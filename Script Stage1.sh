#install packages
conda install -c bioconda fastqc
conda install -c bioconda samtools
conda install -c bioconda star
conda install -c bioconda htseq
#download datasets
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/ACBarrie_R2_rep.fastq.gz?raw=true https://github.com/josoga2/yt-dataset/blob/main/dataset/alignment_map/ACBarrie.bam?raw=true
https://github.com/josoga2/yt-dataset/blob/384a2d0d72c395f5235025fa75b92308e5d73c7d/dataset/references/reference.fasta?raw=true -O reference.fastq.gz
#run fastqc
fastqc -o output ACBarrie_R1.fastq.gz
#run samtools
samtools flagstat ACBarrie.bam > ACBarrie_flagstat.txt
#view the content of the file
cat ACBarrie_flagstat.txt
# move the file to the output folder
mv ACBarrie_flagstat.txt /home/luisacriollo17/output/ACBarrie_flagstat.txt





