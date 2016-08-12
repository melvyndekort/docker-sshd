#!/bin/sh

# Generate Host keys, if required
if ! ls /etc/ssh/ssh_host_* 1> /dev/null 2>&1; then
  ssh-keygen -A
fi

exec "$@"

