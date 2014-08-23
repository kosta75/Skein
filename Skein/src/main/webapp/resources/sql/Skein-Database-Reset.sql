-----------------------------------------------------------------------------------------------
-- 1. Roles(����)
-----------------------------------------------------------------------------------------------
-- 1.1 Roles(����) ���̺� ���� �� ����
ALTER TABLE Roles
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Roles;

/* ���� */
DROP TABLE Roles
	CASCADE CONSTRAINTS;

/* ���� */
CREATE TABLE Roles (
	Authority VARCHAR2(127) NOT NULL, /* ���� */
	RoleName VARCHAR2(127) NOT NULL, /* �����̸� */
	Discription VARCHAR2(127) /* ���Ѽ��� */
);

COMMENT ON TABLE Roles IS '����';

COMMENT ON COLUMN Roles.Authority IS '����';

COMMENT ON COLUMN Roles.RoleName IS '�����̸�';

COMMENT ON COLUMN Roles.Discription IS '���Ѽ���';

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

-- 1.2 ���� ������ �Է� (�ݵ�� ����Ǿ�� �Ѵ�)
INSERT INTO ROLES(Authority, RoleName, Discription) VALUES('IS_AUTHENTICATED_ANONYMOUSLY','AnonymousUser','�͸� �����');
INSERT INTO ROLES(Authority, RoleName, Discription) VALUES('IS_AUTHENTICATED_REMEMBERED','RememberedUser','REMEMBERED �����');
INSERT INTO ROLES(Authority, RoleName, Discription) VALUES('IS_AUTHENTICATED_FULLY','ApprovedUser','������ �����');
INSERT INTO ROLES(Authority, RoleName, Discription) VALUES('ROLE_RESTRICTED','NotApprovedUser','���ѵ� �����');
INSERT INTO ROLES(Authority, RoleName, Discription) VALUES('ROLE_USER','User','�Ϲ� �����');
INSERT INTO ROLES(Authority, RoleName, Discription) VALUES('ROLE_ADMIN','Admin','������');
COMMIT;

-----------------------------------------------------------------------------------------------
-- 2. Members(�����)
-----------------------------------------------------------------------------------------------
-- 2.1 Members(�����) ���̺� ����
/* ����� */
CREATE TABLE Members (
	Email VARCHAR2(127) NOT NULL, /* �̸��� */
	LastName VARCHAR2(127) NOT NULL, /* �� */
	FirstName VARCHAR2(127) NOT NULL, /* �̸� */
	FullName VARCHAR2(127) NOT NULL, /* ��ü�̸� */
	Password VARCHAR2(127) NOT NULL, /* ��й�ȣ */
	BirthDay DATE NOT NULL, /* ������� */
	PersonalURI VARCHAR2(255) NOT NULL, /* ����ڰ����ּ� */
	IsApproved INT DEFAULT 0 NOT NULL, /* �������ο��� */
	IsLockedOut INT DEFAULT 0 NOT NULL, /* ������⿩�� */
	IsDomranted INT DEFAULT 0 NOT NULL, /* �����޸鿩�� */
	IsDropedOut INT DEFAULT 0 NOT NULL, /* ����Ż�𿩺� */
	CreateDate DATE NOT NULL, /* �����ѳ�¥ */
	LastLoginDate DATE, /* �������α��γ�¥ */
	LastPasswordChangedDate DATE, /* ��������й�ȣ���泯¥ */
	FailedPasswordAttemptCount NUMBER DEFAULT 0 NOT NULL, /* ��й�ȣ����Ƚ�� */
	CertificationText VARCHAR2(255) NOT NULL, /* ������������ */
  ColorTheme VARCHAR2(127) /* ������������� */
);

COMMENT ON TABLE Members IS '�����';

COMMENT ON COLUMN Members.Email IS '�̸���';

COMMENT ON COLUMN Members.LastName IS '��';

COMMENT ON COLUMN Members.FirstName IS '�̸�';

COMMENT ON COLUMN Members.FullName IS '��ü�̸�';

COMMENT ON COLUMN Members.Password IS '��й�ȣ';

COMMENT ON COLUMN Members.BirthDay IS '�������';

COMMENT ON COLUMN Members.PersonalURI IS '����ڰ����ּ�';

COMMENT ON COLUMN Members.IsApproved IS '�������ο���';

COMMENT ON COLUMN Members.IsLockedOut IS '������⿩��';

COMMENT ON COLUMN Members.IsDomranted IS '�����޸鿩��';

COMMENT ON COLUMN Members.IsDropedOut IS '����Ż�𿩺�';

COMMENT ON COLUMN Members.CreateDate IS '�����ѳ�¥';

