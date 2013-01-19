module bearing_R4(){
	//outer ring
	color("LightGrey") difference(){
		hull(){
			cylinder(h=4.4,r=15.875/2,$fn=200,center=true);
			cylinder(h=4.978,r=15.775/2,$fn=200,center=true);
		}
		translate([0,0,-0.5]) cylinder(h=10,,r=13.1/2,$fn=80,center=true);
	}
	//inner ring
	color("LightGrey") 
		difference(){
			cylinder(h=4.978,r=8.7/2,$fn=80,center=true);
			cylinder(h=10,r=6.35/2,$fn=80,center=true);
		}
	//balls
	color("DarkGray") 
		difference(){
			cylinder(h=4.778,r=7,$fn=80,center=true);
			cylinder(h=10,r=3.5,$fn=80,center=true);
		}
}