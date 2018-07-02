#!/bin/bash
set -e

cd ~/go/bin/

start_func(){
    ./doctl -v compute droplet create \
        openvpn-ready \
        --size 512mb \
        --image 19978391 \
        --region nyc3 \
        --enable-ipv6 \
        --ssh-keys '03:61:9c:f3:bb:09:61:9e:0b:7f:8a:5e:ac:af:05:84, 7a:14:d9:e4:ae:cf:69:ca:2f:be:a6:a1:1d:67:8e:be'
}

stop_func(){
    ./doctl compute droplet delete openvpn-ready
    status_func
}

status_func(){
    ./doctl compute droplet list
}


case $1 in
    start)
        start_func
        ;;
    stop)
        stop_func
        ;;
    status)
        status_func
        ;;
    *)
        printf "Uknown argument"
        ;;
esac
