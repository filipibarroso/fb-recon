#!/bin/bash
for key in $(cat /usr/share/dirb/wordlists/common.txt)
do

        if [ "$2" == "" ]
        then
                get=$1"/"$key
                resposta=$(curl -s -H "User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0" -o /dev/null -w "%{http_code}" $get)

                if [ $resposta == "200" ] || [ $resposta == "301" ]
                        then
                                echo "$site/$key - $resposta"
                        fi
        fi

        if [ "$2" != "" ]
        then
                get=$1"/"$key"."$2
                resposta=$(curl -s -H "User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0" -o /dev/null -w "%{http_code}" $get)
        fi

                if [ $resposta == "200" ] || [ $resposta == "301" ]
                        then
                                echo "$site/$key - $resposta"
                        fi

done
