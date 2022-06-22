IF EXISTS (SELECT*FROM sys.databases WHERE NAME='lad9') 
DROP DATABASE lad9

CREATE DATABASE lad9
GO

CREATE TABLE CLASS(
    CLASSCODE VARCHAR(10) PRIMARY KEY,
    HEADTEACHER VARCHAR (30),
    RO0M VARCHAR (30),
    TIMESLOT CHAR,
    CLOSEDATE DATETIME
)
GO

CREATE TABLE STUDENT(
    ROLLNO VARCHAR(10) PRIMARY KEY,
    CLASSCODE VARCHAR(10) FOREIGN KEY (CLASSCODE) REFERENCES CLASS(CLASSCODE),
    FULLNAME VARCHAR (30),
    MALE BIT,
    BIRTHDATE DATETIME,
    ADDRESS VARCHAR(30),
    PROVINE CHAR(2),
    EMAIL VARCHAR(30)

)
GO

CREATE TABLE SUBJECTT(
 SUBJECTTCODE VARCHAR(10) PRIMARY KEY,
 SUBJECTTNAME VARCHAR(40),
 WTEST BIT,
 PTEST BIT,
 WTESTPER INT,
 PTESTPER INT

)

GO

CREATE TABLE MARK(
   ROLLNO VARCHAR (10) FOREIGN KEY (ROLLNO) REFERENCES STUDENT(ROLLNO),
   SUBJECTTCODE VARCHAR (10) FOREIGN KEY (SUBJECTTCODE) REFERENCES SUBJECTT(SUBJECTTCODE),
   WRARK FLOAT,
   PMARK FLOAT,
   MARKT FLOAT

)
GO

INSERT INTO CLASS(CLASSCODE,HEADTEACHER,RO0M,TIMESLOT,CLOSEDATE) VALUES('C01','HANG','LOP3','L','3-7-2022'),
                                                                       ( 'C02','HANG','LOP3','L','3-7-2022'),
                                                                       ('C03','THI','LOP3','L','3-7-2022'),
                                                                       ('C04','MAI','LOP3','M','3-7-2022'),
                                                                       ('C05','LUYEN','LOP3','M','3-7-2022'),
                                                                       ('C06','KHANH','LOP3','M','3-7-2022')




                                            

INSERT INTO STUDENT(ROLLNO,CLASSCODE,FULLNAME,MALE,BIRTHDATE,ADDRESS,PROVINE,EMAIL) VALUES('111','C01','HOANGCONGMINH','1','12-27-1998','THAINGUYEN','TN','MINH@GMAIL'),
                                                                                          ('112','C02','TRUONGCONGTUAN','1','12-27-2000','HANOI','HN','TUAN@GMAIL'),
                                                                                          ('113','C03','TRUONGQUANGTUNG','1','12-30-1998','BACKAN','BK','TUNG@GMAIL'),
                                                                                          ('114','C04','NGUYENQUANGDAI','1','12-27-2003','THAINGUYEN','TN','DAI@GMAIL'),
                                                                                          ('115','C05','HOANGCONGNAM','1','12-27-1995','BACNINH','BN','NAM@GMAIL'),
                                                                                          ('116','C05','HOANGCONGNAMANH','1','12-27-1995','BACNINH','BN','NAM@GMAIL'),
                                                                                          ('117','C01','HOANGCONGMINHANH','1','12-27-1998','THAINGUYEN','TN','MINH@GMAIL'),
                                                                                          ('118','C01','HOANGCONGMINHNGUYEN','1','12-27-1998','THAINGUYEN','TN','MINH@GMAIL'),
                                                                                          ('119','C01','HOANGCONGMINHQUAN','1','12-27-1998','THAINGUYEN','TN','MINH@GMAIL')

INSERT INTO SUBJECTT(SUBJECTTCODE,SUBJECTTNAME,WTEST,PTEST,WTESTPER,PTESTPER) VALUES('M1','HOAHOC','1','1',20,20),
                                                                                    ('M2','TOANHOC','1','1',20,20),
                                                                                    ('M3','VANHOC','1','1',20,20),
                                                                                    ('M4','LY','1','1',20,20),
                                                                                    ('M5','VAN','1','1',20,20)
                                                                                    

