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

wa = bat_w + 2 * bat_wall;
ha = bat_h + 2 * bat_wall;
la = 120;

module batterycompartment() {
	translate([0, 0, -la/2])
	difference() {
		difference() {
			minkowski() {
				cube([wa - 6, ha - 6, la - 10], center = true);
				cylinder(r = 3, h = 10, center = true, $fn = 30);
			}
			translate([0, -ha/2, -wall - bat_l])
				cube([2 * wa, ha, la], center = true);
	
		}
		battery(8,2.75);
	}
}

sw = 14;
sh = 10;
sr = 1.95;

module schraube() {
	translate([0, -20 + 5, 0])
		rotate([-90, 0, 0])
			union() {
				cylinder(r1 = 20, r2 = 0, h = 20, $fn = 30);
				cylinder(r = 2.5, h = 30, $fn = 30);
			}
}

// XXX stecker-Radius muss noch ermittelt werden
// 5/16 = 7.93
stecker_r = 3.9;

module stecker() {
	translate([0, 0, -la/2 + 1.2])
		union() {
			cylinder(r = stecker_r, h = 200, center = true, $fn = 30);
			cylinder(r = 10.5/2, h = la, center = true, $fn = 30);
		}
}

module body() {
	difference() {
		union() {
			toppart();
			translate([0, 0, wall - gap])
				batterycompartment();
		}
		union() {
			translate([sw, bat_h/2, -la/2])
				schraube();
			translate([-sw, bat_h/2, -la/2])
				schraube();
			translate([0, bat_h/2, -la/2 + sh])
				schraube();
			translate([0, bat_h/2, -la/2 - sh])
				schraube();

			translate([-25, 0.75, 0])
				stecker();

			translate([20.32, -6.35, 0])
				cube([9, 7, 300], center = true);
		}
	}
}

body();

