//
// ecke.scad
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
l = 60;
screwoffset = l/2 + 1;
h = 7;
w = 10;

module schraube() {
    union() {
        translate([0, 0, -30])
            cylinder(r = 1.5, h = 60, $fn = 30, center = true);
        translate([0, 0, -2])
            cylinder(r1 = 0, r2 = 4, h = 4, $fn = 30, center = true);
    }
}

module baseplate() {
    translate([-6, -6, 0])
    difference() {
        minkowski() {
            sphere(r = 3, $fn = 50);
            cube([l + 8, l + 8, 1], center = true);
        }
        union() {
            translate([+screwoffset, +screwoffset, 3.5]) schraube();
            translate([-screwoffset, +screwoffset, 3.5]) schraube();
            translate([+screwoffset, -screwoffset, 3.5]) schraube();
            translate([-screwoffset, -screwoffset, 3.5]) schraube();
            translate([-screwoffset,            0, 3.5]) schraube();
            translate([           0, -screwoffset, 3.5]) schraube();
        }
    }
}

module topplate() {
    intersection() {
        union() {
            translate([l/2 - w, -l/2 , h + 0.5])
                cylinder(r = w, h = 1, center = true, $fn = 60);
            translate([-l/2, l/2 - w, h + 0.5])
                cylinder(r = w, h = 1, center = true, $fn = 60);
        }
        rotate([0, 0, 45])
            translate([49 + l/2, 0, 0]) cube([100 + l, 100 + l, 100], center = true);
    }
}

module ecke() {
    intersection() {
        difference() {
            union() {
                translate([-1, -1, 0])
                minkowski() {
                    sphere(r = 1, $fn = 30);
                    cube([l + 2, l + 2, 2 * h], center = true);
                }
                baseplate();
            }
            cube([l, l, 2*h], center = true);
            cube([l - 2*w, l - 2*w, 2*h + 4], center = true);
        }
        rotate([0, 0, 45])
            translate([-50 - l/2, 0, 0])
                cube([100 + l, 100 + l, 100], center = true);
        translate([0, 0, 50 + l/2])
            cube([100 + l, 100 + l, 100 + l], center = true);
    }   
}


ecke();
topplate();
 