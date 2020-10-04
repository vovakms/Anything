#!/bin/bash
 
URL=$1;
 
if [ -z "$URL" ]; then
    URL=`/usr/bin/zenity --entry --width=350 --title="Нахождение всех сайтов на одном IP" --text="Пожалуйста, введите адрес сайта или IP:" 2>/dev/null`;
fi
 
DONE="";
  
while read -r IP; do
    echo ""; 
    echo "Получен IP $IP. Ищем сайты на этом адресе:"; 
    iptodomain -i $IP -f $IP -w /tmp/t.txt; 
    echo ""; 
    DONE="1"; 
done < <( dig @8.8.8.8 +short $URL); 
 
if [ -z "$DONE" ]; then
    echo ""; 
    echo "Получен IP $URL. Ищем сайты на этом адресе:"; 
    iptodomain -i $URL -f $URL -w /tmp/t.txt; 
    echo ""; 
fi
