       IDENTIFICATION DIVISION.
       PROGRAM-ID. mergefiles.
       AUTHOR. Paul McQuade.
       DATE-WRITTEN. 8th May 2020.

       *> This merges files that contain data structured
       *> the same
       *> Sample file Data saved in student.dat
       *>5Derek     
       *>4Paul      
       *>3Sue       
       *>2Sally  
       *> Sample data from student3.dat
       *>1Sam
       *>6Mark   
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       *> Line Sequential puts data on separate lines
              SELECT WorkFile ASSIGN TO 'work.tmp'.
              SELECT File1 ASSIGN TO 'student.dat'
                  ORGANIZATION IS LINE SEQUENTIAL.
              SELECT File2 ASSIGN TO 'student3.dat'
                  ORGANIZATION IS LINE SEQUENTIAL.
              SELECT NewFile ASSIGN TO 'student4.dat'
                  ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD File1.
       01 StudData.
              02 IDNum    PIC 9.
              02 StudName PIC X(10).
       FD File2.
       01 StudData2.
              02 IDNum2    PIC 9.
              02 StudName2 PIC X(10).
       SD WorkFile.
       01 WStudData.
              02 WIDNum    PIC 9.
              02 WStudName PIC X(10).
       FD NewFile.
       01 NStudData.
              02 NIDNum    PIC 9.
              02 NStudName PIC X(10).
        
       PROCEDURE DIVISION.
       MERGE WorkFile ON ASCENDING KEY NIDNum
              USING File1, File2
              GIVING NewFile.
        
       STOP RUN.