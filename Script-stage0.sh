#Print name
name="Luisa"
Lastname="Criollo"
echo "$name $Lastname"
echo -e "$name \n$Lastname"
# Story 1
mkdir Luisa
mkdir biocomputing
cd biocomputing
sudo apt-get install wget
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
mv wildtype.fna /home/luisacriollo17/Luisa
rm wildtype.gbk.1
cd ~
cd Luisa
grep "tatatata" wildtype.fna
grep "tatatata" wildtype.fna > mutant.fna
clear
history
ls biocomputing Luisa
exit
#Story2
figlet Luisa
mkdir compare
cd compare
wget https://www.bioinformatics.babraham.ac.uk/training/Introduction%20to%20Unix/unix_intro_data.tar.gz
gunzip unix_intro_data.tar.gz
tar -xvf unix_intro_data.tar
cd seqmonk_genomes
cd 'Saccharomyces cerevisiae'
cd EF4
cp Mito.dat /home/luisacriollo17/compare
nano Mito.dat
mv Mito.dat /home/luisacriollo17/compare/Mitochondrion.txt
cd ~
cd compare
cd FastQ_Data
wc -l lane8_DD_P4_TTAGGC_L008_R1.fastq.gz
wc -l *
wc -l * > linesnumber.fastq.gz
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
conda install -c bioconda seqtk
conda install -c bioconda samtools
conda install -c bioconda fastp
