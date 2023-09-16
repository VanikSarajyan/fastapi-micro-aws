from fastapi import FastAPI
from lib.logic import wiki

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}
