bowtie_path=$1


echo "Downloading stuff"
#
wget ftp://ftp.ensembl.org/pub/release-91/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna.toplevel.fa.gz
wget ftp://ftp.ensembl.org/pub/release-91/gtf/mus_musculus/Mus_musculus.GRCm38.91.gtf.gz
wgte ftp://ftp-mouse.sanger.ac.uk/REL-1410-SNPs_Indels/mgp.v4.snps.dbSNP.vcf.gz
wget ftp://ftp-mouse.sanger.ac.uk/REL-1410-SNPs_Indels/mgp.v4.indels.dbSNP.vcf.gz
#
#wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR586/007/SRR5863327/SRR5863327.fastq.gz
#
#echo "Unzipping"
#
gunzip Mus_musculus.GRCm38.dna.toplevel.fa.gz
gunzip Mus_musculus.GRCm38.91.gtf.gz


echo "Cleaning"
python filter_contigs.py Mus_musculus.GRCm38.dna.toplevel.fa
python filter_gtf.py Mus_musculus.GRCm38.91.gtf

echo "Constructing diploid txome"
bash create_diploid_transcriptome.sh

echo "Preparing reference"
mkdir -p  rsem_exp/rsem_ref/
rsem-prepare-reference --bowtie2 --bowtie2-path $bowtie_path NxP/emase.pooled.transcripts.fa rsem_exp/rsem_ref/reference -p 16

