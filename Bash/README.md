# Скрипты bash

# Отправка IP на ящик
  
  Дано: Linux host, IP - динамический
  
  Требуется: узнать IP, для доступа из внешней системы  
  
  Решение:
  
  Для отправки доустанавливаем (для Debian\Ubunntu)
  ````
  sudo apt install mailutils
  ````
  после чего скрипт
  #### ip2mail
  ````
#!/bin/sh

DATETIME=$(date +%Y-%m-%d\ %H:%M:%S)         
IP=$(ip addr list ppp0 | grep '  inet ' | head -n 1 | cut -d ' ' -f 6 | cut -d / -f 1)
IP2=$(ifconfig ppp0| sed -n "2{s/^.*inet \([0-9.]*\).*/\1/;p}")
IP3=$(ip a s ppp0 | grep "inet" | cut -d "/" -f 1 | cut -c 10-)

echo $IP $DATETIME >> /home/historyip.log

echo $IP | mail -s 'ip' ВАШ@ящик.ru
  ````
закидываем в папку /etc/ppp/ip-up.d , чтобы он стартовал при поднятии ppp, если у кого интернет сидит на другом то соответственнно изменяем на свои установки.

Теперь делаем файл исполняемым
````
sudo chmod ugo+x  /etc/ppp/ip-up.d/ip2mail
````
и в самом скрипте указываем свой ящик.
 
  Теперь при каждом включении ( если вдруг было выключение ) или перезагрузке в указанном ящике будет лежать актуальный IP.

  
### Получение IP с ящика

  Теперь на внешней системе, той самой которой требуется наш IP, мы делаем следующее
  
файл mail2ip.sh  
````
#!/bin/sh



````
Теперь в файле /home/received.log всегда будет актуальный IP удаленного хоста




# файл allwebsites.bash

## это уже другая история, сканируем интернет и смотрим какие сайты сидят на каком IP
````

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
````

### 3)
````
#!/bin/sh

i1="185.";# 1-й октед адреса
mkdir -p -- "./katalog/$i1"; # создаем каталог
for i2 in `seq 112 254`; #перебираем 2-й октет 
do
 mkdir -p -- "./katalog/$i1/$i1$i2"; # создаем каталог
 for i3 in `seq 80 254`; #перебираем 3-й октет
 do
  for i4 in `seq 1 254`; #перебираем 4-й октет
  do 
   ip=$i1$i2.$i3.$i4; # формируем адрес
   im=$(dig @84.200.69.80 -x $ip +short); # 
   if [ "$im" != "" ]; then
    echo "$ip $im" >> katalog/$i1/$i1$i2/$i1$i2.$i3.txt
   fi
   echo "$ip $im"
  done 
 done
done
````
