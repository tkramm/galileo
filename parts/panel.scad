include <configuration.scad>
include <../components/2020.scad>

module encoder(){
	difference(){
		cylinder(7.5,3.35,3.35,$fn=20);
		translate([1.7,-3,-1]) cube([6,6,9]);
	}
}

module knob(){
	difference(){
		union(){
			translate([0,0,14])cylinder(1,7.5,7,$fn=200);
			cylinder(14,8.5,7.5,$fn=200);
		}
		translate([0,0,-0.01]) encoder();
		for(i = [0,45,90,135,180,225,270,315]){	
			rotate([0,0,i]) translate([10,0,0]) rotate([0,-3,0]) cylinder(40,2,2,$fn=80,center=true);
		}
	}
}

module screwsocket(){
	difference(){
		union(){
			translate([27.5,46.5,0]) cylinder(9.5,3.5,3.5,$fn=50);
			translate([27.5,-46.5,0]) cylinder(9.5,3.5,3.5,$fn=50);
			translate([-27.5,46.5,0]) cylinder(9.5,3.5,3.5,$fn=50);
			translate([-27.5,-46.5,0]) cylinder(9.5,3.5,3.5,$fn=50);
		}
		translate([27.5,46.5,0]) cylinder(10,1.5,1.5,$fn=50);
		translate([27.5,-46.5,0]) cylinder(10,1.5,1.5,$fn=50);
		translate([-27.5,46.5,0]) cylinder(10,1.5,1.5,$fn=50);
		translate([-27.5,-46.5,0]) cylinder(10,1.5,1.5,$fn=50);
	}

//	translate([27.5,-53.5,0]) cylinder(13,3.5,3.5);
//	translate([27.5,68.5,0]) cylinder(13,3.5,3.5);
//	translate([-15.5,-53.5,0]) cylinder(13,3.5,3.5);
//	translate([-15.5,68.5,0]) cylinder(13,3.5,3.5);
}

module panel(){	
	difference(){
		union(){
			hull(){
				translate([-40,-62.5,22]) cube([80,140,2]);
				translate([31,7.5,35]) rotate([0,30,0]) translate([12,0,0]) cube([4,140,20],center=true);
			}
			translate([-40,-62.5,-2]) cube([80,140,24]);
		}
		translate([31,7.5,35]) rotate([0,30,0]) rotate([90,0,0]) beam(h=290,clearance=1);
		translate([31,7.5,35]) rotate([0,30,0]) translate([0,0,0]) rotate([0,90,0]) cylinder(h=40,r=m4_open_radius,center=true,$fn=30);
		translate([31,7.5,35]) rotate([0,30,0]) translate([0,50,0]) rotate([0,90,0]) cylinder(h=40,r=m4_open_radius,center=true,$fn=30);
		translate([31,7.5,35]) rotate([0,30,0]) translate([0,-50,0]) rotate([0,90,0]) cylinder(h=40,r=m4_open_radius,center=true,$fn=30);
		translate([-36,-58.5,0]) cube([72,132,60]);
		sd();
		translate([-15,-40,-3]) cube([30,80,100]);
		translate([0.5,58.5,-3]) cylinder(90,6.5,6.5,$fn=50);
	}
	screwsocket();

}
module sd(){
	translate([-12,-70,14.5]) cube([28,34,4.1]);
	translate([-2,-62,14.5]) cube([8,32,4]);
	translate([8,-62,14.5]) cube([8,32,4]);
}

color("DimGray") panel();
//color("GreenYellow") translate([0.5,58.5,-3]) rotate([180,0,0]) knob();
//rotate([90,0,0]) beam(h=290,clearance=0);
%translate([31,7.5,35]) rotate([0,30,0]) rotate([90,0,0]) beam(h=290,clearance=0);
