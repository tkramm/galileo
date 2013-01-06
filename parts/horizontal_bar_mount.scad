include <configuration.scad>

translate([10,2,0]) difference() {
	cube([20,4,20], center=true);
	rotate([90,0,0]) cylinder(r=m4_open_radius,h=10,$fn=50,center=true);
}
rotate([0,0,-60]) translate([-10,2,0]) difference() { 
	cube([20,4,20], center=true);
	rotate([90,0,0]) cylinder(r=m4_open_radius,h=10,$fn=50,center=true);
}
