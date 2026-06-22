from fastapi import FastAPI
from app.db.database import Base, engine
from app.db.models import *
from app.api.product import router as product_router

Base.metadata.create_all(bind=engine)

app = FastAPI(
    title="ShopWise AI API",
    version="1.0.0"
)

app.include_router(product_router)


@app.get("/")
def home():
    return {
        "message": "ShopWise AI Backend Running"
    }