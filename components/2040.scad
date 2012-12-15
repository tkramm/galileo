module outer_shape(h=10){
	hull(){
		translate([18.6,8.6,-h/2]) cylinder(r=1.4,h=h,$fn=30);
		translate([18.6,-8.6,-h/2]) cylinder(r=1.4,h=h,$fn=30);
		translate([-18.6,8.6,-h/2]) cylinder(r=1.4,h=h,$fn=30);
		translate([-18.6,-8.6,-h/2]) cylinder(r=1.4,h=h,$fn=30);
	}
}

module extrusion_2040(h=10){
	difference(){
		union(){
			difference(){
				outer_shape(h=h);
				cube([37.2,17.2,h+0.1],center=true);
				
				// Nut
				cube([40.1,6,h+0.1],center=true);
				translate([10,0,0]) cube([6,20.1,h+0.1],center=true);
				translate([-10,0,0]) cube([6,20.1,h+0.1],center=true);

				// Nut Wide
				translate([-19.9,0,0])cube([0.5,6.8,h+0.1],center=true);
				translate([19.9,0,0])cube([0.5,6.8,h+0.1],center=true);
				translate([10,-9.9,0])cube([6.8,0.5,h+0.1],center=true);
				translate([10,9.9,0])cube([6.8,0.5,h+0.1],center=true);
				translate([-10,-9.9,0])cube([6.8,0.5,h+0.1],center=true);
				translate([-10,9.9,0])cube([6.8,0.5,h+0.1],center=true);
			}
			// Cross
			translate([-10,0,0]) rotate([0,0,45]) cube([26,1.5,h],center=true);
			translate([-10,0,0]) rotate([0,0,-45]) cube([26,1.5,h],center=true);
			translate([10,0,0]) rotate([0,0,45]) cube([26,1.5,h],center=true);
			translate([10,0,0]) rotate([0,0,-45]) cube([26,1.5,h],center=true);
			
			//Corner Cubes
			intersection(){
				union(){
					translate([18,8,0]) cube([4,4,h],center=true);
					translate([18,-8,0]) cube([4,4,h],center=true);
					translate([-18,8,0]) cube([4,4,h],center=true);
					translate([-18,-8,0]) cube([4,4,h],center=true);

					translate([2,8.5,0]) cube([4,3.5,h],center=true);
					translate([2,-8.5,0]) cube([4,3.5,h],center=true);
					translate([-2,8.5,0]) cube([4,3.5,h],center=true);
					translate([-2,-8.5,0]) cube([4,3.5,h],center=true);

				}
				outer_shape();
			}

			// Center Cube
			translate([10,0,0]) cube([9,9,h],center=true);
			translate([-10,0,0]) cube([9,9,h],center=true);
		}
		translate([10,0,-h/2-1]) cylinder(h+2,2.5,2.5,$fn=30);
		translate([-10,0,-h/2-1]) cylinder(h+2,2.5,2.5,$fn=30);
		cube([5,17,h+2],center=true);
	}


}

module beam_2040(h=10,clearance = 0){
	if(clearance > 0){
		outer_shape(h=h);
	} else {
		extrusion_2040(h);
	}
}

