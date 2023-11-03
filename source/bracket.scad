
use <bolts.scad>;
use <zcube.scad>;

bracket_offset = 25.4 / 2; // 1/2 inch.
bracket_diameter = 25.4 / 4; // 1/4 inch.
bracket_depth = bracket_offset * 3.5;

// A gap between the back of the cabinet and the base of the hardware, to avoid hitting the cable tie attachment points :(
bracket_gap = 4;

function bracket_offset(x = 1) = bracket_offset * x;

module bracket_translate(x, y, offset = bracket_offset) {
	translate([offset * x, offset * y, 0]) children();
}

module bracket_clip(length = 8, thickness = 1.5) {
	translate([-1.5, 0, length - thickness])
	rotate([180, 0, 0])
	threaded_hole(3, length);
	
	#translate([0, 0, -5]) cylinder(d=6, h=5, $fn=32);
}

module bracket_hole(length = 6, thickness = 2) {
	translate([0, 0, -thickness])
	threaded_hole(6, length+thickness);
	
	#translate([0, 0, -5]) cylinder(d=6, h=5, $fn=32);
}

module bracket_cube(size)
{
	bracket_translate(size[0]/2 - 0.5, size[1]/2 - 0.5)
	rcube([size[0] * bracket_offset, size[1] * bracket_offset, size[2]], d=2);
}

module bracket(width = 10, length = 12, height = 34) {
	front_offset = bracket_offset*(length+0.5);
	middle_offset = bracket_offset*(width/2);
	
	color("grey") difference() {
		render() difference() {
			union() {
				hull() {
					translate([front_offset - bracket_depth/2, bracket_offset*width/2, 0])
					rcube([bracket_depth, (width+1)*bracket_offset, height+bracket_gap], d=2);
					
					translate([bracket_offset*length/2, bracket_offset*width/2, 0])
					rcube([bracket_offset*5, (width+1)*bracket_offset, 6], d=2);
				}
				
				translate([bracket_offset*length/2, bracket_offset*width/2, 0])
				rcube([(length+1)*bracket_offset, (width+1)*bracket_offset, 6], d=2);
			}
			
			translate([front_offset, middle_offset, bracket_gap])
			children();
		}
		
		bracket_translate(0, 0) bracket_hole();
		bracket_translate(1, 0) bracket_clip();
		bracket_translate(4, 0) bracket_clip();
		bracket_translate(length - 1, 0) bracket_clip();
		bracket_translate(length, 0) bracket_clip();
		
		bracket_translate(0, width) bracket_hole();
		bracket_translate(1, width) bracket_clip();
		bracket_translate(4, width) bracket_clip();
		bracket_translate(length - 1, width) bracket_clip();
		bracket_translate(length, width) bracket_clip();
	}
}

module bracket_cover(width = 10, length = 12, height = 34, thickness = 8) {
	front_offset = bracket_offset*(length+0.5);
	middle_offset = bracket_offset*(width/2);
	
	color("grey") difference() {
		render() difference() {
			hull() {
				translate([front_offset - bracket_depth/2, bracket_offset*width/2, height+bracket_gap])
				rcube([bracket_depth, (width+1)*bracket_offset, thickness], d=2);
			}
			
			translate([front_offset, middle_offset, bracket_gap])
			children();
		}
	}
}

bracket();
