FROM python:3.7-alpine

# avoid python to buffer outputs
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app
# security, and avoid to use the root user.
RUN adduser -D user
USER user