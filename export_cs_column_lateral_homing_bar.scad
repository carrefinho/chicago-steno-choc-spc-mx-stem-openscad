// Lateral keycaps don't have the slope on one side. This makes it easier to
// slide from one keycap to the other.
//
// Some people prefer this for the inner or outer columns to avoid lifting up
// their finger over the ridges.
//
// Other people don't like it, because it makes it easier to hit the wrong key.
//
// You should place the left and right variation next to each other. So, for
// example, if you wanted to use them on both sides for the pinkies, you would
// print this file twice.

use <gen_sprued_keycaps.scad>

keycap_ids = [
    // Left Side
    "cs_r2_lateral_l" , // Num Row
    "cs_r3_lateral_l",  // Top Alpha
    "cs_r3_lateral_l",  // Home Row
    "cs_r4_lateral_l",  // Bottom Alpha

    // Right Side
    "cs_r2_lateral_r" , // Num Row
    "cs_r3_lateral_r",  // Top Alpha
    "cs_r3_lateral_r",  // Home Row
    "cs_r4_lateral_r",  // Bottom Alpha

    // Homing
    "cs_r3_lateral_l_bar",    // Left Homing
    "cs_r3_lateral_r_bar",    // Right Homing
];

gen_sprued_keycaps(keycap_ids, vertical=true);
