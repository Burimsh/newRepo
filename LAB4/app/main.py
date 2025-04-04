from fastapi import FastAPI
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import sessionmaker, declarative_base
from prometheus_fastapi_instrumentator import Instrumentator

# Database connection
engine = create_engine("mysql+pymysql://user:password@db:3306/api_db")
Session = sessionmaker(bind=engine)
Base = declarative_base()

# Database model
class Item(Base):
    __tablename__ = "items"
    id = Column(Integer, primary_key=True)
    name = Column(String(80), nullable=False)

Base.metadata.create_all(engine)  # Create table

app = FastAPI()
Instrumentator().instrument(app).expose(app)  # Prometheus

# GET all items
@app.get("/items")
def get_items():
    with Session() as db:
        return db.query(Item).all()

# POST new item
@app.post("/items")
def add_item(name: str):
    with Session() as db:
        item = Item(name=name)
        db.add(item)
        db.commit()
        db.refresh(item)
        return item

# DELETE item
@app.delete("/items/{id}")
def delete_item(id: int):
    with Session() as db:
        item = db.query(Item).get(id)
        if item:
            db.delete(item)
            db.commit()
            return {"message": "Item deleted"}
        return {"error": "Item not found"}
