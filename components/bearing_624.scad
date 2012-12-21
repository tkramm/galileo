module bearing_624(clearance = 0){
	if(clearance > 0){
		cylinder(5,7,7,$fn=80,center=true);
	} else {
		color("LightGrey") difference(){
			hull(){
				cylinder(4.4,6.5,6.5,$fn=80,center=true);
				cylinder(5,6.35,6.35,$fn=80,center=true);
			}
			translate([0,0,-0.5]) cylinder(10,5.4,5.4,$fn=80,center=true);
		}
		color("LightGrey") 
			difference(){
				cylinder(5,3.5,3.5,$fn=80,center=true);
				cylinder(10,2,2,$fn=80,center=true);
			}
		color("DarkGray") 
			difference(){
				cylinder(4.8,6,6,$fn=80,center=true);
				cylinder(10,3,3,$fn=80,center=true);
			}
	}
}