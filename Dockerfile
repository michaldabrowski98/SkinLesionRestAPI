FROM tensorflow/tensorflow:2.14.0-gpu

RUN apt-get update
RUN pip install --upgrade pip

RUN pip install numpy
RUN pip install uvicorn
RUN pip install fastapi
RUN pip install pydantic
RUN pip3 install opencv-python
RUN pip install sqlalchemy
RUN pip install pydantic_settings
RUN pip install mysql-connector-python
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

COPY ./model /model/

COPY ./app /app

EXPOSE 5000

WORKDIR /app

CMD ["python", "main.py"]
