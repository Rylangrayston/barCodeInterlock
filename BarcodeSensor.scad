hole1=(3)/2-.15;
hole2=(5)/2-.2;
hole3=1/2;


pairDistance=12;
edge=2;
swipeLength=50;

//21


module one(holeA=hole1) {
    difference(){
        union(){
            square([pairDistance+edge*2+hole2*2,edge*2+hole2*2],center=true);
            translate([0,-swipeLength/2]) square([pairDistance+edge*2+hole2*2,swipeLength],center=true);
        }
        translate([-pairDistance/2,0]) circle(holeA,$fn=20);
        translate([pairDistance/2,0]) circle(holeA,$fn=20);
    }
}
one(hole3);