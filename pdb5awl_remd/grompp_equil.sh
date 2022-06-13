for dir in sim[0123]
do
  cd $dir
  gmx grompp -f equil.mdp -c ../pre/em.gro -r ../pre/em.gro -p ../pre/topol.top -o equil.tpr
  cd ..
done

