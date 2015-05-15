#!/bin/bash
#$ -t 1
#$ -o  /home/trubetsk/bam2fastq/logs/bam2fastq_test.out
#$ -j y
#$ -S /bin/bash
#$ -V

##############################################################################
## test out the BAM-to-FASTQ pipeline on a single sample
##############################################################################

## collect bams
rg_bams=($(ls /mnt/data/test_1000g_bams/read_group_bams/*bam))

## start with just a single sample
#bam=${bams[$SGE_TASK_ID]}
#bam="/home/trubetsk/data/test_1000g_bams/HG01051.wgs.ILLUMINA.bwa.PUR.high_cov_pcr_free.20140203.bam"
#rg_bam="/home/trubetsk/data/test_1000g_bams/read_group_bams/$( basename ${bam%%.bam} )"
#sample=$(basename $bam | cut -d '.' -f 1)

for bam in ${rg_bams[@]}; do
  sample_rg=$(basename ${bam%%.bam})
  fastq="/mnt/data/test_1000g_bams/fastq/${sample_rg}"
  echo -e "#\!/bin/bash\n /home/vasya/gotcloud/bin/bam bam2fastq --in $bam --out $fastq" > "bam2fastq.sh"
  chmod u+x "./bam2fastq.sh"
  /usr/bin/time -v -o /mnt/data/test_1000g_bams/bam2fastq/logs/${sample_rg}_bam2fastq_test.log "./bam2fastq.sh" 
done
wait
rm ./bam2fastq.sh

