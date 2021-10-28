# Build neovim separately in the first stage
FROM alpine:latest

RUN apk --no-cache add \
    git \
    build-base \
    cmake \
    automake \
    autoconf \
    libtool \
    pkgconf \
    coreutils \
    curl \
    unzip \
    gettext-tiny-dev

# Build neovim (and use it as an example codebase
RUN git clone https://github.com/neovim/neovim.git

RUN cd neovim && make install

COPY ./local.mk /neovim/local.mk
COPY ./gdb_start.sh /neovim/gdb_start.sh

RUN apk --no-cache add \
    tmux \
    gdb \
    cgdb

WORKDIR /neovim
