#!/bin/bash

./update identify 7 >> log.txt 2>&1

while :
do
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 > test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin
    printf "0: %.2x" `shuf -i 0-255 -n 1` | xxd -r -g0 >> test.bin

    echo -n `hexdump -ve '1/1 "%.2X"' test.bin` >> log.txt
    echo -e "\n"  >> log.txt
    
    ./update password test.bin
    sleep 0.5
    update_return=`eval "./update identify 7"`
    echo $update_return >> log.txt 2>&1
    if ! `echo $update_return | grep -iq "Password check NG"`; then
       cp test.bin data/`hexdump -ve '1/1 "%.2X"' test.bin`.bin
    fi
done
