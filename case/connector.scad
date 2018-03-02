//
// connector.scad
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
include <common.inc>

bat_w = 78;
bat_h = 21.5;
bat_r = 10;
la = 10;

module stecker() {
    difference() {
        battery(8, 2.75);
        union() {
            translate([bat_w / 2 - 4, 0, 0])
                cylinder(r = 1.2, h = 1000, center = true, $fn = 30);
            translate([-bat_w / 2 + 4, 0, 0])
                cylinder(r = 1.2, h = 1000, center = true, $fn = 30);
            translate([0, 0, 27])
                union() {
                    cube([64, 16, 80], center = true);
                    translate([-25, -0.75, -93])
                    union() {
                        translate([0, 0, 50])
                            cylinder(r = 4, h = 100, center = true, $fn = 30);
                        translate([0, 0, 25])
                            cylinder(r = 8, h = 50, center = true, $fn = 30);
                    }
                }
            translate([0, 10, 14])
                cube([3, 20, 10], center = true);
        }
    }
}

module schraube() {
    translate([0, 0, -20])
    union() {
        translate([0, 0, 10])
            cylinder(r = 1.2, h = 20, center = true, $fn = 30);
        translate([0, 0, 1.5])
            cylinder(r1 = 3, r2 = 0, h = 3, center = true, $fn = 30);
    }
}

module deckel() {
    difference() {
        union() {
            intersection() {
                battery(8, 2.75);
                translate([0, 0, -18])
                    cube([100, 100, 4], center = true);
                
            }
            translate([-26.5, 0, -15])
                cube([10, 16-0.5, 2], center = true);
            translate([+26.5, 0, -15])
                cube([10, 16-0.5, 2], center = true);
        }
        union() {
            translate([-bat_w / 2 + 4, 0, 0])
                    schraube();
            translate([bat_w / 2 - 4, 0, 0])
                    schraube();
        }
    }
}

stecker();
translate([0, -30, 0]) deckel();