// You can use these for the outer pinky column if your keyboard has one.
//
// Print this in addition to the homerow_bar file to get both dots and bar
// homing keys.

use <gen_sprued_keycaps.scad>

keycap_ids = [
    // Left Keyboard Side
    "cs_r2_1" , // Num Row
    "cs_r3_1",  // Top Alpha
    "cs_r3_1",  // Home Row
    "cs_r4_1",  // Bottom Alpha

    // Right Keyboard Side
    "cs_r2_1" , // Num Row
    "cs_r3_1",  // Top Alpha
    "cs_r3_1",  // Home Row
    "cs_r4_1",  // Bottom Alpha

    // Homing keys
    "cs_r3_1_dot",
    "cs_r3_1_dot",
];

gen_sprued_keycaps(keycap_ids, vertical=true);
