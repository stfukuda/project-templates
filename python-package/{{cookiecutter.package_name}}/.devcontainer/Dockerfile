ARG VARIANT=3.9

FROM python:${VARIANT}

RUN apt update && \
    apt upgrade -y && \
    apt install gnupg2 -y && \
    pip install -U pip setuptools wheel poetry
