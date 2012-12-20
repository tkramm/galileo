screw_distance = 71.5;
offset = screw_distance/2;

module fan_80mm(clearance = 0){
	color("darkgrey") difference(){
		hull(){
			translate([offset,offset,0]) cylinder(25,4.25,4.25,$fn=20,center=true);
			translate([offset,-offset,0]) cylinder(25,4.25,4.25,$fn=20,center=true);
			translate([-offset,offset,0]) cylinder(25,4.25,4.25,$fn=20,center=true);
			translate([-offset,-offset,0]) cylinder(25,4.25,4.25,$fn=20,center=true);
		}
		union(){
			translate([offset,offset,0]) cylinder(40,2,2,$fn=20,center=true);
			translate([offset,-offset,0]) cylinder(40,2,2,$fn=20,center=true);
			translate([-offset,offset,0]) cylinder(40,2,2,$fn=20,center=true);
			translate([-offset,-offset,0]) cylinder(40,2,2,$fn=20,center=true);
		}
		translate([0,0,0]) cylinder(40,39,39,$fn=80,center=true);
	}
	if(clearance > 0){
		union(){
			translate([offset,offset,0]) cylinder(40,2,2,$fn=20,center=true);
			translate([offset,-offset,0]) cylinder(40,2,2,$fn=20,center=true);
			translate([-offset,offset,0]) cylinder(40,2,2,$fn=20,center=true);
			translate([-offset,-offset,0]) cylinder(40,2,2,$fn=20,center=true);
		}
		translate([0,0,0]) cylinder(40,40,40,$fn=80,center=true);
	}
}
