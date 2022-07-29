#install packages
conda install -c bioconda fastqc
conda install -c bioconda samtools
conda install -c bioconda qualimap
#download datasets
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/ACBarrie_R2_rep.fastq.gz?raw=true -O ACBarrie_R2_rep.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/alignment_map/ACBarrie.bam?raw=true -O ACBarrie.bam
#run fastqc
fastqc -o output ACBarrie_R1.fastq.gz
#unzip bam.gz file
gzip -d ACBarrie.bam.gz
#run samtools
samtools flagstat ACBarrie.bam > ACBarrie_flagstat.txt
#view the content of the file
cat ACBarrie_flagstat.txt
# move the file to the output folder
mv ACBarrie_flagstat.txt /home/luisacriollo17/output/ACBarrie_flagstat.txt
#sort file
samtools sort ACBarrie.bam -o ACBarrie_sorted.bam 
#run qualimap
qualimap bamqc -bam /home/luisacriollo17/ACBarrie_sorted.bam -outdir /home/luisacriollo17/output





