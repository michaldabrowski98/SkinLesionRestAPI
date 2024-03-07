from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from pydantic_settings import SettingsConfigDict

model_config = SettingsConfigDict(env_file=".env")

SQLALCHEMY_DATABASE_URL = "mysql://avnadmin:AVNS_XpwoxogQlu5fEfXmE0a@mysql-2ddec4d3-mdboxman-6cae.a.aivencloud.com:28995/defaultdb"

engine = create_engine(
    SQLALCHEMY_DATABASE_URL, connect_args={"check_same_thread": False}
)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()
