#!/usr/bin/env bash

#	10. Разработать скрипт, выполняющий следующие действия:
#		‒ копирование содержимого первого файла во второй. Имена файлов задаются как
#		аргументы командной строки;
#		‒ вывод списка всех пользователей в системе в файл, имя которого задается как третий
#		аргумент командной строки.


cat $1 >> $2
cut -d: -f1 /etc/passwd > $3


#cut -d: -f1 /etc/passwd
#cat /etc/passwd | sed 's/\:.*//'
