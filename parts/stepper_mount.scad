include <configuration.scad>
include <../components/2040.scad>
include <../components/nema17.scad>


module motor_mount(){
	difference(){
		union(){
			hull(){
				translate([15.5,15.5,3]) cylinder(r=6,h=6,center=true,$fn=50);
				translate([15.5,-15.5,3]) cylinder(r=6,h=6,center=true,$fn=50);
				translate([-15.5,15.5,3]) cylinder(r=6,h=6,center=true,$fn=50);
				translate([-15.5,-15.5,3]) cylinder(r=6,h=6,center=true,$fn=50);
				translate([42,12,3]) cube([38,4,6],center=true);
				translate([42,-12,3]) cube([38,4,6],center=true);
			}
			hull(){
				translate([32,0,-4.5]) rotate([90,0,0]) cylinder(28,5,5,$fn=50,center=true);
				translate([52,0,-4.5]) rotate([90,0,0]) cylinder(28,5,5,$fn=50,center=true);
				translate([42,0,1]) cube([38,28,2],center=true);
			}
		}
		nema17(clearance=1);
		translate([42,0,0]) beam_2040(h=160, clearance=1);
		translate([0,0,0]) cube([200,16,20],center=true);

		translate([32,0,-4.5]) rotate([90,0,0]) cylinder(100,m4_open_radius,m4_open_radius,$fn=20,center=true);
		translate([52,0,-4.5]) rotate([90,0,0]) cylinder(100,m4_open_radius,m4_open_radius,$fn=20,center=true);
	}
}
rotate([0,180,0]) motor_mount();
//motor_mount();
%nema17();
%color("Silver") translate([42,0,0]) beam_2040(h=160);
