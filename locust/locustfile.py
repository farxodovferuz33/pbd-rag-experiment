from locust import HttpUser, task, between
import json
import random

class RAGUser(HttpUser):
    wait_time = between(1, 3)
    
    def on_start(self):
        with open("data/queries_sample.jsonl") as f:
            self.queries = [json.loads(line) for line in f]

    @task
    def chat_query(self):
        query = random.choice(self.queries)
        self.client.post("/chat", json={"query": query["query"]})
