       IDENTIFICATION DIVISION.
       PROGRAM-ID. sampledata.
       AUTHOR. Paul McQuade.
       DATE-WRITTEN. 28th April 2020
        
       *> Define a custom data classification
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
              CLASS PassingScore IS "A" THRU "C", "D".
        
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Age PIC 99 VALUE 0.
       01 Grade PIC 99 VALUE 0.
       01 Score PIC X(1) VALUE "B".
        
       01 CanVoteFlag PIC 9 VALUE 0.
              88 CanVote VALUE 1.
              88 CantVote VALUE 0.
        
       *> Used to demonstrate evaluate
       01 TestNumber  PIC X.
              *> Level 88 designates multiple values
              88  IsPrime     VALUE   "1", "3", "5", "7".
              88  IsOdd       VALUE   "1", "3", "5", "7", "9".
              88  IsEven      VALUE   "2", "4", "6", "8".
              88  LessThan5   VALUE   "1" THRU "4".
              88  ANumber     VALUE   "0" THRU "9".
        
       PROCEDURE DIVISION.
        
       *> If Conditional
       DISPLAY "Enter Age : " WITH NO ADVANCING
       ACCEPT Age
       IF Age > 18 THEN
              DISPLAY "You can vote"
       ELSE
              DISPLAY "You can't vote"
       END-IF
        
       *> Logical and Conditional Operators
       *> ELSE IF statements are to be avoided
       *> < or LESS THAN
       *> > or GREATER THAN
       *> = or EQUAL TO
       *> NOT EQUAL TO
       IF Age LESS THAN 5 THEN
              DISPLAY "Stay Home"
       END-IF
       IF Age = 5 THEN
              DISPLAY "Go to Kindergarten"
       END-IF
       *> You can also use OR instead of AND
       IF Age > 5 AND Age < 18 THEN
              COMPUTE Grade = Age - 5
              DISPLAY "Go to Grade " Grade
       END-IF
       *> <= or LESS THAN OR EQUAL TO
       IF Age GREATER THAN OR EQUAL TO 18 
              DISPLAY "Go to college"
       END-IF
        
       *> You can verify values fit a classification
       IF Score IS PassingScore THEN
              DISPLAY "You Passed"
       ELSE
              DISPLAY "You Failed"
       END-IF
        
       *> There are built in classifications
       *> NUMERIC, ALPHABETIC, ALPHABETIC-LOWER
       *> ALPHABETIC-UPPER
       IF Score IS NOT NUMERIC THEN
              DISPLAY "Not a Number"
       END-IF
        
       *> Use set to toggle values to true or false 
       IF Age > 18 THEN
              SET CanVote TO true
       ELSE 
              SET CantVote TO true
       END-IF
       DISPLAY "Vote " CanVoteFlag
        
       *> Evaluate performs a certain action based on 
       *> which value is assigned to a variable
       DISPLAY "Enter Single Number or X to Exit : "
       ACCEPT TestNumber
       *> Will execute until data that isn't a numeric is entered
       *> Used for iteration which I'll cover next
       PERFORM UNTIL NOT ANumber
       *> Executes different displays based on condition met
       *> Only one match can occur
           EVALUATE TRUE
               WHEN IsPrime    DISPLAY "Prime"
               WHEN IsOdd      DISPLAY "Odd"
               WHEN IsEven      DISPLAY "Even"
               WHEN LessThan5  DISPLAY "Less than 5"
               WHEN OTHER DISPLAY "Default Action"
           END-EVALUATE
           ACCEPT TestNumber
       END-PERFORM
        
       STOP RUN.