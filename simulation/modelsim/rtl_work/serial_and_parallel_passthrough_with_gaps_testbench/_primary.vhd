library verilog;
use verilog.vl_types.all;
entity serial_and_parallel_passthrough_with_gaps_testbench is
    generic(
        stimDelay       : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of stimDelay : constant is 1;
end serial_and_parallel_passthrough_with_gaps_testbench;