COMMENT ON COLUMN Members.LastLoginDate IS '�������α��γ�¥';

COMMENT ON COLUMN Members.LastPasswordChangedDate IS '��������й�ȣ���泯¥';

COMMENT ON COLUMN Members.FailedPasswordAttemptCount IS '��й�ȣ����Ƚ��';

COMMENT ON COLUMN Members.CertificationText IS '������������';

COMMENT ON COLUMN Members.ColorTheme IS '�������������';

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
-- 3. Authorities(����ڱ���)
-----------------------------------------------------------------------------------------------
-- 3.1 Authorities(����ڱ���) ���̺� ���� �� ����
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

/* ����� ���� */
DROP TABLE Authorities
	CASCADE CONSTRAINTS;

/* ����� ���� */
CREATE TABLE Authorities (
	Authority VARCHAR2(127) NOT NULL, /* ���� */
	Email VARCHAR2(127) NOT NULL /* �̸��� */
);

COMMENT ON TABLE Authorities IS '����� ����';

COMMENT ON COLUMN Authorities.Authority IS '����';

COMMENT ON COLUMN Authorities.Email IS '�̸���';

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
-- 4. BoardForm(�Խ��������ڵ�)
-----------------------------------------------------------------------------------------------
-- 4.1 BoardForm(�Խ��������ڵ�) ���̺� ���� �� ����
ALTER TABLE BoardForm
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_BoardForm;

/* �Խ������� */
DROP TABLE BoardForm
	CASCADE CONSTRAINTS;

/* �Խ������� */
CREATE TABLE BoardForm (
	FormCode NUMBER NOT NULL, /* �Խ��������ڵ� */
	FormName VARCHAR2(127) NOT NULL /* �Խ��������̸� */
);

COMMENT ON TABLE BoardForm IS '�Խ�������';

COMMENT ON COLUMN BoardForm.FormCode IS '�Խ��������ڵ�';

COMMENT ON COLUMN BoardForm.FormName IS '�Խ��������̸�';

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

-- 4.2 BoardForm(�Խ��������ڵ�) ������ �Է�
INSERT INTO BoardForm VALUES(1, 'Notice');
INSERT INTO BoardForm VALUES(2, 'History');
INSERT INTO BoardForm VALUES(3, 'Daily');
COMMIT;

-----------------------------------------------------------------------------------------------
-- 5. BoardKind(�Խ�������)
-----------------------------------------------------------------------------------------------
-- 5.1 BoardKind(�Խ�������) ���̺� ���� �� ����
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

/* �Խ������� */
DROP TABLE BoardKind
	CASCADE CONSTRAINTS;

/* �Խ������� */
CREATE TABLE BoardKind (
	BoardKindSeq NUMBER NOT NULL, /* �Խ��ǹ�ȣ */
	BoardKindName VARCHAR2(127) NOT NULL, /* �Խ����̸� */
	FormCode NUMBER NOT NULL /* �Խ��������ڵ� */
);

COMMENT ON TABLE BoardKind IS '�Խ�������';

COMMENT ON COLUMN BoardKind.BoardKindSeq IS '�Խ��ǹ�ȣ';

COMMENT ON COLUMN BoardKind.BoardKindName IS '�Խ����̸�';

COMMENT ON COLUMN BoardKind.FormCode IS '�Խ��������ڵ�';

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

-- 5.2 BoardKind(�Խ��������ڵ�) ������ �Է�
INSERT INTO BOARDKIND VALUES(1, '��������', 1);
INSERT INTO BOARDKIND VALUES(2, '���α��', 2);
INSERT INTO BOARDKIND VALUES(3, '���̾', 3);
COMMIT;


-----------------------------------------------------------------------------------------------
-- 6. PublicLevel(��������)
-----------------------------------------------------------------------------------------------
-- 6.1 PublicLevel(��������) ���̺� ���� �� ����
ALTER TABLE PublicLevel
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_PublicLevel;

/* �������� */
DROP TABLE PublicLevel
	CASCADE CONSTRAINTS;

/* �������� */
CREATE TABLE PublicLevel (
	PublicLevelCode NUMBER NOT NULL, /* ���������ڵ� */
	PublicLevelName VARCHAR2(127) NOT NULL, /* ���������̸� */
	PublicLevelDescription VARCHAR2(127) /* ������������ */
);

COMMENT ON TABLE PublicLevel IS '��������';

COMMENT ON COLUMN PublicLevel.PublicLevelCode IS '���������ڵ�';

COMMENT ON COLUMN PublicLevel.PublicLevelName IS '���������̸�';

