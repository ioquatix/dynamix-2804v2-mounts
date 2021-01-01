
use <bracket.scad>;
use <bolts.scad>;
use <zcube.scad>;

module mounting_holes() {
	translate([0, 0, 28-8]) {
		bracket_translate(-0.5, -5)
		translate([0, 0, 0]) children();
		
		bracket_translate(-3, -5)
		translate([0, 0, 0]) children();
	}
}

module sides() {
	bracket(height=28) {
		translate([-141/2, 0, 0])
		zcube([141, 115, 28]);
		
		translate([-141/2-25, 0, -4])
		zcube([141+50, 100, 28]);
		
		translate([-52+(-60/2)-20, 115/2 + 20, 8+(13/2)+7/2])
		rotate([90, 0, 0])
		rcube([60+40, 13+7, 20], d=4);
		
		reflect([0, 1, 0])
		mounting_holes() bolted_hole(3, 12);
	}
}

module heatsink() {
	translate([-102/2 - 4, 0, 28]) {
		#difference() {
			zcube([102, 98, 36]);
			
			translate([0, 0, 5])
			zcube([30, 98, 36-5]);
		}
	}
}

module top() {
	bracket_cover(height=28) {
		reflect([0, 1, 0])
		#mounting_holes() bolted_hole(3, 12+4);
		
		heatsink();
	}
}

sides();
top();
