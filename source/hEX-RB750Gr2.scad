
use <bracket.scad>;
use <bolts.scad>;
use <zcube.scad>;

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
	bracket(height=32, width=10, length=8) {
		translate([-90/2-4, 0, 0])
		#zcube([90, 114, 28]);
		
		translate([-89+50/2, 0, -4])
		zcube([90+50, 114-10, 32+4]);
		
		translate([-40/2-7, 142/2, 28/2])
		rotate([90, 0, 0])
		rcube([40, 14, 142], d=4);
	}
}

render()
sides();
