#!/bin/bash
## test variant calling on GCE using the seqshop 2014 data
## this assumes you have run the gotcloud_align_test.sh in this directory

## set seqshop envrionmental variants
export GC=/home/vasya/gotcloud
export SS=~/seqshop/example
export OUT=~/seqshop/output

## run snpcall
${GC}/gotcloud snpcall \
  --conf ${SS}/gotcloud.conf \
  --batchtype sge \
  --numjobs 6 \
  --region 22:36000000-37000000 \
  --base_prefix ${SS} \
  --outdir ${OUT}
