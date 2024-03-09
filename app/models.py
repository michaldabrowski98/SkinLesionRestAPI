from database import Base
from sqlalchemy import Column, Integer, String

class SkinLesion(Base):
    __tablename__ = "skin_lesion"

    id = Column(Integer, primary_key=True)
    code = Column(String, unique=True)
    english_name = Column(String)
    polish_name = Column(String)
    description = Column(String)
