include <configuration.scad>
include <../components/2040.scad>
mount_spacing_v = 45;
mount_spacing_h = 90;

module mounting_beams(){
	translate([0,0,-20]) rotate([0,90,0]) translate([0,60,0]) beam_2040(h=100);
	translate([0,0,-20])	rotate([0,90,0]) translate([0,-60,0]) beam_2040(h=100);
}

color("Silver") mounting_beams();

module mount_right(){
	difference(){
		union(){
		translate([24.1,-37,1]) cylinder(4,6,3,$fn=30);
//		translate([24.1,45.7,1]) cylinder(4,6,3,$fn=30);
		translate([-24.1,-35.7,1]) cylinder(4,6,3,$fn=30);
//		translate([-24.1,39.2,1]) cylinder(4,6,3,$fn=30);
			translate([-(mount_spacing_h/2+2),-40,(mount_spacing_v+8)/2+4]) cube([4,20,mount_spacing_v+8],center=true);
			difference(){
				translate([0,-40,(mount_spacing_v+8)/2]) cube([mount_spacing_h+8,20,mount_spacing_v+8],center=true);
				translate([0,-40,mount_spacing_v/2+4]) cube([mount_spacing_h,22,mount_spacing_v],center=true);
			}
			hull(){
				translate([(mount_spacing_h+8)/2-20,-40,+2]) cube([40,20,4],center=true);
				translate([(mount_spacing_h+8)/2-5,-65,+2]) cylinder(h=4,r=5,center=true,$fn=30);
				translate([(mount_spacing_h+8)/2-15,-65,+2]) cylinder(h=4,r=5,center=true,$fn=30);
			}
			hull(){
				translate([-((mount_spacing_h+8)/2)+20,-40,+2]) cube([40,20,4],center=true);
				translate([-(mount_spacing_h+8)/2+5,-65,+2]) cylinder(h=4,r=5,center=true,$fn=30);
				translate([-(mount_spacing_h+8)/2+15,-65,+2]) cylinder(h=4,r=5,center=true,$fn=30);
			}
			translate([(mount_spacing_h+8)/2-((m3_radius+3)),-35,(mount_spacing_v+8)+((m3_radius+3))]) rotate([-90,0,0]) difference(){
				hull(){
					cylinder(h=10,r=m3_radius+3,center=true,$fn=30);
					translate([0,(m3_radius+4)/2,0]) cube([(m3_radius+3)*2,(m3_radius+4),10],center=true);
				}
				cylinder(h=12,r=m3_radius,center=true,$fn=20);
			}
		}
		translate([0,-51,0]) holes();
		translate([(mount_spacing_h+8)/2-10,-60,+2]) cylinder(h=50,r=m4_radius,center=true,$fn=30);
		translate([-(mount_spacing_h+8)/2+10,-60,+2]) cylinder(h=50,r=m4_radius,center=true,$fn=30);
	}
}

module mount_left(){
	difference(){
		union(){
		translate([24.1,45.7,1]) cylinder(4,6,3,$fn=30);
		translate([-24.1,39.2,1]) cylinder(4,6,3,$fn=30);
			translate([-(mount_spacing_h/2+2),40,(mount_spacing_v+8)/2+4]) cube([4,20,mount_spacing_v+8],center=true);
			difference(){
				translate([0,40,(mount_spacing_v+8)/2]) cube([mount_spacing_h+8,20,mount_spacing_v+8],center=true);
				translate([0,40,mount_spacing_v/2+4]) cube([mount_spacing_h,22,mount_spacing_v],center=true);
			}
			hull(){
				translate([(mount_spacing_h+8)/2-20,40,+2]) cube([40,20,4],center=true);
				translate([(mount_spacing_h+8)/2-5,65,+2]) cylinder(h=4,r=5,center=true,$fn=30);
				translate([(mount_spacing_h+8)/2-15,65,+2]) cylinder(h=4,r=5,center=true,$fn=30);
			}
			hull(){
				translate([-((mount_spacing_h+8)/2)+20,40,+2]) cube([40,20,4],center=true);
				translate([-(mount_spacing_h+8)/2+5,65,+2]) cylinder(h=4,r=5,center=true,$fn=30);
				translate([-(mount_spacing_h+8)/2+15,65,+2]) cylinder(h=4,r=5,center=true,$fn=30);
			}
			translate([(mount_spacing_h+8)/2-((m3_radius+3)),35,(mount_spacing_v+8)+((m3_radius+3))]) rotate([-90,0,0]) difference(){
				hull(){
					cylinder(h=10,r=m3_radius+3,center=true,$fn=30);
					translate([0,(m3_radius+4)/2,0]) cube([(m3_radius+3)*2,(m3_radius+4),10],center=true);
				}
				cylinder(h=12,r=m3_radius,center=true,$fn=20);
			}
		}
		translate([0,-51,0]) holes();
		translate([(mount_spacing_h+8)/2-10,60,+2]) cylinder(h=50,r=m4_radius,center=true,$fn=30);
		translate([-(mount_spacing_h+8)/2+10,60,+2]) cylinder(h=50,r=m4_radius,center=true,$fn=30);
	}
}

module holes(){
	translate([24.1,14,0]) cylinder(h=50,r=m3_radius,center=true,$fn=30);
	translate([24.1,96.7,0]) cylinder(h=50,r=m3_radius,center=true,$fn=30);
	translate([-24.1,15.3,0]) cylinder(h=50,r=m3_radius,center=true,$fn=30);
	translate([-24.1,90.2,0]) cylinder(h=50,r=m3_radius,center=true,$fn=30);
}

color("Red") mount_right();
color("Red") mount_left();
color("green") translate([0,0,5]) rotate([0,0,90]) import("../components/ArduinoMegaBoard.stl");
//color("green") translate([-1.4,44,17]) rotate([0,0,90]) import("../components/Ramps14_3D.stl");