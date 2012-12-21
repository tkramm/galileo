include <configuration.scad>
module push_fit(clearance = 0){
	if(clearance > 0){
		union(){
			translate([0,0,8]) cylinder(h=8,r=12.3/2,$fn=6);
			translate([0,0,8]) cylinder(h=16,r=10.6/2,$fn=50);
			cylinder(h=24,r=9.6/2,$fn=50);
		}
	} else {
		color("Silver") difference(){
			union(){
				translate([0,0,8]) cylinder(h=8,r=12.3/2,$fn=6);
				translate([0,0,8]) cylinder(h=16,r=10.6/2,$fn=50);
				cylinder(h=24,r=9.2/2,$fn=50);
			}
			translate([0,0,14]) cylinder(h=16,r=6/2,$fn=50);
			translate([0,0,-1]) cylinder(h=18,r=4/2,$fn=6);
		}

	}
}