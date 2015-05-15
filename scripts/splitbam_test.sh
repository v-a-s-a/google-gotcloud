#!/bin/bash
#$ -t 1
#$ -o  /home/trubetsk/bam2fastq/logs/split_test.out
#$ -j y
#$ -S /bin/bash
#$ -V

##############################################################################
## test out the BAM-to-FASTQ pipeline on a single sample
##############################################################################


## collect bams
bams=($(ls /mnt/data/test_1000g_bams/*bam))

## start with just a single sample
#bam=${bams[$SGE_TASK_ID]}
bam="/mnt/data/test_1000g_bams/HG01051.wgs.ILLUMINA.bwa.PUR.high_cov_pcr_free.20140203.bam"
rg_bam="/home/trubetsk/data/test_1000g_bams/read_group_bams/$( basename ${bam%%.bam} )"
sample=$(basename $bam | cut -d '.' -f 1)


## log performance metrics
## Split BAM into read groups
## write a create a tmp script
tmp_dir="/tmp/${JOB_ID}"
mkdir $tmp_dir
cd $tmp_dir
echo -e "#\!/bin/bash\n /home/vasya/gotcloud/bin/bam splitBam --in $bam --out $rg_bam" > "splitBam.sh"
chmod u+x "./splitBam.sh"
/usr/bin/time -v -o /mnt/data/test_1000g_bams/bam2fastq/logs/${sample}_splitBam_test.log "./splitBam.sh"
cd ~
rm -rf $tmp_dir
 


