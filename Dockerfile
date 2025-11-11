# Python Image for flask apps
FROM python:3.12-alpine

RUN mkdir /srv/app

# Container set inside working dir
WORKDIR /srv/app

# Copying App and Dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt gunicorn

COPY hello.py .
COPY templates ./templates
COPY static ./static

EXPOSE 8001

CMD ["gunicorn", "--workers", "3", "--bind", "0.0.0.0:8001", "hello:app"]