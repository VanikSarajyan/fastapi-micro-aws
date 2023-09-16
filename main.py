import uvicorn
from fastapi import FastAPI


from lib.logic import wiki

app = FastAPI()


@app.get("/wiki")
async def wiki():
    return {"wiki": wiki()}


if __name__ == "__main__":
    uvicorn.run(app, port=8080, host="0.0.0.0")
