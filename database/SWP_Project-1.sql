DROP DATABASE FPTU_Lost_and_Found;
GO
CREATE DATABASE FPTU_Lost_and_Found
GO

USE FPTU_Lost_and_Found
GO

CREATE TABLE Campus
(
	CampusID int IDENTITY(1,1) PRIMARY KEY,
	CampusName nvarchar(30) NOT NULL,	
);

CREATE TABLE Role(
RoleID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
RoleName nvarchar(50)
);

CREATE TABLE Member
(
	MemberID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,	
	FullName nvarchar(50),
	Email nvarchar(50) NOT NULL,
	Picture nvarchar(200),
	Phone nvarchar(10),
	ProfileInfo nvarchar(max),
	RoleID INT  NOT NULL FOREIGN KEY REFERENCES Role(RoleID),
	MemberStatus BIT NOT NULL,
	CampusID int NOT NULL FOREIGN KEY REFERENCES Campus(CampusID),
);

CREATE TABLE ArticleType
(
	ArticleTypeID int IDENTITY(1,1) PRIMARY KEY,
	ArticleTypeName nvarchar(30) NOT NULL,	
);

CREATE TABLE ItemType
(
	ItemID int IDENTITY(1,1) PRIMARY KEY,
	ItemName nvarchar(50) NOT NULL,	
);

CREATE TABLE Article
(
	ArticleID INT IDENTITY(1,1) PRIMARY KEY,
	ArticleContent nvarchar(max) NOT NULL,
	ImgURL nvarchar(50),
	PostTime DateTime NOT NULL,
	ArticleStatus bit NOT NULL,
	Location nvarchar(max) NOT NULL,
	MemberID INT  NOT NULL FOREIGN KEY REFERENCES Member(MemberID),
	ArticleTypeID int  NOT NULL FOREIGN KEY REFERENCES ArticleType(ArticleTypeID),
	ItemID int  NOT NULL FOREIGN KEY REFERENCES ItemType(ItemID),
);

CREATE TABLE Comment
(
	ArticleID int  NOT NULL FOREIGN KEY REFERENCES Article(ArticleID),
	MemberID INT  NOT NULL FOREIGN KEY REFERENCES Member(MemberID),
	PRIMARY KEY (ArticleID, MemberID),
	CommentContent nvarchar(max) NOT NULL,
	CommentTime DateTime NOT NULL
);

CREATE TABLE Report
(
	ArticleID INT  NOT NULL FOREIGN KEY REFERENCES Article(ArticleID),
	MemberID INT  NOT NULL FOREIGN KEY REFERENCES Member(MemberID),
	ReportContent nvarchar(max) NOT NULL,
	ReportTime DateTime NOT NULL,
	ReportStatus bit NOT NULL,
	PRIMARY KEY (ArticleID, MemberID),
);

CREATE TABLE Admin(
AdminID  INT IDENTITY(1,1) NOT NULL PRIMARY KEY ,
 FOREIGN KEY (AdminID) REFERENCES Member(MemberID)
);

CREATE TABLE Blog(
BlogID INT IDENTITY(1,1) PRIMARY KEY,
BlogName nvarchar (50) NOT NULL,
BlogContent nvarchar(max),
AdminID INT  FOREIGN KEY REFERENCES Admin(AdminID)
);


