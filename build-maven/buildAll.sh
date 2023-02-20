#!/bin/bash
dir=$(pwd)
for dockerfile in $(find . -type f -name "Dockerfile"); do
    echo "Building $dockerfile..."
    cd "$(dirname "${dockerfile}")" || exit
    docker build -t wuzhaozhongguo/build-maven:$(basename $(dirname "${dockerfile}")) .
    docker push wuzhaozhongguo/build-maven:$(basename $(dirname "${dockerfile}"))
    cd "$dir" || exit
done
