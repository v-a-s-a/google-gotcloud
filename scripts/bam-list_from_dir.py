#!//usr/bin/env python

import argparse as arg
import os

p = arg.ArgumentParser(description='Create GotCloud bam.list from directory.')
p.add_argument('-d', action='store', dest='bamDirectory')
args = p.parse_args()


for (root, dirs, files) in os.walk(args.bamDirectory):
	bams = [ root+bam for bam in files if bam.endswith('.bam') ]
	for bam in bams:
		sample = os.path.basename(bam).split('.')[0]
		print '\t'.join((sample, bam))

