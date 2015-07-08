#!/bin/bash

##############################################################################
#### GotCloud Alignment of HG01051
##############################################################################

/home/vasya/gotcloud/gotcloud pipe --name bam2fastq \
	--conf /home/trubetsk/google-gotcloud/config/multi_sample_snpcall_gcsfuse.conf \
	--numjobs 24

