       IDENTIFICATION DIVISION.
       PROGRAM-ID. edited.
       AUTHOR. Paul McQuade.
       DATE-WRITTEN. 28th April 2020
       *> We can format data as it is entered
       *> using edited pictures
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 StartNum    PIC 9(8)V99 VALUE 00001123.55.
       *> Replace zeroes with space and add decimal
       01 NoZero  PIC ZZZZZZZ9.99.
       *> No zeroes and commas (Also use *)
       01 NoZPlusC   PIC ZZ,ZZZ,ZZ9.99.
       *> Convert to dollars (Also use +, -)
       01 Dollar  PIC $$,$$$,$$9.99.
       01 BDay   PIC 9(8)    VALUE 12211974.
       *> Insert / (Also use B)
       01 ADate   PIC 99/99/9999.
        
       PROCEDURE DIVISION.
       MOVE StartNum TO NoZero
       DISPLAY NoZero
       MOVE StartNum TO NoZPlusC
       DISPLAY NoZPlusC
       MOVE StartNum TO Dollar
       DISPLAY Dollar
       MOVE BDay TO ADate
       DISPLAY ADate
       STOP RUN.