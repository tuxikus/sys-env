#!/usr/bin/env bash
set -e

go install $(xargs < go-packages)

echo "done installing go packages"
