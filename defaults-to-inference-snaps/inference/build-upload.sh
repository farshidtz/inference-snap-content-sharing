#!/bin/bash
set -e
snapcraft pack
snapcraft upload inference_0.1_amd64.snap --release=edge/content-share
