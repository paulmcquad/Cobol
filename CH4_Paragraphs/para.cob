       IDENTIFICATION DIVISION.
       PROGRAM-ID. para.
       AUTHOR. Paul McQuade.
       DATE-WRITTEN. 28th April 2020

        
       PROCEDURE DIVISION.
       *> Gravity driven programming falls through the
       *> code until a condition or goto redirects it 
       *> Open paragraphs are executed through gravity
       *> while closed paragraphs are executed by name.
       *> Open paragraphs are basically ways to name blocks
       *> of code (tags).
       *> Data created in a closed paragraph can't be
       *> accessed outside of it. They are traditional functions.
        
       *> This demonstrates the flow
       SubOne.
              DISPLAY "In Paragraph 1"
              PERFORM SubTwo
              DISPLAY "Returned to Paragraph 1"
              *> Execute code multiple times
              PERFORM 2 TIMES
              DISPLAY "Repeat"
              END-PERFORM
              STOP RUN.
        
       SubThree.
              DISPLAY "In Paragraph 3".
              
       SubTwo.
              DISPLAY "In Paragraph 2"
              PERFORM SubThree
              DISPLAY "Returned to Paragraph 2".
        