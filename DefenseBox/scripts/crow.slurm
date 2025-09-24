#!/bin/bash

#################################################
## TEMPLATE VERSION 1.01                       ##
#################################################
## ALL SBATCH COMMANDS WILL START WITH #SBATCH ##
## DO NOT REMOVE THE # SYMBOL                  ## 
#################################################

#SBATCH --job-name=crow_eval
#SBATCH --output=logs/crow_epoch10

#SBATCH --nodes=1
#SBATCH --gres=gpu:H100
#SBATCH --time=06:00:00

#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=acheung@gatech.edu

#################################################
##            END OF SBATCH COMMANDS           ##
#################################################

# check that the script is launched with sbatch
if [ "x$SLURM_JOB_ID" == "x" ]; then
   echo "You need to submit your job to the queuing system with sbatch"
   exit 1
fi

# Run the job from this directory:
cd /home/hice1/acheung46/scratch/poison/BackdoorLLM
source .venv/bin/activate

cd DefenseBox/defense_methods

set -eux
python crow.py --epochs 10
