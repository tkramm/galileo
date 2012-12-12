module traxxas_5525(){
	difference(){
		union(){
			cylinder(h=3,r=5,center=true,$fn=30);
			hull(){
				translate([0,-5,-1.5]) cube([5,10,3]);
				translate([7,-3.5,-1.5]) cube([1,7,3]);
			}
			hull(){
				translate([4,-3.5,-1.5]) cube([1,7,3]);
				translate([11,0,0]) rotate([0,90,0]) cylinder(h=16,r=3.5,$fn=30);
			}
		}
		cylinder(h=6,r=2.5,center=true,$fn=30);		
		translate([11.2,0,0]) rotate([0,90,0]) cylinder(h=16,r=2,$fn=30);
	}
}