COMMENT ON COLUMN PublicLevel.PublicLevelDescription IS '������������';

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

-- 6.2 PublicLevel(��������) ������ �Է�
INSERT INTO PublicLevel VALUES(1, 'Privacy', '��������');
INSERT INTO PublicLevel VALUES(2, 'Share', 'ģ������(����)');
INSERT INTO PublicLevel VALUES(3, 'Friend', 'ģ������(���)');
INSERT INTO PublicLevel VALUES(4, 'User', '����ڰ���');
INSERT INTO PublicLevel VALUES(5, 'Public', '��ü����');
COMMIT;


-----------------------------------------------------------------------------------------------
-- 10. BoardGroup(���ű�ϱ׷�) > 7
-----------------------------------------------------------------------------------------------
-- 10.1 BoardGroup(���ű�ϱ׷�) ���̺� ���� �� ����
ALTER TABLE BoardGroup
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_BoardGroup;

/* ���ű�ϱ׷� */
DROP TABLE BoardGroup
	CASCADE CONSTRAINTS;

/* ���ű�ϱ׷� */
CREATE TABLE BoardGroup (
	GroupSeq NUMBER NOT NULL, /* ���ű�ϱ׷�ĺ���ȣ */
  Email VARCHAR2(127) NOT NULL, /* �̸��� */
	GroupName VARCHAR2(127) NOT NULL, /* ���ű�ϱ׷�� */
	IsImportantGroup INT, /* �߿�׷� */
	GroupStartDate DATE, /* �׷�߻������� */
	GroupEndDate DATE /* �׷�߻������� */
);

COMMENT ON TABLE BoardGroup IS '���ű�ϱ׷�';

COMMENT ON COLUMN BoardGroup.GroupSeq IS '���ű�ϱ׷�ĺ���ȣ';

COMMENT ON COLUMN BoardGroup.Email IS '�̸���';

COMMENT ON COLUMN BoardGroup.GroupName IS '���ű�ϱ׷��';

COMMENT ON COLUMN BoardGroup.IsImportantGroup IS '�߿�׷�';

COMMENT ON COLUMN BoardGroup.GroupStartDate IS '�׷�߻�������';

COMMENT ON COLUMN BoardGroup.GroupEndDate IS '�׷�߻�������';

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
-- 7. Board(�Խ���)
-----------------------------------------------------------------------------------------------
-- 7.1 Board(�Խ���) ���̺� ���� �� ����
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

/* �Խ��� */
DROP TABLE Board
	CASCADE CONSTRAINTS;

/* �Խ��� */
CREATE TABLE Board (
	BoardSeq NUMBER NOT NULL, /* �۹�ȣ */
	BoardKindSeq NUMBER NOT NULL, /* �Խ��ǹ�ȣ */
	Email VARCHAR2(127) NOT NULL, /* �̸��� */
	Content VARCHAR2(3095) NOT NULL, /* ���� */
	WriteDate DATE NOT NULL, /* �ۼ��� */
	PublicLevelCode NUMBER DEFAULT 0 NOT NULL, /* ���������ڵ� */
	IsActivated INT DEFAULT 1 NOT NULL, /* Ȱ��ȭ */
	GroupSeq NUMBER NOT NULL /* ���ű�ϱ׷�ĺ���ȣ */
);

COMMENT ON TABLE Board IS '�Խ���';

COMMENT ON COLUMN Board.BoardSeq IS '�۹�ȣ';

COMMENT ON COLUMN Board.BoardKindSeq IS '�Խ��ǹ�ȣ';

COMMENT ON COLUMN Board.Email IS '�̸���';

COMMENT ON COLUMN Board.Content IS '����';

COMMENT ON COLUMN Board.WriteDate IS '�ۼ���';

COMMENT ON COLUMN Board.PublicLevelCode IS '���������ڵ�';

COMMENT ON COLUMN Board.IsActivated IS 'Ȱ��ȭ';

COMMENT ON COLUMN Board.GroupSeq IS '���ű�ϱ׷�ĺ���ȣ';

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
-- 8. ProfileCodes(�������׸�)
-----------------------------------------------------------------------------------------------
-- 8.1 ProfileCodes(�������׸�) ���̺� ���� �� ����
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

/* �������׸� */
DROP TABLE ProfileCodes
	CASCADE CONSTRAINTS;

/* �������׸� */
CREATE TABLE ProfileCodes (
	ProfileCode NUMBER NOT NULL, /* �������׸��ڵ� */
	ProfileName VARCHAR2(127) NOT NULL /* �������̸� */
);

COMMENT ON TABLE ProfileCodes IS '�������׸�';

