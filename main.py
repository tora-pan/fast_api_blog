import os
from fastapi import FastAPI
from routers import blog
from utils.html import mount_static

app = FastAPI()




app.include_router(blog.router)

@app.get("/")
async def home():
    return {"message": "Hello World"}

mount_static()
from exceptions import handler
