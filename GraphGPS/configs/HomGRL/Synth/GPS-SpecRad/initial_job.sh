cfgs=( #GPS all inj no HP search
"/data/coml-graphml/kell7068/thesis_code_1/GraphGPS/configs/GPS/Synth/GPS-SpecRad/All5+RWSE.yaml"
"/data/coml-graphml/kell7068/thesis_code_1/GraphGPS/configs/GPS/Synth/GPS-SpecRad/All5.yaml"
"/data/coml-graphml/kell7068/thesis_code_1/GraphGPS/configs/GPS/Synth/GPS-SpecRad/RWSE.yaml"
"/data/coml-graphml/kell7068/thesis_code_1/GraphGPS/configs/GPS/Synth/GPS-SpecRad/Spasm+RWSE.yaml"
"/data/coml-graphml/kell7068/thesis_code_1/GraphGPS/configs/GPS/Synth/GPS-SpecRad/Spasm.yaml"
"/data/coml-graphml/kell7068/thesis_code_1/GraphGPS/configs/GPS/Synth/GPS-SpecRad/initial_job.sh"
"/data/coml-graphml/kell7068/thesis_code_1/GraphGPS/configs/GPS/Synth/GPS-SpecRad/none.yaml"
)

for c in "${cfgs[@]}"; do
    cat <<EOT > temp_submit.sh
#! /bin/bash
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --time=12:00:00
#SBATCH --job-name=test
#SBATCH --partition=short

module purge
module load Anaconda3/2023.09-0

/data/coml-graphml/kell7068/GPS-env/bin/python3 "/data/coml-graphml/kell7068/thesis_code_1/GraphGPS/main.py" --cfg "$c" --repeat 1 wandb.use True
EOT

    sleep 1s
    sbatch temp_submit.sh
    #cat temp_submit.sh

done