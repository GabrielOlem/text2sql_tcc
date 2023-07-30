#import bitsandbytes as bnb
import argparse
import torch
import torch.nn as nn
import transformers
from datasets import load_dataset
from huggingface_hub import notebook_login
from peft import (
    LoraConfig,
    PeftConfig,
    PeftModel,
    get_peft_model,
    prepare_model_for_kbit_training
)
from transformers import (
    AutoConfig,
    AutoModelForCausalLM,
    AutoTokenizer,
    BitsAndBytesConfig
)

from datasets import load_dataset

def tokenize_prompt(data_point):
  return tokenizer.__call__(data_point['data'] + tokenizer.pad_token, padding = True, add_special_tokens=True)

def dataset_loader(dataset_name):
    dataset = load_dataset("json", data_files = dataset_name, split="train")
    data = dataset.map(tokenize_prompt)
    data = data.filter(lambda ex: len(ex['input_ids']) < 2048)
    return data

def load_model(model_name):
    bnb_config = BitsAndBytesConfig(
        load_in_4bit=True,
        bnb_4bit_use_double_quat=True,
        bnb_4bit_quant_type="nf4",
        bnb_4bit_compute_dtype=torch.float16,
    )

    model = AutoModelForCausalLM.from_pretrained(
        model_name,
        device_map="auto",
        quantization_config=bnb_config,
        trust_remote_code=True
    )
    tokenizer = AutoTokenizer.from_pretrained(model_name, trust_remote_code=True)
    tokenizer.pad_token = tokenizer.eos_token
    model = prepare_model_for_kbit_training(model)
    return model, tokenizer


def lora(lora_r, lora_alpha, lora_dropout, model):
    peft_config = LoraConfig(
        r=lora_r,
        lora_alpha=lora_alpha,
        target_modules=[
            "query_key_value"
        ],
        lora_dropout=lora_dropout,
        bias="none",
        task_type="CAUSAL_LM"
    )

    model = get_peft_model(model, peft_config)
    return model

def print_trainable_parameters(model):
  trainable_params = 0
  all_param = 0
  for _, param in model.named_parameters():
    all_param += param.numel()
    if param.requires_grad:
      trainable_params += param.numel()
  print(
      f'trainable_params: {trainable_params} || all params: {all_param} || trainables: {100*trainable_params/all_param}'
  )



def training(model, tokenizer, data, training_arguments, save_path):
    trainer = transformers.Trainer(
        model=model,
        train_dataset=data,
        data_collator = transformers.DataCollatorForLanguageModeling(tokenizer, mlm=False),
        args=training_arguments,
    )
    model.config.use_cache = False
    trainer.train()
    print('Saving model on ', save_path)
    model.save_pretrained(save_path)






if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--dataset_path', dest='dataset_path', type=str)
    parser.add_argument('--model_name', dest='model_name', type=str)
    parser.add_argument('--lora_alpha', dest='lora_alpha', type=str)
    parser.add_argument('--lora_dropout', dest='lora_dropout', type=str)
    parser.add_argument('--lora_r', dest='lora_r', type=str)
    parser.add_argument('--output_dir', dest='output_dir', type=str)
    parser.add_argument('--per_device_train_batch_size', dest='per_device_train_batch_size', type=str)
    parser.add_argument('--gradient_accumulation_steps', dest='gradient_accumulation_steps', type=str)
    parser.add_argument('--num_train_epochs', dest='num_train_epochs', type=str)
    parser.add_argument('--learning_rate', dest='learning_rate', type=str)
    parser.add_argument('--optim', dest='optim', type=str)
    parser.add_argument('--save_steps', dest='save_steps', type=str)
    parser.add_argument('--logging_steps', dest='logging_steps', type=str)
    parser.add_argument('--warmup_ratio', dest='warmup_ratio', type=str)
    parser.add_argument('--lr_scheduler_type', dest='lr_scheduler_type', type=str)
    parser.add_argument('--save_path', dest='save_path', type=str)
    args = parser.parse_args()

    dataset_path = args.dataset_path
    model_name = args.model_name
    lora_alpha = args.lora_alpha
    lora_dropout = args.lora_dropout
    lora_r = args.lora_r
    output_dir = args.output_dir
    per_device_train_batch_size = args.per_device_train_batch_size
    gradient_accumulation_steps = args.gradient_accumulation_steps
    num_train_epochs = args.num_train_epochs
    learning_rate = args.learning_rate
    optim = args.optim
    save_steps = args.save_steps
    logging_steps = args.logging_steps
    warmup_ratio = args.warmup_ratio
    lr_scheduler_type = args.lr_scheduler_type
    save_path = args.save_path
    
    print('Loading the Model')
    model, tokenizer = load_model(model_name)
    

    print_trainable_parameters(model)

    print('Loading Dataset')
    data = dataset_loader(dataset_path)

    print('Applying Lora configuration')
    model = lora(lora_r, lora_alpha, lora_dropout, model)


    print('Creating Training Arguments')
    training_arguments = transformers.TrainingArguments(
        output_dir=output_dir,
        per_device_train_batch_size=per_device_train_batch_size,
        gradient_accumulation_steps=gradient_accumulation_steps,
        optim=optim,
        num_train_epochs = num_train_epochs,
        save_steps=save_steps,
        logging_steps=logging_steps,
        learning_rate=learning_rate,
        fp16=True,
        #max_steps=max_steps,
        warmup_ratio=warmup_ratio,
        group_by_length=True,
        lr_scheduler_type=lr_scheduler_type,
    )


    print('Training Initiated')
    training(model, tokenizer, data, training_arguments, save_path)
