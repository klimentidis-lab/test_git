#!/bin/bash
#PBS -N ma_gwama
#PBS -m bea
#PBS -M arora@email.arizona.edu
#PBS -W group_list=yann
#PBS -q standard
#PBS -l select=1:ncpus=28:mem=168gb:pcmem=6gb
#PBS -l place=pack:shared
#PBS -l walltime=150:00:00
#PBS -l cput=4200:00:00

cd /rsgrps/yann/amit/Tools/ldsc/ldsc/
conda init --all --dry-run --verbose
conda activate ldsc

date
./munge_sumstats.py \
--sumstats /rsgrps/yann/amit/PleiotropicTraits/ngwama/ngwma_t2d.txt \
--N 231420 \
--out /rsgrps/yann/amit/PleiotropicTraits/ngwama/t2d \
--merge-alleles /rsgrps/yann/amit/Tools/SampleData/w_hm3.snplist

./ldsc.py \
--rg /rsgrps/yann/amit/PleiotropicTraits/ngwama/tg.sumstats.gz,/rsgrps/yann/amit/PleiotropicTraits/ngwama/ldl.sumstats.gz,/rsgrps/yann/amit/PleiotropicTraits/ngwama/fg.sumstats.gz,/rsgrps/yann/amit/PleiotropicTraits/ngwama/fi.sumstats.gz,/rsgrps/yann/amit/PleiotropicTraits/ngwama/t2d.sumstats.gz \
--ref-ld-chr /rsgrps/yann/amit/Tools/SampleData/eur_w_ld_chr/ \
--w-ld-chr /rsgrps/yann/amit/Tools/SampleData/eur_w_ld_chr/ \
--out /rsgrps/yann/amit/PleiotropicTraits/ngwama/tg_ldl_fg_fi_t2d
less /rsgrps/yann/amit/PleiotropicTraits/ngwama/tg_ldl_fg_fi_t2d.log

date