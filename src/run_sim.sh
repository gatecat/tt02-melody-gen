#!/usr/bin/env bash
set -ex
iverilog -s tb -o mel_tb.vvp melody.v tb.v
vvp mel_tb.vvp -fst
python3 wav.py
