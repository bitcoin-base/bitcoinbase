#!/usr/bin/env bash
# Copyright (c) 2021-2023 The Dash Core developers
# Copyright (c) 2026 The Bitcoin Base Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"/../.. || exit

DOCKER_IMAGE=${DOCKER_IMAGE:-dashpay/bitcoinbased-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}
DOCKER_RELATIVE_PATH=contrib/containers/deploy

if [ -d $DOCKER_RELATIVE_PATH/bin ]; then
    rm $DOCKER_RELATIVE_PATH/bin/*
fi

mkdir $DOCKER_RELATIVE_PATH/bin
cp "$BASE_ROOT_DIR"/src/bitcoinbased    $DOCKER_RELATIVE_PATH/bin/
cp "$BASE_ROOT_DIR"/src/dash-cli $DOCKER_RELATIVE_PATH/bin/
cp "$BASE_ROOT_DIR"/src/bitcoinbase-tx  $DOCKER_RELATIVE_PATH/bin/
strip $DOCKER_RELATIVE_PATH/bin/bitcoinbased
strip $DOCKER_RELATIVE_PATH/bin/dash-cli
strip $DOCKER_RELATIVE_PATH/bin/bitcoinbase-tx

docker build --pull -t "$DOCKER_IMAGE":"$DOCKER_TAG" -f $DOCKER_RELATIVE_PATH/Dockerfile docker