COMMENT ON COLUMN ProfileCodes.ProfileCode IS '�������׸��ڵ�';

COMMENT ON COLUMN ProfileCodes.ProfileName IS '�������̸�';

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

-- 8.2 ProfileCodes(�������׸�) ������ �Է�
INSERT INTO ProfileCodes VALUES(1, '��°�');
INSERT INTO ProfileCodes VALUES(2, '�����ʻ���');
INSERT INTO ProfileCodes VALUES(3, '�����̸���');
INSERT INTO ProfileCodes VALUES(4, '�޴�����ȣ');
INSERT INTO ProfileCodes VALUES(5, '���±�');
INSERT INTO ProfileCodes VALUES(6, '����');
INSERT INTO ProfileCodes VALUES(7, '��ġ����');
INSERT INTO ProfileCodes VALUES(8, '���');
INSERT INTO ProfileCodes VALUES(9, '��α�');
INSERT INTO ProfileCodes VALUES(10, '����');
COMMIT;


-----------------------------------------------------------------------------------------------
-- 9. Profiles(�����������)
-----------------------------------------------------------------------------------------------
-- 9.1 Profiles(�����������) ���̺� ���� �� ����
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

/* ����������� */
DROP TABLE Profiles
	CASCADE CONSTRAINTS;

/* ����������� */
CREATE TABLE Profiles (
	ProfileSeq NUMBER NOT NULL, /* ����������ʽĺ���ȣ */
	ProfileCode NUMBER NOT NULL, /* �������׸��ڵ� */
	ProfileInfo VARCHAR2(127), /* �����ʳ��� */
	PublicLevelCode NUMBER NOT NULL, /* ���������ڵ� */
	Email VARCHAR2(127) NOT NULL /* �̸��� */
);

COMMENT ON TABLE Profiles IS '�����������';

COMMENT ON COLUMN Profiles.ProfileSeq IS '����������ʽĺ���ȣ';

COMMENT ON COLUMN Profiles.ProfileCode IS '�������׸��ڵ�';

COMMENT ON COLUMN Profiles.ProfileInfo IS '�����ʳ���';

COMMENT ON COLUMN Profiles.PublicLevelCode IS '���������ڵ�';

COMMENT ON COLUMN Profiles.Email IS '�̸���';

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
-- 11. History(���ű��)
-----------------------------------------------------------------------------------------------
-- 11.1 History(���ű��) ���̺� ���� �� ����
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

/* ���α�� */
DROP TABLE History
	CASCADE CONSTRAINTS;

/* ���α�� */
CREATE TABLE History (
	BoardSeq NUMBER NOT NULL, /* �۹�ȣ */
	StartDate DATE, /* �߻������� */
	EndDate DATE, /* �߻������� */
	Feelings VARCHAR2(127), /* ��� */
	Weather VARCHAR2(127), /* ���� */
	IsImportant INT, /* �߿� */
	IsShare INT, /* ���� */
	Keyword VARCHAR2(127), /* �ٽ�Ű���� */
	Place VARCHAR2(255) /* ��� */
);

COMMENT ON TABLE History IS '���α��';

COMMENT ON COLUMN History.BoardSeq IS '�۹�ȣ';

COMMENT ON COLUMN History.StartDate IS '�߻�������';

COMMENT ON COLUMN History.EndDate IS '�߻�������';

COMMENT ON COLUMN History.Feelings IS '���';

COMMENT ON COLUMN History.Weather IS '����';

COMMENT ON COLUMN History.IsImportant IS '�߿�';

COMMENT ON COLUMN History.IsShare IS '����';

COMMENT ON COLUMN History.Keyword IS '�ٽ�Ű����';

COMMENT ON COLUMN History.Place IS '���';

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
-- 12. Media(�̵��)
-----------------------------------------------------------------------------------------------
-- 12.1 Media(�̵��) ���̺� ���� �� ����
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

/* �̵�� */
DROP TABLE Media
	CASCADE CONSTRAINTS;

/* �̵�� */
CREATE TABLE Media (
	BoardSeq NUMBER NOT NULL, /* �۹�ȣ */
	Filename VARCHAR2(127) NOT NULL, /* ���ϸ� */
	Filesize NUMBER NOT NULL, /* ����ũ�� */
	Extension VARCHAR2(127) NOT NULL /* ����Ȯ���� */
);

COMMENT ON TABLE Media IS '�̵��';

COMMENT ON COLUMN Media.BoardSeq IS '�۹�ȣ';

COMMENT ON COLUMN Media.Filename IS '���ϸ�';

COMMENT ON COLUMN Media.Filesize IS '����ũ��';

