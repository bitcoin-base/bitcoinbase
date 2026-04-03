#!/usr/bin/env bash
# Copyright (c) 2018-2023 The Dash Core developers
# Copyright (c) 2026 The Bitcoin Base Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.
# use testnet settings,  if you need mainnet,  use ~/.dashcore/bitcoinbased.pid file instead
export LC_ALL=C

bitcoinbase_pid="$(<~/.dashcore/testnet3/bitcoinbased.pid)"
sudo gdb -batch -ex "source debug.gdb" bitcoinbased "${bitcoinbase_pid}"
