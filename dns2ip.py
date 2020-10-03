#!/usr/bin/python
# -*- coding: utf-8 -*-

import os # библиотека для работы с системными вызовами и консолью
import re # библиотека для работы с регулярными выражениями

name_host = raw_input("Введите имя сайта: ") # вводим с клавиатуры 

spis_p = os.popen("host " + name_host ) # как бы в консоли выполняем команду host, результат помещаем 
reg_ip = re.compile(r"([\d]+)\.([\d]+)\.([\d]+)\.([\d]+)")

for line in spis_p.readlines(): # перебираем весь массив результата от команды host
  hst = reg_ip.search(line)
  if (hst != None):
    break

adr_host = hst.group(0) # берем из всего массива первый адрес

print name_host + " - " + adr_host # показываем имя сайта и адрес на каком сервере он хостится
