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
	# Dela upp input i två variabler separerade med delimiter ':'
	opt1=$(echo $val | cut -d: -f1)
	opt2=$(echo $val | cut -d: -f2)

	# ------------ LÄGG TILL FUNKTION FÖR '?' -----------------

	# If-sats: kollar om opt1 är en substräng till group, user, eller folder (till exakt en av strängarna)
	if [ $(echo -e "group\nuser\nfolder" | grep $opt1 | wc -l) = 1 ]; then
		opt1=$(echo -e "group\nuser\nfolder" | grep $opt1) # Sätter opt1 till det val som matchades från input
	# Om 0 eller fler än 1 matchningar med input skriv ut felmeddelande
	else
		echo "Please enter a valid option"	# skriv ut hjälp meny?
	fi

	# If-sats: kollar om opt2 är en substräng till add, list, view, eller modify (till exakt en av strängarna)
	if [ $(echo -e "add\nlist\nview\nmodify" | grep $opt2 | wc -l) = 1 ]; then
		opt2=$(echo -e "add\nlist\nview\nmodify" | grep $opt2) # Sätter opt2 till det val som matchades från input
	else
		echo "Please enter a valid option"	# skriv ut hjälp meny?
	fi

	# Hitta användarens val mha opt1 och opt2 och kalla på rätt funktion
	if [ $opt1 = "group" ]; then # Group
		if [ $opt2 = "add" ]; then # Add group
			# Kalla på funktion för att skapa en ny grupp
		elif [ $opt2 = "list" ]; then # List groups
			# Kalla på funktion för att lista alla grupper
		elif [ $opt2 = "view" ]; then # View groups
			# Kalla på funktion för att visa (rättigheter?) på en grupp
		else # Modify group
		fi
	elif [ $opt1 = "user" ]; then # User
		if [ $opt2 = "add" ]; then # Add user
			# Kalla på funktion för att skapa användare
		elif [ $opt2 = "list" ]; then # List users
			# Kalla på funktion för att lista alla användare
		elif [ $opt2 = "view" ]; then # View users
			# Kalla på funktion för att se information om en användare
		else # Modify user
			# Kalla på funktion för att modifiera en användare
		fi
	else # Folder
		if [ $opt2 = "add" ]; then # Add folder
			# Kalla på funktion för att skapa en folder
		elif [ $opt2 = "list" ]; then # List folders
			# Kalla på funktion för att lista folders
		elif [ $opt2 = "view" ]; then # View folders
			# Kalla på funktion för att (lista innehållet i / visa rättigheter ???) för en folder
		else # Modify folders
			# Kalla på funktion för att modifiera en folder (ändra ägare / rättigheter???)
		fi
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
