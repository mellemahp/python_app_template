FROM alpine:3.10.3

# ensures logging is correct
ENV PYTHONUNBUFFERED=1

RUN apk add --update --no-cache \
    gcc \ 
    musl-dev \
    linux-headers \
    python3 \
    python3-dev


# Install all python dependencies
COPY requirements.dev.txt .
RUN pip3 install --no-cache-dir -r requirements.dev.txt && \
    rm requirements.dev.txt

COPY ./code/ /app/ 
WORKDIR /app/

EXPOSE 80

ENTRYPOINT ["deploy.sh"]