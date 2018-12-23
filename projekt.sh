#!/bin/bash

# FUNKTION - dependencies
check_dependencies() {


#	which lolcat &>/dev/null
#	if [ $? -eq 1 ]; then
#	fi


	Packages=('lolcat' 'figlet' 'cowsay')

	for PACKAGE in ${Packages[*]}; do
		which $PACKAGE &>/dev/null
		if [ $? -eq 1 ]; then
			echo -e "\t=[ \e[93mmissing dependencies $PACKAGE\e[0m\t]"
		fi
	done
}

# FUNKTION - SKRIV UT BANNER
print_banner() {
	echo "Adam"
	echo "Jesse"
}
# FUNKTION - MANUELL BANNER
pretty_banner() {
	echo "###############################################"
}

# FUNKTION - skirv ut version info
print_version() {
	echo -e "\n\t=[ \e[93msysmod38 v0.1.disco-dev \e[0m\t]"
}

# FUNKTION - MENY
print_menu() {
	echo -e "\e[1;35;92m" ###### ------------- ÄNDRAR FÄRG FÖR TEXT


	# --------- TO DO SÄTT ALLA PRINT PÅ SAMMA RAD MED \n


	echo -e "group:add\t\tCreate a new user\ngroup:list\t\tList system groups\ngroup:view\t\tList user associations for group\ngroup:modify\t\tModify user associations for group\nuser:add\t\tCreate a new user\nuser:list\t\tList system user\nuser:view\t\tView user properties\nuser:modify\t\tModify user properties\nfolder:add\t\tCreate a new folder\nfolder:list\t\tList folder contents\nfolder:view\t\tView folder properties\nfolder:modify\t\tModify folder properties"
}

# FUNKTION - Kolla om figlet och lolcat är installerat
verify_packages() {
	which figlet &>/dev/null && which lolcat &>/dev/null
	if [ $? -eq 0 ]; then
		print_banner | figlet | lolcat -a -s 20 -d 3 -F 1
		print_version
	else
		pretty_banner
		print_version
	fi
}

# FUNKTION - user input
get_input() {
	echo -ne "\e[4msysmod38\e[0m > "	# gör blinkande
	read val
}

