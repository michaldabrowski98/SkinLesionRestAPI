from uvicorn import run
from typing import List
from fastapi import FastAPI, Depends, HTTPException
import os
import tensorflow as tf
import cv2
import numpy as np
import urllib.request
import numpy as np
from sqlalchemy.orm import Session
import crud, models, schemas
from database import engine, SessionLocal

IMG_SIZE = 32

SKIN_CONDITIONS_CODE_LIST = [
        'akiec',
        'bcc',
        'bkl',
        'df',
        'nv',
        'vasc',
        'mel'
    ]

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

model = tf.keras.models.load_model('../model/model_v1')

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get('/')
def index():
    return {'message': 'This is skin lesion classification API'}

@app.post('/classify')
def classify(image: schemas.Image, db: Session = Depends(get_db)):
    image_url = image.image_url
    if image_url == "":
        return {'message': 'No image provided'}
    
    skin_lesion_code = get_prediction(image_url)
    skin_lesion = crud.get_skin_lesion_by_code(db, code=skin_lesion_code)
    if skin_lesion is None:
        raise HTTPException(status_code=500, details="Internal server error")
    
    return skin_lesion

def get_prediction(image_url: str) -> str:
    req = urllib.request.urlopen(image_url)
    arr = np.asarray(bytearray(req.read()), dtype=np.uint8)
    img = cv2.imdecode(arr, -1)
    test_image = cv2.resize(img, (IMG_SIZE , IMG_SIZE))
    test_image = np.array(test_image).reshape( -1, IMG_SIZE, IMG_SIZE, 3)
    prediction = model.predict({'conv2d_14_input': test_image })

    return get_skin_condition(prediction[0])

def get_skin_condition(prediction: List[float]) -> str:
    maxIndex = 0
    max = prediction[maxIndex]
    for i in range(1, len(prediction)):
        if prediction[i] > max:
            max = prediction[i]
            maxIndex = i

    return SKIN_CONDITIONS_CODE_LIST[maxIndex]

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    run(app, host='0.0.0.0', port=port)
