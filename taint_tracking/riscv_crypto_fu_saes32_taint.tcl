analyze -sv riscv_crypto_fu_saes32_taint.v

elaborate -top riscv_crypto_fu_saes32

clock -none
reset -none


# check once the computation is finsihed that there is no information leak to the registar where data is stored
assume {rs1_t == 1}
assert {ready -> !rd_t}


# Set the time limit to 1 hour (3600 seconds)
set_prove_time_limit 3600
prove -all