COMMENT ON COLUMN Media.Extension IS '����Ȯ����';

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
-- 13. NotificationCodes(�˸�)
-----------------------------------------------------------------------------------------------
-- 13.1 NotificationCodes(�˸�) ���̺� ���� �� ����
ALTER TABLE NotificationCodes
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_NotificationCodes;

/* �˸� */
DROP TABLE NotificationCodes
	CASCADE CONSTRAINTS;

/* �˸� */
CREATE TABLE NotificationCodes (
	NotificationCode NUMBER NOT NULL, /* �˸��ڵ� */
	NotificationName VARCHAR2(127) NOT NULL /* �˸��̸� */
);

COMMENT ON TABLE NotificationCodes IS '�˸�';

COMMENT ON COLUMN NotificationCodes.NotificationCode IS '�˸��ڵ�';

COMMENT ON COLUMN NotificationCodes.NotificationName IS '�˸��̸�';

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

-- 13.1 NotificationCodes(�˸�) ������ �Է�
INSERT INTO NotificationCodes VALUES(1, '��������');
INSERT INTO NotificationCodes VALUES(2, 'ģ����û');
INSERT INTO NotificationCodes VALUES(3, 'ģ����û����');
INSERT INTO NotificationCodes VALUES(4, '������û');
INSERT INTO NotificationCodes VALUES(5, '������û����');
INSERT INTO NotificationCodes VALUES(6, '���');



-----------------------------------------------------------------------------------------------
-- 13. Notifications(����� �˸�)
-----------------------------------------------------------------------------------------------
-- 13.1 Notifications(����� �˸�) ���̺� ���� �� ����
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

/* ����ھ˸� */
DROP TABLE Notifications
	CASCADE CONSTRAINTS;

/* ����ھ˸� */
CREATE TABLE Notifications (
	NotificationSeq NUMBER NOT NULL, /* ����ھ˸���ȣ */
	Email VARCHAR2(127) NOT NULL, /* �̸��� */
	IsRead INT NOT NULL, /* �����˸� */
	CreateDate DATE NOT NULL, /* �߻����� */
	NotificationCode NUMBER NOT NULL /* �˸��ڵ� */
);

COMMENT ON TABLE Notifications IS '����ھ˸�';

COMMENT ON COLUMN Notifications.NotificationSeq IS '����ھ˸���ȣ';

COMMENT ON COLUMN Notifications.Email IS '�̸���';

COMMENT ON COLUMN Notifications.IsRead IS '�����˸�';

COMMENT ON COLUMN Notifications.CreateDate IS '�߻�����';

COMMENT ON COLUMN Notifications.NotificationCode IS '�˸��ڵ�';

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
-- 14. Friendship(ģ��)
-----------------------------------------------------------------------------------------------
-- 14.1 Friendship(ģ��) ���̺� ���� ��  ����
/* ģ�� */
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

/* ģ�� */
DROP TABLE Friendship
	CASCADE CONSTRAINTS;

/* ģ�� */
CREATE TABLE Friendship (
	Email VARCHAR2(127) NOT NULL, /* ���̸��� */
	FriendEmail VARCHAR2(127) NOT NULL /* ģ���̸��� */
);

COMMENT ON TABLE Friendship IS 'ģ��';

COMMENT ON COLUMN Friendship.Email IS '���̸���';

COMMENT ON COLUMN Friendship.FriendEmail IS 'ģ���̸���';

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
-- 15. FriendshipNotification(ģ���˸�)
-----------------------------------------------------------------------------------------------
-- 15.1 FriendshipNotification(ģ���˸�) ���̺� ���� �� ����
/* ģ���˸� */
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

/* ģ���˸� */
DROP TABLE FriendshipNotification
	CASCADE CONSTRAINTS;

/* ģ���˸� */
CREATE TABLE FriendshipNotification (
	NotificationSeq NUMBER NOT NULL, /* ����ھ˸���ȣ */
	Email VARCHAR2(127) NOT NULL, /* �̸��� */
	FriendEmail VARCHAR2(127) NOT NULL, /* ģ���̸��� */
	FriendshipConfirm INT /* ģ����ûȮ�� */
);

COMMENT ON TABLE FriendshipNotification IS 'ģ���˸�';

COMMENT ON COLUMN FriendshipNotification.NotificationSeq IS '����ھ˸���ȣ';

COMMENT ON COLUMN FriendshipNotification.Email IS '�̸���';

COMMENT ON COLUMN FriendshipNotification.FriendEmail IS 'ģ���̸���';

COMMENT ON COLUMN FriendshipNotification.FriendshipConfirm IS 'ģ����ûȮ��';

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
-- Test�� ���̺�
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
