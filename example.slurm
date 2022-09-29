#!/bin/bash

## Setup SLURM submission options ----------------------------------------------

## Setup job to run on the stat queue
#SBATCH --partition=stat

## Give job a name to easily identify using: squeue -u $USER
#SBATCH --job-name=example

## Send email on any change in job status (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-type=ALL

## Define email address where notifications will be sent
#SBATCH --mail-user=dalpiaz2@illinois.edu

## Define time (as hour:min:sec) allotted for job to run
#SBATCH --time=00:10:00

## Specify use of a single compute node
#SBATCH --ntasks=1

## Specify number of CPUs (cores) for parallel jobs
#SBATCH --cpus-per-task=8

## Request a maximum amount of RAM per CPU core
#SBATCH --mem-per-cpu=2150M

## Setup output directory ------------------------------------------------------

## Create a directory for the data output based on SLURM_JOBID assigned to job
mkdir ${SLURM_SUBMIT_DIR}/${SLURM_JOBID}

## Switch directory into job ID
cd ${SLURM_SUBMIT_DIR}/${SLURM_JOBID}

## Run computations ------------------------------------------------------------

## Load required modules
module load R

## Run script
Rscript $HOME/example.R
