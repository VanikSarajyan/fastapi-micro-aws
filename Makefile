install:
	pip install --upgrade pip
	pip install -r requirements.txt

format:
	black *.py lib/*.py --verbose

lint:
	pylint --disable=R,C *.py lib/*.py

test:
	pytest --cov=lib

build:
	docker build . -t fastapi-container

run: 
	docker run -p 127.0.0.1:8080:8080 fastapi-container

deploy:
	aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin 820286721345.dkr.ecr.eu-north-1.amazonaws.com
	docker build -t wiki .
	docker tag wiki:latest 820286721345.dkr.ecr.eu-north-1.amazonaws.com/wiki:latest
	docker push 820286721345.dkr.ecr.eu-north-1.amazonaws.com/wiki:latest

all: install format lint test deploy