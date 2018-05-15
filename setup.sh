#!/bin/bash

set -euox pipefail

SSH_KEY=${SSH_KEY:-id_rsa}

build_images() {
  docker-compose build
}

start_ssh_agent() {
  docker-compose up -d ssh-agent
}

add_ssh_key() {
  docker run --rm -it \
         --volumes-from=thepugglepaydevblog_ssh-agent_1 \
         -v ~/.ssh:/.ssh \
         nardeas/ssh-agent \
         ssh-add "/root/.ssh/$SSH_KEY"
}

main() {
  start_ssh_agent
  add_ssh_key
  build_images
}

main
