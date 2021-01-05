
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
	bracket(height=28) {
		translate([-141/2, 0, 0])
		zcube([141, 115, 28]);
		
		translate([-141/2-25, 0, -4])
		zcube([141+50, 100, 28]);
		
		// The side panel cutout:
		translate([-52+(-60/2)-20, 115/2 + 20, 28/2])
		rotate([90, 0, 0])
		hull() {
			rcube([60+40, 14, 20], d=4);
			translate([0, 10, 0])
			rcube([60+40, 14, 20], d=4);
		}
		
		translate([-40/2-7, 142/2, 28/2])
		rotate([90, 0, 0])
		rcube([40, 14, 142], d=4);
		
		mounting_holes();
	}
}

module heatsink() {
	translate([-102/2 - 4, 0, 28]) {
		difference() {
			zcube([102, 98, 36]);
			
			translate([0, 0, 5])
			zcube([30, 98, 36-5]);
		}
	}
}

module top() {
	bracket_cover(height=28) {
		mounting_holes();
		
		heatsink();
	}
}

sides();
top();
