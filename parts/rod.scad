include <../components/traxxas_5525.scad>

module rod_end(){
	traxxas_5525();
}

module rod_end_bearing(){
	color("silver") difference(){
		union(){
			rotate([90,0,0]) cylinder(r=2,h=8,center=true,$fn=30);
			translate([0,3.8,0]) rotate([90,0,0]) cylinder(0.4,2.5,2,center=true,$fn=30);
			translate([0,-3,0]) rotate([90,0,0]) cylinder(2,2,2.5,center=true,$fn=30);
			sphere(r=2.5,$fn=30);
		}
		rotate([90,0,0]) cylinder(r=1.5,h=10,center=true,$fn=30);
	}
}

module effector_rod(){
//	rod_end_bearing();
//	translate([250,0,0]) rod_end_bearing();
	union(){
		color("black") rotate([90,0,0]) rod_end();
		color("black") translate([250,0,0]) rotate([90,180,0]) rod_end();
		color("grey") translate([125,0,0]) rotate([0,90,0]) cylinder(h=226,r=3,center=true,$fn=30);
	}
}
module effector_rods(){
	union(){
	translate([0,22.5,0]) union(){
		color("black") rotate([90,0,0]) rod_end();
		color("black") translate([250,0,0]) rotate([90,180,0]) rod_end();
		color("grey") translate([125,0,0]) rotate([0,90,0]) cylinder(h=226,r=3,center=true,$fn=30);
	}
	translate([0,-22.5,0]) union(){
		color("black") rotate([90,0,0]) rod_end();
		color("black") translate([250,0,0]) rotate([90,180,0]) rod_end();
		color("grey") translate([125,0,0]) rotate([0,90,0]) cylinder(h=226,r=3,center=true,$fn=30);
	}
	}
}
effector_rods();