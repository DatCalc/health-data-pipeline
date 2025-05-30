import json

def send_to_kafka(topic, data):
    print(f"Producing to {topic}: {json.dumps(data)}")
