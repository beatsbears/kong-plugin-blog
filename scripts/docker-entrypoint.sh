#!/bin/bash
set -e

export KONG_NGINX_DAEMON=off

if [[ "$1" == "kong" ]]; then
  PREFIX=${KONG_PREFIX:=/usr/local/kong}

  if [[ "$2" == "docker-start" ]]; then
    # Kong migrations
    kong migrations bootstrap && kong migrations up && kong migrations finish

    # Kong prep
    kong prepare -p "$PREFIX"

    # Set up custom plugins
    sh plugin_setup.sh

    exec /usr/local/openresty/nginx/sbin/nginx \
      -p "$PREFIX" \
      -c nginx.conf
  fi
fi

exec "$@"