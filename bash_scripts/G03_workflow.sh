mkdir fastq_file
mkdir MT-toolbox_data
cd MT-toolbox_data
mkdir G03
cd
gunzip *.gz
cp *.fastq fastq_file
cd fastq_file
mv	3day-G03-F_S6_R1_001.fastq	3day-G03-F_R1.fastq
mv	3day-G03-F_S6_R2_001.fastq	3day-G03-F_R2.fastq
mv	5day-G03-F_S28_R1_001.fastq	5day-G03-F_R1.fastq
mv	5day-G03-F_S28_R2_001.fastq	5day-G03-F_R2.fastq
mv	plasmid-G03-F_S50_R1_001.fastq	plasmid-G03-F_R1.fastq
mv	plasmid-G03-F_S50_R2_001.fastq	plasmid-G03-F_R2.fastq
mv	3day-G03-R_S79_R1_001.fastq	3day-G03-R_R1.fastq
mv	3day-G03-R_S79_R2_001.fastq	3day-G03-R_R2.fastq
mv	5day-G03-R_S101_R1_001.fastq	5day-G03-R_R1.fastq
mv	5day-G03-R_S101_R2_001.fastq	5day-G03-R_R2.fastq
mv	plasmid-G03-R_S123_R1_001.fastq	plasmid-G03-R_R1.fastq
mv	plasmid-G03-R_S123_R2_001.fastq	plasmid-G03-R_R2.fastq
cd
PATH=$PATH:/home/dnanexus/FLASH-1.2.8/
MTDriver.pl --params_file G03.xml
unset DX_WORKSPACE_ID
dx cd project-F6xFvX00g3QK3fbp5qxYx1y3
dx cd MT-toolbox-results
cd MT-toolbox_data
dx upload -r G03
dx terminate job-F8ZvjZ00g3Q7v6Z56Kkv7P8k
