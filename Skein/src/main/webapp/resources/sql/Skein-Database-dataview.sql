SELECT * FROM ROLES;
SELECT * FROM AUTHORITIES;
SELECT * FROM MEMBERS;

DESC MEMBERS;

COMMIT;


-- 임의 사용자 추가
INSERT INTO MEMBERS(email,lastname,firstname,fullname,PASSWORD,birthday,personalURI,isapproved,islockedout,isdomranted,isdropedout,createdate,failedpasswordattemptcount,certificationtext)
VALUES('test@test.com','Sil','Tester','SilTester','1004',SYSDATE,'test',1,0,0,0,SYSDATE, 0,'test');
INSERT INTO AUTHORITIES VALUES('ROLE_USER','test@test.com');
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


