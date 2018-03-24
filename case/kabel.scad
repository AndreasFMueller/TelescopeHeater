//
// kabel.scad
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//

module schraube() {
    union() {
        translate([0, 0, -30])
            cylinder(r = 1.5, h = 60, $fn = 30, center = true);
        translate([0, 0, -5])
            cylinder(r1 = 0, r2 = 10, h = 10, $fn = 30, center = true);
    }
}

module kabelhalter() {
	difference() {
        union() {
            minkowski() {
                sphere(r = 2, $fn = 30);
                cube([26, 24, 2], center = true);
            }
            minkowski() {
                sphere(r = 2, $fn = 30);
                cube([7, 24, 7], center = true);
            }
        }
		union() {
            minkowski() {
                cube([4, 40, 5], center = true);
                sphere(r = 1, $fn = 30);
            }
			translate([0, 0, -50])
				cube([100, 100, 100], center = true);
		}
	}
}

difference() {
    kabelhalter();
    union() {
        translate([-10, -9, 9.5]) schraube();
        translate([+10, -9, 9.5]) schraube();
        translate([-10, +9, 9.5]) schraube();
        translate([+10, +9, 9.5]) schraube();
    }
}