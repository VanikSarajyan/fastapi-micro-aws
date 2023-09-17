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


deploy:
	#deploy

all: install format lint test deploy