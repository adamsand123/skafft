#!/bin/bash

# FUNKTION - SKRIV UT BANNER
print_banner() {
	echo "#"
}

# FUNKTION - MENY
print_menu() {
	echo -e "group:add\t\tCreate a new user"
	echo -e "group:list\t\tList system groups"
	echo -e "group:view\t\tList user associations for group"
	echo -e "group:modify\t\tModify user associations for group"
	echo -e "user:add\t\tCreate a new user"
	echo -e "user:list\t\tList system user"
	echo -e "user:view\t\tView user properties"
	echo -e "user:modify\t\tModify user properties"
	echo -e "folder:add\t\tCreate a new folder"
	echo -e "folder:list\t\tList folder contents"
	echo -e "folder:view\t\tView folder properties"
	echo -e "folder:modify\t\tModify folder properties"
}

# FUNKTION - user input
get_input() {
	echo -n "_"	# gör blinkande
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


	if [ $(echo $val | grep :) -eq 1 ]; then # Felkontroll, endast ett ':'

		# Dela upp input i två variabler separerade med delimiter ':'
		opt1=$(echo $val | cut -d: -f1)
		opt2=$(echo $val | cut -d: -f2)


		# If-sats: kollar om opt1 är en substräng till group, user, eller folder (till exakt en av strängarna)
		if [ $(echo -e "group\nuser\nfolder" | grep ^$opt1 | wc -l) -eq 1 ]; then
			opt1=$(echo -e "group\nuser\nfolder" | grep ^$opt1) # Sätter opt1 till det val som matchades från input

		# ---------- FELKONTROLL OM FLERA MÖJLIGA MATCHNINGAR (BEHÖVS EJ FÖR DE HÄR VALEN) -------------
		elif [ $(echo -e "group\nuser\nfolder" | grep ^$opt1 | wc -l) -gt 1 ]; then # OM flera matchningar
			echo -e "ERROR: ambiguous command, possibilities:\n$(echo -e "group\nuser\nfolder" | grep ^$opt1)"

		else # OM ingen matchning
			echo "Please enter a valid option"	# skriv ut hjälp meny?
		fi

		# If-sats: kollar om opt2 är en substräng till add, list, view, eller modify (till exakt en av strängarna)
		if [ $(echo -e "add\nlist\nview\nmodify" | grep ^$opt2 | wc -l) -eq 1 ]; then
			opt2=$(echo -e "add\nlist\nview\nmodify" | grep $opt2) # Sätter opt2 till det val som matchades från input

		# ---------- FELKONTROLL OM FLERA MÖJLIGA MATCHNINGAR (BEHÖVS EJ FÖR DE HÄR VALEN) -------------
		elif [ $(echo -e "add\nlist\nview\nmodify" | grep ^$opt2 | wc -l) -gt 1 ]; then # OM flera matchningar
			echo -e "ERROR: ambiguous command, possibilities:\n$(echo -e "add\nlist\nview\nmodify" | grep ^$opt2)"

		else
			echo "Please enter a valid option"	# skriv ut hjälp meny?
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
		echo "INVALID SYNTAX: $val"
	fi
}

# FUNKTION - MAIN
main() {
	# kalla på banner funktion
	print_banner

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
