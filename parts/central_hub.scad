include <../components/2020.scad>
include <configuration.scad>

module hub_beams(l=100){
	// 3 times
	for(i = [0,120,240]){	
		 rotate([0,0,i]) translate([10,0,0]) rotate([0,90,0]) translate([0,0,l/2]) beam(h=l,clearance=0);
	}
}

// the base object
module holder(l=60){
	hull(){
		for(i = [0,120,240]){	
			 rotate([0,0,i]) translate([10,0,-2.5]) rotate([0,90,0]) translate([0,0,l/2]) cube([25,30,l],center=true);
		}
	}
}

module cutouts(l=61){
	// round outside
	for(i = [60,180,300]){	
		 rotate([0,0,i]) translate([133,0,-20]) cylinder(40,100,100,$fn=200);
	}

	// the cutout for the beam
	for(i = [0,120,240]){	
		 rotate([0,0,i]) translate([10,0,-0.1]) rotate([0,90,0]) translate([0,0,l/2]) beam(h=l,clearance=1);
		 rotate([0,0,i]) translate([10,0,2]) rotate([0,90,0]) translate([0,0,l/2]) beam(h=l,clearance=1);
	}

	// holes for mounting the beam
	translate([0,0,-50])cylinder(100,1,1,$fn=20);
	for(i = [0,120,240]){	
		 rotate([0,0,i]) translate([25,0,-50])cylinder(100,m4_open_radius,m4_open_radius,$fn=20);
		 rotate([0,0,i]) translate([60,0,-50])cylinder(100,m4_open_radius,m4_open_radius,$fn=20);
	}

	// centerhole for measuring or whatever
	translate([0,0,-50]) cylinder(100,1,1,$fn=20);
}

//combine everything
module central_hub(color="red"){
	color(color)
		difference(){
			holder(l=60);
			cutouts(l=61);
		}
}

//render
central_hub();