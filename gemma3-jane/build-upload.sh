#!/bin/bash
set -e
snapcraft pack
snapcraft upload gemma3-jane_0.1_amd64.snap --component test=gemma3-jane+test.comp --release=edge/content-share
