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
mkdir D11
cd
gunzip *.gz
cp *.fastq fastq_file
cd fastq_file
mv	3day-D11-F_S12_R1_001.fastq	3day-D11-F_R1.fastq
mv	3day-D11-F_S12_R2_001.fastq	3day-D11-F_R2.fastq
mv	5day-D11-F_S34_R1_001.fastq	5day-D11-F_R1.fastq
mv	5day-D11-F_S34_R2_001.fastq	5day-D11-F_R2.fastq
mv	plasmid-D11-F_S56_R1_001.fastq	plasmid-D11-F_R1.fastq
mv	plasmid-D11-F_S56_R2_001.fastq	plasmid-D11-F_R2.fastq
mv	3day-D11-R_S85_R1_001.fastq	3day-D11-R_R1.fastq
mv	3day-D11-R_S85_R2_001.fastq	3day-D11-R_R2.fastq
mv	5day-D11-R_S107_R1_001.fastq	5day-D11-R_R1.fastq
mv	5day-D11-R_S107_R2_001.fastq	5day-D11-R_R2.fastq
mv	plasmid-D11-R_S129_R1_001.fastq	plasmid-D11-R_R1.fastq
mv	plasmid-D11-R_S129_R2_001.fastq	plasmid-D11-R_R2.fastq
cd
PATH=$PATH:/home/dnanexus/FLASH-1.2.8/
MTDriver.pl --params_file D11.xml
unset DX_WORKSPACE_ID
dx cd project-F6xFvX00g3QK3fbp5qxYx1y3
dx cd MT-toolbox-results
cd MT-toolbox_data
dx upload -r D11
dx terminate job-F8ZvGZQ0g3QG09Vq6X3bjbJ9
