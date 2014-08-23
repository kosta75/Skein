-----------------------------------------------------------------------------------------------
-- 1. Roles(역할)
-----------------------------------------------------------------------------------------------
-- 1.1 Roles(역할) 테이블 삭제 및 생성
ALTER TABLE Roles
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Roles;

/* 역할 */
DROP TABLE Roles
	CASCADE CONSTRAINTS;

/* 역할 */
CREATE TABLE Roles (
	Authority VARCHAR2(127) NOT NULL, /* 권한 */
	RoleName VARCHAR2(127) NOT NULL, /* 권한이름 */
	Discription VARCHAR2(127) /* 권한설명 */
);

COMMENT ON TABLE Roles IS '역할';

COMMENT ON COLUMN Roles.Authority IS '권한';

COMMENT ON COLUMN Roles.RoleName IS '권한이름';

COMMENT ON COLUMN Roles.Discription IS '권한설명';

CREATE UNIQUE INDEX PK_Roles
	ON Roles (
		Authority ASC
	);

ALTER TABLE Roles
	ADD
		CONSTRAINT PK_Roles
		PRIMARY KEY (
			Authority
		);

-- 1.2 역할 데이터 입력 (반드시 선행되어야 한다)
INSERT INTO ROLES(Authority, RoleName, Discription) VALUES('IS_AUTHENTICATED_ANONYMOUSLY','AnonymousUser','익명 사용자');
INSERT INTO ROLES(Authority, RoleName, Discription) VALUES('IS_AUTHENTICATED_REMEMBERED','RememberedUser','REMEMBERED 사용자');
INSERT INTO ROLES(Authority, RoleName, Discription) VALUES('IS_AUTHENTICATED_FULLY','ApprovedUser','인증된 사용자');
INSERT INTO ROLES(Authority, RoleName, Discription) VALUES('ROLE_RESTRICTED','NotApprovedUser','제한된 사용자');
INSERT INTO ROLES(Authority, RoleName, Discription) VALUES('ROLE_USER','User','일반 사용자');
INSERT INTO ROLES(Authority, RoleName, Discription) VALUES('ROLE_ADMIN','Admin','관리자');
COMMIT;

-----------------------------------------------------------------------------------------------
-- 2. Members(사용자)
-----------------------------------------------------------------------------------------------
-- 2.1 Members(사용자) 테이블 생성
/* 사용자 */
CREATE TABLE Members (
	Email VARCHAR2(127) NOT NULL, /* 이메일 */
	LastName VARCHAR2(127) NOT NULL, /* 성 */
	FirstName VARCHAR2(127) NOT NULL, /* 이름 */
	FullName VARCHAR2(127) NOT NULL, /* 전체이름 */
	Password VARCHAR2(127) NOT NULL, /* 비밀번호 */
	BirthDay DATE NOT NULL, /* 생년월일 */
	PersonalURI VARCHAR2(255) NOT NULL, /* 사용자고유주소 */
	IsApproved INT DEFAULT 0 NOT NULL, /* 계정승인여부 */
	IsLockedOut INT DEFAULT 0 NOT NULL, /* 계정폐쇄여부 */
	IsDomranted INT DEFAULT 0 NOT NULL, /* 계정휴면여부 */
	IsDropedOut INT DEFAULT 0 NOT NULL, /* 계정탈퇴여부 */
	CreateDate DATE NOT NULL, /* 가입한날짜 */
	LastLoginDate DATE, /* 마지막로그인날짜 */
	LastPasswordChangedDate DATE, /* 마지막비밀번호변경날짜 */
	FailedPasswordAttemptCount NUMBER DEFAULT 0 NOT NULL, /* 비밀번호오류횟수 */
	CertificationText VARCHAR2(255) NOT NULL, /* 계정인증문자 */
  ColorTheme VARCHAR2(127) /* 사용자지정색상 */
);

COMMENT ON TABLE Members IS '사용자';

COMMENT ON COLUMN Members.Email IS '이메일';

COMMENT ON COLUMN Members.LastName IS '성';

COMMENT ON COLUMN Members.FirstName IS '이름';

COMMENT ON COLUMN Members.FullName IS '전체이름';

COMMENT ON COLUMN Members.Password IS '비밀번호';

COMMENT ON COLUMN Members.BirthDay IS '생년월일';

COMMENT ON COLUMN Members.PersonalURI IS '사용자고유주소';

COMMENT ON COLUMN Members.IsApproved IS '계정승인여부';

