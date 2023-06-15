# Stock-App
Explanation of the stock-app COBOL program

TL;DR :

The stock-app program is a COBOL program that manages a file of stock items. It allows users to add, delete, update, and get stock items from the file.

Explanation :

The stock-app program is written in COBOL and manages a file of stock items. It allows users to add, delete, update, and get stock items from the file.

The program starts by opening the ITEM-FILE for input and output. It then enters a loop that displays a menu of options to the user and performs the selected action. The loop continues until the user chooses to quit.

The ADD-ITEM subroutine prompts the user for an item code, name, and price, and writes a new record to the ITEM-FILE.

The DELETE-ITEM subroutine prompts the user for an item code and deletes the corresponding record from the ITEM-FILE.

The UPDATE-ITEM subroutine prompts the user for an item code and updates the corresponding record in the ITEM-FILE with a new name and price.

The GET-ITEM subroutine prompts the user for an item code and retrieves the corresponding record from the ITEM-FILE, displaying its code, name, and price.

The program uses COBOL's file handling capabilities to read and write records to the ITEM-FILE. It also uses COBOL's EVALUATE statement to select the appropriate subroutine based on the user's menu choice.
