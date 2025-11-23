#!/bin/bash

# Konfigurasi
WALLET="RXnG5hr5Qz5SjUZwdgee7X7pE4gFBYUmjYHBGRRL7X635pUnj3gavU145j0/nba4cru"
WORKER="modalGPU01"
POOL="pool.ryo-currency.com:3333"
# Update system
sudo apt update -y
sudo apt install -y git build-essential cmake automake libtool autoconf

# Clone miner RYO (panthera)
git clone https://github.com/ryo-currency/cpuminer-ryo.git
cd cpuminer-ryo

# Build miner
mkdir build
cd build
cmake ..
make -j$(nproc)
# Jalankan miner
./cpuminer -a panthera -o stratum+tcp://$POOL -u $WALLET.$WORKER -p x
