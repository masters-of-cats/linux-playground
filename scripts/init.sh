#!/bin/bash

export GOPATH=/vagrant_data

pushd "$GOPATH/src/github.com/opencontainers/runc"
  make && make install
popd

pushd "$GOPATH/src/github.com/containerd/containerd"
  make && sudo make install
popd

secure_path="/usr/local/go/bin:$(sudo cat /etc/sudoers | grep secure_path | cut -d '=' -f 2 | tr -d '"')"
sudo sed -i "/secure_path/c\Defaults        secure_path=$secure_path" /etc/sudoers

