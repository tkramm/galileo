enstop_screw_dia = 2.5;

module endstop_screw_cutout(){
	translate([5,2.75,-10]) cylinder(r=enstop_screw_dia/2,h=20,$fn=30);
	translate([-5,2.75,-10]) cylinder(r=enstop_screw_dia/2,h=20,$fn=30);
}

module endstop(){
	translate([-10,-2.75,-3.2]) union(){
		color("DimGray") difference(){
			union(){
				cube([20,9.5,6.4]);
				translate([10,0,0]) cube([10,10,6.4]);
			}
			translate([10,0,0]) endstop_screw_cutout();
		}
		color("White") translate([12,9.1,1.2]) cube([2,2,4]);
		color("Gainsboro") translate([1.25,-4,1.2]) cube([0.5,4,3.2]);
		color("Gainsboro") translate([9.75,-4,1.2]) cube([0.5,4,3.2]);
		color("Gainsboro") translate([18.75,-4,1.2]) cube([0.5,4,3.2]);
	}
}

//endstop();
