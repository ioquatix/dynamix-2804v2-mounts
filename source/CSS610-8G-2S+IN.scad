
use <bracket.scad>;
use <bolts.scad>;
use <zcube.scad>;

module mounting_holes() {
	translate([0, 0, 44/2]) {
		translate([-25/2, 0, -25/2]) children();
		translate([25/2, 0, -25/2]) children();
		translate([25/2, 0, 25/2]) children();
		translate([-25/2, 0, 25/2]) children();
	}
}

module sides() {
	bracket(width=17, height=44) {
		translate([-167/2, 0, -4])
		#zcube([167, 200, 44+4]);
		
		reflect([0, 1, 0])
		translate([-44/2, 0, 0])
		mounting_holes()
		translate([0, 4-200/2, 0])
		#rotate([90, 0, 0]) countersunk_hole(3, 12);
	}
}

sides();
