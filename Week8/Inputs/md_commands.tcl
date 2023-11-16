mol load dcd 2dWCA_T0.1_d${density_value}_N100000.dcd waitfor all
mol modcolor 0 top Temperature
mol modstyle 0 top VDW
mol modselect 0 top "name != 'W'"
mol modmaterial 0 top AOShiny
mol modrepresentation 0 top QuickSurf
mol modtrajectory 0 top 0
mol modtrajectory 0 top 1
mol drawframes top 0 last
render TachyonInternal ${image_file} size 800 600
exit