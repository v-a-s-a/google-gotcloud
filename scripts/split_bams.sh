#!/bin/bash

## collect bams
bams=($(ls /mnt/data/test_1000g_bams/raw_bams/))

for bam in ${bams[@]}; do 
	bam_path="/mnt/data/test_1000g_bams/raw_bams/"${bam}
	rg_bam="/mnt/data/test_1000g_bams/read_group_bams/$( basename ${bam%%.bam} )"
	sample=$(basename $bam | cut -d '.' -f 1)

	echo -e "#!/bin/sh\n /home/vasya/gotcloud/bin/bam splitBam --in ${bam_path} --out ${rg_bam}" > "/tmp/${sample}.sh"
	sbatch -B 2 /tmp/${sample}.sh
done




