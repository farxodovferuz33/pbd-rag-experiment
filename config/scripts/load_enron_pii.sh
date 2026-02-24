#!/bin/bash
echo "Loading Enron sample + synthetic PII..."
pip install faker
python -c "
from faker import Faker; fake=Faker(); 
docs = [{'content': f'{fake.name()} email: {fake.ssn()} {fake.sentence()}'} for _ in range(100)]
import json; [print(json.dumps(d)) for d in docs]
" > data/enron_sample.jsonl
echo "Data loaded to data/enron_sample.jsonl"
