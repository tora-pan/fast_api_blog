from fastapi import FastAPI
from routers import blog
from utils.html import mount_static

app = FastAPI()


app.include_router(blog.router)

mount_static()
from exceptions import handler
