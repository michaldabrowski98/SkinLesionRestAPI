from uvicorn import run
from typing import List
# from pydantic import BaseModel
from fastapi import FastAPI
import os
import tensorflow as tf
import cv2
import numpy as np
from skin_conditions import SkinConditions
from image import Image
import urllib.request
import numpy as np

IMG_SIZE = 32

app = FastAPI()

model = tf.keras.models.load_model('../model/model_v1')

@app.get('/')
def index():
    return {'message': 'This is skin lesion classification API'}

@app.post('/classify')
def classify(image: Image):
    image_url = image.image_url
    if image_url == "":
        return {'message': 'No image provided'}
    
    req = urllib.request.urlopen(image_url)
    arr = np.asarray(bytearray(req.read()), dtype=np.uint8)
    img = cv2.imdecode(arr, -1)
    test_image = cv2.resize(img, (IMG_SIZE , IMG_SIZE))
    test_image = np.array(test_image).reshape( -1, IMG_SIZE, IMG_SIZE, 3)
    prediction = model.predict({'conv2d_14_input': test_image })
    
    return get_skin_condition(prediction[0])

def get_skin_condition(prediction: List[float]):
    maxIndex = 0
    max = prediction[maxIndex]
    for i in range(1, len(prediction)):
        if prediction[i] > max:
            max = prediction[i]
            maxIndex = i

    return SkinConditions.SKIN_CONDITIONS_LIST[maxIndex]

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    run(app, host='0.0.0.0', port=port)