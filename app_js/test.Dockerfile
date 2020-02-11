ARG PROD_CONTAINER

FROM ${PROD_CONTAINER}

RUN pip3 install pytest

# Copy test file over (prod container removes tests)
COPY ./tests /app/tests/

ENTRYPOINT [ "pytest" ]