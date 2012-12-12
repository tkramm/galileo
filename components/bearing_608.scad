module bearing_608(){
	color("LightGrey") difference(){
		hull(){
			cylinder(6,11,11,$fn=80,center=true);
			cylinder(7,10.5,10.5,$fn=80,center=true);
		}
		translate([0,0,-0.5]) cylinder(10,9,9,$fn=80,center=true);
	}
	color("LightGrey") 
		difference(){
			cylinder(7,6,6,$fn=80,center=true);
			cylinder(10,4,4,$fn=80,center=true);
		}
	color("DarkGray") 
		difference(){
			cylinder(6.6,10.6,10.6,$fn=80,center=true);
			cylinder(10,5,5,$fn=80,center=true);
		}
}