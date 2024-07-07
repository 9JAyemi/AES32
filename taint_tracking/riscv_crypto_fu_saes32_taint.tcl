analyze -sv riscv_crypto_fu_saes32_taint.v

elaborate -top riscv_crypto_fu_saes32

clock -none
reset reset -non_resettable_regs 0


# check once the computation is finsihed that there is no information to the registar where data is stored
assume {rs1_t == 1}
assert {ready -> !rd_t}


# Set the time limit to 1 hour (3600 seconds)
set_prove_time_limit 3600
prove -all