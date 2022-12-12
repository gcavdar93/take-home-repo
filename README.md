Using the script for the torsional angle analysis of DNA:

Gromacs ile yapilan bir molekuler dinamik simulasyonundan elde edilen npt.pdb ciktisi (protein ve dna iceriyor) su kod ile frame by frame bolunur:

nucleus splitpdbs -p npt.pdb

02_pdbs isminde bir klasor otomatik olarak olusur ve pdbler orada toplanir. 

02_pbds, analyze_tor_gozdem.sh ve charmm36.ff, take-home-repo klasorune kopyalanir. 

./analyze_tor_gozdem..sh
 
kodu ile script calistirilir. 

Elde edilen torsion.csv dosyasi, sirasiyla Frame, Chain ID, Bp_Number, Base, Epsilon, Zeta, E_Z ve Population columnlarindan olusan bir dataframe icerir. 


