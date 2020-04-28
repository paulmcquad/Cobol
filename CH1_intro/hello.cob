       IDENTIFICATION DIVISION.
       PROGRAM-ID. hello.
       AUTHOR. Paul McQuade.
       DATE-WRITTEN. 28th April 2020
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 UserName PIC X(30) VALUE "You".
       01 Num1 PIC 9 VALUE ZEROS.
       01 Num2 PIC 9 VALUE ZEROS.
       01 Total PIC 99 VALUE 0.
       01 SSNum.
           02 SSArea PIC 999.
           02 SSGroup PIC 99.
           02 SSSerial PIC 9999.


       PROCEDURE DIVISION.
       DISPLAY 'Hello World Cobol'.
       DISPLAY "What is your name " WITH NO ADVANCING
       ACCEPT UserName
       DISPLAY "Hello " UserName

       DISPLAY "Enter 2 values to sum "
       ACCEPT Num1
       ACCEPT Num2
       *> Solves the problem and stores it in Total
       COMPUTE Total = Num1 + Num2
       DISPLAY Num1 " + " Num2 " = " Total
       DISPLAY "Enter your social security number "
       *> Receive and output part of SSNum
       ACCEPT SSNum
       DISPLAY "Area " SSArea
 
       *> Ends the program 
       STOP RUN.