.PHONY: setup run analyze clean test

setup:
	docker-compose up --build -d
	cd scripts && ./load_enron_pii.sh
	cd scripts && python generate_queries.py

run:
	@echo "Run experiments (10 reps each condition)"
	@for i in {1..10}; do \
		echo "Rep $$i"; \
		locust -f locust/locustfile.py --headless --users=10 --spawn-rate=2 --run-time=2m --host=http://localhost:8000 --logs-out=results/rep$$i-baseline-normal.log & \
		locust -f locust/locustfile.py --headless --users=10 --spawn-rate=2 --run-time=2m --host=http://localhost:8001 --logs-out=results/rep$$i-baseline-attack.log & \
		sleep 180; \
	done

analyze:
	cd scripts && python process_results.py

test:
	pytest tests/

clean:
	docker-compose down
	rm -rf results/*.csv
