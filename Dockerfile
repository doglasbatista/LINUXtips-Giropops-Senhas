FROM python:3.9-slim

RUN apt-get update && \
  apt-get install -y redis && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/

ENV REDIS_HOST="localhost"

WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt

CMD ["sh", "-c", "redis-server & flask run --host=0.0.0.0"]