COMMENT ON COLUMN Members.IsLockedOut IS '계정폐쇄여부';

COMMENT ON COLUMN Members.IsDomranted IS '계정휴면여부';

COMMENT ON COLUMN Members.IsDropedOut IS '계정탈퇴여부';

COMMENT ON COLUMN Members.CreateDate IS '가입한날짜';

COMMENT ON COLUMN Members.LastLoginDate IS '마지막로그인날짜';

COMMENT ON COLUMN Members.LastPasswordChangedDate IS '마지막비밀번호변경날짜';

COMMENT ON COLUMN Members.FailedPasswordAttemptCount IS '비밀번호오류횟수';

COMMENT ON COLUMN Members.CertificationText IS '계정인증문자';

COMMENT ON COLUMN Members.ColorTheme IS '사용자지정색상';

CREATE UNIQUE INDEX PK_Members
	ON Members (
		Email ASC
	);

CREATE UNIQUE INDEX UIX_Members
	ON Members (
		PersonalURI ASC
	);

ALTER TABLE Members
	ADD
		CONSTRAINT PK_Members
		PRIMARY KEY (
			Email
		);

ALTER TABLE Members
	ADD
		CONSTRAINT UK_Members
		UNIQUE (
			PersonalURI
		);


-----------------------------------------------------------------------------------------------
-- 3. Authorities(사용자권한)
-----------------------------------------------------------------------------------------------
-- 3.1 Authorities(사용자권한) 테이블 삭제 및 생성
ALTER TABLE Authorities
	DROP
		CONSTRAINT FK_Roles_TO_Authorities
		CASCADE;

ALTER TABLE Authorities
	DROP
		CONSTRAINT FK_Members_TO_Authorities
		CASCADE;

ALTER TABLE Authorities
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Authorities;

/* 사용자 권한 */
DROP TABLE Authorities
	CASCADE CONSTRAINTS;

/* 사용자 권한 */
CREATE TABLE Authorities (
	Authority VARCHAR2(127) NOT NULL, /* 권한 */
	Email VARCHAR2(127) NOT NULL /* 이메일 */
);

COMMENT ON TABLE Authorities IS '사용자 권한';

COMMENT ON COLUMN Authorities.Authority IS '권한';

COMMENT ON COLUMN Authorities.Email IS '이메일';

CREATE UNIQUE INDEX PK_Authorities
	ON Authorities (
		Authority ASC,
		Email ASC
	);

ALTER TABLE Authorities
	ADD
		CONSTRAINT PK_Authorities
		PRIMARY KEY (
			Authority,
			Email
		);

ALTER TABLE Authorities
	ADD
		CONSTRAINT FK_Roles_TO_Authorities
		FOREIGN KEY (
			Authority
		)
		REFERENCES Roles (
			Authority
		);

ALTER TABLE Authorities
	ADD
		CONSTRAINT FK_Members_TO_Authorities
		FOREIGN KEY (
			Email
		)
		REFERENCES Members (
			Email
		) ON DELETE CASCADE;


-----------------------------------------------------------------------------------------------
-- 4. BoardForm(게시판형식코드)
-----------------------------------------------------------------------------------------------
-- 4.1 BoardForm(게시판형식코드) 테이블 삭제 및 생성
ALTER TABLE BoardForm
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_BoardForm;

/* 게시판형식 */
DROP TABLE BoardForm
	CASCADE CONSTRAINTS;

/* 게시판형식 */
CREATE TABLE BoardForm (
	FormCode NUMBER NOT NULL, /* 게시판형식코드 */
	FormName VARCHAR2(127) NOT NULL /* 게시판형식이름 */
);

COMMENT ON TABLE BoardForm IS '게시판형식';

COMMENT ON COLUMN BoardForm.FormCode IS '게시판형식코드';

COMMENT ON COLUMN BoardForm.FormName IS '게시판형식이름';

CREATE UNIQUE INDEX PK_BoardForm
	ON BoardForm (
		FormCode ASC
	);

ALTER TABLE BoardForm
	ADD
		CONSTRAINT PK_BoardForm
		PRIMARY KEY (
			FormCode
		);

-- 4.2 BoardForm(게시판형식코드) 데이터 입력
INSERT INTO BoardForm VALUES(1, 'Notice');
INSERT INTO BoardForm VALUES(2, 'History');
INSERT INTO BoardForm VALUES(3, 'Daily');
COMMIT;

