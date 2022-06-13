for dir in sim[0123]
do
  cd $dir
  gmx grompp -f sim.mdp -c equil.gro -r equil.gro -t equil.cpt -p ../pre/topol.top -o sim.tpr
  cd ..
done

