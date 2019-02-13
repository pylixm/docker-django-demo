FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && rm -rf requirements.txt

COPY . /code/
RUN sed -i 's/\r//' gunicorn.sh \
    && chmod +x gunicorn.sh

RUN sed -i 's/\r//' entrypoint.sh \
    && chmod +x entrypoint.sh

RUN sed -i 's/\r//' start.sh \
    && chmod +x start.sh

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
