
use <zcube.scad>;
use <bracket.scad>;

module loop(size = 90, width = bracket_offset(), thickness = 6) {
	render() difference() {
		rcube([size, size, width], d=2);
		rcube([size-thickness*2, size-thickness*2, width], d=2);
		
		bracket_translate(2, 0)
		translate([0, (size-thickness)/2, 0])
		/* rotate([0, 0, 45]) */
		#zcube([thickness*2, size/3, width]);
	}
}

module clip(width = 3, length = 1, height = 90) {
	color("grey") difference() {
		union() {
			bracket_translate(0, 0.5)
			translate([0, 0, 45])
			rotate([90, 0, 0])
			loop();
			
			/* bracket_cube([width, length, 6]); */
		}
		
		bracket_translate(-2, 0) bracket_clip();
		bracket_translate(-1, 0) bracket_clip();
		bracket_translate(2, 0) bracket_hole();
		bracket_translate(1, 0) bracket_clip();
	}
}

clip();
