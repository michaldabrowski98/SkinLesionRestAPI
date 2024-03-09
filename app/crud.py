from sqlalchemy.orm import Session
import models

def get_skin_lesion_by_code(db: Session, code: str):
    return db.query(models.SkinLesion).filter(models.SkinLesion.code == code).first()
