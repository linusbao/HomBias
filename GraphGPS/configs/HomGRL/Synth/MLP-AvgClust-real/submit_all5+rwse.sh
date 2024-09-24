#! /bin/bash
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --time=00:10:00
#SBATCH --job-name=test
#SBATCH --partition=short

module purge
module load Anaconda3/2023.09-0

cfg="/data/coml-graphml/kell7068/thesis_code_1/GraphGPS/configs/GPS/Synth/GPS-AvgClust/All5+RWSE.yaml"

/data/coml-graphml/kell7068/GPS-env/bin/python3 "/data/coml-graphml/kell7068/thesis_code_1/GraphGPS/main.py" --cfg $cfg