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
	#deploy

all: install format lint test deploy