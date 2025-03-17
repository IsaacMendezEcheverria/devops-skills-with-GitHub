test:
	python -m pytest -vv --cov=hello --cov=mylib test_*.py

format:	
	black *.py mylib/*.py

lint:
	# Run pylint
	pylint --disable=R,C --extension-pkg-whitelist='pydantic' main.py --ignore-patterns=test_.*?py *.py mylib/*.py

container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

refactor: format lint

deploy:
	#deploy is only pushing to ECR

install:
	# Add installation commands here

all: install lint test format deploy