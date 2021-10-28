FROM fedora:34

# Common dependencies
RUN dnf -y update && \
    dnf -y install git \
      ninja-build \
      libtool \
      autoconf \
      automake \
      cmake \
      gcc \
      gcc-c++ \
      make \
      pkgconfig \
      unzip \
      patch \
      gettext \
      curl && \
    dnf clean all

# Build neovim (and use it as an example codebase
RUN git clone https://github.com/neovim/neovim.git

RUN cd neovim && make install

COPY ./local.mk /neovim/local.mk
COPY ./gdb_start.sh /neovim/gdb_start.sh

RUN dnf -y update && \
    dnf -y install \
    tmux \
    gdb \
    cgdb

WORKDIR /neovim
