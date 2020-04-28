       IDENTIFICATION DIVISION.
       PROGRAM-ID. math.
       AUTHOR. Paul McQuade.
       DATE-WRITTEN. 28th April 2020
       DATA DIVISION.
        
       WORKING-STORAGE SECTION.
       *> Defines an alphanumeric type 10 spaces long
       *> with the default value of "Stuff" (System Defined Max Length)
       *> The Picture Clause is where we define the 
       *> data type and size (COBOL isn't a typed language)
       *> X means any type of character on your keyboard
       01 SampleData PIC X(10) VALUE "Stuff".
        
       *> Only letters and spaces are allowed
       01 JustLetters PIC AAA VALUE "ABC".
        
       *> 4 of numbers from 0 to 9 (31 max values)
       01 JustNums PIC 9(4) VALUE 1234.
        
       *> Signed number
       01 SignedInt PIC S9(4) VALUE -1234.
        
       *> 4 digit decimal with 2 decimal places
       01 PayCheck PIC 9(4)V99 VALUE ZEROS.
        
       *> A Group Item is a collection of values
       *> They are structured using level numbers
       *> where the highest number is lowest 
       *> in the hierarchy (01 - 49)
       01 Customer.
              02 Ident    PIC 9(3).
              02 CustName PIC X(20).
              02 DateOfBirth.
                  03 MOB  PIC 99.
                  03 DOB  PIC 99.
                  03 YOB  PIC 9(4).
        
       01 Num1 PIC 9 VALUE 5.
       01 Num2 PIC 9 VALUE 4.
       01 Num3 PIC 9 VALUE 3.
       01 Ans PIC S99V99 VALUE 0.
       01 Rem PIC 9V99.
        
       PROCEDURE DIVISION.
       *> MOVE is used to assign values
       MOVE "More Stuff" TO SampleData
       MOVE "123" TO SampleData
       *> You can assign numerics to alphanumerics
       *> because typing isn't enforced
       MOVE 123 TO SampleData
       DISPLAY SampleData
       DISPLAY PayCheck
       *> Entering data this way requires additonal
       *> filled spaces
       MOVE "123Bob Smith           12211974" TO Customer
       DISPLAY CustName 
       DISPLAY MOB "/" DOB "/" YOB
        
       *> Figurative Constants
       *> Zero in every space
       MOVE ZERO TO SampleData
       DISPLAY SampleData
       *> Space in every space
       MOVE SPACE TO SampleData
       DISPLAY SampleData
       *> Question mark in every space
       MOVE HIGH-VALUE TO SampleData
       DISPLAY SampleData
       *> Space in every space
       MOVE LOW-VALUE TO SampleData
       DISPLAY SampleData
       *> Quote in every space
       MOVE QUOTE TO SampleData
       DISPLAY SampleData
       *> Defined value in every space
       MOVE ALL "2" TO SampleData
       DISPLAY SampleData
        
       *> Math
        
       *> Add Num1 to Num2 and store in Ans
       ADD Num1 TO Num2 GIVING Ans
       SUBTRACT Num1 FROM Num2 GIVING Ans
       MULTIPLY Num1 BY Num2 GIVING Ans
       DIVIDE Num1 INTO Num2 GIVING Ans
       *> You can get quotient and remainder separately
       DIVIDE Num2 INTO Num1 GIVING Ans REMAINDER Rem
       DISPLAY "Remainder " Rem
        
       *> Using more then 2 variables
       ADD Num1, Num2 TO Num3 GIVING Ans
       ADD Num1, Num2, Num3 GIVING Ans
       DISPLAY Ans
        
       *> Can also use COMPUTE
       COMPUTE Ans = Num1 + Num2
       COMPUTE Ans = Num1 - Num2
       COMPUTE Ans = Num1 * Num2
       COMPUTE Ans = Num1 / Num2
       DISPLAY Ans
       *> 5 to the power of 2
       COMPUTE Ans = Num1 ** 2
       DISPLAY Ans
        
       *> Using parentheses
       COMPUTE Ans = (3 + 5) * 5
       DISPLAY Ans
       COMPUTE Ans = 3 + 5 * 5
       DISPLAY Ans
        
       *> You can round output
       COMPUTE Ans ROUNDED = 3.0 + 2.005
       DISPLAY Ans
        
       STOP RUN.