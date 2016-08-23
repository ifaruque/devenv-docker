#!/usr/bin/env bash

mongodb() {
  # first check mongodb container is running or not
  local state=$(is_running mongodb)

  if [[ "$state" == "true" ]]; then
    echo 'mongodb server container is already running'
  else
    docker run -it -d \
      -v ${DEV_ZONE}/storage/mongodb:/data/db \
      -p 27017:27017 \
      --net ronsvpn \
      --name mongodb \
      mvertes/alpine-mongo
  fi
}
