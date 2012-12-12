include <../components/2020.scad>
include <../components/M4x60_hex.scad>
include <../components/endstop.scad>
include <configuration.scad>


module endstop_mount(color="Red"){
	// position on center
	rotate([0,-90,0]) rotate([0,0,180])
		union(){
			// show endstop
			%translate([6,0,11]) rotate([0,0,-90]) endstop();

			
			color(color) difference(){
				union(){
					
					// baseplate
					hull(){
						translate([-10,-10,0]) cube([15,20,4]);
						translate([6,5,0]) cylinder(4,5,5,$fn=30);
						translate([6,-5,0]) cylinder(4,5,5,$fn=30);
					}
					
					// mount
					translate([6,-5,4]) cylinder(3.8,5,3,$fn=30);
					translate([6,5,4]) cylinder(3.8,5,3,$fn=30);
				}

				// screwcutouts
				translate([6,5,4]) cylinder(r=1.3,h=20,$fn=30,center=true);
				translate([6,-5,4]) cylinder(r=1.3,h=20,$fn=30,center=true);
				translate([-5,0,0]) cylinder(r=m4_open_radius,h=20,$fn=30,center=true);
			}
		}
}

// render
rotate([0,90,0]) endstop_mount();