include <configuration.scad>;

difference(){
	body();
	cutouts();
}

module body(){
	translate([20,0,0])cube([40,40,4],center=true);

	translate([40,0,19])cube([4,40,42],center=true);

	hull(){
		translate([20,19,0])cube([40,2,4],center=true);
		translate([40,19,20])cube([4,2,40],center=true);
	}
	hull(){
		translate([20,-19,0])cube([40,2,4],center=true);
		translate([40,-19,20])cube([4,2,40],center=true);
	}

	hull(){
		translate([0,25,0]) cylinder(r=13,h=4,center=true,$fn=50);
		translate([0,-25,0]) cylinder(r=13,h=4,center=true,$fn=50);
	}
}

module cutouts(){
	translate([0,0,0]) cylinder(r=10,h=20,center=true,$fn=50);

	translate([0,25,0]) cylinder(r=m4_open_radius,h=20,center=true,$fn=20);
	translate([0,-25,0]) cylinder(r=m4_open_radius,h=20,center=true,$fn=20);

	translate([40,10,10]) rotate([0,90,0]) cylinder(r=m4_open_radius,h=20,center=true,$fn=20);
	translate([40,-10,10]) rotate([0,90,0]) cylinder(r=m4_open_radius,h=20,center=true,$fn=20);
	translate([40,10,30]) rotate([0,90,0]) cylinder(r=m4_open_radius,h=20,center=true,$fn=20);
	translate([40,-10,30]) rotate([0,90,0]) cylinder(r=m4_open_radius,h=20,center=true,$fn=20);
}
