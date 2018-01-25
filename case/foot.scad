//
// foot.scad 
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//

r = 18;
h = 5;

difference() {
	union() {
		difference() {
			cylinder(r = r, h = h, $fn = 64, center = true);
			translate([0, 0, 1])
				cylinder(r2 = r - 1, r1 = r - 4, h = h, $fn = 64, center = true);
		}
		cylinder(r1 = 7, r2 = 4, h = h, $fn = 32, center = true);
	}
	translate([0, 0, -0.001])
		union() {
			cylinder(r = 2, h = 10, $fn = 32, center = true);
			translate([0, 0, -1])
				cylinder(r1 = 5, h = 5, r2 = 0, $fn = 32, center = true);
		}
}