-----------------------------------------------------------------------------------------------
-- 5. BoardKind(게시판종류)
-----------------------------------------------------------------------------------------------
-- 5.1 BoardKind(게시판종류) 테이블 삭제 및 생성
ALTER TABLE BoardKind
	DROP
		CONSTRAINT FK_BoardForm_TO_BoardKind
		CASCADE;

ALTER TABLE BoardKind
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_BoardKind;

/* 게시판종류 */
DROP TABLE BoardKind
	CASCADE CONSTRAINTS;

/* 게시판종류 */
CREATE TABLE BoardKind (
	BoardKindSeq NUMBER NOT NULL, /* 게시판번호 */
	BoardKindName VARCHAR2(127) NOT NULL, /* 게시판이름 */
	FormCode NUMBER NOT NULL /* 게시판형식코드 */
);

COMMENT ON TABLE BoardKind IS '게시판종류';

COMMENT ON COLUMN BoardKind.BoardKindSeq IS '게시판번호';

COMMENT ON COLUMN BoardKind.BoardKindName IS '게시판이름';

COMMENT ON COLUMN BoardKind.FormCode IS '게시판형식코드';

CREATE UNIQUE INDEX PK_BoardKind
	ON BoardKind (
		BoardKindSeq ASC
	);

ALTER TABLE BoardKind
	ADD
		CONSTRAINT PK_BoardKind
		PRIMARY KEY (
			BoardKindSeq
		);

ALTER TABLE BoardKind
	ADD
		CONSTRAINT FK_BoardForm_TO_BoardKind
		FOREIGN KEY (
			FormCode
		)
		REFERENCES BoardForm (
			FormCode
		);

-- 5.2 BoardKind(게시판형식코드) 데이터 입력
INSERT INTO BOARDKIND VALUES(1, '공지사항', 1);
INSERT INTO BOARDKIND VALUES(2, '개인기록', 2);
INSERT INTO BOARDKIND VALUES(3, '다이어리', 3);
COMMIT;


-----------------------------------------------------------------------------------------------
-- 6. PublicLevel(공개범위)
-----------------------------------------------------------------------------------------------
-- 6.1 PublicLevel(공개범위) 테이블 삭제 및 생성
ALTER TABLE PublicLevel
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_PublicLevel;

/* 공개범위 */
DROP TABLE PublicLevel
	CASCADE CONSTRAINTS;

/* 공개범위 */
CREATE TABLE PublicLevel (
	PublicLevelCode NUMBER NOT NULL, /* 공개범위코드 */
	PublicLevelName VARCHAR2(127) NOT NULL, /* 공개범위이름 */
	PublicLevelDescription VARCHAR2(127) /* 공개범위설명 */
);

COMMENT ON TABLE PublicLevel IS '공개범위';

COMMENT ON COLUMN PublicLevel.PublicLevelCode IS '공개범위코드';

COMMENT ON COLUMN PublicLevel.PublicLevelName IS '공개범위이름';

COMMENT ON COLUMN PublicLevel.PublicLevelDescription IS '공개범위설명';

CREATE UNIQUE INDEX PK_PublicLevel
	ON PublicLevel (
		PublicLevelCode ASC
	);

ALTER TABLE PublicLevel
	ADD
		CONSTRAINT PK_PublicLevel
		PRIMARY KEY (
			PublicLevelCode
		);

-- 6.2 PublicLevel(공개범위) 데이터 입력
INSERT INTO PublicLevel VALUES(1, 'Privacy', '나만보기');
INSERT INTO PublicLevel VALUES(2, 'Share', '친구공개(공유)');
INSERT INTO PublicLevel VALUES(3, 'Friend', '친구공개(모두)');
INSERT INTO PublicLevel VALUES(4, 'User', '사용자공개');
INSERT INTO PublicLevel VALUES(5, 'Public', '전체공개');
COMMIT;


-----------------------------------------------------------------------------------------------
-- 10. BoardGroup(과거기록그룹) > 7
-----------------------------------------------------------------------------------------------
-- 10.1 BoardGroup(과거기록그룹) 테이블 삭제 및 생성
ALTER TABLE BoardGroup
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_BoardGroup;

/* 과거기록그룹 */
DROP TABLE BoardGroup
	CASCADE CONSTRAINTS;

/* 과거기록그룹 */
CREATE TABLE BoardGroup (
	GroupSeq NUMBER NOT NULL, /* 과거기록그룹식별번호 */
  Email VARCHAR2(127) NOT NULL, /* 이메일 */
	GroupName VARCHAR2(127) NOT NULL, /* 과거기록그룹명 */
	IsImportantGroup INT, /* 중요그룹 */
	GroupStartDate DATE, /* 그룹발생시작일 */
	GroupEndDate DATE /* 그룹발생종료일 */
);

