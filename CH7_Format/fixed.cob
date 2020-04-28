       IDENTIFICATION DIVISION.
       PROGRAM-ID. fixed.
       AUTHOR. Paul McQuade.
       DATE-WRITTEN. 28th April 2020

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       *> Most programming languages use floating point
       *> calculations which can introduce errors.
       *> COBOL uses fixed point decimal arithmetic
       *> and allows you to define how you will round.
       01 Price PIC 9(4)V99.
       01 TaxRate PIC V999 VALUE .075.
       01 FullPrice PIC 9(4)V99.
        
       PROCEDURE DIVISION.
       DISPLAY "Enter the Price : " WITH NO ADVANCING
       ACCEPT Price
       COMPUTE FullPrice ROUNDED = Price + (Price * TaxRate)
       DISPLAY "Price + Tax : " FullPrice.
        
       STOP RUN.