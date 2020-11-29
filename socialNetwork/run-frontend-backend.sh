#!/bin/bash

services=""
services="$services social-graph-mongodb"
services="$services social-graph-redis"
services="$services write-home-timeline-rabbitmq"
services="$services home-timeline-redis"
services="$services compose-post-redis"
services="$services post-storage-memcached"
services="$services post-storage-mongodb"
services="$services user-timeline-redis"
services="$services user-timeline-mongodb"
services="$services url-shorten-memcached"
services="$services url-shorten-mongodb"
services="$services user-memcached"
services="$services user-mongodb"
services="$services media-memcached"
services="$services media-mongodb"
services="$services nginx-thrift"
services="$services media-frontend"
services="$services jaeger"

docker-compose up $services
