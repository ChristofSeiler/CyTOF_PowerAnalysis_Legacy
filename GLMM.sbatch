#!/bin/bash

#SBATCH --job-name=GLMM
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --mem-per-cpu=8GB
#SBATCH --time=02:00:00
#SBATCH --partition=bigmem
#SBATCH --qos=bigmem

module load R/3.3.0

start=`date +%s`

# preprocessing and differential analysis
ICC=$1
R -e "rmarkdown::render('GLMM.Rmd',output_file = 'GLMM_${ICC}.html',params = list(ICC = '${ICC}')"

end=`date +%s`
runtime=$((end-start))
echo runtime: $runtime sec.