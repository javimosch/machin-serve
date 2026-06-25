#!/bin/sh
# Build machin-serve — a static file HTTP server in machin (MFL).
set -e
machin encode serve.src > serve.mfl
machin build serve.mfl -o serve
echo "built serve ($(ls -lh serve | awk '{print $5}'))"
