import uvicorn
from fastapi import FastAPI

from lib.logic import wiki as wiki_logic

app = FastAPI()


@app.get("/wiki")
async def wiki():
    return {"wiki": wiki_logic()}


if __name__ == "__main__":
    uvicorn.run(app, port=8080, host="0.0.0.0")
