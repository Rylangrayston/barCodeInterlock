laserCurf = .3;
barWidth = 2.5 ;
barLength = 5; 
barSpaceing = barWidth *2;

gapBetweenClockAndCode = 7 ;

startMargin = 2;
endMargin = 100; 
sideMargin = 2;

numberOfClocks = 4; 

totalStripLength = barSpaceing* numberOfClocks + startMargin + endMargin;
totalStripWidth = sideMargin * 2 + gapBetweenClockAndCode + barLength * 2;
echo(totalStripWidth);



codeSequence = [0,0,1,0];


module bar(){
    square([barLength - laserCurf, barWidth - laserCurf]);
}


module clock(){
    for ( i = [0:1:numberOfClocks - 1]){
            translate([0,(numberOfClocks - 1 - i) * barSpaceing,0])
        bar();
    }
}
//clock();

module code(){
    for (i = [0:1:numberOfClocks - 1]){
        if (codeSequence[i] == 0){
            translate([0,(numberOfClocks - 1 - i) * barSpaceing,0])
                bar();
        }
    }
    
}

module plate(){
    difference(){
        square([totalStripWidth, totalStripLength]);
        translate([sideMargin, startMargin,0 ]){
            translate([0, barWidth,0])
            clock();
            translate([barLength + gapBetweenClockAndCode, barWidth/2,0])
            code();
        }
    }
    
}
plate();





    