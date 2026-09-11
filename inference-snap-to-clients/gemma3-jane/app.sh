#!/bin/bash -exu

dir=$SNAP_COMMON/share/provider
mkdir -p $dir
echo "# $(date)" > $dir/provider.env
echo "SNAP_NAME=$SNAP_NAME" >> $dir/provider.env
echo "SNAP_INSTANCE_NAME=$SNAP_INSTANCE_NAME" >> $dir/provider.env
echo "OPENAI_BASE_URL=http://localhost:8080/v1" >> $dir/provider.env
