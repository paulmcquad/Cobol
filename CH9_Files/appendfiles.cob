       IDENTIFICATION DIVISION.
       PROGRAM-ID. appendfiles.
       AUTHOR. Paul McQuade.
       DATE-WRITTEN. 28th April 2020.
        
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
              SELECT CustomerFile ASSIGN TO "Customer.dat"
                  ORGANIZATION IS LINE SEQUENTIAL
                  ACCESS IS SEQUENTIAL.
        
       DATA DIVISION.
       FILE SECTION.
       FD CustomerFile.
       01 CustomerData.
              02 IDNum    PIC 9(8).
              02 CustName.
                  03 FirstName    PIC X(15).
                  03 LastName     PIC X(15).
        
       WORKING-STORAGE SECTION.
       01 WSCustomer.
              02 WSIDNum    PIC 9(5).
              02 WSCustName.
                  03 WSFirstName    PIC X(15).
                  03 WSLastName     PIC X(15).
        
       PROCEDURE DIVISION.
       *> Extend adds new data to the end of the file
       OPEN EXTEND CustomerFile.
              DISPLAY "Customer ID " WITH NO ADVANCING
              ACCEPT IDNum.
              DISPLAY "Customer First Name " WITH NO ADVANCING
              ACCEPT FirstName.
              DISPLAY "Customer Last Name " WITH NO ADVANCING
              ACCEPT LastName.
              WRITE CustomerData
              END-WRITE.
           CLOSE CustomerFile.
           *> Enter customers using ascending keys for later example
       STOP RUN.