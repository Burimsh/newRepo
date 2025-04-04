from fastapi import FastAPI
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from prometheus_fastapi_instrumentator import Instrumentator

# Database setup
DATABASE_URL = "mysql+pymysql://user:password@db:3306/api_db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

# Define the Item model
class Item(Base):
    __tablename__ = "items"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(80), nullable=False)

# Create the table
Base.metadata.create_all(bind=engine)

# FastAPI app
app = FastAPI()

# Prometheus metrics
Instrumentator().instrument(app).expose(app)

# Routes
@app.get("/items")
def get_items():
    db = SessionLocal()
    items = db.query(Item).all()
    db.close()
    return [{"id": item.id, "name": item.name} for item in items]

@app.post("/items")
def add_item(name: str):
    db = SessionLocal()
    new_item = Item(name=name)
    db.add(new_item)
    db.commit()
    result = {"id": new_item.id, "name": new_item.name}
    db.close()
    return result

@app.delete("/items/{id}")
def delete_item(id: int):
    db = SessionLocal()
    item = db.query(Item).filter(Item.id == id).first()
    if item:
        db.delete(item)
        db.commit()
        db.close()
        return {"message": "Item deleted"}
    db.close()
    return {"error": "Item not found"}, 404