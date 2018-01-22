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
pot_h = 7.5;
pot_r = 6/2;

