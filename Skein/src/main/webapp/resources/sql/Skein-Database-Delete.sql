-----------------------------------------------------------------------------------------------
-- 1. Roles(역할)
-----------------------------------------------------------------------------------------------
-- 1.1 Roles(역할) 테이블 삭제
/* 역할 */
DROP TABLE Roles
	CASCADE CONSTRAINTS;

-----------------------------------------------------------------------------------------------
-- 2. Members(사용자)
-----------------------------------------------------------------------------------------------
-- 2.1 Members(사용자) 테이블 삭제
/* 사용자 */
DROP TABLE Members
	CASCADE CONSTRAINTS;

-----------------------------------------------------------------------------------------------
-- 3. Authorities(사용자권한)
-----------------------------------------------------------------------------------------------
-- 3.1 Authorities(사용자권한) 테이블 삭제
/* 사용자 권한 */
DROP TABLE Authorities
	CASCADE CONSTRAINTS;

-----------------------------------------------------------------------------------------------
-- 4. BoardForm(게시판형식코드)
-----------------------------------------------------------------------------------------------
-- 4.1 BoardForm(게시판형식코드) 테이블 삭제
/* 게시판형식 */
DROP TABLE BoardForm
	CASCADE CONSTRAINTS;

-----------------------------------------------------------------------------------------------
-- 5. BoardKind(게시판종류)
-----------------------------------------------------------------------------------------------
-- 5.1 BoardKind(게시판종류) 테이블 삭제
/* 게시판종류 */
DROP TABLE BoardKind
	CASCADE CONSTRAINTS;

-----------------------------------------------------------------------------------------------
-- 6. PublicLevel(공개범위)
-----------------------------------------------------------------------------------------------
-- 6.1 PublicLevel(공개범위) 테이블 삭제
/* 공개범위 */
DROP TABLE PublicLevel
	CASCADE CONSTRAINTS;

-----------------------------------------------------------------------------------------------
-- 10. BoardGroup(과거기록그룹) > 7
-----------------------------------------------------------------------------------------------
-- 10.1 BoardGroup(과거기록그룹) 테이블 삭제
/* 과거기록그룹 */
DROP TABLE BoardGroup
	CASCADE CONSTRAINTS;

-----------------------------------------------------------------------------------------------
-- 7. Board(게시판)
-----------------------------------------------------------------------------------------------
-- 7.1 Board(게시판) 테이블 삭제
/* 게시판 */
DROP TABLE Board
	CASCADE CONSTRAINTS;

-----------------------------------------------------------------------------------------------
-- 8. ProfileCodes(프로필항목)
-----------------------------------------------------------------------------------------------
-- 8.1 ProfileCodes(프로필항목) 테이블 삭제
/* 프로필항목 */
DROP TABLE ProfileCodes
	CASCADE CONSTRAINTS;

-----------------------------------------------------------------------------------------------
-- 9. Profiles(사용자프로필)
-----------------------------------------------------------------------------------------------
-- 9.1 Profiles(사용자프로필) 테이블 삭제
/* 사용자프로필 */
DROP TABLE Profiles
	CASCADE CONSTRAINTS;

-----------------------------------------------------------------------------------------------
-- 11. History(과거기록)
-----------------------------------------------------------------------------------------------
-- 11.1 History(과거기록) 테이블 삭제
/* 개인기록 */
DROP TABLE History
	CASCADE CONSTRAINTS;

-----------------------------------------------------------------------------------------------
-- 12. Media(미디어)
-----------------------------------------------------------------------------------------------
-- 12.1 Media(미디어) 테이블 삭제
/* 미디어 */
DROP TABLE Media
	CASCADE CONSTRAINTS;































-----------------------------------------------------------------------------------------------
-- 모든 테이블 삭제시 가장 마지막에 실행
-----------------------------------------------------------------------------------------------
PURGE RECYCLEBIN;