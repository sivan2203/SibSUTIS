#!/usr/bin/env bash

#	6. Написать скрипт, анализирующий параметры командной строки. Параметры должны
#	быть следующие: -f файл, -c, -r. При анализе опций должны быть установлены
#	переменные: FILE, COMPIL, RUN. После анализа опций выполнить следующие
#	действия: если определена переменная FILE и такой файл существует, то выдать его
#	содержимое на экран. Если переменная не определена, то в качестве имени файла
#	использовать .bashrc. Если определена переменная COMPIL и определена переменная
#	FILE, то откомпилировать указанный файл. Если результат компиляции положительный,
#	то, если определена переменная RUN, исполнить откомпилированный файл.

while getopts rcf: OPTION ; do
	case $OPTION in
	f)
		if [ -n "${OPTARG}" ] ; then
			FILE=${OPTARG}
		fi
		
		if [ -e $FILE ] ; then
			cat $FILE 
		else 
			FILE=".bashrc"
			cat $FILE
		fi
		;;
	c)
		COMPIL=$FILE".out"
		gcc -Wall $FILE -o $COMPIL
		;;
	r)
		if [ -x $COMPIL ] ; then
			./$COMPIL
		fi
		;;
	esac
done	
