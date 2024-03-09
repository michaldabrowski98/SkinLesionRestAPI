from pydantic import BaseModel

class SkinLesion(BaseModel):
    id: int
    code: str
    english_name: str
    polish_name: str
    description: str | None = None

class Image(BaseModel):
    image_url: str
