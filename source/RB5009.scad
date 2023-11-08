
use <bracket.scad>;
use <bolts.scad>;
use <zcube.scad>;

bracket_offset = 25.4 / 2; // 1/2 inch.

module mounting_hole_offsets() {
	translate([0, 0, 28-8]) {
		bracket_translate(-0.5, -5)
		translate([0, 0, 2]) children();
		
		bracket_translate(-3, -5)
		translate([0, 0, 2]) children();
	}
}

module mounting_holes() {
	reflect([0, 1, 0])
	mounting_hole_offsets() countersunk_bolted_hole(3, 12, 0);
}

module sides() {
	bracket(height=21.5, width=17, length=12) {
		translate([-125/2 - bracket_offset, 0, -4])
		#zcube([125, 220, 21.5]);
		
		translate([-125/2 - bracket_offset, 0, -4])
		#zcube([125+60, 220-(16*2), 21.5+4]);
		
		translate([-40/2-7, 142/2, 28/2])
		rotate([90, 0, 0])
		rcube([40, 14, 142], d=4);
	}
}

render()
sides();