COMMENT ON TABLE BoardGroup IS '과거기록그룹';

COMMENT ON COLUMN BoardGroup.GroupSeq IS '과거기록그룹식별번호';

COMMENT ON COLUMN BoardGroup.Email IS '이메일';

COMMENT ON COLUMN BoardGroup.GroupName IS '과거기록그룹명';

COMMENT ON COLUMN BoardGroup.IsImportantGroup IS '중요그룹';

COMMENT ON COLUMN BoardGroup.GroupStartDate IS '그룹발생시작일';

COMMENT ON COLUMN BoardGroup.GroupEndDate IS '그룹발생종료일';

CREATE UNIQUE INDEX PK_BoardGroup
	ON BoardGroup (
		GroupSeq ASC
	);

ALTER TABLE BoardGroup
	ADD
		CONSTRAINT PK_BoardGroup
		PRIMARY KEY (
			GroupSeq
		);

ALTER TABLE BoardGroup
	ADD
		CONSTRAINT FK_Members_TO_BoardGroup
		FOREIGN KEY (
			Email
		)
		REFERENCES Members (
			Email
		) ON DELETE CASCADE;


-----------------------------------------------------------------------------------------------
-- 7. Board(게시판)
-----------------------------------------------------------------------------------------------
-- 7.1 Board(게시판) 테이블 삭제 및 생성
ALTER TABLE Board
	DROP
		CONSTRAINT FK_BoardKind_TO_Board
		CASCADE;

ALTER TABLE Board
	DROP
		CONSTRAINT FK_Members_TO_Board
		CASCADE;

ALTER TABLE Board
	DROP
		CONSTRAINT FK_PublicLevel_TO_Board
		CASCADE;

ALTER TABLE Board
	DROP
		CONSTRAINT FK_BoardGroup_TO_Board
		CASCADE;

ALTER TABLE Board
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Board;

/* 게시판 */
DROP TABLE Board
	CASCADE CONSTRAINTS;

/* 게시판 */
CREATE TABLE Board (
	BoardSeq NUMBER NOT NULL, /* 글번호 */
	BoardKindSeq NUMBER NOT NULL, /* 게시판번호 */
	Email VARCHAR2(127) NOT NULL, /* 이메일 */
	Content VARCHAR2(3095) NOT NULL, /* 내용 */
	WriteDate DATE NOT NULL, /* 작성일 */
	PublicLevelCode NUMBER DEFAULT 0 NOT NULL, /* 공개범위코드 */
	IsActivated INT DEFAULT 1 NOT NULL, /* 활성화 */
	GroupSeq NUMBER NOT NULL /* 과거기록그룹식별번호 */
);

COMMENT ON TABLE Board IS '게시판';

COMMENT ON COLUMN Board.BoardSeq IS '글번호';

COMMENT ON COLUMN Board.BoardKindSeq IS '게시판번호';

COMMENT ON COLUMN Board.Email IS '이메일';

COMMENT ON COLUMN Board.Content IS '내용';

COMMENT ON COLUMN Board.WriteDate IS '작성일';

COMMENT ON COLUMN Board.PublicLevelCode IS '공개범위코드';

COMMENT ON COLUMN Board.IsActivated IS '활성화';

COMMENT ON COLUMN Board.GroupSeq IS '과거기록그룹식별번호';

CREATE UNIQUE INDEX PK_Board
	ON Board (
		BoardSeq ASC
	);

ALTER TABLE Board
	ADD
		CONSTRAINT PK_Board
		PRIMARY KEY (
			BoardSeq
		);

ALTER TABLE Board
	ADD
		CONSTRAINT FK_BoardKind_TO_Board
		FOREIGN KEY (
			BoardKindSeq
		)
		REFERENCES BoardKind (
			BoardKindSeq
		);

ALTER TABLE Board
	ADD
		CONSTRAINT FK_Members_TO_Board
		FOREIGN KEY (
			Email
		)
		REFERENCES Members (
			Email
		) ON DELETE CASCADE;

ALTER TABLE Board
	ADD
		CONSTRAINT FK_PublicLevel_TO_Board
		FOREIGN KEY (
			PublicLevelCode
		)
		REFERENCES PublicLevel (
			PublicLevelCode
		);

