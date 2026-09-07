#!/bin/bash -exu

dir=$SNAP_COMMON/share/provider/gemma3-jane
mkdir -p $dir
echo "# $(date)" > $dir/provider.env
echo "OPENAI_BASE_URL=http://localhost:8080/v1" >> $dir/provider.env
echo "SNAP_NAME=$SNAP_NAME" >> $dir/provider.env
