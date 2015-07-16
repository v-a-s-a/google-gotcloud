#!/bin/bash
## submit gotcloud align jobs to nodes

for i in {0..11}; do
	outdir="/mnt/outputs/align_out_${i}/"
	outdiropt="outdir ${outdir}"
	fastqlist="list ${outdir}fastq.list"
	batchscript="${outdir}gotcloud_align_${i}.sh"

	## create job script
	##   set --outdir
	##   set --list
	cat /home/trubetsk/google-gotcloud/scripts/gotcloud_align_template.txt |
		sed 's|outdir|'"${outdiropt}"'|' - |
		sed 's|list|'"${fastqlist}"'|' - > ${batchscript}

	## submit that sucka
	sbatch -B 8 ${batchscript}
done
