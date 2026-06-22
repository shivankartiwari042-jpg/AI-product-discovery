from sqlalchemy import (
    Column,
    Integer,
    String,
    Float,
    ForeignKey
)
from sqlalchemy.orm import relationship
from app.db.database import Base


class Product(Base):
    __tablename__ = "products"

    id = Column(Integer, primary_key=True, index=True)

    name = Column(String(255), nullable=False)
    description = Column(String(1000))

    price = Column(Float)
    rating = Column(Float)

    category_id = Column(
        Integer,
        ForeignKey("categories.id")
    )

    brand_id = Column(
        Integer,
        ForeignKey("brands.id")
    )

    category = relationship("Category")
    brand = relationship("Brand")