#!/usr/bin/env python

import os
from itertools import izip

def pairwise(iterable):
    "s -> (s0,s1), (s2,s3), (s4, s5), ..."
    a = iter(iterable)
    return izip(a, a)

fastqList = []
for (root, dirs, files) in os.walk('/mnt/inputs/bam2fastq_output/fastqs/mnt/data/test_1000g_bams/raw_bams/'):
        fastqs = [ root+fastq for fastq in files if fastq.endswith('1.fastq') ]
        for fastq in fastqs:
                sample = os.path.basename(fastq).split('.')[0]
                fastqList.append('\t'.join((sample, fastq, fastq.replace('_1', '_2'))))

for i in xrange(12):
	outDir = '/mnt/outputs/align_out_%s/' % str(i)
	os.system('mkdir %s' % outDir)
	fastqs = list(pairwise(fastqList))[i]
	print >> open('%sfastq.list' % outDir, 'w'), 'MERGE_NAME	FASTQ1	FASTQ2'
	for file in fastqs:
		print >> open('%sfastq.list' % outDir, 'a'), file
	



