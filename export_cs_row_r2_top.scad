// Use these for the num row if you have one
// or for the top alpha row on keyboards without a num row.

use <gen_sprued_keycaps.scad>

keycap_ids = [
    // Left Keyboard Side
    "cs_r2_1",
    "cs_r2_1",
    "cs_r2_1",
    "cs_r2_1",
    "cs_r2_1",

    // Right Keyboard Side
    "cs_r2_1",
    "cs_r2_1",
    "cs_r2_1",
    "cs_r2_1",
    "cs_r2_1",
];

gen_sprued_keycaps(keycap_ids);
