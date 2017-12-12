# This script compares the merged reads derived from MT-tool box with the reference amplicon sequence. The output the script include a plot of base error rate and a txt file with numerical error rate at each base position.
# python TAS_error-rate.py merged_reads.fastq amplicon_ref_seq.fasta error_rate_report.txt

from sys import argv
import time
import matplotlib

## convert AscII code to numerical number
def phred33ToQ(qual):
    return ord(qual)-33

## main script
t0 = time.time()

reads = argv[1]
ref_seq_file = argv[2]
final_report = argv[3]

read_name, read_seq, read_plus, read_phred, report, error_rate,non_ref_count,ref_count = ([] for i in range (8))
with open (ref_seq_file, 'r') as f:
    f.readline().strip()
    ref_seq = f.readline().strip()
# print (ref_seq)
for i in range(len(ref_seq)):
    error_rate.append(0)
    non_ref_count.append(0)
    ref_count.append(0)

with open(reads, 'r') as f1:
    lines = f1.read().splitlines()
    # read the first 1 M reads for downstream analysis
    for i, line in enumerate(lines):
        if i%4 == 0:
            read_name.append(line)
        elif i%4 == 1:
            read_seq.append(line)
        elif i%4 == 2:
            read_plus.append(line)
        elif i%4 ==3:
            read_phred.append(line)

for phred,seq in zip(read_phred,read_seq):
    # only consider merged reads whose length is equal to reference seq
    if len(seq) == len(ref_seq):
        print ("phred score is:\n %s, seq is \n %s" %(phred,seq))
        for i, base in enumerate(seq):
            print ("%s,%s" %(i,base))
            # only consider bases with phred score larger equal to 30
            print (phred33ToQ(phred[i]))
            if phred33ToQ(phred[i]) >=30:
                # add method upper() for case-insensitive
                if base.upper() == ref_seq[i].upper():
                    ref_count[i]+=1
                else:
                    non_ref_count[i]+=1

for i in range(len(ref_seq)):
    error_rate[i] = non_ref_count[i]/(ref_count[i]+non_ref_count[i])*100
 
# set default backend
matplotlib.use('Agg')

import matplotlib.pyplot as plt
f=plt.figure(1)
plt.subplot(211)
plt.plot(error_rate)
plt.show()
plt.title("Error rate at each base position")
plt.ylabel("% of non-reference sequence")
f.savefig("error_rate.pdf")

t1 = time.time()
total = t1-t0
report.append("total running time is %.2f" % total)
with open (final_report, 'w') as f:
    for line in report:
        f.write(line)
    for line in error_rate:
        f.write("%s\n" %line)

