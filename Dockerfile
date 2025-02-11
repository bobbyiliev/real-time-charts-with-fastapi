FROM python:3.10-slim-buster
LABEL maintainer="ronmarti18@gmail.com"

RUN pip install poetry

ENV PYTHONUNBUFFERED=1

RUN mkdir /code
WORKDIR /code
COPY . /code/

RUN poetry config virtualenvs.create false
RUN poetry install

CMD uvicorn application:application --host 0.0.0.0 --port 5000
