//
// common.inc -- common dimensions
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
board_width = 77.47;
board_height = 20.32;
board_thickness = 1.8;

wall = 2.0;
gap = 0.1;
bed = 1;

w = board_width + 2 * gap;
h = board_height + 2 * gap;

wi = w + 2 * bed + 2 * gap;
hi = h + 2 * bed + 2 * gap;

wo = wi + 2 * wall;
ho = hi + 2 * wall;

led_x = 5.715;
led_y = 6.350;
led_r = 3.2/2;

cinch_x = 13.335;
cinch_y =  3.810;
cinch_r = 11/2;

pot_x = 29.845;
pot_y = 5.080;
pot_h = 7.5 + 0.5;
pot_r = 6/2;

bat_gap = 0.2 + 0.2;
bat_w = 78 + 2 * bat_gap;
bat_h = 21.5 + 2 * bat_gap;
bat_l = 10;
bat_r = 10;
bat_wall = 4;

function radius(a, b) = (a*a + b*b) / (2*b);

module battery(a, b) {
	translate([0, 0, -5])
	minkowski() {
		cube([bat_w - 2 * a, bat_h - 2 * b, la], center = true);
		intersection() {
			translate([0, b - radius(a, b), 0])
				cylinder(r = radius(a,b), h = 2 * bat_r,
					center = true, $fn = 40);
			translate([0, -b + radius(a, b), 0])
				cylinder(r = radius(a,b), h = 2 * bat_r,
					center = true, $fn = 40);
		}
	}
}

