#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
host_vol=$script_dir
dckr_vol=/home/rbruno/git/DeathStarBench/socialNetwork
img=yg397/thrift-microservice-deps:xenial
cmd="mkdir -p $dckr_vol/build; cd $dckr_vol/build && cmake .. && make -j40 && make install && cp -r /usr/local/bin $dckr_vol/"

docker run -v $host_vol:$dckr_vol $img /bin/bash -c "$cmd"
