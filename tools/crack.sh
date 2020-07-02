#!/bin/bash
./update identify 7 >> log.txt 2>&1

count=0
for ((a = 0; a < 256; a++))
do
    for ((b = 0; b < 256; b++))
    do
        for ((c = 0; c < 256; c++))
        do
            for ((d = 0; d < 256; d++))
            do
                for ((e = 0; e < 256; e++))
                do
                    for ((f = 0; f < 256; f++))
                    do
                        for ((g = 0; g < 256; g++))
                        do
                            for ((h = 0; h < 256; h++))
                            do
                                for ((i = 0; i < 256; i++))
                                do
                                    for ((j = 0; j < 256; j++))
                                    do
                                        for ((k = 0; k < 256; k++))
                                         do
                                            for ((l = 0; l < 256; l++))
                                            do
                                                for ((m = 0; m < 256; m++))
                                                do
                                                    for ((n = 0; n < 256; n++))
                                                    do
                                                        for ((o = 0; o < 256; o++))
                                                        do
                                                            for ((p = 0; p < 256; p++))
                                                            do
                                                                count=count+1
                                                                printf "0: %.2x" $a | xxd -r -g0 > test.bin
                                                                printf "0: %.2x" $b | xxd -r -g0 >> test.bin
                                                                printf "0: %.2x" $c | xxd -r -g0 >> test.bin
                                                                printf "0: %.2x" $d | xxd -r -g0 >> test.bin
                                                                printf "0: %.2x" $e | xxd -r -g0 >> test.bin
                                                                printf "0: %.2x" $f | xxd -r -g0 >> test.bin
                                                                printf "0: %.2x" $g | xxd -r -g0 >> test.bin
                                                                printf "0: %.2x" $h | xxd -r -g0 >> test.bin
                                                                printf "0: %.2x" $i | xxd -r -g0 >> test.bin
                                                                printf "0: %.2x" $j | xxd -r -g0 >> test.bin
                                                                printf "0: %.2x" $k | xxd -r -g0 >> test.bin
                                                                printf "0: %.2x" $l | xxd -r -g0 >> test.bin
                                                                printf "0: %.2x" $m | xxd -r -g0 >> test.bin
                                                                printf "0: %.2x" $n | xxd -r -g0 >> test.bin
                                                                printf "0: %.2x" $o | xxd -r -g0 >> test.bin
                                                                printf "0: %.2x" $p | xxd -r -g0 >> test.bin
                                                                
                                                                hexdump test.bin >> log.txt 2>&1
                                                                
                                                                ./update password test.bin
                                                                sleep 0.5
                                                                update_return=`eval "./update identify 7"`
                                                                echo $update_return >> log.txt 2>&1
                                                                if ! `echo $update_return | grep -iq "Password check NG"`; then
                                                                   cp test.bin data/$count.bin
                                                                fi
                                                            done
                                                        done
                                                    done
                                                done
                                            done
                                        done
                                    done
                                done
                            done
                        done
                    done
                done
            done
        done
    done
done
