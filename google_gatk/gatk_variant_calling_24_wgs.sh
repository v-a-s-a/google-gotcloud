#!/bin/bash

time gatk-google-alpha dna-genotype-3.4-0a -project friendly-medley-91616 -input gs://gs-fuse-test/bams.*.bam -output gs://gs-fuse-test/gatk_output/

