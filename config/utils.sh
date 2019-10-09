mkrunc () {
  pushd $GOPATH/src/github.com/opencontainers/runc
    make BUILDTAGS='seccomp apparmor' static && sudo make install
  popd
}

testrunc () {
  pushd $GOPATH/src/github.com/opencontainers/runc
    make test
  popd
}

mkctrd () {
  pushd $GOPATH/src/github.com/containerd/containerd
    make binaries && sudo make install
  popd
}

testctrd () {
  pushd $GOPATH/src/github.com/containerd/containerd
    TEST_RUNTIME=io.containerd.runtime.v1.linux make integration
  popd
}

testctrdv2 () {
  pushd $GOPATH/src/github.com/containerd/containerd
    TEST_RUNTIME=io.containerd.runc.v2 make integration
  popd
}

