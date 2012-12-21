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
			hull(){
				translate([-19,28,7]) rotate([0,90,0]) cube([14,14,4],center=true);
				translate([-19,-28,7]) rotate([0,90,0]) cube([14,14,4],center=true);
			}
			hull(){
				translate([-5,16,block_h/2]) cube([31,10,block_h],center=true);
				translate([-6,-16,block_h/2]) cube([30,10,block_h],center=true);
			}
			hull(){
				translate([-6,-17,block_h/2]) cube([30,8,block_h],center=true);
				translate([15.5,-15.5,block_h/2]) cylinder(r=4.8,h=block_h,center=true,$fn=100);
			}
		}
		block_cutout();
	}
}

module block_cutout(){
		// beam mount screws cutout
		translate([-19,28,7]) rotate([0,90,0]) cylinder(r=m4_open_radius,h=10,center=true,$fn=100);
		translate([-19,-28,7]) rotate([0,90,0]) cylinder(r=m4_open_radius,h=10,center=true,$fn=100);

		// plasic saver
//		hull(){
//			translate([-15.5,9,-50]) cylinder(r=3,h=100,$fn=50);
//			translate([-15.5,-9,-50]) cylinder(r=3,h=100,$fn=50);
//		}
//		difference(){
//			translate([-5,-13,0]) cube([10,10,100],center=true);
//			cylinder(h=100,r=13,center=true,$fn=100);
//		}
		hull(){
			translate([-48,-20,block_h]) cube([42,42,10]);
			translate([-21.1,-22,block_h-8]) cube([10,44,10]);
		}
			translate([-13,-23,block_h-8]) rotate([0,-20,0]) cube([44,30,10]);
		

		// Mount screw cutouts
		translate([15.5,15.5,block_h/2]) cylinder(r=m3_open_radius,h=100,center=true,$fn=20);
		translate([15.5,-15.5,block_h/2]) cylinder(r=m3_open_radius,h=100,center=true,$fn=40);
		translate([-15.5,15.5,block_h/2]) cylinder(r=m3_open_radius,h=100,center=true,$fn=40);
		translate([-15.5,-15.5,block_h/2]) cylinder(r=m3_open_radius,h=100,center=true,$fn=40);

		translate([-15.5,15.5,9]) cylinder(r=3,h=100,$fn=50);
		translate([-15.5,-15.5,9]) cylinder(r=3,h=100,$fn=50);

		translate([15.5,-15.5,block_h/2+block_h/4]) cylinder(r=4.1,h=block_h/2+0.2,$fn=100,center=true);
		translate([18,-15.5,block_h/2+block_h/4]) cube([10,11,block_h/2+0.2],center=true);

		translate([-2,22,block_h/2+(block_h/4)]) cube([4,20,7.2],center=true);
		translate([-2,22,block_h/2-(block_h/4)]) cube([4,20,7.2],center=true);
		
		translate([-1,16.2,block_h/2+(block_h/4)]) rotate([0,90,0]) cylinder(h=100,r=m4_open_radius,$fn=50);
		translate([-1,16.2,block_h/2-(block_h/4)]) rotate([0,90,0]) cylinder(h=100,r=m4_open_radius,$fn=50);

//		translate([20,0,block_h/2]) cube([10,44,block_h+2],center=true);
		translate([6.5,-13.5,gear_h+2]) rotate([90,0,0]) push_fit(clearance=1);
		translate([0,0,gear_h]) drive_gear(clearance = 1);
		hull(){
//			translate([10,0,0]) cylinder(h=4,r=6,center=true,$fn=50);
			cylinder(h=6,r=11.2,center=true,$fn=50);
			translate([0,0,4]) cylinder(6,11.2,6.7,center=true,$fn=50);
//			translate([10,0,4]) cylinder(4,6,5,center=true,$fn=50);
		}

		// drive gear & bearing cutout
		hull(){
			translate([14,0,gear_h+2]) cylinder(h=block_h+10,r=8,center=true);
			cylinder(h=100,r=6.7,center=true,$fn=50);
		}
	
}

module idler(){
	difference(){
		union(){
			translate([17,0,block_h/2]) rotate([0,90,0]) hull(){
				translate([(block_h/2-2),19,0]) cylinder(8,2,2,$fn=20);
				translate([-(block_h/2-2),19,0]) cylinder(8,2,2,$fn=20);
				translate([0,-15.5,4]) cube([block_h,7.6,8],center=true);
			}
			hull(){
				translate([15.5,-15.5,block_h/2+0.1]) cylinder(r=3.8,h=block_h-0.2,center=true,$fn=100);
				translate([20,-15.5,block_h/2+0.1]) cube([6,7.6,block_h-0.2],center=true);
			}
			hull(){
				translate([21.5,0,gear_h+8]) cube([6,14,5],center=true);
				translate([14.5,0,gear_h+8]) cylinder(5,5.5,5.5,center=true,$fn=50);
			}
			hull(){
				translate([21.5,0,gear_h-4]) cube([6,14,5],center=true);
				translate([14.5,0,gear_h-4]) cylinder(5,5.5,5.5,center=true,$fn=50);
			}

		}

		translate([14.5,0,block_h/2]) cylinder(h=12,r=2,center=true,$fn=80);
		translate([18,0,gear_h+2]) cube([16,14,7],center=true);
		translate([10,0,gear_h+2]) cube([7.6,14,block_h-2],center=true);

		translate([15.5,-15.5,block_h/2]) cylinder(r=m3_open_radius,h=100,center=true,$fn=40);
		translate([15.5,-15.5,block_h/4]) cylinder(r=5.2,h=block_h/2+0.1,center=true,$fn=80);
		translate([18,-16.5,block_h/4]) cube([16,10,block_h/2+0.1],center=true);
		hull(){
			translate([-1,16.2,block_h/2+(block_h/4)]) rotate([0,90,0]) cylinder(h=100,r=m4_open_radius,$fn=50);
			translate([-1,22,block_h/2+(block_h/4)]) rotate([0,90,0]) cylinder(h=100,r=m4_open_radius,$fn=50);
		}
		hull(){
			translate([-1,16.2,block_h/2-(block_h/4)]) rotate([0,90,0]) cylinder(h=100,r=m4_open_radius,$fn=50);
			translate([-1,22,block_h/2-(block_h/4)]) rotate([0,90,0]) cylinder(h=100,r=m4_open_radius,$fn=50);

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
	nema17();
	translate([0,0,gear_h]) drive_gear(clearance = 0);
%	translate([6.5,-13.1,gear_h+2]) rotate([90,0,0]) push_fit();
	color("GreenYellow") block();
	color("GreenYellow") idler();
%	translate([14.5,0,gear_h+2]) bearing_624();
}

assembly();
//rotate([0,90,0]) idler();
//rotate([0,0,0]) block();