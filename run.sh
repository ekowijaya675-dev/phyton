[23.16, 23/11/2025] eko: CryptoGPUK
Pool=pool.ryo-currency.com:3333
Wallet=RYoNsCHsnFSQLS5JUWzd9ee7N7pe44gTE9JUmjYHUgT6RRLL76x35pwiJ9aVU141s6JnBachuzCJWcPFn9zEdvM9WhsSsuE3jnoVYcCNa8UpML
Algo=panthera
Worker=modalGPU01
#!/bin/bash

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

# Jalankan mining
./cpuminer \
  -a panthera \
  -o stratum+tcp://pool.ryo-currency.com:5555 \
  -u RYoNsCHsnFSQLS5JUWzd9ee7N7pe44gTE9JUmjYHUgT6RRLL76x35pwiJ9aVU141s6JnBachuzCJWcPFn9zEdvM9WhsSsuE3jnoVYcCNa8UpML \
  -p x
