ARG VARIANT=3.9

FROM python:$VARIANT

RUN apt update && \
    apt upgrade -y && \
    apt install gnupg2 -y && \
    pip install -U pip setuptools wheel poetry

ARG USERNAME=vscode
ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID $USERNAME && \
    useradd -s /bin/bash -u $UID -g $GID -m $USERNAME && \
    apt install -y sudo && \
    echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME
