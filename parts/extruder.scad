include <configuration.scad>
include <../components/2040.scad>
include <../components/nema17.scad>
include <../components/drive_gear.scad>
include <../components/push_fit.scad>
include <../components/bearing_608.scad>
include <../components/bearing_624.scad>

gear_h = 9;
block_h = 22;

module block(){
	difference(){
		union(){
				translate([-19,27,6]) rotate([0,90,0]) cube([12,12,4],center=true);
				translate([-19,-37,6]) rotate([0,90,0]) cube([12,12,4],center=true);
			hull(){
				translate([6.5,-11,gear_h+2]) rotate([90,0,0]) cylinder(h=20,r=16/2,$fn=50);
				translate([0,-21,6]) cube([22,20,12],center=true);
			}

			hull(){
				translate([6.5,11,gear_h+2]) rotate([-90,0,0]) cylinder(h=10,r=4.5,$fn=50);
				translate([2,16,block_h/2-(block_h/4)]) cube([17,10,block_h/2],center=true);
				translate([0,16,6]) cube([22,10,12],center=true);
			}

			translate([-10.5,-5,6]) cube([21,52,12],center=true);
		}
		block_cutout();
	}
}

module block_cutout(){

		// beam mount screws cutout
		translate([-21,27,6]) rotate([0,90,0]) cylinder(r=m4_open_radius,h=10,center=true,$fn=100);
		translate([-21,-37,6]) rotate([0,90,0]) cylinder(r=m4_open_radius,h=10,center=true,$fn=100);

		// Mount screw cutouts
		translate([-15.5,15.5,block_h/2]) cylinder(r=m3_open_radius,h=100,center=true,$fn=40);
		translate([-15.5,-15.5,block_h/2]) cylinder(r=m3_open_radius,h=100,center=true,$fn=40);

		// Screw head cutout
		translate([-15.5,15.5,6]) cylinder(r=3,h=100,$fn=40);
		translate([-15.5,-15.5,6]) cylinder(r=3,h=100,$fn=40);

		// Idler Axis Cutout
		hull(){
			translate([15.5,-15.5,block_h/2]) cylinder(r=4.5,h=block_h,$fn=100,center=true);
			translate([15.5,-10,block_h/2]) cylinder(r=4.5,h=block_h,$fn=100,center=true);
		}

		// Idler tensioner cutouts
		translate([-2,22,block_h/2-(block_h/4)]) cube([4,30,7.4],center=true);
		translate([-1,16.2,block_h/2-(block_h/4)]) rotate([0,90,0]) cylinder(h=100,r=m4_open_radius,$fn=50);

		// Push fit cutout
		translate([6.5,-21,gear_h+2]) rotate([90,0,0]) cylinder(25,9.7/2,10.4/2,$fn=50);

		// Drive cutout
        translate([0,0,gear_h]) drive_gear(clearance = 1);
		cylinder(h=12.1,r=11.4,center=true,$fn=100);
		translate([0,0,7]) cylinder(2.1,11.4,11,center=true,$fn=100);
		translate([0,0,7]) cylinder(11,11,11,center=true,$fn=100);
}

module idler(){
	difference(){
		union(){
			translate([17,0,block_h/2]) rotate([0,90,0]) hull(){
				translate([(block_h/2-2),19,0]) cylinder(6,2,2,$fn=20);
				translate([-(block_h/2-2)+10,19,0]) cylinder(6,2,2,$fn=20);
				translate([-(block_h/2-2),7,0]) cylinder(6,2,2,$fn=20);
				translate([0,-15.5,3]) cube([block_h,7.6,6],center=true);
			}
			hull(){
				translate([15.5,-15.5,block_h/2]) cylinder(r=3.8,h=block_h,center=true,$fn=100);
				translate([20,-15.5,block_h/2+0.1]) cube([6,7.6,block_h-0.2],center=true);
			}
			hull(){
				translate([20,0,gear_h+8]) cube([6,14,5],center=true);
				translate([14.5,0,gear_h+8]) cylinder(5,5.5,5.5,center=true,$fn=50);
			}
			hull(){
				translate([20,0,gear_h-4]) cube([6,14,5],center=true);
				translate([14.5,0,gear_h-4]) cylinder(5,5.5,5.5,center=true,$fn=50);
			}

		}

		translate([14.5,0,block_h/2]) cylinder(h=12,r=2,center=true,$fn=80);
		translate([18,0,gear_h+2]) cube([16,14,7],center=true);
		translate([10,0,gear_h+2]) cube([7.6,14,block_h-2],center=true);

		translate([15.5,-15.5,block_h/2]) cylinder(r=m3_open_radius,h=100,center=true,$fn=40);
		hull(){
			translate([-1,15.5,block_h/2-(block_h/4)]) rotate([0,90,0]) cylinder(h=100,r=4.8/2,$fn=50);
			translate([-1,22,block_h/2-(block_h/4)]) rotate([0,90,0]) cylinder(h=100,r=4.8/2,$fn=50);

		}
	}
	difference(){
		union(){
			translate([14.5,0,gear_h+5]) cylinder(1,3,4,center=true,$fn=50);
			translate([14.5,0,gear_h-1]) cylinder(1,4,3,center=true,$fn=50);
		}
		translate([14.5,0,block_h/2]) cylinder(h=9,r=2,center=true,$fn=80);
		translate([10,0,gear_h+2]) cube([7.6,14,block_h-2],center=true);
	}
}

module assembly(){
%	nema17();
	translate([0,0,gear_h]) drive_gear(clearance = 0);
%	translate([6.5,-23.1,gear_h+2]) rotate([90,0,0]) push_fit();
	color("GreenYellow") block();
	color("GreenYellow") idler();
%	translate([14.5,0,gear_h+2]) bearing_624();
}

assembly();
//rotate([0,90,0]) idler();
//rotate([0,0,0]) block();