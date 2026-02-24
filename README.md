# PbD RAG Experiment: Privacy-by-Design Layers in Chatbots

Repro repo for quasi-experiment testing baseline vs PbD stack in RAG chatbots.

## Quick Start
```bash
make setup    # Build Docker + load data
make run      # Run 10 reps all conditions  
make analyze  # Generate CSVs + plots


What it Tests
2x2 Design: Stack (baseline vs PbD) × Attack (normal vs injection)

Metrics: PII leakage %, attack success, latency, throughput

Model: Llama-3.1-8B on AWS g5.xlarge

Data: 500 business chats w/ synthetic PII (Enron + faker)
