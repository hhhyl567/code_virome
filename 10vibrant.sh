#!/bin/sh
#SBATCH -o job_vibrant_1907PL4S.%j.%N.out
#SBATCH --partition=cpu
#SBATCH -J add_0
#SBATCH --get-user-env
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=14

source activate vibrant

input=/lustre/home/liyinghao_2022phd/05_glacier/process/02assembly
output=/lustre/home/liyinghao_2022phd/05_glacier/process/10vibrant
mkdir ${output}
#vibrant=/lustre/home/liutang/01software/VIBRANT #vVIBRANT_run.py目录
#samples=../samplefile1.txt
#samples=../samplefile2.txt
#samples=


#for i in $(cat $samples)
for i in 1907PL4S
do
mkdir ${output}/${i}
VIBRANT_run.py  -i ${input}/${i}/contigs.fasta \
                           -folder ${output}/${i} \
                           -t 14

#out_dir=${output}/${sampleid}/contigs.fasta
###分别筛选>=1000/>=1500/>=5000/>=10000bp的病毒序列
#for j in 1000 1500 5000 10000
#do
#echo -e "$(awk 'BEGIN{RS=">"}{sub("\n","\t"); gsub("\n",""); print RS$0}' ${out_dir}/${sampleid}/contigs.fasta_combined.fna | awk -v len=${j} 'BEGIN{OFS=FS="\t"}{if(length($2)>=len){sub("\t","\n");print $0}}')" >${out_dir}/${sampleid}_${j}bp.fasta
#done

done

#source activate vibrant
#VIBRANT_run.py  -i PATH/TO/INPUT/fasta \
                #-f Format of input ['nucl','prot',default='nucl'] \
                #-folder PATH/TO/OUTPUT [deflaut=working path] \
                #-t num of threads
                #-l length in basepairs to limit input sequeces [default=1000] \
                #-o number of ORFs per scaffold to limit input sequences [default=4] \
