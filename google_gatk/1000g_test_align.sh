#!/bin/bash
sample="HG00096"
run="wgs1000g"
population="GBR"
sequence_type="Genome"

for i in {1..2}; do
  gatk-google-alpha set Sample:"${sample}" Run:"${run}" Population:"${population}" Platform:Illumina SequenceType:"${sequence_type}"  gs://gatk-testing/fastq/SRR062634_${i}.filt.fastq.gz 
done

gatk-google-alpha dna-align-3.4-0a -project-id friendly-medley-91616 -input gs://gatk-testing/fastq/*fastq.gz -output gs://gatk-testing/output/
