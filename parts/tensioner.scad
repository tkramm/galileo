include <../components/2020.scad>
include <../components/M4x60_hex.scad>
include <../components/bearing_608.scad>
include <configuration.scad>

screw_spacing = 36;
bearing_holder_height = 16;
bearing_holder_width = 28;
bearing_holder_depth = 9;

module tensioner_mount(){
	difference(){
		union(){
			translate([0,0,2])cube([28,screw_spacing,24],center=true);
			translate([0,(screw_spacing/2),-10]) cylinder(r=5,h=24,$fn=30);
			translate([0,-(screw_spacing/2),-10]) cylinder(r=5,h=24,$fn=30);
		}
		// Screw Cutouts
		translate([0,(screw_spacing/2),14.01]) m4x60_hex();
		translate([0,-(screw_spacing/2),14.01]) m4x60_hex();

		translate([0,0,14.01]) cylinder(r=m4_open_radius,h=100,$fn=50, center=true);

		// Beam Cutout
		rotate([0,90,0]) beam(h=100,clearance=1);
		translate([0,0,-2]) rotate([0,90,0]) beam(h=100,clearance=1);
	}
}

module tensioner_bearing(){
	difference(){
		union(){
			difference(){
				union(){
					cube([bearing_holder_depth+6,screw_spacing,bearing_holder_height],center=true);
					translate([0,(screw_spacing/2),0]) cylinder(r=5,h=bearing_holder_height,$fn=30,center=true);
					translate([0,-(screw_spacing/2),0]) cylinder(r=5,h=bearing_holder_height,$fn=30,center=true);
				}
				// Screw Cutouts
				translate([0,(screw_spacing/2),14.01]) m4x60_hex();
				translate([0,-(screw_spacing/2),14.01]) m4x60_hex();

				// B	earing Cutout
				translate([0,0,0])cube([bearing_holder_depth,bearing_holder_width,30],center=true);
			}
			translate([(bearing_holder_depth/2),0,0]) rotate([0,-90,0]) cylinder(1,7,6);
			translate([-(bearing_holder_depth/2),0,0]) rotate([0,90,0]) cylinder(1,7,6);
		}
		rotate([0,90,0]) cylinder(r=4,h=bearing_holder_depth+10,$fn=50,center=true);
		translate([0,(screw_spacing/2),-(bearing_holder_height/2)-0.01]) cylinder(r=m3_nut_radius,h=2.5,$fn=6);
		translate([0,-(screw_spacing/2),-(bearing_holder_height/2)-0.01]) cylinder(r=m3_nut_radius,h=2.5,$fn=6);
	}
}

module tensioner(mount_color="Red",bearing_color="Red"){
	color(mount_color) tensioner_mount();
	color(bearing_color) translate([0,0,-35]) tensioner_bearing();
	
	translate([0,(screw_spacing/2),14]) m4x60_hex();
	translate([0,-(screw_spacing/2),14]) m4x60_hex();
	translate([0,0,-35]) rotate([0,90,0]) bearing_608();
}

module tensioner_w_bar(color="Red"){
	tensioner(color=color);
	color("Silver") rotate([0,90,0]) beam(h=100);
}
tensioner_w_bar();

//rotate([180,0,0]) tensioner_mount();