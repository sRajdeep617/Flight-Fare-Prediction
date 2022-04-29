FROM python:alpine

WORKDIR /usr/app

COPY requirements.txt ./

RUN apk add --no-cache --update \
    python3 python3-dev gcc \
    gfortran musl-dev
RUN apk add --update py3-pip
RUN pip3 install --upgrade pip setuptools && \
    pip3 install -r requirements.txt

COPY ./ ./

CMD ["python", "app.py"]
