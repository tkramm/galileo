include <configuration.scad>
include <../components/2040.scad>
include <../components/nema23.scad>
include <../components/drive_gear_steel.scad>
include <../components/push_fit.scad>
include <../components/bearing_624.scad>
include <../components/bearing_R4.scad>

width = 56.4;
height = 56;
screw_spacing = 47.14;
corner_radius = 7/2;
cap_height = 11;
ring_height = 1.6;
ring_radius = 38.1/2;

axle_length = 20.6;
axle_radius = 6.35/2;

corner_pos = (width/2-corner_radius);


gear_h = 9;
block_h = 22;

module block(bearing=0){
	difference(){
		union(){
			//pushfit
			hull(){
				translate([6,-width/2+14,gear_h+2]) rotate([90,0,0]) cylinder(14,18/2,18/2,$fn=50);
				translate([-3,-width/2+7,10]) cube([20,14,20],center=true);
			}
			hull(){
//				translate([6.5,width/2-18,gear_h+2]) rotate([-90,0,0]) cylinder(h=18,r=4.5,$fn=50);
				translate([0,width/2-9,6]) cube([9,18,12],center=true);
			}
			translate([-width/2+12,0,6]) cube([24,width,12],center=true);

			translate([-(width/2-7),0,10]) cube([21,width+40,20],center=true);
		}
		block_cutout(bearing);
	}
}

module block_cutout(bearing=0){

		// beam mount screws cutout
		translate([-width/2,width/2+10,10]) rotate([0,90,0]) cylinder(r=m4_open_radius,h=50,center=true,$fn=100);
		translate([-width/2,-width/2-10,10]) rotate([0,90,0]) cylinder(r=m4_open_radius,h=50,center=true,$fn=100);

		// Mount screw cutouts
		translate([-(screw_spacing/2),(screw_spacing/2),3]) cylinder(r=m5_open_radius,h=100,center=true,$fn=40);
		translate([-(screw_spacing/2),-(screw_spacing/2),3]) cylinder(r=m5_open_radius,h=100,center=true,$fn=40);

		// Screw head cutout
			translate([-(screw_spacing/2),(screw_spacing/2),4]) cylinder(r=9/2,h=100,$fn=6);
			translate([-(screw_spacing/2),-(screw_spacing/2),4]) cylinder(r=9/2,h=100,$fn=6);

		// Idler Axis Cutout
		hull(){
			translate([(screw_spacing/2),-(screw_spacing/2),block_h/2]) cylinder(r=4.5,h=block_h,$fn=100,center=true);
			translate([(screw_spacing/2),-10,block_h/2]) cylinder(r=4.5,h=block_h,$fn=100,center=true);
		}

		// Idler tensioner cutouts
		translate([-2,34,block_h/2-(block_h/4)]) cube([4,30,7.4],center=true);
		translate([-1,(screw_spacing/2),block_h/2-(block_h/4)]) rotate([0,90,0]) cylinder(h=100,r=m4_open_radius,$fn=50);
//		translate([-width/2+12,0,18]) cube([24,width,12],center=true);

		// Push fit cutout
		translate([6,-width/2+9,gear_h+2]) rotate([90,0,0]) cylinder(10,9.7/2,10/2,$fn=50);

		// Drive cutout
        translate([0,0,gear_h]) drive_gear(clearance = 1);
		hull(){
			cylinder(h=ring_height*2,r=ring_radius+0.5,center=true,$fn=100);
			cylinder(h=18,r=13,center=true,$fn=100);
			translate([15,0,0]) cylinder(h=ring_height*2,r=ring_radius+0.5,center=true,$fn=100);
			translate([15,0,0]) cylinder(h=18,r=13,center=true,$fn=100);
		}
		hull(){
			cylinder(h=60,r=20,center=true,$fn=100);
			translate([15,0,0]) cylinder(h=60,r=20,center=true,$fn=100);
		}
}

module idler(){
	difference(){
		union(){
			translate([width/2-6,0,block_h/2]) rotate([0,90,0]) hull(){
				translate([(block_h/2-2),width/2-2,-2]) cylinder(8,2,2,$fn=20);
				translate([-(block_h/2-2)+10,width/2-2,-2]) cylinder(8,2,2,$fn=20);
				translate([-(block_h/2-2),13,-2]) cylinder(8,2,2,$fn=20);
				translate([0,-screw_spacing/2,2]) cube([block_h,7.6,8],center=true);
			}
			hull(){
				translate([screw_spacing/2,-screw_spacing/2,block_h/2]) cylinder(r=5.5,h=block_h,center=true,$fn=100);
				translate([width/2-3,-screw_spacing/2+2,block_h/2+0.1]) cube([6,13,block_h-0.2],center=true);
			}
			hull(){
				translate([25,0,gear_h+8]) cube([4,26,5],center=true);
				translate([14.5,0,gear_h+8]) cylinder(5,5.5,5.5,center=true,$fn=50);
			}
			hull(){
				translate([25,0,gear_h-4]) cube([4,26,5],center=true);
				translate([14.5,0,gear_h-4]) cylinder(5,5.5,5.5,center=true,$fn=50);
			}

		}

		translate([14.5,0,block_h/2]) cylinder(h=12,r=2,center=true,$fn=80);
		translate([25,0,gear_h+2]) cube([16,14,7],center=true);
		translate([10,0,gear_h+2]) cube([7.6,14,block_h-2],center=true);

		translate([screw_spacing/2,-screw_spacing/2,block_h/2]) cylinder(r=m5_open_radius,h=100,center=true,$fn=40);
		translate([screw_spacing/2,-screw_spacing/2,-0.01]) cube([20,17,10],center=true);

		hull(){
			translate([-1,screw_spacing/2-2,block_h/2-(block_h/4)]) rotate([0,90,0]) cylinder(h=100,r=4.8/2,$fn=50);
			translate([-1,screw_spacing/2+7,block_h/2-(block_h/4)]) rotate([0,90,0]) cylinder(h=100,r=4.8/2,$fn=50);

		}
		translate([width/2+5,0,10]) cube([10,width+10,30],center=true);
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

module assembly(bearing=0){
	translate([0,0,gear_h]) drive_gear(clearance = 0);
%	translate([6,-15,gear_h+2]) rotate([90,0,0]) push_fit();
	color("GreenYellow") block(bearing);
//	color("red") block_cutout();
	color("GreenYellow") idler();
//	translate([0,0,17.5]) bearing_R4();
%	translate([14.5,0,gear_h+2]) bearing_624();
	nema23();
}
//block();
assembly(bearing=0);
//rotate([0,90,0]) idler();
//rotate([0,0,0]) block_fan(bearing=0);