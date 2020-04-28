       IDENTIFICATION DIVISION.
       PROGRAM-ID. tutorial5.
        
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Ind    PIC 9(1)    VALUE 0.
        
       PROCEDURE DIVISION.
       WhileLoop.
       *> Works like while loop that executes while the index
       *> is greater than 5
              PERFORM OutputData WITH TEST AFTER UNTIL Ind > 5
              *> Jumps to another paragraph
              GO TO ForLoop.
        
       OutputData.
              DISPLAY Ind.
              ADD 1 TO Ind.
        
       *> Perform varying works like a for loop where Ind starts
       *> with a value of 1 defined after FROM and increments by
       *> 1 defined after BY until the condition is met
       ForLoop.
              PERFORM OutputData2 VARYING Ind FROM 1 BY 1 UNTIL Ind=5
              STOP RUN.
        
       OutputData2.
              DISPLAY Ind.