include <configuration.scad>
include <../components/2040.scad>

holes_spacing_h = 85;
holes_spacing_v = 126;

module holes(){
	translate([holes_spacing_h/2,holes_spacing_v/2,0]) cylinder(h=20,r=m3_open_radius,center=true,$fn=30);
	translate([holes_spacing_h/2,-holes_spacing_v/2,0]) cylinder(h=20,r=m3_open_radius,center=true,$fn=30);
	translate([60,holes_spacing_v/2,0]) cylinder(h=20,r=m4_open_radius,center=true,$fn=30);
	translate([60,-holes_spacing_v/2,0]) cylinder(h=20,r=m4_open_radius,center=true,$fn=30);
	hull(){
		translate([holes_spacing_h/2,holes_spacing_v/2-15,0]) cylinder(h=20,r=6,$fn=30,center=true);
		translate([holes_spacing_h/2,-holes_spacing_v/2+15,0]) cylinder(h=20,r=6,$fn=30,center=true);
	}
}

module plate(){
	union(){
		translate([holes_spacing_h/2,holes_spacing_v/2,0]) cylinder(h=8,r=6,$fn=30);
		translate([holes_spacing_h/2,-holes_spacing_v/2,0]) cylinder(h=8,r=6,$fn=30);
		hull(){
			translate([60,holes_spacing_v/2,0]) cylinder(h=4,r=10,$fn=30);
			translate([holes_spacing_h/2,holes_spacing_v/2,0]) cylinder(h=4,r=10,$fn=30);
		}
		hull(){
			translate([60,-holes_spacing_v/2,0]) cylinder(h=4,r=10,$fn=30);
			translate([holes_spacing_h/2,-holes_spacing_v/2,0]) cylinder(h=4,r=10,$fn=30);
		}
		hull(){
			translate([holes_spacing_h/2,holes_spacing_v/2,0]) cylinder(h=4,r=10,$fn=30);
			translate([holes_spacing_h/2,-holes_spacing_v/2,0]) cylinder(h=4,r=10,$fn=30);
		}
	}
}

module mount(){
	difference(){
		plate();
		holes();
	}
}

%color("Silver") translate([60,0,-20]) rotate([0,90,90]) beam_2040(h=200);
%color("Silver") translate([-60,0,-20]) rotate([0,90,90]) beam_2040(h=200);
mount();
%rotate([0,0,180]) mount();