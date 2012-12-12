module m4x60_hex(){
	color("LightGrey") 
		difference(){
			cylinder(4,3.5,3.5,$fn=40);
			translate([0,0,1.1])cylinder(3,1.6,1.6,$fn=6);
		}
	color("LightGrey") translate([0,0,-40]) cylinder(40,2,2,$fn=30);
	color("Gray") translate([0,0,-60]) cylinder(20,1.9,1.9,$fn=30);
}