ALTER TABLE Board
	ADD
		CONSTRAINT FK_BoardGroup_TO_Board
		FOREIGN KEY (
			GroupSeq
		)
		REFERENCES BoardGroup (
			GroupSeq
		) ON DELETE CASCADE;

-----------------------------------------------------------------------------------------------
-- 8. ProfileCodes(프로필항목)
-----------------------------------------------------------------------------------------------
-- 8.1 ProfileCodes(프로필항목) 테이블 삭제 및 생성
ALTER TABLE ProfileCodes
	DROP
		UNIQUE (
			ProfileName
		)
		CASCADE
		KEEP INDEX;

ALTER TABLE ProfileCodes
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX UIX_ProfileCodes;

DROP INDEX PK_ProfileCodes;

/* 프로필항목 */
DROP TABLE ProfileCodes
	CASCADE CONSTRAINTS;

/* 프로필항목 */
CREATE TABLE ProfileCodes (
	ProfileCode NUMBER NOT NULL, /* 프로필항목코드 */
	ProfileName VARCHAR2(127) NOT NULL /* 프로필이름 */
);

COMMENT ON TABLE ProfileCodes IS '프로필항목';

COMMENT ON COLUMN ProfileCodes.ProfileCode IS '프로필항목코드';

COMMENT ON COLUMN ProfileCodes.ProfileName IS '프로필이름';

CREATE UNIQUE INDEX PK_ProfileCodes
	ON ProfileCodes (
		ProfileCode ASC
	);

CREATE UNIQUE INDEX UIX_ProfileCodes
	ON ProfileCodes (
		ProfileName ASC
	);

ALTER TABLE ProfileCodes
	ADD
		CONSTRAINT PK_ProfileCodes
		PRIMARY KEY (
			ProfileCode
		);

ALTER TABLE ProfileCodes
	ADD
		CONSTRAINT UK_ProfileCodes
		UNIQUE (
			ProfileName
		);

-- 8.2 ProfileCodes(프로필항목) 데이터 입력
INSERT INTO ProfileCodes VALUES(1, '사는곳');
INSERT INTO ProfileCodes VALUES(2, '프로필사진');
INSERT INTO ProfileCodes VALUES(3, '공개이메일');
INSERT INTO ProfileCodes VALUES(4, '휴대폰번호');
INSERT INTO ProfileCodes VALUES(5, '상태글');
INSERT INTO ProfileCodes VALUES(6, '종교');
INSERT INTO ProfileCodes VALUES(7, '정치성향');
INSERT INTO ProfileCodes VALUES(8, '언어');
INSERT INTO ProfileCodes VALUES(9, '블로그');
INSERT INTO ProfileCodes VALUES(10, '생일');
COMMIT;


-----------------------------------------------------------------------------------------------
-- 9. Profiles(사용자프로필)
-----------------------------------------------------------------------------------------------
-- 9.1 Profiles(사용자프로필) 테이블 삭제 및 생성
ALTER TABLE Profiles
	DROP
		CONSTRAINT FK_ProfileCodes_TO_Profiles
		CASCADE;

ALTER TABLE Profiles
	DROP
		CONSTRAINT FK_PublicLevel_TO_Profiles
		CASCADE;

ALTER TABLE Profiles
	DROP
		CONSTRAINT FK_Members_TO_Profiles
		CASCADE;

ALTER TABLE Profiles
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Profiles;

/* 사용자프로필 */
DROP TABLE Profiles
	CASCADE CONSTRAINTS;

/* 사용자프로필 */
CREATE TABLE Profiles (
	ProfileSeq NUMBER NOT NULL, /* 사용자프로필식별번호 */
	ProfileCode NUMBER NOT NULL, /* 프로필항목코드 */
	ProfileInfo VARCHAR2(127), /* 프로필내용 */
	PublicLevelCode NUMBER NOT NULL, /* 공개범위코드 */
	Email VARCHAR2(127) NOT NULL /* 이메일 */
);

COMMENT ON TABLE Profiles IS '사용자프로필';

COMMENT ON COLUMN Profiles.ProfileSeq IS '사용자프로필식별번호';

COMMENT ON COLUMN Profiles.ProfileCode IS '프로필항목코드';

COMMENT ON COLUMN Profiles.ProfileInfo IS '프로필내용';

COMMENT ON COLUMN Profiles.PublicLevelCode IS '공개범위코드';

COMMENT ON COLUMN Profiles.Email IS '이메일';

CREATE UNIQUE INDEX PK_Profiles
	ON Profiles (
		ProfileSeq ASC
	);

