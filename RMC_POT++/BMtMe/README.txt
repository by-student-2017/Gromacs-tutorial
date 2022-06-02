VMD
1. get "BMtMe_s.gro" from convert_gromacs
2. gmx editconf -f BMtMe_s.gro -o BMtMe_s.pdb
3. vmd BMtMe_s.pdb

Energy minimization (1 cycle)
1. get "BMtMe_s.gro" and "BMtMe_s1.top" from convert_gromacs
2. gmx grompp -f minim.mdp -c BMtMe_s.gro -p BMtMe_s1.top -o em.tpr
3. gmx mdrun -v -deffnm em
4. gmx energy -f em.edr -o potential.xvg
  4 0
  (4  Potential, 0 End)
5. xmgrace potential.xvg
6. vmd em.gro

---------------------------------------------------------------------------
Test (failed)

NVT (1st, 4 K -> 10 K)
7. gmx grompp -f nvt1.mdp -c em.gro -r em.gro -p BMtMe_s1.top -o nvt1.tpr
8. gmx mdrun -deffnm nvt1
9. gmx energy -f nvt.edr -o temperature.xvg
  9 0
  (9  Temperature, 0 End)
10. xmgrace temperature.xvg
11. vmd nvt1.gro nvt1.trr

NVT (2nd, 10 K -> 20 K)
12. gmx grompp -f nvt2.mdp -c nvt1.gro -r nvt1.gro -t nvt1.cpt -p BMtMe_s1.top -o nvt2.tpr
13. gmx mdrun -deffnm nvt2
14. gmx energy -f nvt2.edr -o temperature.xvg
  9 0
  (9  Temperature, 0 End)
15. xmgrace temperature.xvg
16. vmd nvt2.gro nvt2.trr

NPT (1st, 20 K, 1 bar)
17. gmx grompp -f npt1.mdp -c nvt2.gro -r nvt2.gro -t nvt2.cpt -p BMtMe_s1.top -o npt1.tpr
18. gmx mdrun -deffnm npt1
19. gmx energy -f npt1.edr -o pressure.xvg
  11 0
  (11  Pressure, 0 End)
20. xmgrace pressure.xvg
21. vmd npt1.gro npt1.trr

NPT (2nd, 20 K, 1 bar) one more
22. gmx grompp -f npt2.mdp -c npt1.gro -r npt1.gro -t npt1.cpt -p BMtMe_s1.top -o npt2.tpr
23. gmx mdrun -deffnm npt2
24. gmx energy -f npt2.edr -o pressure.xvg
  11 0
  (11  Pressure, 0 End)
25. xmgrace pressure.xvg
26. vmd npt2.gro npt2.trr

MD (20 K, 1 bar)
27. gmx grompp -f md.mdp -c npt2.gro -r npt2.gro -t npt2.cpt -p BMtMe_s1.top -o md.tpr
28. gmx mdrun -deffnm md
29. gmx trjconv -s md.tpr -f md.xtc -o md_noPBC.xtc -pbc mol -center
 Select a group: 2
 Selected 2: 'BMtMe'
 Select a group: 0
 Selected 0: 'System'
30. vmd md.gro md_noPBC.xtc
