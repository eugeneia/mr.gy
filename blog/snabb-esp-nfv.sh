#!/bin/bash

source=snabb-esp-nfv-Intel-Xeon-E5-1650.dat

gnuplot <<EOF
set terminal pngcairo \
size 1200,480 font 'Lato,18' lw 1.8 crop
set output 'snabb-esp-nfv.png'
set key outside
set xlabel "Plaintext packet size (bytes)"
set xtics (64, 256, 512, 1024, 1500)
set ylabel "Throughput (Gbps)"
set grid

plot "$source" using 1:2 title "ESP Transport" \
     smooth csplines lw 3 lt rgb "#cd3000", \
     "$source" using 1:3 title "Plain" \
     smooth csplines lw 3 lt rgb "#cdcdcd", \
     "$source" using 1:4 title "Raw encap+decap" \
     smooth csplines lw 3 lt rgb "#ffcccc" dashtype 2
EOF
