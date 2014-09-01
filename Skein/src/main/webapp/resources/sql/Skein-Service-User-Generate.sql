-- ÁÖÀÇ : Å×ÀÌºí ¸ðµÎ ¿Ï¼º ÈÄ¿¡ ½ÇÇà ÇÒ °Í!
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10, TO_CHAR(SYSDATE,'YYYY-MM-DD'), 1, 'admin@skein.com');

-- ÀÓÀÇ »ç¿ëÀÚ Ãß°¡(25¸í)
INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('admin@skein.com','°ü¸®ÀÚ','°ü¸®ÀÚ','°ü¸®ÀÚ','fed33392d3a48aa149a87a38b875ba4a', '1985-07-06','admin',1,0,0,0,SYSDATE, 0,'admin');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','admin@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10, '1985-07-06', 1, 'admin@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test@skein.com','Ã¢','¼º½Ç','Ã¢¼º½Ç','fed33392d3a48aa149a87a38b875ba4a','1985-07-06','test',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10, '1985-07-06', 1, 'test@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test1@skein.com','¼­','Çö´ö','¼­Çö´ö','fed33392d3a48aa149a87a38b875ba4a','1987-06-22','test1',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test1@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10, '1987-06-22', 1, 'test1@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test2@skein.com','¼Û','±¤È¿','¼Û±¤È¿','fed33392d3a48aa149a87a38b875ba4a','1985-10-21','test2',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test2@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1985-10-21', 1, 'test2@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test3@skein.com','ÀÌ','¼Ò·æ','ÀÌ¼Ò·æ','fed33392d3a48aa149a87a38b875ba4a','1987-03-15','test3',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test3@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1987-03-15', 1, 'test3@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('gbaus@skein.com','±è','ÈÞ¸é','±èÈÞ¸é','fed33392d3a48aa149a87a38b875ba4a','1994-03-15','gbaus',0,0,1,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_RESTRICTED','gbaus@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1994-03-15', 1, 'gbaus@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('xkfxhl@skein.com','Á¤','Å»Åð','Á¤Å»Åð','fed33392d3a48aa149a87a38b875ba4a','1991-07-15','xkfxhl',0,0,0,1,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_RESTRICTED','xkfxhl@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1991-07-15', 1, 'xkfxhl@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('vPtho@skein.com','ÀÌ','Æó¼â','ÀÌÆó¼â','fed33392d3a48aa149a87a38b875ba4a','1989-10-15','vPtho',0,1,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_RESTRICTED','vPtho@skein.com');
INSERT INTO PROFILES VALUES((SELECT NVL(MAX(profileSeq),0)+1 FROM PROFILES), 10,'1989-10-15', 1, 'vPtho@skein.com');

COMMIT;




INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test4@skein.com','ÃÖ','½ÂÁö','ÃÖ½ÂÁö','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test4',1,0,0,0,SYSDATE, 0,'test');
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
VALUES('test8@skein.com','±è','»óÁø','±è»óÁø','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test8',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test8@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test9@skein.com','ÃÖ','¿ë½Ä','ÃÖ¿ë½Ä','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test9',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test9@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test10@skein.com','À¯','¼±Áß','À¯¼±Áß','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test10',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test10@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test11@skein.com','¹Ú','Çý¸²','¹ÚÇý¸²','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test11',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test11@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test12@skein.com','Blacker','Billie','Billie Blacker','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test12',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test12@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test13@skein.com','Rients','Ramiro','Ramiro Rients','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test13',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test13@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test14@skein.com','Á¤','ÁØ¸ð','Á¤ÁØ¸ð','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test14',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test14@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test15@skein.com','Carls','Chang','Chang Carls','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test15',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test15@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test16@skein.com','Joyce','Jayme','Jayme Joyce','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test16',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test16@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test17@skein.com','¹Ú','È¿»ó','¹ÚÈ¿»ó','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test17',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test17@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test18@skein.com','±è','ÀåÇö','±èÀåÇö','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test18',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test18@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test19@skein.com','±è','ÁØÇö','±èÁØÇö','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test19',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test19@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test20@skein.com','±è','ÁØÇü','±èÁØÇü','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test20',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test20@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test21@skein.com','ÃÖ','ÇüÀÎ','ÃÖÇüÀÎ','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test21',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test21@skein.com');

INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test22@skein.com','ÀÌ','Ã¢È¯','ÀÌÃ¢È¯','fed33392d3a48aa149a87a38b875ba4a',SYSDATE,'test22',1,0,0,0,SYSDATE, 0,'test');
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
