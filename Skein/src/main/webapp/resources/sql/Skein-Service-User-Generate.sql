-- ���� : ���̺� ��� �ϼ� �Ŀ� ���� �� ��!
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10, TO_CHAR(SYSDATE,'YYYY-MM-DD'), 1, 'admin@skein.com');

-- ���� ����� �߰�(25��)
INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('admin@skein.com','������','������','������','fed33392d3a48aa149a87a38b875ba4a', '1985-07-06','admin',1,0,0,0,SYSDATE, 0,'admin');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','admin@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10, '1985-07-06', 1, 'admin@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a','1982-10-18','test',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10, '1982-10-18', 1, 'test@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test1@skein.com','��','����','�̼���','fed33392d3a48aa149a87a38b875ba4a','1964-11-11','test1',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test1@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10, '1964-11-11', 1, 'test1@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test2@skein.com','��','����','�ּ���','fed33392d3a48aa149a87a38b875ba4a','1962-12-18','test2',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test2@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1962-12-18', 1, 'test2@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test3@skein.com','��','����','�Ѱ���','fed33392d3a48aa149a87a38b875ba4a','1982-02-25','test3',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test3@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1982-02-25', 1, 'test3@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('gbaus@skein.com','��','�޸�','���޸�','fed33392d3a48aa149a87a38b875ba4a','1994-03-15','gbaus',0,0,1,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_RESTRICTED','gbaus@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1994-03-15', 1, 'gbaus@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('xkfxhl@skein.com','��','Ż��','��Ż��','fed33392d3a48aa149a87a38b875ba4a','1991-07-15','xkfxhl',0,0,0,1,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_RESTRICTED','xkfxhl@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1991-07-15', 1, 'xkfxhl@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('vPtho@skein.com','��','���','�����','fed33392d3a48aa149a87a38b875ba4a','1989-10-15','vPtho',0,1,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_RESTRICTED','vPtho@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1989-10-15', 1, 'vPtho@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test4@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a','1981-02-25','test4',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test4@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1981-02-25', 1, 'test4@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test5@skein.com','Eickhoff','Adolfo','Adolfo Eickhoff','fed33392d3a48aa149a87a38b875ba4a','1965-01-21','test5',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test5@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1965-01-21', 1, 'test5@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test6@skein.com','Murch','Zita','Zita Murch','fed33392d3a48aa149a87a38b875ba4a','1945-09-26','test6',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test6@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1945-09-26', 1, 'test6@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test7@skein.com','Viera','Lucio','Lucio Viera','fed33392d3a48aa149a87a38b875ba4a','1992-03-07','test7',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test7@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1992-03-07', 1, 'test7@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test8@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a','1977-04-23','test8',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test8@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1977-04-23', 1, 'test8@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test9@skein.com','��','�·�','���·�','fed33392d3a48aa149a87a38b875ba4a','1970-11-29','test9',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test9@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1970-11-29', 1, 'test9@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test10@skein.com','��','����','�����','fed33392d3a48aa149a87a38b875ba4a','1940-05-09','test10',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test10@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1940-05-09', 1, 'test10@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test11@skein.com','��','�Ѻ�','���Ѻ�','fed33392d3a48aa149a87a38b875ba4a','1984-11-17','test11',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test11@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1984-11-17', 1, 'test11@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test12@skein.com','Blacker','Billie','Billie Blacker','fed33392d3a48aa149a87a38b875ba4a','1988-06-30','test12',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test12@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1988-06-30', 1, 'test12@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test13@skein.com','Rients','Ramiro','Ramiro Rients','fed33392d3a48aa149a87a38b875ba4a','1994-01-05','test13',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test13@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1994-01-05', 1, 'test13@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test14@skein.com','��','����','�輺��','fed33392d3a48aa149a87a38b875ba4a','1968-10-03','test14',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test14@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1968-10-03', 1, 'test14@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test15@skein.com','Carls','Chang','Chang Carls','fed33392d3a48aa149a87a38b875ba4a','1987-07-25','test15',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test15@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1987-07-25', 1, 'test15@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test16@skein.com','Joyce','Jayme','Jayme Joyce','fed33392d3a48aa149a87a38b875ba4a','1987-07-25','test16',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test16@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1987-07-25', 1, 'test16@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test17@skein.com','��','ȿ��','��ȿ��','fed33392d3a48aa149a87a38b875ba4a','1981-12-01','test17',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test17@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1981-12-01', 1, 'test17@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test18@skein.com','��','ȿ��','��ȿ��','fed33392d3a48aa149a87a38b875ba4a','1989-10-13','test18',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test18@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1989-10-13', 1, 'test18@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test19@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a','1980-11-16','test19',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test19@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1980-11-16', 1, 'test19@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test20@skein.com','��','�¿�','���¿�','fed33392d3a48aa149a87a38b875ba4a','1981-05-12','test20',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test20@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1981-05-12', 1, 'test20@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test21@skein.com','��','�γ�','���γ�','fed33392d3a48aa149a87a38b875ba4a','1982-06-05','test21',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test21@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1982-06-05', 1, 'test21@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test22@skein.com','��','âȯ','��âȯ','fed33392d3a48aa149a87a38b875ba4a','1967-09-16','test22',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test22@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1967-09-16', 1, 'test22@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test23@skein.com','Johansson','Jonathon','Jonathon Johansson','fed33392d3a48aa149a87a38b875ba4a','1990-05-27','test23',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test23@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1990-05-27', 1, 'test23@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test24@skein.com','Dunn','Derik','Derik Dunn','fed33392d3a48aa149a87a38b875ba4a','1989-02-24','test24',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test24@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1989-02-24', 1, 'test24@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test25@skein.com','Darrington','Darius','Darius Darrington','fed33392d3a48aa149a87a38b875ba4a','1987-09-13','test25',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test25@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1987-09-13', 1, 'test25@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test26@skein.com','��','����','�ѿ���','fed33392d3a48aa149a87a38b875ba4a','1981-09-18','test26',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test26@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1981-09-18', 1, 'test26@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test27@skein.com','��','ȿ��','��ȿ��','fed33392d3a48aa149a87a38b875ba4a','1987-02-22','test27',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test27@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1987-02-22', 1, 'test27@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test28@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a','1982-11-05','test28',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test28@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1982-11-05', 1, 'test28@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test29@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a','1976-04-25','test29',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test29@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1976-04-25', 1, 'test29@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test30@skein.com','��','�缮','���缮','fed33392d3a48aa149a87a38b875ba4a','1972-08-14','test30',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test30@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1972-08-14', 1, 'test30@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test31@skein.com','��','����','�̿���','fed33392d3a48aa149a87a38b875ba4a','1971-01-31','test31',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test31@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1971-01-31', 1, 'test31@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test32@skein.com','��','����','�̳���','fed33392d3a48aa149a87a38b875ba4a','1979-02-22','test32',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test32@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1979-02-22', 1, 'test32@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test33@skein.com','��','ȿ��','��ȿ��','fed33392d3a48aa149a87a38b875ba4a','1980-04-04','test33',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test33@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1980-04-04', 1, 'test33@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test34@skein.com','��','��','�ֿ�','fed33392d3a48aa149a87a38b875ba4a','1987-09-30','test34',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test34@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1987-09-30', 1, 'test34@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test35@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a','1978-02-24','test35',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test35@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1978-02-24', 1, 'test35@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test36@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a','1981-01-18','test36',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test36@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1981-01-18', 1, 'test36@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test37@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a','1997-08-13','test37',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test37@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1997-08-13', 1, 'test37@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test38@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a','1986-10-06','test38',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test38@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1986-10-06', 1, 'test38@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test39@skein.com','��','��ȣ','����ȣ','fed33392d3a48aa149a87a38b875ba4a','1993-08-17','test39',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test39@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1993-08-17', 1, 'test39@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test40@skein.com','Pitt','Brad','Brad Pitt','fed33392d3a48aa149a87a38b875ba4a','1963-12-18','test40',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test40@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1963-12-18', 1, 'test40@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test41@skein.com','Paltrow','Gwyneth','Gwyneth Paltrow','fed33392d3a48aa149a87a38b875ba4a','1972-09-27','test41',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test41@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1972-09-27', 1, 'test41@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test42@skein.com','Johansson','Scarlett','Scarlett Johansson','fed33392d3a48aa149a87a38b875ba4a','1984-11-22','test42',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test42@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1984-11-22', 1, 'test42@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test43@skein.com','Evans','Chris','Chris Evans','fed33392d3a48aa149a87a38b875ba4a','1981-06-13','test43',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test43@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1981-06-13', 1, 'test43@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test44@skein.com','Bieber','Justin','Justin Bieber','fed33392d3a48aa149a87a38b875ba4a','1994-03-01','test44',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test44@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1994-03-01', 1, 'test44@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test45@skein.com','Hanks','Tom','Tom Hanks','fed33392d3a48aa149a87a38b875ba4a','1956-07-09','test45',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test45@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1956-07-09', 1, 'test45@skein.com');

--

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test46@skein.com','Watson','Emma','Emma Watson','fed33392d3a48aa149a87a38b875ba4a','1990-04-15','test46',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test46@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1990-04-15', 1, 'test46@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test47@skein.com','Fanning','Dakota','Dakota Fanning','fed33392d3a48aa149a87a38b875ba4a','1994-02-23','test47',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test47@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1994-02-23', 1, 'test47@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test48@skein.com','Cumberbatch','Benedict','Benedict Cumberbatch','fed33392d3a48aa149a87a38b875ba4a','1956-07-09','test48',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test48@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1956-07-09', 1, 'test48@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test49@skein.com','Freeman','Martin','Martin Freeman','fed33392d3a48aa149a87a38b875ba4a','1971-09-08','test49',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test49@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1971-09-08', 1, 'test49@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test50@skein.com','Damon','Matt','Matt Damon','fed33392d3a48aa149a87a38b875ba4a','1970-10-08','test50',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test50@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1970-10-08', 1, 'test50@skein.com');


COMMIT;
