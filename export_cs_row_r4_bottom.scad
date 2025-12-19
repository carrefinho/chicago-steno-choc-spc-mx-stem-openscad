// This is the same as the R2 row.
// You can also simply print the R2 file, but this is provided for
// clarity and ease of checking when ordering.

use <gen_sprued_keycaps.scad>

keycap_ids = [
    // Left Keyboard Side
    "cs_r4_1",
    "cs_r4_1",
    "cs_r4_1",
    "cs_r4_1",
    "cs_r4_1",

    // Right Keyboard Side
    "cs_r4_1",
    "cs_r4_1",
    "cs_r4_1",
    "cs_r4_1",
    "cs_r4_1",
];

gen_sprued_keycaps(keycap_ids);
