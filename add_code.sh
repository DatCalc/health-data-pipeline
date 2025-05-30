#!/bin/bash

echo "🚀 Adding boilerplate code to your health-data-pipeline project..."

# API Server
cat > api_server/main.py <<EOF
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"message": "Health Data API"}
EOF

cat > api_server/routes/user_routes.py <<EOF
from fastapi import APIRouter

router = APIRouter()

@router.get("/users")
def list_users():
    return [{"user_id": 1}, {"user_id": 2}]
EOF

# Kafka
cat > kafka/producer.py <<EOF
import json

def send_to_kafka(topic, data):
    print(f"Producing to {topic}: {json.dumps(data)}")
EOF

cat > kafka/consumer.py <<EOF
def consume_from_kafka(topic):
    print(f"Consuming messages from {topic}")
    return {"raw_data": "example"}
EOF

# Extractor
cat > extractor/data_extractor.py <<EOF
def extract_bpm_bpst(data):
    return {"bpm": 70, "bpst": 120}
EOF

# Processors
cat > processors/bpm_analyzer.py <<EOF
def analyze_bpm(data):
    if data.get("metric") == "hr":
        from .hr_processor import calculate_hr
        return calculate_hr(data)
EOF

cat > processors/hr_processor.py <<EOF
def calculate_hr(data):
    return {"hr": 72}
EOF

cat > processors/hrv_processor.py <<EOF
def calculate_hrv(data):
    return {"hrv": 55}
EOF

cat > processors/rr_processor.py <<EOF
def calculate_rr(data):
    return {"rr": 18}
EOF

cat > processors/bp_processor.py <<EOF
def calculate_bp(data):
    return {"bp": "120/80"}
EOF

cat > processors/spo2_processor.py <<EOF
def calculate_spo2(data):
    return {"spo2": 98}
EOF

# InfluxDB Writer
cat > influxdb_client/writer.py <<EOF
def write_to_influx(metric_data):
    print(f"Writing to InfluxDB: {metric_data}")
EOF

# Models
cat > models/schemas.py <<EOF
from pydantic import BaseModel

class VitalInput(BaseModel):
    user_id: str
    bpm: int
EOF

# Utils
cat > utils/logger.py <<EOF
import logging

def get_logger(name):
    logging.basicConfig(level=logging.INFO)
    return logging.getLogger(name)
EOF

cat > utils/helpers.py <<EOF
def format_response(data):
    return {"status": "success", "data": data}
EOF

# Tests
cat > tests/test_extractor.py <<EOF
from extractor.data_extractor import extract_bpm_bpst

def test_extract():
    result = extract_bpm_bpst({"input": "test"})
    assert "bpm" in result
EOF

cat > tests/test_hr_processor.py <<EOF
from processors.hr_processor import calculate_hr

def test_hr():
    result = calculate_hr({"signal": [1, 2, 3]})
    assert "hr" in result
EOF

echo "✅ Boilerplate added successfully."

