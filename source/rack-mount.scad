
use <bolts.scad>;
use <zcube.scad>;

$fs = 0.1;

hole_width = 25.4 / 2; // 1/2 inch.
hole_diameter = 25.4 / 4; // 1/4 inch.

rack_unit = 25.4 * (7/8);
rack_unit_hole_spacing = 25.4 * 0.625;

module bracket() {
	difference() {
		intersection() {
			rcube([hole_width * 5, hole_width, rack_unit], d=2);
			
			hull() {
				zcube([hole_width * 5, hole_width, 4]);
				
				translate([hole_width * 2.5 - 2, 0, 0])
				zcube([4, hole_width, rack_unit]);
			}
		}
		
		translate([hole_width*-1, 0, 0]) hole(6, 4, inset=rack_unit);
		translate([hole_width*1, 0, 0]) hole(6, 4, inset=rack_unit);
	}
}

bracket();