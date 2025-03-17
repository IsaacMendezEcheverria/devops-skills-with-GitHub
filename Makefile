
test:
	python -m pytest -vv --cov=hello --cov=mylib test_*.py

format:	
	black *.py mylib/*.py

lint:
	# Install required packages
	pip install numpy pandas scipy matplotlib seaborn scikit-learn tensorflow keras torch requests fastapi pydantic uvicorn click wikipedia-api yake && \	source venv/bin/activate && \
	# Run pylint
	pylint --disable=R,C --extension-pkg-whitelist='pydantic' main.py --ignore-patterns=test_.*?py *.py mylib/*.pyydantic' main.py --ignore-patterns=test_.*?py *.py mylib/*.py

container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile	docker run --rm -i hadolint/hadolint < Dockerfile

refactor: format lint

deploy:
	#deploy is only pushing to ECR
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 561744971673.dkr.ecr.us-east-1.amazonaws.come AWS --password-stdin 561744971673.dkr.ecr.us-east-1.amazonaws.com
	docker build -t cdfast .ocker build -t cdfast .
	docker tag cdfast:latest 561744971673.dkr.ecr.us-east-1.amazonaws.com/cdfast:latest73.dkr.ecr.us-east-1.amazonaws.com/cdfast:latest



all: install lint test format deploy			docker push 561744971673.dkr.ecr.us-east-1.amazonaws.com/cdfast:latest	docker push 561744971673.dkr.ecr.us-east-1.amazonaws.com/cdfast:latest
		
all: install lint test format deploy