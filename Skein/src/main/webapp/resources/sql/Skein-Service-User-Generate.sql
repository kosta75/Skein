-- 주의 : 테이블 모두 완성 후에 실행 할 것!

-- 임의 사용자 추가(25명)
INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test@test.com','창','성실','창성실','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test1@test.com','서','현덕','서현덕','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test1',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test1@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test2@test.com','송','광효','송광효','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test2',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test2@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test3@test.com','이','소룡','이소룡','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test3',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test3@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test4@test.com','최','승지','최승지','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test4',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test4@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test5@test.com','Eickhoff','Adolfo','Adolfo Eickhoff','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test5',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test5@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test6@test.com','Murch','Zita','Zita Murch','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test6',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test6@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test7@test.com','Viera','Lucio','Lucio Viera','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test7',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test7@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test8@test.com','김','상진','김상진','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test8',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test8@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test9@test.com','최','용식','최용식','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test9',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test9@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test10@test.com','유','선중','유선중','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test10',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test10@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test11@test.com','박','혜림','박혜림','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test11',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test11@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test12@test.com','Blacker','Billie','Billie Blacker','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test12',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test12@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test13@test.com','Rients','Ramiro','Ramiro Rients','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test13',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test13@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test14@test.com','정','준모','정준모','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test14',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test14@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test15@test.com','Carls','Chang','Chang Carls','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test15',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test15@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test16@test.com','Joyce','Jayme','Jayme Joyce','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test16',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test16@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test17@test.com','박','효상','박효상','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test17',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test17@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test18@test.com','김','장현','김장현','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test18',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test18@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test19@test.com','김','준현','김준현','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test19',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test19@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test20@test.com','김','준형','김준형','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test20',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test20@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test21@test.com','최','형인','최형인','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test21',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test21@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test22@test.com','이','창환','이창환','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test22',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test22@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test23@test.com','Johansson','Jonathon','Jonathon Johansson','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test23',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test23@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test24@test.com','Dunn','Derik','Derik Dunn','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test24',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test24@test.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test25@test.com','Darrington','Darius','Darius Darrington','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test25',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test25@test.com');



COMMIT;
