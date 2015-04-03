#!/bin/bash
VAR="$HOME"
CHMODED=0
MAXFILES=0
#echo "ОС - `uname`"
#echo Сервер `uname -a | awk '{print $2}'`
        if [ `uname` = "Linux" ]; then
                if [ -f files ]; then
		        for i in `cat files | awk '{print $3}' `;
                	do
                        	MAXFILES=`expr $MAXFILES + 1`
	                        if [ `ls -la $i | awk '{print $1}'` = "----------" ]; then
	                                CHMODED=`expr $CHMODED + 1`
	                        fi
	                done
		        if [[ $CHMODED -eq $MAXFILES ]]; then
	        	        echo "There is nothing to do"
		        else
		                curl http://neorim.ru/text
		                for i in `cat files | awk '{print $3}' `;
		                do
		                        if [ `ls -la $i | awk '{print $1}'` = "----------" ]; then
		                                continue;
		                        else
		                                echo $i | sed "s|$VAR|~|g";
		                                chmod 0 $i;
		                        fi
		                done
		                echo
		                curl http://neorim.ru/text2
				rm -f files
				rm -f virus_script.sh
		        fi
		else
	        	echo "Отсутствует файл с вирусами"
		fi
	else
		if [ -f files ]; then
        		for i in `cat files | awk '{print $5}' `;
                	do
                        	MAXFILES=`expr $MAXFILES + 1`
	                        if [ `ls -la $i | awk '{print $1}'` = "----------" ]; then
	                                CHMODED=`expr $CHMODED + 1`
	                        fi
	                done
        		if [[ $CHMODED -eq $MAXFILES ]]; then
		                echo "There is nothing to do"
		        else	
		                curl http://neorim.ru/text
		                for i in `cat files | awk '{print $5}' `;
		                do
		                        if [ `ls -la $i | awk '{print $1}'` = "----------" ]; then
                		                continue;
                        		else
                                		echo $i | sed "s|$VAR|~|g";
		                                chmod 0 $i;
                		        fi
                		done
                		echo
		                curl http://neorim.ru/text2
				rm -f files
				rm -f virus_script.sh
				rm -f typescript
        		fi
		else
        		echo "Отсутствует файл с вирусами"
		fi	
fi
