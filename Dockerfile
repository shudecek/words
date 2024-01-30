FROM python:3.11-slim-bullseye

WORKDIR /app

COPY requirements.txt /app
RUN pip install --no-cache -r /app/requirements.txt

COPY server.py /app
COPY redisstore.py /app
COPY utils.py /app
COPY encoder.py /app

ENTRYPOINT ["uvicorn", "--host", "0.0.0.0", "server:app"]
