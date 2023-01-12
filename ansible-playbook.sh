#!/usr/bin/env sh

# change into script directory
cd "$(dirname $0)"

# build image
docker build . --quiet --squash --tag=ansible-toolbox:local

# create history file to persist your shell history
touch ash_history

# flush terminal
clear

# start container
if [ "$#" -eq 0 ]; then
  docker run \
    --name=ansible-toolbox \
    --rm \
    --tty \
    --interactive \
    --network=host \
    --volume="${PWD}/ash_history:/root/.ash_history" \
    --volume="${PWD}:/host" \
    --workdir="/host" \
    ansible-toolbox:local
else
  echo "ansible-playbook $@"
  docker run \
    --name=ansible-toolbox \
    --rm \
    --tty \
    --network=host \
    --volume="${PWD}/ash_history:/root/.ash_history" \
    --volume="${PWD}:/host" \
    --workdir="/host" \
    --entrypoint="/usr/local/bin/ansible-playbook" \
    ansible-toolbox:local \
    $@
fi
