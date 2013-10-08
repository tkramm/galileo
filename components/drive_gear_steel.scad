include <configuration.scad>
include <../components/nema17.scad>



module filament_around(d=3){
	rotate_extrude(convexity = 10, $fn = 50)
		translate([14.2/2, 0, 0])
			circle(r = d/2, $fn = 50);
}

module filament(d=3){
	rotate([90,0,0])
	cylinder(h=200,r = d/2, $fn = 50,center=true);
}


module drive_gear(clearance = 0){
	if(clearance > 0){
		cylinder(h=12,r=6.5,center=true,$fn=50);
		translate([14.2/2,0,2]) filament(d=3.3);
	} else {
		color("Silver") difference(){
			cylinder(h=11,r=12.6/2,center=true,$fn=50);
			translate([0,0,2]) filament_around();
			cylinder(h=20,r=2.5,center=true,$fn=30);
		}
		color("Red") translate([14.2/2,0,2]) filament();
	}
}