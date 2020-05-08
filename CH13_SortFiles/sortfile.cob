       IDENTIFICATION DIVISION.
       PROGRAM-ID. sortfile.
       AUTHOR. Paul McQuade.
       DATE-WRITTEN. 8th May 2020.
       
       *> This program sorts a file by ID
       *> Sample file Data saved in student.dat
       *>5Derek     
       *>4Paul      
       *>3Sue       
       *>2Sally     
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       *> Line Sequential puts data on separate lines
              SELECT WorkFile ASSIGN TO 'work.tmp'.
              SELECT OrgFile ASSIGN TO 'student.dat'
                  ORGANIZATION IS LINE SEQUENTIAL.
              SELECT SortedFile ASSIGN TO 'student2.dat'
                  ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD OrgFile.
       01 StudData.
              02 IDNum    PIC 9.
              02 StudName PIC X(10).
       *> SD (Sort File Description) describes layout 
       *> for sorted files
       SD WorkFile.
       01 WStudData.
              02 WIDNum    PIC 9.
              02 WStudName PIC X(10).
       FD SortedFile.
       01 SStudData.
              02 SIDNum    PIC 9.
              02 SStudName PIC X(10).
        
       PROCEDURE DIVISION.
       SORT WorkFile ON ASCENDING KEY SIDNum
              USING OrgFile
              GIVING SortedFile.
        
       STOP RUN.