INSERT INTO   MARK(ROLLNO,SUBJECTTCODE,WRARK,PMARK,MARKT) VALUES('111','M1',80,80,100),   
                                                               ('112','M2',80,80,100) ,
                                                               ('113','M3',80,80,100) ,
                                                               ('114','M4',80,80,100) ,
                                                               ('115','M5',80,80,100) ,
                                                               ('116','M1',80,80,80),
                                                               ('117','M1',80,80,80),
                                                               ('118','M1',80,80,80),
                                                               ('119','M1',80,80,80)

INSERT INTO   MARK(ROLLNO,SUBJECTTCODE,WRARK,PMARK,MARKT) VALUES('111','M3',80,80,100)
INSERT INTO   MARK(ROLLNO,SUBJECTTCODE,WRARK,PMARK,MARKT) VALUES('111','M3',80,80,100)
INSERT INTO   MARK(ROLLNO,SUBJECTTCODE,WRARK,PMARK,MARKT) VALUES('112','M3',80,80,100)




SELECT * FROM CLASS        
SELECT * FROM STUDENT    
SELECT * FROM SUBJECTT       
SELECT * FROM MARK       

CREATE VIEW MT AS
SELECT S.FullName, COUNT(M.SUBJECTTCODE) AS KETQUA
FROM STUDENT S , MARK M 
WHERE S.ROLLNO = M.ROLLNO 
GROUP BY S.FullName
HAVING COUNT(M.SUBJECTTCODE) >=2

SELECT * FROM MT



CREATE VIEW map AS
  SELECT STUDENT.FULLNAME, STUDENT.ROLLNO, MARK.MARKT
  FROM STUDENT
  INNER JOIN MARK
  ON STUDENT.ROLLNO = MARK.ROLLNO
  WHERE MARK.MARKT >= 100;

SELECT * FROM MAP

CREATE VIEW mlb AS
  SELECT STUDENT.FULLNAME, CLASS.TIMESLOT
  FROM STUDENT
  INNER JOIN CLASS
  ON STUDENT.CLASSCODE = CLASS.CLASSCODE
  WHERE CLASS.TIMESLOT = 'L';

  SELECT * FROM mlb

  CREATE VIEW mmlk AS
  SELECT STUDENT.FULLNAME, CLASS.TIMESLOT
  FROM STUDENT
  INNER JOIN CLASS
  ON STUDENT.CLASSCODE = CLASS.CLASSCODE
  WHERE CLASS.TIMESLOT = 'M';

SELECT * FROM mmlk

CREATE VIEW TENGIAOVIEN3 AS
  SELECT  CLASS.HEADTEACHER, COUNT( DISTINCT MARK.ROLLNO) AS TENGV
  FROM CLASS,STUDENT,MARK
  WHERE STUDENT.CLASSCODE = CLASS.CLASSCODE AND STUDENT.ROLLNO = MARK.ROLLNO AND MARKT<100
  GROUP BY HEADTEACHER
  HAVING COUNT(DISTINCT MARK.ROLLNO)>2

  SELECT * FROM TENGIAOVIEN3
DROP VIEW TENGIAOVIEN3
CREATE VIEW TRUOTHOA AS
SELECT STUDENT.FULLNAME, CLASS.RO0M, CLASS.HEADTEACHER,SUBJECTT.SUBJECTTNAME
FROM CLASS
INNER JOIN STUDENT ON STUDENT.CLASSCODE=CLASS.CLASSCODE
INNER JOIN MARK ON STUDENT.ROLLNO=MARK.ROLLNO
INNER JOIN SUBJECTT ON SUBJECTT.SUBJECTTCODE=MARK.SUBJECTTCODE
WHERE SUBJECTTNAME='HOAHOC' AND MARKT <= 100

  SELECT * FROM TRUOTHOA



  




  

 



                                                                    
                                            


                                                                                        

