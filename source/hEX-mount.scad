$fs = 0.1;

module clip() {
	size = 6;
	
	scale([1, 2.2/3, 1]) intersection() {
		translate([0, -size, 0]) linear_extrude(size/2, center=true) polygon(points=[
			[0, 0], [size, 0], 
			[size, size/2], [size/2, size/2],
			[size/2, size], [0, size]
		]);
		
		union() {
			intersection() {
				rotate(90, [1, 0, 0]) cylinder(d=size,h=size/2);
				translate([size/2, 0, 0]) rotate(90, [1, 0, 0])  cylinder(h=size,d=size);
			}
			
			translate([size/2, -size/2, 0]) rotate(90, [1, 0, 0])  cylinder(h=size/2,d=size);
		}
	}
	
	rotate(90, [1, 0, 0]) cylinder(d=size,h=0.1);
}

module hex_hole(nut_radius, screw_radius, depth) {
	correction = 1/cos(30);
	cylinder(r=nut_radius*correction+0.2, h=2.4, $fa=60);
	cylinder(d=screw_radius,h=depth);
}

height = 12;
thickness = 4;
hole_width = 12.7;
distance = 112;
width = distance+60;
offset = (width-distance) / 2;

translate([0, 0, thickness]) rotate(90, [-1, 0, 0]) union() {
	color("orange") translate([hole_width*1, 0, height/2]) rotate(90, [1, 0, 0]) cylinder(d=6.2,h=2.5);
	
	color("blue") difference() {
		cube(size=[width, thickness, height]);
		
		// Screw holes
		translate([offset, 0, height/2]) rotate(90, [-1, 0, 0]) {
			translate([0, 0, -0.1]) hex_hole(5.5/2, 3.2, thickness+0.2);
			translate([distance, 0, -0.1]) hex_hole(5.5/2, 3.2, thickness+0.2);
		}
	}
	
	color("green") union() {
		translate([hole_width*6, 0, height/2]) clip();
		translate([hole_width*7, 0, height/2]) clip();
		
		translate([hole_width*12, 0, height/2]) clip();
	}
}