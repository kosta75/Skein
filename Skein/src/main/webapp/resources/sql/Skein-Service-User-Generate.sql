-- ���� : ���̺� ��� �ϼ� �Ŀ� ���� �� ��!
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10, TO_CHAR(SYSDATE,'YYYY-MM-DD'), 1, 'admin@skein.com');

-- ���� ����� �߰�(25��)
INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('admin@skein.com','������','������','������','fed33392d3a48aa149a87a38b875ba4a', '1985-07-06','admin',1,0,0,0,SYSDATE, 0,'admin');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','admin@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10, '1985-07-06', 1, 'admin@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test@skein.com','â','����','â����','fed33392d3a48aa149a87a38b875ba4a','1985-07-06','test',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10, '1985-07-06', 1, 'test@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test1@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a','1987-06-22','test1',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test1@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10, '1987-06-22', 1, 'test1@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test2@skein.com','��','��ȿ','�۱�ȿ','fed33392d3a48aa149a87a38b875ba4a','1985-10-21','test2',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test2@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1985-10-21', 1, 'test2@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test3@skein.com','��','�ҷ�','�̼ҷ�','fed33392d3a48aa149a87a38b875ba4a','1987-03-15','test3',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test3@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1987-03-15', 1, 'test3@skein.com');

COMMIT;







INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test4@skein.com','��','����','�ֽ���','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test4',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test4@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test5@skein.com','Eickhoff','Adolfo','Adolfo Eickhoff','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test5',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test5@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test6@skein.com','Murch','Zita','Zita Murch','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test6',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test6@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test7@skein.com','Viera','Lucio','Lucio Viera','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test7',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test7@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test8@skein.com','��','����','�����','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test8',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test8@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test9@skein.com','��','���','�ֿ��','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test9',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test9@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test10@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test10',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test10@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test11@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test11',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test11@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test12@skein.com','Blacker','Billie','Billie Blacker','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test12',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test12@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test13@skein.com','Rients','Ramiro','Ramiro Rients','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test13',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test13@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test14@skein.com','��','�ظ�','���ظ�','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test14',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test14@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test15@skein.com','Carls','Chang','Chang Carls','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test15',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test15@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test16@skein.com','Joyce','Jayme','Jayme Joyce','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test16',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test16@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test17@skein.com','��','ȿ��','��ȿ��','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test17',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test17@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test18@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test18',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test18@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test19@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test19',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test19@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test20@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test20',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test20@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test21@skein.com','��','����','������','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test21',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test21@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test22@skein.com','��','âȯ','��âȯ','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test22',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test22@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test23@skein.com','Johansson','Jonathon','Jonathon Johansson','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test23',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test23@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test24@skein.com','Dunn','Derik','Derik Dunn','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test24',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test24@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test25@skein.com','Darrington','Darius','Darius Darrington','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test25',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test25@skein.com');



COMMIT;
