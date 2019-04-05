#!/bin/bash

set -x

containers=$(find /run/containerd/runc -mindepth 2 -maxdepth 3  -type d -exec basename {} \;)

pidof containerd containerd-shim runc | xargs -r -n 1 kill -9

for container in $containers; do
  grep "$container" /proc/self/mountinfo | while read -r mountpoint; do
    umount "$( echo "$mountpoint" | awk '{print $5}' )"
  done

  find /sys/fs/cgroup -name "$container" -print0 | xargs -r -0 rmdir
done

rm -rf /run/containerd/runc/*
rm -rf /run/containerd/fifo/*
rm -rf /run/containerd-test/*
