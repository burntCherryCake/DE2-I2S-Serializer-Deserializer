library verilog;
use verilog.vl_types.all;
entity audio_serial_to_parallel_testbench is
    generic(
        stimDelay       : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of stimDelay : constant is 1;
end audio_serial_to_parallel_testbench;
