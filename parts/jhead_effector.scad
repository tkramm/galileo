include <configuration.scad>;

separation = 48;
radius = 30;
height = 9;
cone_r1 = height/2;
cone_r2 = 5.5;

//height = 6;
screwspacing = 14.9;

//J-Head
//hotend_diameter = 15.7;
hotend_diameter = 16.4;

module effector(){
	difference() {
	  union() {
		translate([0,0,-height/2]) cylinder(h=25,r=hotend_diameter/2+4,$fn=200);
        translate([16,-10,14-height/2]) cube([7, 6, 18], center=true);
        translate([-16,-10,14-height/2]) cube([7, 6, 18], center=true);
		hull(){
	    for (a = [0:120:359]) rotate([0, 0, a]) 
    		  translate([0, 22, 0])
	        cylinder(r=5, h=height, center=true, $fn=72);
		}
	    for (a = [60:120:359]) rotate([0, 0, a]) {
    		  translate([0, radius, 0]) intersection() {
	        cube([separation, 200, height], center=true);
    	    union() {
    		      for (s = [-1, 1]) scale([s, 1, 1]) {
        		    translate([separation/2-4, 0, 0]) rotate([0, 90, 0])
             	 cylinder(r1=cone_r2, r2=cone_r1, h=8, center=true, $fn=48);
	            translate([separation/2-4, -10, 0])
    		          cube([8, 20, height], center=true);
        		  }
	        }
    		  }
	    }
	  }

		//Push Fit
		translate([0,0,-height/2-0.01]) cylinder(9,10.2/2,9.7/2,$fn=80);

		// Hotend
		translate([0,0,-height/2+8.98]) cylinder(h=18,r=hotend_diameter/2,$fn=100);

		// Screws
		translate([16,0,20-height/2]) rotate([90, 0, 0]) cylinder(h=50,r=m3_radius,$fn=30, center=true);
		translate([-16,0,20-height/2]) rotate([90, 0, 0]) cylinder(h=50,r=m3_radius,$fn=30, center=true);

		translate([screwspacing/2,0,16-height/2]) rotate([90, 0, 0]) cylinder(h=50,r=m3_radius,$fn=30, center=true);
		translate([-screwspacing/2,0,16-height/2]) rotate([90, 0, 0]) cylinder(h=50,r=m3_radius,$fn=30, center=true);
		difference(){
			union(){
				translate([screwspacing/2,0,16-height/2]) rotate([-90, 0, 0]) cylinder(h=50,r=3,$fn=30);
				translate([-screwspacing/2,0,16-height/2]) rotate([-90, 0, 0]) cylinder(h=50,r=3,$fn=30);
				translate([screwspacing/2,0,16-height/2]) rotate([90, 0, 0]) cylinder(h=50,r=m3_nut_radius,$fn=6);
				translate([-screwspacing/2,0,16-height/2]) rotate([90, 0, 0]) cylinder(h=50,r=m3_nut_radius,$fn=6);
			}
			rotate([0,0,0]) translate([-15.9/2-10,-15.9/2,0]) cube([15.9+20,15.9,25]);
		}

	  for (a = [60:120:359]) rotate([0, 0, a]) {
    		translate([0, radius, 0]) rotate([0, 90, 0])
	      cylinder(r=1.5, h=separation+1, center=true, $fn=12);
    		translate([0, radius, 0]) rotate([90, 0, 90])
	      cylinder(r=m3_nut_radius+0.1, h=separation-12, center=true, $fn=6);
	  }

	}
}

effector();
