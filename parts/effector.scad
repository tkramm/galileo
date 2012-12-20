include <configuration.scad>;

separation = 48;
radius = 40;
height = 9;
cone_r1 = height/2;
cone_r2 = 5.5;

module effector(){
	difference() {
	  union() {
    		cylinder(r=separation-6.5, h=height, center=true, $fn=6);
	    for (a = [60:120:359]) rotate([0, 0, a]) {
    		  translate([0, radius, 0]) intersection() {
	        cube([separation, 20, height], center=true);
    	    union() {
    		      for (s = [-1, 1]) scale([s, 1, 1]) {
        		    translate([separation/2-4, 0, 0]) rotate([0, 90, 0])
             	 cylinder(r1=cone_r2, r2=cone_r1, h=8, center=true, $fn=48);
	            translate([separation/2-4, -5, 0])
    		          cube([8, 10, height], center=true);
        		  }
	        }
    		  }
	    }
	  }
	  for (a = [60:120:359]) rotate([0, 0, a]) {
    		translate([0, radius, 0]) rotate([0, 90, 0])
	      cylinder(r=1.5, h=separation+1, center=true, $fn=12);
    		translate([0, radius, 0]) rotate([90, 0, 90])
	      cylinder(r=m3_nut_radius, h=separation-12, center=true, $fn=6);
	  }
	  cylinder(r=20, h=height+1, center=true, $fn=72);
	  for (a = [0:90:359]) rotate([0, 0, a]) {
    		translate([0, 25, 0])
	      cylinder(r=2.2, h=2*height, center=true, $fn=24);
	  }
	}
}
effector();