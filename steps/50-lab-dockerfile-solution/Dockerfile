FROM python:3.12-alpine

LABEL org.opencontainers.image.authors="Sophie FONFEC"
LABEL org.opencontainers.image.version=1.0.0

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY app.py /app

EXPOSE 9090

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]