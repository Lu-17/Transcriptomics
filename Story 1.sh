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
