#!/bin/bash

source=snabb-esp-raw-Intel-Xeon-E5-1650.dat

gnuplot <<EOF
set terminal pngcairo \
size 1200,480 font 'Lato,18' lw 1.8 crop
set output 'snabb-esp-raw.png'
set key outside
set xlabel "Plaintext packet size (bytes)"
set xtics (64, 256, 512, 1024, 1500, 2048)
set ylabel "Throughput (Gbps)"
set grid

plot "$source" using 1:2 title "encapsulate" \
     smooth csplines lw 3 lt rgb "#cd3000", \
     "$source" using 1:4 title "decapsulate" \
     smooth csplines lw 3 lt rgb "#0074cd"

#     "$source" using 1:2:3 title "" \
#     with yerrorbars lw 1 lt rgb "#cd3000", \
#     "$source" using 1:4:5 title "" \
#     with yerrorbars lw 1 lt rgb "#0074cd"
EOF
