       IDENTIFICATION DIVISION.
       PROGRAM-ID. stock-app.
      *********************************
      *AUTHOR. MURAT KUÞ.
      *DATE-WRITTEN. 15/06/2023.
      *********************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT ITEM-FILE ASSIGN TO
           "C:\Coding etc\Github Cobol\New folder\itemfile.txt"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS ITEM-CODE.

       DATA DIVISION.
       FILE SECTION.

       FD  ITEM-FILE.
       01  STOCK-ITEMS.
        02 ITEM-NAME PIC X(20).
        02 ITEM-CODE PIC X(5).
        02 ITEM-PRICE PIC $Z(5)9.9(2).

       WORKING-STORAGE SECTION.

       01  CHOISE PIC 9.
       01  STAY-OPEN PIC X VALUE "Y".
       01  ITEM-EXIST PIC X.

       PROCEDURE DIVISION.
       START-PARAG.
       OPEN I-O ITEM-FILE.

           PERFORM UNTIL STAY-OPEN="N"
           DISPLAY " "
           DISPLAY "ITEM RECORDS"
           DISPLAY "1: ADD ITEM"
           DISPLAY "2: DELETE ITEM"
           DISPLAY "3: UPDATE ITEM"
           DISPLAY "4: GET ITEM"
           DISPLAY "0: QUIT"
           DISPLAY "ENTER A NUMBER: " WITH NO ADVANCING
           ACCEPT CHOISE
           EVALUATE CHOISE
               WHEN 1 PERFORM ADD-ITEM
               WHEN 2 PERFORM DELETE-ITEM
               WHEN 3 PERFORM UPDATE-ITEM
               WHEN 4 PERFORM GET-ITEM
               WHEN OTHER MOVE "N" TO STAY-OPEN
           END-EVALUATE
           END-PERFORM.
           CLOSE ITEM-FILE.
           STOP RUN.

       ADD-ITEM.
           DISPLAY " "
           DISPLAY "ENTER ITEM CODE: " WITH NO ADVANCING.
           ACCEPT ITEM-CODE.
           DISPLAY "ENTER ITEM NAME: " WITH NO ADVANCING.
           ACCEPT ITEM-NAME.
           DISPLAY "ENTER ITEM PRICE: " WITH NO ADVANCING.
           ACCEPT ITEM-PRICE.
           DISPLAY " "
           WRITE STOCK-ITEMS
               INVALID KEY DISPLAY "CODE TAKEN"
           END-WRITE.

       DELETE-ITEM.
           DISPLAY " "
           DISPLAY "ENTER ITEM CODE TO DELETE: " WITH NO ADVANCING.
           ACCEPT ITEM-CODE.
           DELETE ITEM-FILE
               INVALID KEY DISPLAY "ITEM CODE DOESN'T EXIST"
           END-DELETE.

       UPDATE-ITEM.
           MOVE "Y" TO ITEM-EXIST.
           DISPLAY " "
           DISPLAY "ENTER ITEM CODE: " WITH NO ADVANCING.
           ACCEPT ITEM-CODE.
           READ ITEM-FILE
               INVALID KEY MOVE "N" TO ITEM-EXIST
           END-READ
           IF ITEM-EXIST="N"
               DISPLAY "ITEM DOESN'T EXIST"
           ELSE
               DISPLAY "ENTER NEW ITEM NAME: " WITH NO ADVANCING
               ACCEPT ITEM-NAME
               DISPLAY "ENTER NEW ITEM PRICE: " WITH NO ADVANCING
               ACCEPT ITEM-PRICE
           END-IF.
           REWRITE STOCK-ITEMS
               INVALID KEY DISPLAY "ITEM DOESN'T UPDATED"
           END-REWRITE.

       GET-ITEM.
           MOVE "Y" TO ITEM-EXIST.
           DISPLAY " "
           DISPLAY "ENTER ITEM CODE TO FIND ITEM: " WITH NO ADVANCING.
           ACCEPT ITEM-CODE.
           READ ITEM-FILE
               INVALID KEY MOVE "N" TO ITEM-EXIST
           END-READ.
           IF ITEM-EXIST="N"
               DISPLAY "ITEM DOESN'T EXIST"
           ELSE
               DISPLAY "ITEM CODE: " ITEM-CODE
               DISPLAY "ITEM NAME: " ITEM-NAME
               DISPLAY "ITEM PRICE: " ITEM-PRICE
           END-IF.