# FUNKTION - process input
process_input() {
#	# ------------ LÄGG TILL FUNKTION FÖR '?' -----------------
#	while [ $(echo $val | grep -o '.$') = '?' ]; do
#		echo "funkar?"
#		if [ -z $(echo $val | cut -d: -f2) ]; then # Kolla om andra delen av input (efter : ) är tom isåfall skriv ut alternativ för del 1
#			echo "Second part empty"
#		else # Om andra delen inte är tom skriv ut alternativ för del 2
#			echo "Second part not empty"
#		fi
#		get_input
#	done


	if [ $(echo $val | grep : | wc -l) -eq 1 ]; then # Felkontroll, endast ett ':'

		# Dela upp input i två variabler separerade med delimiter ':'
		opt1=$(echo $val | cut -d: -f1)
		opt2=$(echo $val | cut -d: -f2)


		# If-sats: kollar om opt1 är en substräng till group, user, eller folder (till exakt en av strängarna)
		if [ $(echo -e "group\nuser\nfolder" | grep ^$opt1 | wc -l) -eq 1 ]; then
			opt1=$(echo -e "group\nuser\nfolder" | grep ^$opt1) # Sätter opt1 till det val som matchades från input

		# ---------- FELKONTROLL OM FLERA MÖJLIGA MATCHNINGAR (BEHÖVS EJ FÖR DE HÄR VALEN) -------------
		elif [ $(echo -e "group\nuser\nfolder" | grep ^$opt1 | wc -l) -gt 1 ]; then # OM flera matchningar
			echo -e "ERROR: ambiguous command, possibilities:\n$(echo -e "group\nuser\nfolder" | grep ^$opt1)"



######### ------------------ FEL HÄR SKRIVER UT TVÅ FELMEDDELANDEN OM 


		else # OM ingen matchning
			which cowsay &>/dev/null
			if [ $? -eq 0 ]; then
				cowsay "Please enter a valid option for the first argument" | lolcat -F 1 -a -s 150
			else
				echo "Please enter a valid option for the first argument"	# skriv ut hjälp meny?
			fi

		fi

		# If-sats: kollar om opt2 är en substräng till add, list, view, eller modify (till exakt en av strängarna)
		if [ $(echo -e "add\nlist\nview\nmodify" | grep ^$opt2 | wc -l) -eq 1 ]; then
			opt2=$(echo -e "add\nlist\nview\nmodify" | grep $opt2) # Sätter opt2 till det val som matchades från input

		# ---------- FELKONTROLL OM FLERA MÖJLIGA MATCHNINGAR (BEHÖVS EJ FÖR DE HÄR VALEN) -------------
		elif [ $(echo -e "add\nlist\nview\nmodify" | grep ^$opt2 | wc -l) -gt 1 ]; then # OM flera matchningar
			echo -e "ERROR: ambiguous command, possibilities:\n$(echo -e "add\nlist\nview\nmodify" | grep ^$opt2)"




######### ------------------ FEL HÄR SKRIVER UT TVÅ FELMEDDELANDEN OM 



		else
			which cowsay &>/dev/null
			if [ $? -eq 0 ]; then
				cowsay "Please enter a valid option for the second argument" | lolcat -F 1 -a -s 150
			else
				echo "Please enter a valid option for the second argument"	# skriv ut hjälp meny?
			fi
		fi

		# Hitta användarens val mha opt1 och opt2 och kalla på rätt funktion
		if [ $opt1 = "group" ]; then # Group
			if [ $opt2 = "add" ]; then # Add group
				# Kalla på funktion för att skapa en ny grupp
				echo "group:add" # Bash ger error utan något här inne
			elif [ $opt2 = "list" ]; then # List groups
				# Kalla på funktion för att lista alla grupper
				echo "group:list" # Bash ger error utan något här inne
			elif [ $opt2 = "view" ]; then # View groups
				# Kalla på funktion för att visa (rättigheter?) på en grupp
				echo "group:view" # Bash ger error utan något här inne
			else # Modify group
				echo "group:mod" # Bash ger error utan något här inne
			fi
		elif [ $opt1 = "user" ]; then # User
			if [ $opt2 = "add" ]; then # Add user
				# Kalla på funktion för att skapa användare
				echo "user:add" # Bash ger error utan något här inne
			elif [ $opt2 = "list" ]; then # List users
				# Kalla på funktion för att lista alla användare
				echo "user:list" # Bash ger error utan något här inne
			elif [ $opt2 = "view" ]; then # View users
				# Kalla på funktion för att se information om en användare
				echo "user:view" # Bash ger error utan något här inne
			else # Modify user
				# Kalla på funktion för att modifiera en användare
				echo "user:mod" # Bash ger error utan något här inne
			fi
		else # Folder
			if [ $opt2 = "add" ]; then # Add folder
				# Kalla på funktion för att skapa en folder
				echo "folder:add" # Bash ger error utan något här inne
			elif [ $opt2 = "list" ]; then # List folders
				# Kalla på funktion för att lista folders
				echo "folder:list" # Bash ger error utan något här inne
			elif [ $opt2 = "view" ]; then # View folders
				# Kalla på funktion för att (lista innehållet i / visa rättigheter ???) för en folder
				echo "folder:view" # Bash ger error utan något här inne
			else # Modify folders
				# Kalla på funktion för att modifiera en folder (ändra ägare / rättigheter???)
				echo "folder:mod" # Bash ger error utan något här inne
			fi
		fi
	else
		which cowsay &>/dev/null
		if [ $? -eq 0 ]; then
			cowsay Please enter a valid option | lolcat -a -s 100 -F 1
		else	
			echo "INVALID SYNTAX: $val"
		fi
	fi
}

# FUNKTION - MAIN
main() {
	clear
	# BANNER
	verify_packages
	check_dependencies
	# while loop tills avsluta
	while true; do
		# Skriv ut meny
		print_menu
		# Hämta menyval
		get_input
		# Processera menyval
		process_input
	done
}

main
