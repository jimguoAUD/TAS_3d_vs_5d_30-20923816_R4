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
mkdir H10
cd
gunzip *.gz
cp *.fastq fastq_file
cd fastq_file
mv	3day-H10-F_S21_R1_001.fastq	3day-H10-F_R1.fastq
mv	3day-H10-F_S21_R2_001.fastq	3day-H10-F_R2.fastq
mv	5day-H10-F_S43_R1_001.fastq	5day-H10-F_R1.fastq
mv	5day-H10-F_S43_R2_001.fastq	5day-H10-F_R2.fastq
mv	plasmid-H10-F_S65_R1_001.fastq	plasmid-H10-F_R1.fastq
mv	plasmid-H10-F_S65_R2_001.fastq	plasmid-H10-F_R2.fastq
mv	3day-H10-R_S94_R1_001.fastq	3day-H10-R_R1.fastq
mv	3day-H10-R_S94_R2_001.fastq	3day-H10-R_R2.fastq
mv	5day-H10-R_S116_R1_001.fastq	5day-H10-R_R1.fastq
mv	5day-H10-R_S116_R2_001.fastq	5day-H10-R_R2.fastq
mv	plasmid-H10-R_S138_R1_001.fastq	plasmid-H10-R_R1.fastq
mv	plasmid-H10-R_S138_R2_001.fastq	plasmid-H10-R_R2.fastq
cd
PATH=$PATH:/home/dnanexus/FLASH-1.2.8/
MTDriver.pl --params_file H10.xml
unset DX_WORKSPACE_ID
dx cd project-F6xFvX00g3QK3fbp5qxYx1y3
dx cd MT-toolbox-results
cd MT-toolbox_data
dx upload -r H10
dx terminate job-F8ZvpF80g3Q6XgbV0FzQ95vK
