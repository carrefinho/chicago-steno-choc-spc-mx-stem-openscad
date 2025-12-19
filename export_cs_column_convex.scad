// You can use these for the outer pinky column
// or for the inner index column
use <gen_sprued_keycaps.scad>

keycap_ids = [
    // Left Keyboard Side
    "cs_r2x_1" , // Num Row
    "cs_r3x_1",  // Top Alpha
    "cs_r3x_1",  // Home Row
    "cs_r4x_1",  // Bottom Alpha

    // Right Keyboard Side
    "cs_r2x_1" , // Num Row
    "cs_r3x_1",  // Top Alpha
    "cs_r3x_1",  // Home Row
    "cs_r4x_1",  // Bottom Alpha
];

gen_sprued_keycaps(keycap_ids, vertical=true);
