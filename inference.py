from transformers import AutoTokenizer, AutoModelForCausalLM
import transformers
import torch
import pandas as pd
import argparse
from peft import (
    PeftConfig,
    PeftModel
)
from transformers import (
    AutoModelForCausalLM,
    AutoTokenizer,
    BitsAndBytesConfig
)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--eval_path', dest='eval_path', type=str)
    parser.add_argument('--save_path', dest='save_path', type=str)
    parser.add_argument('--model', dest='model', type=str)
    parser.add_argument('--ispeft', dest='ispeft', type=bool)

    args = parser.parse_args()
    
    eval_path = args.eval_path
    save_path = args.save_path
    eval_path = args.eval_path
    model_path = args.model
    ispeft = args.ispeft
    print(model_path)

    print('Loading the model')
    bnb_config = BitsAndBytesConfig(
        load_in_4bit=True,
        bnb_4bit_use_double_quat=True,
        bnb_4bit_quant_type="nf4",
        bnb_4bit_compute_dtype=torch.float16,
    )
    print(ispeft, ~ispeft, ~ispeft==0)
    if not ispeft:
        model = AutoModelForCausalLM.from_pretrained(
            model_path, 
            trust_remote_code=True,
            device_map="auto",
            quantization_config=bnb_config
        )
        tokenizer = AutoTokenizer.from_pretrained(model_path, return_token_type_ids=False)
    else:
        config = PeftConfig.from_pretrained(model_path, use_auth_token=True)
        
        model = AutoModelForCausalLM.from_pretrained(
            config.base_model_name_or_path,
            return_dict=True,
            local_files_only=True,
            quantization_config=bnb_config,
            device_map="auto",
            trust_remote_code=True
        )
        tokenizer = AutoTokenizer.from_pretrained(config.base_model_name_or_path, return_token_type_ids=False)
        tokenizer.pad_token = tokenizer.eos_token
        
    
    print('Loading the dataset')
    database = pd.read_json(eval_path)
    database['NoAnswer'] = database.apply(lambda x: x['data'].split('Answer:')[0] + "Answer:", axis = 1)
    if ~ispeft:
        database['NoAnswer'] = database.apply(lambda x: 'Context: You are a SQL expert, and I need your help building SQL queries. Please provide only the SQL query, without explanation.\n' + x['NoAnswer'], axis=1)

    print('Dataset Loaded ', database.shape)
    file_save = ""
    print('Inference Started')
    for query in database['NoAnswer']:
        model_inputs = tokenizer(query, return_tensors="pt", return_token_type_ids=False).to('cuda')
        outputs = model.generate(**model_inputs, max_length=512)
        output_text = tokenizer.batch_decode(outputs, skip_special_tokens=True)[0]
        file_save += output_text + '\n'
        print(output_text)
    print('Saving inferences on ', save_path)
    with open(save_path, 'w') as f:
        f.write(file_save)