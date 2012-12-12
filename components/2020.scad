module outer_shape(h=10){
	hull(){
		translate([8.6,8.6,-h/2]) cylinder(r=1.4,h=h,$fn=30);
		translate([8.6,-8.6,-h/2]) cylinder(r=1.4,h=h,$fn=30);
		translate([-8.6,8.6,-h/2]) cylinder(r=1.4,h=h,$fn=30);
		translate([-8.6,-8.6,-h/2]) cylinder(r=1.4,h=h,$fn=30);
	}
}

module extrusion(h=10){
	difference(){
		union(){
			difference(){
				outer_shape(h=h);
				cube([17.2,17.2,h+0.1],center=true);
				cube([20.1,6,h+0.1],center=true);
				cube([6,20.1,h+0.1],center=true);

				translate([-9.9,0,0])cube([0.5,6.8,h+0.1],center=true);
				translate([9.9,0,0])cube([0.5,6.8,h+0.1],center=true);
				translate([0,-9.9,0])cube([6.8,0.5,h+0.1],center=true);
				translate([0,9.9,0])cube([6.8,0.5,h+0.1],center=true);
			}
			rotate([0,0,45]) cube([26,1.5,h],center=true);
			rotate([0,0,-45]) cube([26,1.5,h],center=true);
			intersection(){
				union(){
					translate([8,8,0]) cube([4,4,h],center=true);
					translate([8,-8,0]) cube([4,4,h],center=true);
					translate([-8,8,0]) cube([4,4,h],center=true);
					translate([-8,-8,0]) cube([4,4,h],center=true);
				}
				outer_shape();
			}
			cube([9,9,h],center=true);
		}
		translate([0,0,-h/2-1]) cylinder(h+2,2.5,2.5,$fn=30);
	}


}

module beam(h=10,clearance = 0){
	if(clearance > 0){
		outer_shape(h=h);
	} else {
		extrusion(h);
	}
}