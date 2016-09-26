#!/bin/bash
set -e

cd ~/go/bin/
./doctl compute droplet create \
    opevpn-ready \
    --size 512mb \
    --image 13226822 \
    --region nyc3 \
    --ssh-keys 03:61:9c:f3:bb:09:61:9e:0b:7f:8a:5e:ac:af:05:84
