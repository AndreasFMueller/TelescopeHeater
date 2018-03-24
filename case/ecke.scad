//
// ecke.scad
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//

module schraube() {
    union() {
        translate([0, 0, -30])
            cylinder(r = 1.5, h = 60, $fn = 30, center = true);
        translate([0, 0, -1.5])
            cylinder(r1 = 0, r2 = 3, h = 3, $fn = 30, center = true);
    }
}

module ecke() {
    intersection() {
        difference() {
            union() {
                translate([-1, -1, 0])
                minkowski() {
                    sphere(r = 1, $fn = 30);
                    cube([12, 12, 12], center = true);
                }
                translate([-5, -5, 0])
                    minkowski() {
                        sphere(r = 3, $fn = 30);
                        cube([16, 16, 1], center = true);
                    }
            }
            cube([10, 10, 12], center = true);
        }
        rotate([0, 0, 45]) translate([-50, 0, 0]) cube([100, 100, 100], center = true);
        translate([0, 0, 50])
            cube([100, 100, 100], center = true);
    }   
}

difference() {
    ecke();
    union() {
        translate([-11,  2, 3.5]) schraube();
        translate([  2,-11, 3.5]) schraube();
        translate([-11,-11, 3.5]) schraube();
    }
}
