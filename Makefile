install:
	pip install --upgrade pip
	pip install -r requirements.txt

format:
	black *.py lib/*.py

lint:
	#link

test:
	#test

deploy:
	#deploy

all: install format lint test deploy