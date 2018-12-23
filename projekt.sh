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

# FUNKTION - MAIN
main() {
	# kalla på banner funktion
	print_banner

	# while loop tills avsluta
	while true; do
		# Skriv ut meny
		print_menu

	done

}

main
