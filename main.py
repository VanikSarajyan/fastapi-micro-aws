import uvicorn
from fastapi import FastAPI

from lib.logic import wiki as wiki_logic, search_wiki

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Microservice on AWS"}


@app.get("/wiki/{name}")
async def wiki(name: str):
    return {"result": wiki_logic(name)}


@app.get("/search/{value}")
async def search(value: str):
    """Page to search in wikipedia"""

    result = search_wiki(value)
    return {"result": result}


if __name__ == "__main__":
    uvicorn.run(app, port=8080, host="0.0.0.0")
