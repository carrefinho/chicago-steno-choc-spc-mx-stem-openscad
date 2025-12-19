// You can use these for the outer pinky column if your keyboard has one.

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
];

gen_sprued_keycaps(keycap_ids, vertical=true);
