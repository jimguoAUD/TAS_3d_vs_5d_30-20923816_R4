## setting up DNAnexus workstation to run MT-toolbox workflow
## MT-toolbox was preinstalled on workstation using snapshot (https://dl.dnanex.us/F/D/xKPxY5jgfBq7903QGVQKgG4yQKzf1y8yYz2fxQkB/MT-toolbox.snapshot)
#! /usr/bin/env bash

# run script with bash -x *.sh to log the command. (* needs to be replaced with specific bash script name)

# These commands are for logging the output.
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3

# the name "log.out" should be changed for each run to be associated with each file.
exec 1>*_log.txt 2>&1

mkdir fastq_file
mkdir MT-toolbox_data
cd MT-toolbox_data
mkdir F12
cd
gunzip *.gz
cp *.fastq fastq_file
cd fastq_file
mv	3day-F12-F_S15_R1_001.fastq	3day-F12-F_R1.fastq
mv	3day-F12-F_S15_R2_001.fastq	3day-F12-F_R2.fastq
mv	5day-F12-F_S37_R1_001.fastq	5day-F12-F_R1.fastq
mv	5day-F12-F_S37_R2_001.fastq	5day-F12-F_R2.fastq
mv	plasmid-F12-F_S59_R1_001.fastq	plasmid-F12-F_R1.fastq
mv	plasmid-F12-F_S59_R2_001.fastq	plasmid-F12-F_R2.fastq
mv	3day-F12-R_S88_R1_001.fastq	3day-F12-R_R1.fastq
mv	3day-F12-R_S88_R2_001.fastq	3day-F12-R_R2.fastq
mv	5day-F12-R_S110_R1_001.fastq	5day-F12-R_R1.fastq
mv	5day-F12-R_S110_R2_001.fastq	5day-F12-R_R2.fastq
mv	plasmid-F12-R_S132_R1_001.fastq	plasmid-F12-R_R1.fastq
mv	plasmid-F12-R_S132_R2_001.fastq	plasmid-F12-R_R2.fastq
cd
PATH=$PATH:/home/dnanexus/FLASH-1.2.8/
MTDriver.pl --params_file F12.xml
unset DX_WORKSPACE_ID
dx cd project-F6xFvX00g3QK3fbp5qxYx1y3
dx cd MT-toolbox-results
cd MT-toolbox_data
dx upload -r F12
dx terminate job-F8ZvZYQ0g3Q1K6gp6PGzQJZB
