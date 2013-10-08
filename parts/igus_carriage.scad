plate_height = 6;

module igus_slide(){
	color("Silver") difference(){
		union(){
			translate([-200,-13.5,-6]) cube([400,27,6]);
			translate([-200,-9.5,-9]) cube([400,19,3]);
			translate([-200,-11,-9]) cube([400,22,1.5]);
		}
		translate([-210,-8.5,-4]) cube([420,17,5]);
		translate([-210,-12,-4.5]) cube([420,24,3.5]);
	}
}

module igus_slider(){
	translate([0,0,-4.5]){
		color("Khaki") translate([-17.5,-12,0]) cube([35,24,3.5]);
		color("DarkGray"){
			translate([-15,-7,2]) cube([30,14,3]);
			difference(){
				union(){
					translate([10,0,4]) cylinder(h=6,r=6/2,$fn=40);
					translate([-10,0,4]) cylinder(h=6,r=6/2,$fn=40);
				}
				translate([10,0,-1]) cylinder(h=20,r=4/2,$fn=40);
				translate([-10,0,-1]) cylinder(h=20,r=4/2,$fn=40);
			}
		}
	}
}


module belt(){
	color("black") translate([-200,11,8]) cube([400,1,5]);
	color("black") translate([-200,-12,8]) cube([400,1,5]);
}

module carriage(){
	difference(){
		union(){
			difference(){
				hull(){
					translate([-6,-12,0])cube([12,24,plate_height]);
					translate([-4.5,-4.5-19.5,0]) cube([9,8,plate_height]);
					translate([-4.5,16,0]) cube([9,8,plate_height]);
					translate([0,24,plate_height+3.5]) rotate([90,0,0])cylinder(9,3,5.5,$fn=40);
					translate([0,-24,plate_height+3.5]) rotate([-90,0,0])cylinder(9,3,5.5,$fn=40);
				}
				translate([0,0,plate_height+3.5]) rotate([90,30,0]) cylinder(h=35,r=6.2/2,$fn=6,center=true);
				translate([0,0,plate_height+3.5]) rotate([90,0,0])cylinder(h=60,r=3.1/2,$fn=20,center=true);
			}
			hull(){
				translate([50,0,0]) cylinder(h=6,r=10/2,$fn=40);
				translate([30,0,0]) cylinder(h=6,r=10/2,$fn=40);
				translate([10,0,0]) cylinder(h=6,r=10/2,$fn=40);
				translate([-10,0,0]) cylinder(h=6,r=10/2,$fn=40);
			}
		}
		translate([3,5,-1]) cylinder(h=20,r=2.8/2,$fn=30);
		translate([-3,5,-1]) cylinder(h=20,r=2.8/2,$fn=30);
		translate([0,-75,plate_height/2])rotate([0,-90,0])cylinder(h=20,r=2.9/2,$fn=30);

		translate([-25,-15,plate_height])cube([50,30,20]);

		translate([50,0,-1]) cylinder(h=10,r=6.1/2,$fn=40);
		translate([30,0,-1]) cylinder(h=10,r=6.1/2,$fn=40);
		translate([10,0,-1]) cylinder(h=10,r=6.1/2,$fn=40);
		translate([-10,0,-1]) cylinder(h=10,r=6.1/2,$fn=40);
		translate([15,-7,plate_height/2])rotate([0,-90,0])cylinder(h=30,r=2.8/2,$fn=30);
	}
	difference(){
		union(){
			translate([50,0,0]) cylinder(h=6,r=11/2,$fn=40);
			translate([30,0,0]) cylinder(h=6,r=11/2,$fn=40);
			translate([10,0,0]) cylinder(h=6,r=11/2,$fn=40);
			translate([-10,0,0]) cylinder(h=6,r=11/2,$fn=40);
		}
		translate([50,0,-1]) cylinder(h=10,r=6.1/2,$fn=40);
		translate([30,0,-1]) cylinder(h=10,r=6.1/2,$fn=40);
		translate([10,0,-1]) cylinder(h=10,r=6.1/2,$fn=40);
		translate([-10,0,-1]) cylinder(h=10,r=6.1/2,$fn=40);
		translate([-150,-7,plate_height/2])rotate([0,-90,0])cylinder(h=30,r=2.8/2,$fn=30);
	}
}

module assembly(){
	color("GreenYellow")  carriage();
	translate([0,0,-0.5]){
		igus_slide();
		igus_slider();
		translate([40,0,0]) igus_slider();
	}
	belt();
}

//assembly();
carriage();