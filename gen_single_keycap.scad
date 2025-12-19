use <gen_sprued_keycaps.scad>

keycap_id = undef;
assert(keycap_id != undef, str("Please specify the keycap_id using -D keycap_id=cs_r2_1."))

cs_keycap(keycap_id);
