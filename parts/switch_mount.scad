include <../components/2020.scad>
include <configuration.scad>

through_hole_radius = 6.3;

base_height = 3;
stength_height = 4;
max_height = 15;

module switch_mount(){
	difference(){
		hull(){
			translate([0,0,-(stength_height/2-base_height/2)]) cube([66,55.4,stength_height],center=true);
			translate([0,28,-7]) rotate([30,0,0]) translate([0,2,-8]) cube([66,4,24],center=true);
		}

		translate([0,0,-20-max_height]) cube([80,55,40],center=true);

		translate([-20,28,-7]) rotate([30,0,0]) translate([0,2,-10]) rotate([90,0,0]) cylinder(r=m4_open_radius,h=100,center=true, $fn=50);
		translate([20,28,-7]) rotate([30,0,0]) translate([0,2,-10]) rotate([90,0,0]) cylinder(r=m4_open_radius,h=100,center=true, $fn=50);

		translate([-22,-7,0]) cylinder(r=through_hole_radius,h=50,center=true,$fn=80);
		translate([0,-7,0]) cylinder(r=through_hole_radius,h=50,center=true,$fn=80);
		translate([22,-7,0]) cylinder(r=through_hole_radius,h=50,center=true,$fn=80);

		translate([22,-7,-16.5]) cube([16,26,30],center=true);
		translate([0,-7,-16.5]) cube([16,26,30],center=true);
		translate([-22,-7,-16.5]) cube([16,26,30],center=true);

		translate([0,28,-7]) rotate([30,0,0]) translate([0,-10,-10]) rotate([0,90,0]) beam(h=290,clearance=1);
	}
	%translate([0,28,-7]) rotate([30,0,0]) translate([0,-10,-10]) rotate([0,90,0]) beam(h=290,clearance=0);
}


rotate([180,0,0]) switch_mount();
//switch_mount();
