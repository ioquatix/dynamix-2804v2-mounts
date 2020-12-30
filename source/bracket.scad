
use <bolts.scad>;
use <zcube.scad>;

$fs = 0.1;

hole_width = 25.4 / 2; // 1/2 inch.
hole_diameter = 25.4 / 4; // 1/4 inch.

height = 12;
thickness = 4;
distance = 112;
width = distance+60;
offset = (width-distance) / 2;

// Hole diameter is 1/4 inch.
module clip(size = hole_diameter, standoff = 0.2, gap = 1.6) {
	offset = size/3;
	
	//scale([1, 2.2/3, 1])
	intersection() {
		#translate([offset, 0, -gap]) cube([size, size, gap*2], center=true);
		
		union() {
			intersection() {
				translate([0, 0, -gap]) cylinder(d=size,h=gap);
				translate([offset, 0, -size]) cylinder(h=size,d=size);
			}
			
			translate([offset, 0, -gap*2]) cylinder(h=gap,d=size);
		}
	}
	
	translate([0, 0, -standoff]) cylinder(d=size,h=standoff);
}

module fitting(size = hole_diameter, gap = 1.6) {
		translate([0, 0, -gap*2]) cylinder(d=size,h=gap*2);
}

module bracket() {
	color("green") {
		translate([hole_width*-2, 0, 0]) clip();
		translate([hole_width*0, 0, 0]) clip();
		translate([hole_width*2, 0, 0]) clip();
	}
	
	color("orange") {
		/* translate([hole_width*2, 0, ]) fitting(); */
	}
	
	difference() {
		rcube([hole_width * 5, hole_width, 4], d=2);
		
		translate([hole_width*-1, 0, 0]) hole(6);
		translate([hole_width*1, 0, 0]) hole(6);
	}
}

bracket();