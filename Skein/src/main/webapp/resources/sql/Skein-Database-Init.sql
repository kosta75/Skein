-----------------------------------------------------------------------------------------------
-- 1. Roles(����)
-----------------------------------------------------------------------------------------------
-- 1.1 Roles(����) ���̺� ����
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

-- 1.2. ���� ������ �Է�
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
	CertificationText VARCHAR2(255) NOT NULL /* ������������ */
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
-- 3.1 Authorities(����ڱ���) ���̺� ����
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
		);


-----------------------------------------------------------------------------------------------
-- 4. BoardForm(�Խ��������ڵ�)
-----------------------------------------------------------------------------------------------
-- 4.1 BoardForm(�Խ��������ڵ�) ���̺� ����
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
-- 5.1 BoardKind(�Խ�������) ���̺� ����
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


-----------------------------------------------------------------------------------------------
-- 6. PublicLevel(��������)
-----------------------------------------------------------------------------------------------
-- 6.1 PublicLevel(��������) ���̺� ����
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
-- 10. HistoryGroup(���ű�ϱ׷�) > 7
-----------------------------------------------------------------------------------------------
-- 10.1 HistoryGroup(���ű�ϱ׷�) ���̺� ����
/* ���ű�ϱ׷� */
CREATE TABLE HistoryGroup (
	GroupSeq NUMBER NOT NULL, /* ���ű�ϱ׷�ĺ���ȣ */
	GroupName VARCHAR2(127) NOT NULL, /* ���ű�ϱ׷�� */
	IsImportantGroup INT, /* �߿�׷� */
	GroupStartDate DATE, /* �׷�߻������� */
	GroupEndDate DATE /* �׷�߻������� */
);

COMMENT ON TABLE HistoryGroup IS '���ű�ϱ׷�';

COMMENT ON COLUMN HistoryGroup.GroupSeq IS '���ű�ϱ׷�ĺ���ȣ';

COMMENT ON COLUMN HistoryGroup.GroupName IS '���ű�ϱ׷��';

COMMENT ON COLUMN HistoryGroup.IsImportantGroup IS '�߿�׷�';

COMMENT ON COLUMN HistoryGroup.GroupStartDate IS '�׷�߻�������';

COMMENT ON COLUMN HistoryGroup.GroupEndDate IS '�׷�߻�������';

CREATE UNIQUE INDEX PK_HistoryGroup
	ON HistoryGroup (
		GroupSeq ASC
	);

ALTER TABLE HistoryGroup
	ADD
		CONSTRAINT PK_HistoryGroup
		PRIMARY KEY (
			GroupSeq
		);


-----------------------------------------------------------------------------------------------
-- 7. Board(�Խ���)
-----------------------------------------------------------------------------------------------
-- 7.1 Board(�Խ���) ���̺� ���� �� ����
/* �Խ��� */
CREATE TABLE Board (
	BoardSeq NUMBER NOT NULL, /* �۹�ȣ */
	BoardKindSeq NUMBER NOT NULL, /* �Խ��ǹ�ȣ */
	Email VARCHAR2(127) NOT NULL, /* �̸��� */
	Content VARCHAR2(127) NOT NULL, /* ���� */
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
		);

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
		CONSTRAINT FK_HistoryGroup_TO_Board
		FOREIGN KEY (
			GroupSeq
		)
		REFERENCES HistoryGroup (
			GroupSeq
		);

-----------------------------------------------------------------------------------------------
-- 8. ProfileCodes(�������׸�)
-----------------------------------------------------------------------------------------------
-- 8.1 ProfileCodes(�������׸�) ���̺� ����
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
COMMIT;


-----------------------------------------------------------------------------------------------
-- 9. Profiles(�����������)
-----------------------------------------------------------------------------------------------
-- 9.1 Profiles(�����������) ���̺� ���� �� ����
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
		);




-----------------------------------------------------------------------------------------------
-- 11. History(���ű�ϱ׷�)
-----------------------------------------------------------------------------------------------
-- 11.1 History(���ű�ϱ׷�) ���̺� ����
/* ���α�� */
CREATE TABLE History (
	HistorySeq NUMBER NOT NULL, /* ��Ͻĺ���ȣ */
	BoardSeq NUMBER, /* �۹�ȣ */
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

COMMENT ON COLUMN History.HistorySeq IS '��Ͻĺ���ȣ';

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
		HistorySeq ASC
	);

ALTER TABLE History
	ADD
		CONSTRAINT PK_History
		PRIMARY KEY (
			HistorySeq
		);

ALTER TABLE History
	ADD
		CONSTRAINT FK_Board_TO_History
		FOREIGN KEY (
			BoardSeq
		)
		REFERENCES Board (
			BoardSeq
		);









