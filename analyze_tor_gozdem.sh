#!/bin/bash
#SBATCH -p ulimited3
#SBATCH -J torsion-angles
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mail-type=ALL
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err
#SBATCH --mail-user=gozdem.cavdar@ibg.edu.tr

module load x3dna

# Simulation folder
sim_folder="/home/cavdarg/simulation/2022-07-29/run-11-mouse_gra-without-Mg/02_pdbs"


# Output file
distances="torsion.csv"
first_frame=0
last_frame=1001


declare -a arr=("$sim_folder")


for  (( frame=$first_frame; frame<$last_frame; frame++ ))
do
	echo "Frame: $frame"

        pdbfile="${arr[idx]}/md_${frame}.pdb"
	torfile="md_${frame}.tor"
        outfile="md_${frame}.out"
	find_pair $pdbfile $outfile
	analyze -t=$torfile $pdbfile
	sed '/Pseudo/q' $torfile | head -n -2 | tail -n +22 | awk -v frame=$frame '{print frame "," $2 "," $9 "," $10 "," $11 "," $12}'  >> ${distances}
	#sed '/Pseudo/q' $torfile | head -n -2 | tail -n +22 | awk -v frame=$frame -v condition=${arr[idx]} '{print frame "," $2 "," condition "," $9 "," $10 "," $11 "," $12}'  >> ${distances}
	#rm $outfile $torfile
done