ALTER TABLE Profiles
	ADD
		CONSTRAINT PK_Profiles
		PRIMARY KEY (
			ProfileSeq
		);

ALTER TABLE Profiles
	ADD
		CONSTRAINT FK_ProfileCodes_TO_Profiles
		FOREIGN KEY (
			ProfileCode
		)
		REFERENCES ProfileCodes (
			ProfileCode
		);

ALTER TABLE Profiles
	ADD
		CONSTRAINT FK_PublicLevel_TO_Profiles
		FOREIGN KEY (
			PublicLevelCode
		)
		REFERENCES PublicLevel (
			PublicLevelCode
		);

ALTER TABLE Profiles
	ADD
		CONSTRAINT FK_Members_TO_Profiles
		FOREIGN KEY (
			Email
		)
		REFERENCES Members (
			Email
		) ON DELETE CASCADE;









-----------------------------------------------------------------------------------------------
-- 11. History(과거기록)
-----------------------------------------------------------------------------------------------
-- 11.1 History(과거기록) 테이블 삭제 및 생성
ALTER TABLE History
	DROP
		CONSTRAINT FK_Board_TO_History
		CASCADE;

ALTER TABLE History
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_History;

/* 개인기록 */
DROP TABLE History
	CASCADE CONSTRAINTS;

/* 개인기록 */
CREATE TABLE History (
	BoardSeq NUMBER NOT NULL, /* 글번호 */
	StartDate DATE, /* 발생시작일 */
	EndDate DATE, /* 발생종료일 */
	Feelings VARCHAR2(127), /* 기분 */
	Weather VARCHAR2(127), /* 날씨 */
	IsImportant INT, /* 중요 */
	IsShare INT, /* 공유 */
	Keyword VARCHAR2(127), /* 핵심키워드 */
	Place VARCHAR2(255) /* 장소 */
);

COMMENT ON TABLE History IS '개인기록';

COMMENT ON COLUMN History.BoardSeq IS '글번호';

COMMENT ON COLUMN History.StartDate IS '발생시작일';

COMMENT ON COLUMN History.EndDate IS '발생종료일';

COMMENT ON COLUMN History.Feelings IS '기분';

COMMENT ON COLUMN History.Weather IS '날씨';

COMMENT ON COLUMN History.IsImportant IS '중요';

COMMENT ON COLUMN History.IsShare IS '공유';

COMMENT ON COLUMN History.Keyword IS '핵심키워드';

COMMENT ON COLUMN History.Place IS '장소';

CREATE UNIQUE INDEX PK_History
	ON History (
		BoardSeq ASC
	);

ALTER TABLE History
	ADD
		CONSTRAINT PK_History
		PRIMARY KEY (
			BoardSeq
		);

ALTER TABLE History
	ADD
		CONSTRAINT FK_Board_TO_History
		FOREIGN KEY (
			BoardSeq
		)
		REFERENCES Board (
			BoardSeq
		) ON DELETE CASCADE;

-----------------------------------------------------------------------------------------------
-- 12. Media(미디어)
-----------------------------------------------------------------------------------------------
-- 12.1 Media(미디어) 테이블 삭제 및 생성
ALTER TABLE Media
	DROP
		CONSTRAINT FK_Board_TO_Media
		CASCADE;

ALTER TABLE Media
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Media;

/* 미디어 */
DROP TABLE Media
	CASCADE CONSTRAINTS;

/* 미디어 */
CREATE TABLE Media (
	BoardSeq NUMBER NOT NULL, /* 글번호 */
	Filename VARCHAR2(127) NOT NULL, /* 파일명 */
	Filesize NUMBER NOT NULL, /* 파일크기 */
	Extension VARCHAR2(127) NOT NULL /* 파일확장자 */
);

COMMENT ON TABLE Media IS '미디어';

COMMENT ON COLUMN Media.BoardSeq IS '글번호';

COMMENT ON COLUMN Media.Filename IS '파일명';

COMMENT ON COLUMN Media.Filesize IS '파일크기';

COMMENT ON COLUMN Media.Extension IS '파일확장자';

CREATE UNIQUE INDEX PK_Media
	ON Media (
		BoardSeq ASC
	);

ALTER TABLE Media
	ADD
		CONSTRAINT PK_Media
		PRIMARY KEY (
			BoardSeq
		);

ALTER TABLE Media
	ADD
		CONSTRAINT FK_Board_TO_Media
		FOREIGN KEY (
			BoardSeq
		)
		REFERENCES Board (
			BoardSeq
		) ON DELETE CASCADE;



