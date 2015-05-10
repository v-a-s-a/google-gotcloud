#!/bin/bash
## commands that exercise gotcloud on GCE cluster running SGE

## set seqshop envrionmental variants
export GC=/home/vasya/gotcloud
export SS=~/seqshop/example
export OUT=~/seqshop/output

## run alignment
${GC}/gotcloud align \
  --conf ${SS}/gotcloud.conf \
  --numjobs 4 \
  --batchtype sge \
  --base_prefix ${SS} \
  --outdir ${OUT}

