//
// cap.scad
//
// (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
//
w = 27;
l = 84;
h = 40;
radius = 1.5;
s = 1.8;
wall = 2;
offset = 4.6;
depth = 13;

faces = 20;

module body() {
	difference() {
		minkowski() {
			cube([l + wall, w + wall, h], center = true);
			sphere(r = radius, $fn = faces);
		}
		translate([0, 0, 1 + 5])
			cube([l, w, h + 10], center = true);
        translate([0, -5, h - depth])
            cube([l + 10, 1, h], center = true);
        translate([0, +5, h - depth])
            cube([l + 10, 1, h], center = true);
	}
    translate([-(l + wall)/2 - radius + s, 0, h/2 + radius - offset])
        sphere(r = s, $fn = faces);
    translate([+(l + wall)/2 + radius - s, 0, h/2 + radius - offset])
        sphere(r = s, $fn = faces);
}

body();