-----------------------------------------------------------------------------------------------
-- 13. NotificationCodes(알림)
-----------------------------------------------------------------------------------------------
-- 13.1 NotificationCodes(알림) 테이블 삭제 및 생성
ALTER TABLE NotificationCodes
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_NotificationCodes;

/* 알림 */
DROP TABLE NotificationCodes
	CASCADE CONSTRAINTS;

/* 알림 */
CREATE TABLE NotificationCodes (
	NotificationCode NUMBER NOT NULL, /* 알림코드 */
	NotificationName VARCHAR2(127) NOT NULL /* 알림이름 */
);

COMMENT ON TABLE NotificationCodes IS '알림';

COMMENT ON COLUMN NotificationCodes.NotificationCode IS '알림코드';

COMMENT ON COLUMN NotificationCodes.NotificationName IS '알림이름';

CREATE UNIQUE INDEX PK_NotificationCodes
	ON NotificationCodes (
		NotificationCode ASC
	);

ALTER TABLE NotificationCodes
	ADD
		CONSTRAINT PK_NotificationCodes
		PRIMARY KEY (
			NotificationCode
		);

-- 13.1 NotificationCodes(알림) 데이터 입력
INSERT INTO NotificationCodes VALUES(1, '공지사항');
INSERT INTO NotificationCodes VALUES(2, '친구신청');
INSERT INTO NotificationCodes VALUES(3, '친구신청수락');
INSERT INTO NotificationCodes VALUES(4, '공유신청');
INSERT INTO NotificationCodes VALUES(5, '공유신청수락');
INSERT INTO NotificationCodes VALUES(6, '댓글');



-----------------------------------------------------------------------------------------------
-- 13. Notifications(사용자 알림)
-----------------------------------------------------------------------------------------------
-- 13.1 Notifications(사용자 알림) 테이블 삭제 및 생성
ALTER TABLE Notifications
	DROP
		CONSTRAINT FK_Members_TO_Notifications
		CASCADE;

ALTER TABLE Notifications
	DROP
		CONSTRAINT FK_NotificationCodes_TO_Notifications
		CASCADE;

ALTER TABLE Notifications
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Notifications;

/* 사용자알림 */
DROP TABLE Notifications
	CASCADE CONSTRAINTS;

/* 사용자알림 */
CREATE TABLE Notifications (
	NotificationSeq NUMBER NOT NULL, /* 사용자알림번호 */
	Email VARCHAR2(127) NOT NULL, /* 이메일 */
	IsRead INT NOT NULL, /* 읽은알림 */
	CreateDate DATE NOT NULL, /* 발생일자 */
	NotificationCode NUMBER NOT NULL /* 알림코드 */
);

COMMENT ON TABLE Notifications IS '사용자알림';

COMMENT ON COLUMN Notifications.NotificationSeq IS '사용자알림번호';

COMMENT ON COLUMN Notifications.Email IS '이메일';

COMMENT ON COLUMN Notifications.IsRead IS '읽은알림';

COMMENT ON COLUMN Notifications.CreateDate IS '발생일자';

COMMENT ON COLUMN Notifications.NotificationCode IS '알림코드';

CREATE UNIQUE INDEX PK_Notifications
	ON Notifications (
		NotificationSeq ASC
	);

ALTER TABLE Notifications
	ADD
		CONSTRAINT PK_Notifications
		PRIMARY KEY (
			NotificationSeq
		);

ALTER TABLE Notifications
	ADD
		CONSTRAINT FK_Members_TO_Notifications
		FOREIGN KEY (
			Email
		)
		REFERENCES Members (
			Email
		) ON DELETE CASCADE;

ALTER TABLE Notifications
	ADD
		CONSTRAINT FK_NotifCodes_TO_Notifications
		FOREIGN KEY (
			NotificationCode
		)
		REFERENCES NotificationCodes (
			NotificationCode
		);






-----------------------------------------------------------------------------------------------
-- 14. Friendship(친구)
-----------------------------------------------------------------------------------------------
-- 14.1 Friendship(친구) 테이블 삭제 및  생성
/* 친구 */
ALTER TABLE Friendship
	DROP
		CONSTRAINT FK_Members_TO_Friendship
		CASCADE;

ALTER TABLE Friendship
	DROP
		CONSTRAINT FK_Members_TO_Friendship2
		CASCADE;

ALTER TABLE Friendship
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Friendship;

/* 친구 */
DROP TABLE Friendship
	CASCADE CONSTRAINTS;

