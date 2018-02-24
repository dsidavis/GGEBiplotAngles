
gge:::biplot.gge is the function that does the plotting.

Regarding flip = "auto".
With the sample data set (ng_dataset.csv),
the correlation between the genMeans and the PC components
is negative for the second PC, so we do flip (multiply by -) the coordinates
for this, for each of locCoord, genCoord and blockCoord.

