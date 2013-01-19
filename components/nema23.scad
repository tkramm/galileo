width = 56.4;
height = 56;
screw_spacing = 47.14;
screw_radius = 5/2;
corner_radius = 7/2;
cap_height = 11;
ring_height = 1.6;
ring_radius = 38.1/2;

axle_length = 20.6;
axle_radius = 6.35/2;

corner_pos = (width/2-corner_radius);

module nema23(clearance = 0){
	if(clearance > 0){
				hull(){
					translate([corner_pos,corner_pos,-height/2]) cylinder(r=corner_radius,h=height,center=true,$fn=20);
					translate([corner_pos,-corner_pos,-height/2]) cylinder(r=corner_radius,h=height,center=true,$fn=20);
					translate([-corner_pos,corner_pos,-height/2]) cylinder(r=corner_radius,h=height,center=true,$fn=20);
					translate([-corner_pos,-corner_pos,-height/2]) cylinder(r=corner_radius,h=height,center=true,$fn=20);
				}

		cylinder(r=ring_radius+0.5,h=20,$fn=100,center=true);
		cylinder(r=axle_radius+0.5,h=axle_length+20,$fn=50,center=true);

			translate([(screw_spacing/2),(screw_spacing/2),0]) cylinder(r=screw_radius+0.2,h=30,center=true,$fn=50);
			translate([(screw_spacing/2),-(screw_spacing/2),0]) cylinder(r=screw_radius+0.2,h=30,center=true,$fn=50);
			translate([-(screw_spacing/2),(screw_spacing/2),0]) cylinder(r=screw_radius+0.2,h=30,center=true,$fn=50);
			translate([-(screw_spacing/2),-(screw_spacing/2),0]) cylinder(r=screw_radius+0.2,h=30,center=true,$fn=2500);
	} else {
	color("Black") 
		difference(){
			translate([0,0,-height/2]) cube([width-2,width-2,height-2],center=true);
			rotate([0,0,45]) translate([width/2+12,0,-24]) cube([10,20,60],center=true);
			rotate([0,0,135]) translate([width/2+12,0,-24]) cube([10,20,60],center=true);
			rotate([0,0,-45]) translate([width/2+12,0,-24]) cube([10,20,60],center=true);
			rotate([0,0,-135]) translate([width/2+12,0,-24]) cube([10,20,60],center=true);
		}
	color("Silver") 
		difference(){
			union(){
				hull(){
					translate([corner_pos,corner_pos,-cap_height/2]) cylinder(r=corner_radius,h=cap_height,center=true,$fn=20);
					translate([corner_pos,-corner_pos,-cap_height/2]) cylinder(r=corner_radius,h=cap_height,center=true,$fn=20);
					translate([-corner_pos,corner_pos,-cap_height/2]) cylinder(r=corner_radius,h=cap_height,center=true,$fn=20);
					translate([-corner_pos,-corner_pos,-cap_height/2]) cylinder(r=corner_radius,h=cap_height,center=true,$fn=20);
				}
				hull(){
					translate([corner_pos,corner_pos,-height+cap_height/2]) cylinder(r=corner_radius,h=cap_height,center=true,$fn=20);
					translate([corner_pos,-corner_pos,-height+cap_height/2]) cylinder(r=corner_radius,h=cap_height,center=true,$fn=20);
					translate([-corner_pos,corner_pos,-height+cap_height/2]) cylinder(r=corner_radius,h=cap_height,center=true,$fn=20);
					translate([-corner_pos,-corner_pos,-height+cap_height/2]) cylinder(r=corner_radius,h=cap_height,center=true,$fn=20);
				}
			}

			translate([(screw_spacing/2),(screw_spacing/2),0]) cylinder(r=screw_radius,h=8,center=true,$fn=20);
			translate([(screw_spacing/2),-(screw_spacing/2),0]) cylinder(r=screw_radius,h=8,center=true,$fn=20);
			translate([-(screw_spacing/2),(screw_spacing/2),0]) cylinder(r=screw_radius,h=8,center=true,$fn=20);
			translate([-(screw_spacing/2),-(screw_spacing/2),0]) cylinder(r=screw_radius,h=8,center=true,$fn=20);
		}

	color("Silver") cylinder(r=ring_radius,h=ring_height*2,$fn=100,center=true);

	color("Silver") 
		hull(){
			cylinder(r=axle_radius,h=axle_length*2-2,$fn=50,center=true);
			cylinder(r=axle_radius-0.5,h=axle_length*2,$fn=50,center=true);	
		}
	}
}