/* 친구 */
CREATE TABLE Friendship (
	Email VARCHAR2(127) NOT NULL, /* 내이메일 */
	FriendEmail VARCHAR2(127) NOT NULL /* 친구이메일 */
);

COMMENT ON TABLE Friendship IS '친구';

COMMENT ON COLUMN Friendship.Email IS '내이메일';

COMMENT ON COLUMN Friendship.FriendEmail IS '친구이메일';

CREATE UNIQUE INDEX PK_Friendship
	ON Friendship (
		Email ASC,
		FriendEmail ASC
	);

ALTER TABLE Friendship
	ADD
		CONSTRAINT PK_Friendship
		PRIMARY KEY (
			Email,
			FriendEmail
		);

ALTER TABLE Friendship
	ADD
		CONSTRAINT FK_Members_TO_Friendship
		FOREIGN KEY (
			FriendEmail
		)
		REFERENCES Members (
			Email
		) ON DELETE CASCADE;

ALTER TABLE Friendship
	ADD
		CONSTRAINT FK_Members_TO_Friendship2
		FOREIGN KEY (
			Email
		)
		REFERENCES Members (
			Email
		);






-----------------------------------------------------------------------------------------------
-- 15. FriendshipNotification(친구알림)
-----------------------------------------------------------------------------------------------
-- 15.1 FriendshipNotification(친구알림) 테이블 삭제 및 생성
/* 친구알림 */
ALTER TABLE FriendshipNotification
	DROP
		CONSTRAINT FK_Notif_TO_FriendshipNotif
		CASCADE;

ALTER TABLE FriendshipNotification
	DROP
		CONSTRAINT FK_Members_TO_FriendshipNotif
		CASCADE;

ALTER TABLE FriendshipNotification
	DROP
		CONSTRAINT FK_Members_TO_FriendshipNotif2
		CASCADE;

ALTER TABLE FriendshipNotification
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_FriendshipNotification;

/* 친구알림 */
DROP TABLE FriendshipNotification
	CASCADE CONSTRAINTS;

/* 친구알림 */
CREATE TABLE FriendshipNotification (
	NotificationSeq NUMBER NOT NULL, /* 사용자알림번호 */
	Email VARCHAR2(127) NOT NULL, /* 이메일 */
	FriendEmail VARCHAR2(127) NOT NULL, /* 친구이메일 */
	FriendshipConfirm INT /* 친구신청확인 */
);

COMMENT ON TABLE FriendshipNotification IS '친구알림';

COMMENT ON COLUMN FriendshipNotification.NotificationSeq IS '사용자알림번호';

COMMENT ON COLUMN FriendshipNotification.Email IS '이메일';

COMMENT ON COLUMN FriendshipNotification.FriendEmail IS '친구이메일';

COMMENT ON COLUMN FriendshipNotification.FriendshipConfirm IS '친구신청확인';

CREATE UNIQUE INDEX PK_FriendshipNotification
	ON FriendshipNotification (
		NotificationSeq ASC
	);

ALTER TABLE FriendshipNotification
	ADD
		CONSTRAINT PK_FriendshipNotification
		PRIMARY KEY (
			NotificationSeq
		);

ALTER TABLE FriendshipNotification
	ADD
		CONSTRAINT FK_Notif_TO_FriendshipNotif
		FOREIGN KEY (
			NotificationSeq
		)
		REFERENCES Notifications (
			NotificationSeq
		) ON DELETE CASCADE;

ALTER TABLE FriendshipNotification
	ADD
		CONSTRAINT FK_Members_TO_FriendshipNotif
		FOREIGN KEY (
			Email
		)
		REFERENCES Members (
			Email
		) ON DELETE CASCADE;

ALTER TABLE FriendshipNotification
	ADD
		CONSTRAINT FK_Members_TO_FriendshipNotif2
		FOREIGN KEY (
			FriendEmail
		)
		REFERENCES Members (
			Email
		);

































































-----------------------------------------------------------------------------------------------
-- Test용 테이블
-----------------------------------------------------------------------------------------------
ALTER TABLE TEST
	DROP
		CONSTRAINT PK_Test
		CASCADE;

DROP INDEX PK_Test;

DROP TABLE TEST
	CASCADE CONSTRAINTS;

CREATE TABLE TEST(
seq NUMBER NOT NULL,
content VARCHAR2(127)
);

ALTER TABLE TEST
	ADD
		CONSTRAINT PK_Test
		PRIMARY KEY (
			seq
		);
