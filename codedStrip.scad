

barWidth = 2 ;
barLength = 7; 
barSpaceing = barWidth *2;

gapBetweenClockAndCode = 3 ;

startMargin = 2;
endMargin = 5; 
sideMargin = 2;

numberOfClocks = 8; 

totalStripLength = barSpaceing* numberOfClocks + startMargin + endMargin;
totalStripWidth = sideMargin * 2 + gapBetweenClockAndCode + barLength * 2;




codeSequence = [1,1,0,0,1,0,0,1];


module bar(){
    square([barLength, barWidth]);
}


module clock(){
    for ( i = [0:1:numberOfClocks - 1]){
        translate([0,i * barSpaceing,0])
        bar();
    }
}
//clock();

module code(){
    for (i = [0:1:numberOfClocks - 1]){
        if (codeSequence[i] == 1){
            translate([0,i * barSpaceing,0])
                bar();
        }
    }
    
}

module plate(){
    difference(){
        square([totalStripWidth, totalStripLength]);
        translate([sideMargin, startMargin,0 ]){
            clock();
            translate([barLength + gapBetweenClockAndCode, barWidth/2,0])
            code();
        }
    }
    
}
plate();
    
    
        