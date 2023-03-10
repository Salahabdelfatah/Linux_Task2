# ============ General Functions =====================
# General Instructions
  mainmenu () {
        # User Choices
        echo "Press i to add new contact"
        echo "Press v to view all contacts"
        echo "Press s to search for record"
        echo "Press e to delete all contacts"
        echo "Press d to delete one contact"
        echo "Press q to exit" 

        # Read enter letter choice from user to select opreation needed
        read -p "Enter your choice: " userinput
}

# Call Main Menu Function 
mainmenu

# ask user to go to main menu or exit 
userchoice () {

        # check user choice to return to main menu or exit

        read -p  "to return to main menu press m, or press q for exit: " userinput
        if [ $userinput = m ]
        then
                ./task.sh

        # exit from script
        elif [ $userinput = q  ]
        then
                exit
        fi
}
# ============ End General Functions =====================

# ============ 1- Add Contact to database =====================
# 1- asking user to enter contact details and store it in database file
        if [ $userinput = i ]
        then
                echo "Please Enter your First Name, Last Name, Email, Phone Number ..!"

                # Let user enter there details 
                addcontact () {
                # read user contact details
                read -r  -p "Enter your First Name: " fname
                read -r  -p "Enter your Last Name: " lname
                read -r  -p "Enter your Email: " email
                read -r  -p "Enter your Phone Number: " pnumber

                echo "$fname" "$lname" "$email" "$pnumber" >> database.txt

                echo "Your contact has been saved..."

                # check user choice to return to main menu or exit
                userchoice
}

# Call Add Contact Function
addcontact

# ============ END Add Contact to database =====================

# ============ 2-  Shows all contacts with all info ================
#  shows all contacts with all info
        elif [ $userinput = v ]
        then
                cat database.txt
        
                # check user choice to return to main menu or exit
                userchoice

# ============  END Shows all contacts with all info ===========

# ============  3- enter anything related to your search ===========
#  enter anything related to your search
        elif [ $userinput = s ]
        then
                # Read user input search query keyword 
                read -r -p "Enter your search keyword: " searchquery

                # Search result for keyword  
                grep -r -n $searchquery database.txt

                # check user choice to return to main menu or exit
                userchoice

# ============ END enter anything related to your search ===========


# ============ 4- Delete all records ===========
# delete all records
        elif [ $userinput = e ]
        then
                # delete all records 
                > database.txt

                # check user choice to return to main menu or exit
                userchoice                

# ======= END Delete all records ===========

# ======= 5- Delete record related to search entry ===========
# delete record related to search entry
        elif [ $userinput = d ]
        then
                # Read user input search query keyword 
                        read -r -p "Enter your search keyword to delete related record: " searchquery

                # Search result for keyword and delete related record 
                grep -v $searchquery  database.txt > tmpfile && mv tmpfile database.txt

                # check user choice to return to main menu or exit
                userchoice        

# ======= END Delete record related to search entry ===========


#terminate script
        elif [ $userinput = q  ]
        then
                exit
        fi
