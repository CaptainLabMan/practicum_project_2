bwa index refs/sequence.fasta
bwa mem refs/sequence.fasta reads/SRR1705851.fastq.gz | samtools view -Sb | samtools sort -o alignments/roommate_sorted.bam

samtools index alignments/roommate_sorted.bam
samtools depth alignments/roommate_sorted.bam > alignments/roommate_sorted_coverage.txt
cut -f3 alignments/roommate_sorted_coverage.txt | sort -nr | head -1 > alignments/roommate_sorted_max_depth.txt

samtools mpileup -f refs/sequence.fasta alignments/roommate_sorted.bam -d 44522 > mpileup/my.mpileup
varscan mpileup2snp mpileup/my.mpileup --min-var-freq 0.95 --variants --output-vcf 1 > vcf/VarScan_results_95.vcf
cat vcf/VarScan_results_95.vcf | awk 'NR>24 {print $1, $2, $4, $5}' > vcf/VarScan_results_95_variants.txt
varscan mpileup2snp mpileup/my.mpileup --min-var-freq 0.001 --variants --output-vcf 1 > vcf/VarScan_results_0.1.vcf
cat vcf/VarScan_results_0.1.vcf | awk 'NR>24 {print $1, $2, $4, $5}' > vcf/VarScan_results_0.1_variants.txt

bwa mem refs/sequence.fasta reads/SRR1705858.fastq.gz | samtools view -Sb | samtools sort -o alignments/SRR1705858_sorted.bam
bwa mem refs/sequence.fasta reads/SRR1705859.fastq.gz | samtools view -Sb | samtools sort -o alignments/SRR1705859_sorted.bam
bwa mem refs/sequence.fasta reads/SRR1705860.fastq.gz | samtools view -Sb | samtools sort -o alignments/SRR1705860_sorted.bam
gunzip -c reads/SRR1705858.fastq.gz | grep '^@' | wc -l > reads/SRR1705858.fastq.reads_count.txt
gunzip -c reads/SRR1705859.fastq.gz | grep '^@' | wc -l > reads/SRR1705859.fastq.reads_count.txt
gunzip -c reads/SRR1705860.fastq.gz | grep '^@' | wc -l > reads/SRR17058560.fastq.reads_count.txt
samtools index alignments/SRR1705858_sorted.bam
samtools index alignments/SRR1705859_sorted.bam
samtools index alignments/SRR1705860_sorted.bam
samtools depth alignments/SRR1705858_sorted.bam > alignments/SRR1705858_sorted_coverage.txt
samtools depth alignments/SRR1705859_sorted.bam > alignments/SRR1705859_sorted_coverage.txt
samtools depth alignments/SRR1705860_sorted.bam > alignments/SRR1705860_sorted_coverage.txt
cut -f3 alignments/SRR1705858_sorted_coverage.txt | sort -nr | head -1 > alignments/SRR1705858_sorted_max_depth.txt
cut -f3 alignments/SRR1705859_sorted_coverage.txt | sort -nr | head -1 > alignments/SRR1705859_sorted_max_depth.txt
cut -f3 alignments/SRR1705860_sorted_coverage.txt | sort -nr | head -1 > alignments/SRR17058560_sorted_max_depth.txt
samtools mpileup -f refs/sequence.fasta alignments/SRR1705858_sorted.bam -d 44522 > mpileup/SRR1705858_sorted.mpileup
samtools mpileup -f refs/sequence.fasta alignments/SRR1705859_sorted.bam -d 44522 > mpileup/SRR1705859_sorted.mpileup
samtools mpileup -f refs/sequence.fasta alignments/SRR1705860_sorted.bam -d 44522 > mpileup/SRR1705860_sorted.mpileup
varscan mpileup2snp mpileup/SRR1705858_sorted.mpileup --min-var-freq 0.001 --variants --output-vcf 1 > vcf/SRR1705858_0.1.vcf
varscan mpileup2snp mpileup/SRR1705859_sorted.mpileup --min-var-freq 0.001 --variants --output-vcf 1 > vcf/SRR1705859_0.1.vcf
varscan mpileup2snp mpileup/SRR1705860_sorted.mpileup --min-var-freq 0.001 --variants --output-vcf 1 > vcf/SRR1705860_0.1.vcf