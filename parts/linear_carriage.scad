include <configuration.scad>
include <../components/bearing_608.scad>
spacing = 40.2;
bearing_height = 30;
screw_hole = 8.1;


effector_mount_width=48;

// back side of the carriage
module carriage_back(){
	difference(){
		union(){
			// baseplate
			hull(){
				translate([spacing/2,bearing_height,0]) cylinder(5,7,7,$fn=40);
				translate([-spacing/2,0,0]) cylinder(5,7,7,$fn=40);
				translate([spacing/2,-bearing_height,0]) cylinder(5,7,7,$fn=40);
			}

			// standoffs
			translate([spacing/2,bearing_height,5]) cylinder(7.5,7,7,$fn=40);
			translate([-spacing/2,0,5]) cylinder(7.5,7,7,$fn=40);
			translate([spacing/2,-bearing_height,5]) cylinder(7.5,7,7,$fn=40);
		}

		// screwholes
		translate([spacing/2,bearing_height,-1]) cylinder(20,m8_open_radius,m8_open_radius,$fn=40);
		translate([-spacing/2,0,-1]) cylinder(20,m8_open_radius,m8_open_radius,$fn=40);
		translate([spacing/2,-bearing_height,-1]) cylinder(20,m8_open_radius,m8_open_radius,$fn=40);
	}
}

module carriage_front(){
	difference(){
		union(){

			// baseplate
			hull(){
				translate([spacing/2,(bearing_height),0]) cylinder(5,7,7,$fn=40);
				translate([-spacing/2,(bearing_height),0]) cylinder(5,7,7,$fn=40);
				translate([-spacing/2,-(bearing_height),0]) cylinder(5,7,7,$fn=40);
				translate([spacing/2,-(bearing_height),0]) cylinder(5,7,7,$fn=40);
			}

			// standoffs
			translate([spacing/2,bearing_height,5]) cylinder(7.5,7,7,$fn=40);
			translate([-spacing/2,0,5]) cylinder(7.5,7,7,$fn=40);
			translate([spacing/2,-bearing_height,5]) cylinder(7.5,7,7,$fn=40);
		}

		// axle screw holes
		translate([spacing/2,bearing_height,-1]) cylinder(20,screw_hole/2,screw_hole/2,$fn=40);
		translate([-spacing/2,0,-1]) cylinder(20,screw_hole/2,screw_hole/2,$fn=40);
		translate([spacing/2,-bearing_height,-1]) cylinder(20,screw_hole/2,screw_hole/2,$fn=40);

		// screw holes for effector mount
		translate([-spacing/2,bearing_height,-1]) cylinder(8,m3_open_radius,m3_open_radius,$fn=40);
		translate([-spacing/2,-bearing_height,-1]) cylinder(8,m3_open_radius,m3_open_radius,$fn=40);
		translate([spacing/2,0,-1]) cylinder(8,1.5,1.5,$fn=40);
		
	}
}

module effector_mount(){
union(){
	difference(){
		union(){

			// baseplate
			hull(){
				translate([spacing/2,8,0]) cylinder(5,7,7,$fn=40);
				translate([spacing/2,-8,0]) cylinder(5,7,7,$fn=40);
				translate([-spacing/2,(bearing_height),0]) cylinder(5,7,7,$fn=40);
				translate([-spacing/2,-(bearing_height),0]) cylinder(5,7,7,$fn=40);
			}

			// rod mount
			hull(){
				translate([0,8,5]) cube([effector_mount_width,8,5],center=true);
				translate([0,8,5]) cube([effector_mount_width-18,12,6],center=true);
				translate([0,8,11]) rotate([0,90,0])translate([0,0,-effector_mount_width/2]) cylinder(effector_mount_width,4,4);
				translate([0,8,11]) rotate([0,90,0])translate([0,0,-(effector_mount_width-18)/2]) cylinder(effector_mount_width-18,6,6);
			}

			// enstop screw mount
			translate([-3,30.83,5]) rotate([90,0,0]) cylinder(15,3,3,$fn=40);
			translate([-6,15.83,0]) cube([6,15,5]);

		}

		// endstop screw cutout
		translate([-3,32,5]) rotate([90,0,0]) cylinder(15,m3_open_radius,m3_open_radius,$fn=40);


		translate([11,15,-15]) cylinder(30,m3_open_radius,m3_open_radius,$fn=40);
		translate([11,0,-15]) cylinder(30,m3_open_radius,m3_open_radius,$fn=40);

		//effector mount center cutout
		translate([0,8,11]) cube([effector_mount_width-18,14,12],center=true);
		
		// effector mount screw and nut cutout
		translate([0,8,11]) rotate([0,90,0])translate([0,0,-(effector_mount_width+2)/2]) cylinder(effector_mount_width+2,m3_open_radius,m3_open_radius,$fn=10);
		translate([0,8,11]) rotate([0,90,0]) cylinder(r=m3_nut_radius, h=effector_mount_width-12, center=true, $fn=6);

		// mounting screws cutouts
		translate([-spacing/2,bearing_height,-1]) cylinder(8,m3_open_radius,m3_open_radius,$fn=40);
		translate([-spacing/2,-bearing_height,-1]) cylinder(8,m3_open_radius,m3_open_radius,$fn=40);
		translate([spacing/2,0,-1]) cylinder(8,1.5,1.5,$fn=40);
		
	}

	difference(){
		// belt / fishing line screw mount
		union(){
			translate([11,15,5]) cylinder(3,4,3,$fn=40);
			translate([11,0,5]) cylinder(3,4,3,$fn=40);
		}

		// screw cutouts
		translate([11,15,-15]) cylinder(30,m3_open_radius,m3_open_radius,$fn=40);
		translate([11,0,-15]) cylinder(30,m3_open_radius,m3_open_radius,$fn=40);
	}
}
}


module carriage(color_front="red",color_back="red",color_effector="red"){
	color(color_back) translate([0,0,16]) rotate([180,0,0]) carriage_back();
	color(color_front) translate([0,0,-16]) carriage_front();
	color(color_effector) translate([0,0,-16]) rotate([180,0,0]) effector_mount();

	color("silver") translate([spacing/2,bearing_height,0]) bearing_608();
	color("silver") translate([-spacing/2,0,0]) bearing_608();
	color("silver") translate([spacing/2,-bearing_height,0]) bearing_608();
}

// render
carriage();
