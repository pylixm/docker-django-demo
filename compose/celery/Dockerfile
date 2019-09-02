FROM python:3.6
ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code

COPY ./requirements.txt /code/
COPY ./compose/celery/*.sh /code/
RUN pip install --no-cache-dir -r requirements.txt \
    && rm -rf requirements.txt && sh init_env.sh

COPY . /code/
COPY ./compose/celery/*.sh /code/
RUN sed -i 's/\r//' celery.sh \
    && chmod +x celery.sh \
    && sed -i 's/\r//' celery-beat.sh \
    && chmod +x celery-beat.sh