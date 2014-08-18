SELECT * FROM ROLES;
SELECT * FROM AUTHORITIES;
SELECT * FROM MEMBERS;

DESC MEMBERS;

COMMIT;


-- 임의 사용자 추가
INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test@test.com','Sil','Tester','SilTester','1004',SYSDATE,'test',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test@test.com');

UPDATE MEMBERS SET isapproved = 1 WHERE email = 'admin@skein.com';
INSERT INTO AUTHORITIES VALUES('ROLE_USER','admin@skein.com');
COMMIT;




--DELETE FROM MEMBERS WHERE email = 'seungji222@naver.com';
DELETE FROM MEMBERS WHERE email = 'aa@naver';
COMMIT;

DELETE FROM members WHERE email = 'univcss@naver.com';
COMMIT;

-- 계정 권한 테스트
UPDATE members SET isApproved = 0;
COMMIT;

DELETE FROM authorities
COMMIT;

SELECT * FROM PUBLICLEVEL;

SELECT * FROM BOARDFORM;
SELECT * FROM BOARDKIND;

--
SELECT * FROM BOARDGROUP;
SELECT * FROM BOARD;
SELECT * FROM HISTORY;
SELECT * FROM MEDIA;

DELETE FROM HISTORY;
DELETE FROM MEDIA;
DELETE FROM BOARD;
DELETE FROM BOARDGROUP;
COMMIT;



-- /////////////////////////////////////////// 임시!!!!!!!!

SELECT m.EMAIL, m.FULLNAME, m.BIRTHDAY, m.PERSONALURI, b.BOARDSEQ, b.BOARDKINDSEQ, b.CONTENT, b.WRITEDATE, b.PUBLICLEVELCODE, b.ISACTIVATED, b.GROUPSEQ,
			h.HISTORYSEQ, h.STARTDATE, h.ENDDATE, h.FEELINGS, h.WEATHER, h.ISIMPORTANT, h.ISSHARE, h.KEYWORD, h.PLACE, bg.GROUPNAME, bg.ISIMPORTANTGROUP, bg.GROUPSTARTDATE, bg.GROUPENDDATE,
			me.MEDIASEQ, me.FILENAME, me.FILESIZE, me.EXTENSION
			FROM MEMBERS m JOIN BOARD b ON m.EMAIL = b.email
				JOIN BOARDGROUP bg ON b.GROUPSEQ = bg.GROUPSEQ
				JOIN HISTORY h ON b.BOARDSEQ = h.BOARDSEQ
				LEFT OUTER JOIN MEDIA me ON b.BOARDSEQ = me.BOARDSEQ

				WHERE m.PERSONALURI = 'univcss' ORDER BY b.GROUPSEQ DESC, b.BOARDSEQ DESC


SELECT m.EMAIL, m.FULLNAME, m.BIRTHDAY, m.PERSONALURI FROM MEMBERS m;

SELECT DISTINCT b.GROUPSEQ, b.BOARDSEQ, b.BOARDKINDSEQ, b.CONTENT, b.WRITEDATE, b.PUBLICLEVELCODE, b.ISACTIVATED FROM BOARD b;

SELECT * FROM BOARD;

SELECT boardSeq, COUNT(*) OVER(PARTITION BY groupSeq ORDER BY groupSeq DESC) AS gCount FROM BOARD;
SELECT groupSeq, COUNT(*) FROM BOARD GROUP BY groupSeq ORDER BY groupSeq DESC;
-- GROUP BY GROUPSEQ ORDER BY groupSeq DESC;
-- /////////////////////////////////////////// 임시!!!!!!!!





SELECT * FROM MEMBERS;

SELECT * FROM PROFILES;
SELECT * FROM PROFILECODES ORDER BY profilecode ASC;
--1	사는곳
--2	프로필사진
--3	공개이메일
--4	휴대폰번호
--5	상태글
--6	종교
--7	정치성향
--8	언어
--9	블로그

INSERT INTO PROFILES VALUES(1, 4, '010-3869-8396', 1, 'univcss@gmail.com');
INSERT INTO PROFILES VALUES(2, 1, 'Republic of Korea', 1, 'univcss@gmail.com');
COMMIT;

SELECT pc.PROFILECODE, pc.PROFILENAME, p.PROFILEINFO, p.PUBLICLEVELCODE
FROM MEMBERS m JOIN PROFILES p ON m.EMAIL = p.EMAIL JOIN PROFILECODES pc ON p.PROFILECODE = pc.PROFILECODE;


SELECT * FROM PUBLICLEVEL
SELECT * FROM MEMBERS;

SELECT * FROM AUTHORITIES;

DELETE FROM AUTHORITIES WHERE email = 'univcss@naver.com';
DELETE FROM MEMBERS WHERE email = 'univcss@naver.com';

DELETE FROM MEMBERS WHERE email = 'admin@skein.com';
COMMIT;

SELECT * FROM MEMBERS WHERE personalURI LIKE 'univcss%';

SELECT * FROM MEMBERS WHERE fullName LIKE '창%' AND email != 'univcss@naver.com';


SELECT * FROM






