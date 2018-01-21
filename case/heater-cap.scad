//
// header-cap.scad
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
include <common.inc>;

l = wall + pot_h + board_thickness + 9;

module cap() {
	difference() {
		minkowski() {
			cube([wo - 4, ho - 4, l - 4], center = true);
			cylinder(r = 2, h = 2, center = true, $fn = 30);
		}
		union() {
			translate([0, 0, -wall])
				cube([wi, hi - 2 * 4, l], center = true);
			translate([0, 0, -wall])
				cube([wi - 2 * 4, hi, l], center = true);
			translate([0, 0, -(wall + pot_h)])
				cube([wi, hi, l], center = true);

			translate([ led_x, -led_y, 1])
				cylinder(r = led_r, h = l, center = true, $fn = 12);
			translate([-led_x, -led_y, 1])
				cylinder(r = led_r, h = l, center = true, $fn = 12);

			translate([ pot_x, -pot_y, 1])
				cylinder(r = pot_r, h = l, center = true, $fn = 20);
			translate([-pot_x, -pot_y, 1])
				cylinder(r = pot_r, h = l, center = true, $fn = 20);

			translate([ cinch_x, -cinch_y, 1])
				cylinder(r = cinch_r, h = l, center = true, $fn = 30);
			translate([-cinch_x, -cinch_y, 1])
				cylinder(r = cinch_r, h = l, center = true, $fn = 30);

			translate([-wo/2 - 10 + 3.2, 0, -(l/2 - 4.5)])
				rotate([0, 90, 0])
					cylinder(r1 = 10, r2 = 0, h = 10, $fn = 20);
			translate([wo/2 + 10 - 3.2, 0, -(l/2 - 4.5)])
				rotate([0, -90, 0])
					cylinder(r1 = 10, r2 = 0, h = 10, $fn = 20);
			translate([0, 0, -(l/2 - 4.5)])
				rotate([0, 90, 0])
					cylinder(r = 1.6, h = 100, center = true, $fn = 30);
		}
	}
}


cap();

