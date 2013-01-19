include <configuration.scad>

height = 6;
screwspacing = 21.3;

//J-Head
//hotend_diameter = 15.7;
hotend_diameter = 16;

module hotend_adapter(){
	difference(){
		union(){
			hull(){
				rotate([0, 0, 0]) translate([0, 25, 0]) cylinder(r=5, h=height, $fn=60);
				rotate([0, 0, 180]) translate([0, 25, 0]) cylinder(r=5, h=height, $fn=60);
			}
			hull(){
				rotate([0, 0, 90]) translate([0, 25, 0]) cylinder(r=5, h=height, $fn=60);
				rotate([0, 0, 270]) translate([0, 25, 0]) cylinder(r=5, h=height, $fn=60);
			}
//			hull(){
//				cylinder(r=14, h=9, $fn=100);
//				rotate([0,0,45]) translate([-11,-11,0]) cube([22,22,25]);
				rotate([0,0,45]) cylinder(h=25,r=hotend_diameter/2+4,$fn=200);
//			}
		}

		for (a = [0:90:359]) rotate([0, 0, a]) {
    			translate([0, 25, -height/2])
	    			cylinder(r=2.2, h=2*height, $fn=40);
	  	}
		//Push Fit
		translate([0,0,-0.01]) cylinder(9,10.2/2,9.7/2,$fn=80);
		
		translate([0,0,9-0.02]) cylinder(h=18,r=hotend_diameter/2,$fn=100);

		translate([screwspacing/2,0,16]) rotate([90, 0, 45]) cylinder(h=50,r=m3_radius,$fn=30, center=true);
		translate([-screwspacing/2,0,16]) rotate([90, 0, 45]) cylinder(h=50,r=m3_radius,$fn=30, center=true);

		difference(){
			union(){
				translate([screwspacing/2,0,16]) rotate([90, 0, 45]) cylinder(h=50,r=3,$fn=30);
				translate([-screwspacing/2,0,16]) rotate([90, 0, 45]) cylinder(h=50,r=3,$fn=30);
				translate([screwspacing/2,0,16]) rotate([-90, 0, 45]) cylinder(h=50,r=m3_nut_radius,$fn=6);
				translate([-screwspacing/2,0,16]) rotate([-90, 0, 45]) cylinder(h=50,r=m3_nut_radius,$fn=6);
			}
			rotate([0,0,45]) translate([-15.9/2-10,-15.9/2,0]) cube([15.9+20,15.9,25]);
		}

	}
}

hotend_adapter();