#!/usr/bin/env bash
# Copyright (c) 2021-2023 The Dash Core developers
# Copyright (c) 2026 The Bitcoin Base Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C
set -e

# Get Tor service IP if running
if [[ "$1" == "bitcoinbased" ]]; then
  # Because bitcoinbased only accept torcontrol= host as an ip only, we resolve it here and add to config
  if [[ "$TOR_CONTROL_HOST" ]] && [[ "$TOR_CONTROL_PORT" ]] && [[ "$TOR_PROXY_PORT" ]]; then
    TOR_IP=$(getent hosts "$TOR_CONTROL_HOST" | cut -d ' ' -f 1)
    echo "proxy=$TOR_IP:$TOR_PROXY_PORT" >> "$HOME/.dashcore/bitcoinbase.conf"
    echo "Added \"proxy=$TOR_IP:$TOR_PROXY_PORT\" to $HOME/.dashcore/bitcoinbase.conf"
    echo "torcontrol=$TOR_IP:$TOR_CONTROL_PORT" >> "$HOME/.dashcore/bitcoinbase.conf"
    echo "Added \"torcontrol=$TOR_IP:$TOR_CONTROL_PORT\" to $HOME/.dashcore/bitcoinbase.conf"
    echo -e "\n"
  else
    echo "Tor control credentials not provided"
  fi
fi

exec "$@"
