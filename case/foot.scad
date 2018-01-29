//
// foot.scad 
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//

r = 18;
h = 5;

l = r - 5;

module foot() {
    translate([0, 0, h/2 + 0.01])
    difference() {
        union() {
            difference() {
                cylinder(r = r, h = h, $fn = 64, center = true);
                translate([0, 0, 1])
                    cylinder(r2 = r - 1, r1 = r - 4, h = h, $fn = 64, center = true);
            }
            cylinder(r1 = 9, r2 = 4, h = h, $fn = 32, center = true);
            for (angle = [0: 30: 330]) {
                rotate([0, 0, angle])
                    translate([l/2 + 4.5, 0, 0])
                        cube([l, 1, 3.1], center = true);
            }
        }
        translate([0, 0, -0.001])
            union() {
                cylinder(r = 2, h = 10, $fn = 32, center = true);
                translate([0, 0, 0])
                    cylinder(r1 = 6, h = 6, r2 = 0, $fn = 32, center = true);
            }
    }
}

translate([ 20,  20, 0]) foot();
translate([ 20, -20, 0]) foot();
translate([-20,  20, 0]) foot();
translate([-20, -20, 0]) foot();


