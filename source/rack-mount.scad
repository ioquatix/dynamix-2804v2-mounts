
use <bolts.scad>;
use <zcube.scad>;

$fs = 0.1;

hole_offset = 25.4 / 2; // 1/2 inch.
hole_diameter = 25.4 / 4; // 1/4 inch.

rack_unit = 25.4 * (7/4);
rack_unit_hole_offset = 25.4 * 0.25;
rack_unit_hole_spacing = 25.4 * 1.25;

module bracket(length = 7, width = 25.4*0.625) {
	difference() {
		intersection() {
			rcube([hole_offset * length, width, rack_unit], d=2);
			
			hull() {
				zcube([hole_offset * length, width, 4]);
				
				translate([hole_offset * length/2 - hole_offset/2, 0, 0])
				zcube([hole_offset, width, rack_unit]);
			}
		}
		
		translate([-hole_offset*(length-1)/2, 0, 0]) hole(6, 4, inset=rack_unit);
		
		#translate([hole_offset*(length/2) - 10, 0, rack_unit_hole_offset])
		rotate([0, 90, 0]) hole(6, 10);
		
		#translate([hole_offset*(length/2) - 10, 0, rack_unit_hole_offset+rack_unit_hole_spacing])
		rotate([0, 90, 0]) hole(6, 10);
	}
}

translate([0, hole_offset*8])
bracket();

translate([-167/2, 0, 0])
zcube([167, 200, 46]);