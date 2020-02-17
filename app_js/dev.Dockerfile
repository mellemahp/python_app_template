FROM alpine:3.10.3

# ensures logging is correct
ENV PYTHONUNBUFFERED=1

RUN apk add --update --no-cache \
    gcc \ 
    musl-dev \
    linux-headers \
    python3 \
    python3-dev \
    npm

WORKDIR /app/

# Install the auto_restart script
COPY auto_restart.sh /app/
RUN chmod +x auto_restart.sh

# Install all python dependencies
COPY requirements.dev.txt .
RUN pip3 install --no-cache-dir -r requirements.dev.txt && \
    rm requirements.dev.txt

# Install all javascript dependencies
COPY package.json webpack.config.js /app/
RUN npm install

# Copy all the base code of the python application to container
COPY ./code/ /app/ 

ENV PYTHON_PORT=5000 NODE_ENV=dev

EXPOSE 80

ENTRYPOINT ["./auto_restart.sh"]