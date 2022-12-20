ARG VARIANT=3.9

FROM python:$VARIANT

RUN apt update && \
    apt upgrade -y && \
    pip install -U pip setuptools wheel

ARG USERNAME=vscode
ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID $USERNAME && \
    useradd -s /bin/bash -u $UID -g $GID -m $USERNAME

USER $USERNAME

RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH $HOME/.local/bin:$PATH
