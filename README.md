https://github.com/burntCherryCake/DE2-I2S-Serializer-Deserializer

### Altera DE2 Audio Codec Serializer and Deserializer, with some basic Audio DSP implementations
# Summary
There is a bug in the original DE2 sample projects in the way the Wolfson (now Cirrus Logic) WM8731 Audio ADC/DAC configuration with the way the hardware was reset, causing the audio codec to generate no output. That has been fixed in this repository.

This repository is based on the original Altera DE2 System CD's example for i2s sound. The code compiles and runs in Quartus II 64-bit version 13.0.1 Build 232 06/12/2013 SJ Web Edition

# New Features
- Synchronous I2S Deserializer and Reserealizer implementation with support for true arbitrary length L/R packet sizes
- Working SRAM controller, read and write tested with an external logic analyzer

- A DSP path that has a working implementation of a moving average filter that uses the on-board SRAM
- For convenience, a switch input has been added to toggle between a passthrough (mic/line in) path and a DSP path
- The FIR and CIC filters are possibley partially working.

DE2 board (now obsolete) product website (Terasic) https://www.terasic.com.tw/cgi-bin/page/archive.pl?No=30

![Picture of Schematic and Blocks Connection](https://github.com/burntCherryCake/DE2-I2S-Serializer-Deserializer/blob/main/images/blockDiagram.png)