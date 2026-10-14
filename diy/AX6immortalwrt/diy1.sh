#!/bin/bash
set -e

# DDNSTO 由 ImmortalWrt 默认软件源之外的仓库维护。
FEED_LINE='src-git nas https://github.com/linkease/ddnsto-openwrt-package.git;main'
if ! grep -qxF "$FEED_LINE" feeds.conf.default; then
  echo "$FEED_LINE" >> feeds.conf.default
fi
