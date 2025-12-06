mkdir -p refs
mkdir -p reads/fastqc
mkdir -p reads/trimmed
mkdir -p alignments
mkdir -p mpileup
mkdir -p vcf
mkdir -p data
mkdir -p scripts
wget -P reads http://ftp.sra.ebi.ac.uk/vol1/fastq/SRR170/001/SRR1705851/SRR1705851.fastq.gz
wget -P reads ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR170/008/SRR1705858/SRR1705858.fastq.gz
wget -P reads ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR170/009/SRR1705859/SRR1705859.fastq.gz
wget -P reads ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR170/000/SRR1705860/SRR1705860.fastq.gz
wget -P scripts https://raw.githubusercontent.com/pcingola/SnpEff/refs/heads/master/scripts/_OLD/vcfEffOnePerLine.pl
chmod +x scripts/vcfEffOnePerLine.pl