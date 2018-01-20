//
// heater-body.scad
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
include <common.inc>

pt = 6;
pb = 5;
p = pt + pb;

wb = wi - 2 * gap;
hb = hi - 2 * gap;
lb = p + board_thickness;

module toppart() {
	translate([0, 0, lb/2])
	difference() {
		cube([wb, hb, lb], center = true);
		union() {
			//translate([0, 0, pb])
			//	cube([w, h - 2 * 3, lb], center = true);
			translate([0, 0, pb])
				cube([w - 2 * 3, h - 1, lb], center = true);
			translate([0, 0, p])
				cube([w, h, lb], center = true);
			translate([0, 0, lb/2 - board_thickness - 4.5])
				rotate([0, 90, 0])
					cylinder(r = 1.2, h = 2 * wb, $fn = 16, center = true);
		}
	}
}

bat_w = 75;
bat_h = 21.5;
bat_l = 10;
bat_r = 10;

bat_wall = 4;

wa = bat_w + 2 * bat_wall;
ha = bat_h + 2 * bat_wall;
la = 120;

module battery() {
	translate([0, 0, -5])
	minkowski() {
		cube([bat_w - 2 * bat_r, bat_h - 2 * bat_r, la], center = true);
		cylinder(r = bat_r, h = 2 * bar_r, center = true, $fn = 30);
	}
}

module batterycompartment() {
	translate([0, 0, -la/2])
	difference() {
		difference() {
			cube([wa, ha, la], center = true);
			translate([0, -ha/2, -wall - bat_l])
				cube([2 * wa, ha, la], center = true);
	
		}
		translate([0, -0.5, 0])
			battery();
	}
}

sw = 12;
sh = 15;
sr = 1.95;

module body() {
	difference() {
		union() {
			toppart();
			translate([0, 0, wall - gap])
				batterycompartment();
		}
		union() {
			translate([sw, ha/2 - 20 + 2.5, -la/2])
				rotate([-90, 0, 0])
					cylinder(r1 = 20, r2 = 0, h = 20, $fn = 30);
			translate([-sw, ha/2 - 20 + 2.5, -la/2])
				rotate([-90, 0, 0])
					cylinder(r1 = 20, r2 = 0, h = 20, $fn = 30);
			translate([0, ha/2 - 20 + 2.5, -la/2 + sh])
				rotate([-90, 0, 0])
					cylinder(r1 = 20, r2 = 0, h = 20, $fn = 30);
			translate([0, ha/2 - 20 + 2.5, -la/2 - sh])
				rotate([-90, 0, 0])
					cylinder(r1 = 20, r2 = 0, h = 20, $fn = 30);

			translate([-25, 0, 0])
				cylinder(r = 3, h = 200, center = true, $fn = 30);
			translate([20.32, -6.35, 0])
				cube([9, 7, 300], center = true);
		}
	}
//translate([sw, ha/2 - 20 + 2.5, -la/2 - sh])
//				rotate([-90, 0, 0])
//					cylinder(r1 = 20, r2 = 0, h = 20, $fn = 30);
}

body();

