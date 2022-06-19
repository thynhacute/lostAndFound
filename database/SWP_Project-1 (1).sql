DROP DATABASE FPTU_Lost_and_Found;
GO

CREATE DATABASE FPTU_Lost_and_Found
GO

USE FPTU_Lost_and_Found
GO


CREATE TABLE Role(
RoleID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
RoleName nvarchar(50)
);

CREATE TABLE Member(
	MemberID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,	
	FullName nvarchar(50),
	Email nvarchar(50) NOT NULL,
	Picture nvarchar(200),
	Phone nvarchar(10),
	ProfileInfo nvarchar(max),
	RoleID INT  NOT NULL FOREIGN KEY REFERENCES Role(RoleID),
	MemberStatus BIT NOT NULL,
);


CREATE TABLE ArticleType(
	ArticleTypeID int IDENTITY(1,1) PRIMARY KEY,
	ArticleTypeName nvarchar(30) NOT NULL,	
);

CREATE TABLE ItemType(
	ItemID int IDENTITY(1,1) PRIMARY KEY,
	ItemName nvarchar(50) NOT NULL,	
);
CREATE TABLE Location(
LocationID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
LocationName nvarchar(100)
);

CREATE TABLE Article(
	ArticleID INT IDENTITY(1,1) PRIMARY KEY,
	ArticleContent nvarchar(max) NOT NULL,
	ImgURL nvarchar(300),
	PostTime DateTime NOT NULL,
	ArticleStatus bit NOT NULL,
	LocationID INT NOT NULL FOREIGN KEY REFERENCES Location(LocationID),
	MemberID INT  NOT NULL FOREIGN KEY REFERENCES Member(MemberID),
	ArticleTypeID int  NOT NULL FOREIGN KEY REFERENCES ArticleType(ArticleTypeID),
	ItemID int  NOT NULL FOREIGN KEY REFERENCES ItemType(ItemID),
);

CREATE TABLE Comment(
	ArticleID int  NOT NULL FOREIGN KEY REFERENCES Article(ArticleID),
	MemberID INT  NOT NULL FOREIGN KEY REFERENCES Member(MemberID),
	PRIMARY KEY (ArticleID, MemberID),
	CommentContent nvarchar(max) NOT NULL,
	CommentTime DateTime NOT NULL
);

CREATE TABLE Report(
	ArticleID INT  NOT NULL FOREIGN KEY REFERENCES Article(ArticleID),
	MemberID INT  NOT NULL FOREIGN KEY REFERENCES Member(MemberID),
	ReportContent nvarchar(max) NOT NULL,
	ReportTime DateTime NOT NULL,
	ReportStatus bit NOT NULL,
	PRIMARY KEY (ArticleID, MemberID),
);


CREATE TABLE Blog(
BlogID INT IDENTITY(1,1) PRIMARY KEY,
BlogName nvarchar (100) NOT NULL,
BlogContent nvarchar(max),
MemberID INT  FOREIGN KEY REFERENCES Member(MemberID)
);

SET IDENTITY_INSERT Role ON;
INSERT Role(RoleID, RoleName) VALUES('1', N'Admin')
INSERT Role(RoleID, RoleName) VALUES('2', N'Member')
SET IDENTITY_INSERT Role OFF;

SET IDENTITY_INSERT Member ON;
INSERT [dbo].[Member] ([MemberID], [FullName], [Email], [Picture], [Phone], [ProfileInfo], [RoleID], [MemberStatus]) 
	VALUES ('1', N'NaaTy', N'thyhnse151101@fpt.edu.vn', N'https://i.pinimg.com/originals/30/1f/58/301f58a07b86756082b9f37fc908e3d7.jpg', 
	'12345', N'cutexinkgai', '1', '1')
--INSERT [dbo].[Member] ([MemberID], [FullName], [Email], [Picture], [Phone], [ProfileInfo], [RoleID], [MemberStatus]) 
--	VALUES ('2', N'Hana', N'hana@gmail.com', N'https://i.pinimg.com/originals/30/1f/58/301f58a07b86756082b9f37fc908e3d7.jpg', 
--	'12345', N'cutexinkgai', '2', '1')
--SET IDENTITY_INSERT Member OFF;

SET IDENTITY_INSERT ArticleType ON;
INSERT ArticleType(ArticleTypeID, ArticleTypeName) VALUES('1', N'Đồ thất lạc')
INSERT ArticleType(ArticleTypeID, ArticleTypeName) VALUES('2', N'Đồ nhặt được')
SET IDENTITY_INSERT ArticleType OFF;

SET IDENTITY_INSERT ItemType ON;
INSERT ItemType(ItemID, ItemName) VALUES('1', N'Ví/Bóp')
INSERT ItemType(ItemID, ItemName) VALUES('2', N'Giấy tờ')
INSERT ItemType(ItemID, ItemName) VALUES('3', N'CCCD/CMND')
INSERT ItemType(ItemID, ItemName) VALUES('4', N'Giấy phép lái xe')
SET IDENTITY_INSERT ItemType OFF;

SET IDENTITY_INSERT Location ON;
INSERT Location(LocationID, LocationName) VALUES('1', N'Phòng học')--
INSERT Location(LocationID, LocationName) VALUES('2', N'Nhà xe')--
INSERT Location(LocationID, LocationName) VALUES('3', N'Sảnh chính (Trống đồng)')--
INSERT Location(LocationID, LocationName) VALUES('4', N'Thư viện')--
INSERT Location(LocationID, LocationName) VALUES('5', N'Sân Vovinam')--
INSERT Location(LocationID, LocationName) VALUES('6', N'Sân trường')--
INSERT Location(LocationID, LocationName) VALUES('7', N'Công viên cây xanh')
INSERT Location(LocationID, LocationName) VALUES('8', N'Ao sen')
INSERT Location(LocationID, LocationName) VALUES('9', N'Hội trường A')
INSERT Location(LocationID, LocationName) VALUES('10', N'Hội trường B')
INSERT Location(LocationID, LocationName) VALUES('11', N'Hội trường C')
INSERT Location(LocationID, LocationName) VALUES('12', N'Canteen')
SET IDENTITY_INSERT Location OFF;

SET IDENTITY_INSERT Article ON;
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('1', N'Nhặt được CCCD tại phòng Seminar Giấy tờ mang tên TRẦN PHƯƠNG THÁI (2001, Hà Nội)', 
	N'https://timdothatlac.s3.ap-southeast-1.amazonaws.com/images/articles/ebd6e077-6c4b-44e0-8539-81c3e3d2cf07.jpg', 
	CAST(N'2022-06-16' AS Date), '1', '4', '1', '2', '3')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('2', N'Nhặt được ví tại Nhà xe Giấy tờ mang tên VÕ THỊ TƯỜNG DUY (2001, Bến Tre)', 
	N'https://vn-test-11.slatic.net/p/e212a01b93e8ab0507471c4a7f511e65.jpg', 
	CAST(N'2022-06-20' AS Date), '1', '2', '2', '2', '1')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('3', N'Nhặt được Giấy phép lái xe tại phòng 202 Tầng 2 Giấy tờ mang tên HOÀNG ĐÌNH THÁI (2001, Hồ Chí Minh)', 
	N'https://accgroup.vn/wp-content/uploads/2021/09/lam-giay-to-xe-mat-bao-lau.jpg', 
	CAST(N'2022-06-25' AS Date), '1', '1', '3', '2', '2')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('4', N'Nhặt được Giấy tờ tại phòng 403 Tầng 4 Giấy tờ bao gồm giấy tờ xe, các bằng lái xe, điều khiển xe mang biển số 59p1 52921 mang tên NGUYỄN QUỐC SỸ (2001, Vũng Tàu)', 
	N'https://farm6.staticflickr.com/5740/23117735982_5307002fda_o.jpg', 
	CAST(N'2022-06-26' AS Date), '1', '1', '4', '2', '3')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('5', N'Nhặt được ví tại Sân trường Giấy tờ mang tên NGÔ XUÂN THIỆP (2001, Đồng Nai)', 
	N'https://static2.yan.vn/YanNews/2167221/201904/di-lam-dem-cac-ban-tre-nhat-duoc-vi-tien-100-trieu-dong-va-tra-lai-d172f9ee.jpg', 
	CAST(N'2022-07-03' AS Date), '1', '6','5', '2', '1')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('6', N'Nhặt được Giấy phép lái xe tại phòng 027 Tầng trệt Giấy tờ mang tên NGUYỄN HOÀNG TÂN (2001, Đồng Nai)', 
	N'https://thongtingiaypheplaixe.com/wp-content/uploads/2019/11/IMAG0587-scaled.jpg', 
	CAST(N'2022-07-06' AS Date), '1', '1','6', '2', '2')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('7', N'Nhặt được CMND tại phòng 119 Tầng 1 Giấy tờ mang tên NGUYỄN THANH TÙNG (2001, Hồ Chí Minh)', 
	N'https://static.cand.com.vn/Files/Image/huutoan/2021/01/30/thumb_660_0d00b6a2-18c5-49c3-ab1f-c755f118479d.jpg', 
	CAST(N'2022-07-07' AS Date), '1', '1', '7', '2', '3')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('8', N'Nhặt được Giấy tờ tại Sân Vovinam Giấy tờ bao gồm giấy tờ xe, các bằng lái xe, điều khiển xe mang biển số 60AM 12345 mang tên ĐOÀN VŨ QUANG HUY (2001, Vũng Tàu)', 
	N'https://danquangngai.com/upload/images/meocon_9/images/31472633_2016156075370888_55621084908617728_n(1).jpg', 
	CAST(N'2022-07-10' AS Date), '1', '5', '8', '2', '3')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('9', N'Nhặt được ví tại Sảnh chính (Trống đồng) Giấy tờ mang tên NGUYỄN TRỌNG NGUYÊN VŨ (2001, Vũng Tàu)', 
	N'https://danviet.mediacdn.vn/2021/3/2/15405869525382645198109597458397699628670351n-16146899120431885801469.jpg', 
	CAST(N'2022-07-11' AS Date), '1', '3','9', '2', '1')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('10', N'Nhặt được Giấy phép lái xe tại Hội trường C Giấy tờ mang tên ĐÀO ĐỨC THỊNH (2001, Đồng Nai)', 
	N'https://0711.vn/storage/uploads/img2020061423120431596100.jpg', 
	CAST(N'2022-07-16' AS Date), '1', '11','10', '2', '2')

INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('11', N'Rơi ví tại Nhà xe Giấy tờ mang tên HOÀNG NHÃ THY (2001, Đồng Nai)', 
	N'https://vn-test-11.slatic.net/p/e212a01b93e8ab0507471c4a7f511e65.jpg', 
	CAST(N'2022-06-20' AS Date), '1', '2', '11', '1', '1')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('12', N'Rơi CCCD tại Công viên cây xanh Giấy tờ mang tên NGUYỄN TRẦN THIÊN ĐỨC (2001, Tiền Giang)', 
	N'https://timdothatlac.s3.ap-southeast-1.amazonaws.com/images/articles/ebd6e077-6c4b-44e0-8539-81c3e3d2cf07.jpg', 
	CAST(N'2022-06-16' AS Date), '1', '7', '12', '1', '3')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('13', N'Rơi Giấy phép lái xe tại Canteen Giấy tờ mang tên TRƯƠNG NGUYỄN ANH HUY (2001, Quảng Ngãi)', 
	N'https://accgroup.vn/wp-content/uploads/2021/09/lam-giay-to-xe-mat-bao-lau.jpg', 
	CAST(N'2022-06-25' AS Date), '1', '12', '13', '1', '2')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('14', N'Rơi Giấy tờ tại Ao sen Giấy tờ bao gồm giấy tờ xe, các bằng lái xe, điều khiển xe mang biển số 59p1 52921 mang tên NGUYỄN QUANG HÙNG (2001, Quảng Trị)', 
	N'https://farm6.staticflickr.com/5740/23117735982_5307002fda_o.jpg', 
	CAST(N'2022-06-26' AS Date), '1', '8', '14', '1', '3')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('15', N'Rơi ví tại Sân trường Giấy tờ mang tên NGÔ DUY BÌNH (2002, Tiền Giang)', 
	N'https://static2.yan.vn/YanNews/2167221/201904/di-lam-dem-cac-ban-tre-nhat-duoc-vi-tien-100-trieu-dong-va-tra-lai-d172f9ee.jpg', 
	CAST(N'2022-07-03' AS Date), '1', '6','15', '1', '1')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('16', N'Rơi Giấy phép lái xe tại phòng 011 Tầng trệt Giấy tờ mang tên THÁI VĂN MẪN (2001, Đà Nẵng)', 
	N'https://thongtingiaypheplaixe.com/wp-content/uploads/2019/11/IMAG0587-scaled.jpg', 
	CAST(N'2022-07-06' AS Date), '1', '1','16', '1', '2')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('17', N'Rơi CMND tại Hội trường A Giấy tờ mang tên PHẠM DUY TÙNG (2000, Bình Phước)', 
	N'https://static.cand.com.vn/Files/Image/huutoan/2021/01/30/thumb_660_0d00b6a2-18c5-49c3-ab1f-c755f118479d.jpg', 
	CAST(N'2022-07-07' AS Date), '1', '9', '17', '1', '3')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('18', N'Rơi Giấy tờ tại Sân Vovinam Giấy tờ bao gồm giấy tờ xe, các bằng lái xe, điều khiển xe mang biển số 60AM 12345 mang tên ĐẶNG XUÂN ĐẠT (2001, Vũng Tàu)', 
	N'https://danquangngai.com/upload/images/meocon_9/images/31472633_2016156075370888_55621084908617728_n(1).jpg', 
	CAST(N'2022-07-10' AS Date), '1', '5', '18', '1', '3')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('19', N'Rơi ví tại Sảnh chính (Trống đồng) Giấy tờ mang tên TRẦN QUỐC KHÁNH (2002, Đà Nẵng)', 
	N'https://danviet.mediacdn.vn/2021/3/2/15405869525382645198109597458397699628670351n-16146899120431885801469.jpg', 
	CAST(N'2022-07-11' AS Date), '1', '3','19', '1', '1')
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID]) 
	VALUES ('20', N'Rơi Giấy phép lái xe tại Hội trường B Giấy tờ mang tên MAI XUÂN TÙNG (2003, Đà Nẵng)', 
	N'https://0711.vn/storage/uploads/img2020061423120431596100.jpg', 
	CAST(N'2022-07-16' AS Date), '1', '10','20', '1', '2')
SET IDENTITY_INSERT Article OFF;

INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('1', '1', N'Mong chủ nhân sớm tìm được lại CCCD', CAST(N'2022-06-17' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('2', '1', N'Mong chủ nhân sớm tìm được lại Ví', CAST(N'2022-06-21' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('3', '1', N'Mong chủ nhân sớm tìm được lại Giấy phép lái xe', CAST(N'2022-06-26' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('4', '1', N'Mong chủ nhân sớm tìm được lại Giấy tờ', CAST(N'2022-06-27' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('5', '1', N'Mong chủ nhân sớm tìm được lại Ví', CAST(N'2022-07-04' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('6', '1', N'Mong chủ nhân sớm tìm được lại Giấy phép lái xe', CAST(N'2022-07-07' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('7', '1', N'Mong chủ nhân sớm tìm được lại CMND', CAST(N'2022-07-08' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('8', '1', N'Mong chủ nhân sớm tìm được lại Giấy tờ', CAST(N'2022-07-11' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('9', '1', N'Mong chủ nhân sớm tìm được lại Ví', CAST(N'2022-07-12' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('10', '1', N'Mong chủ nhân sớm tìm được lại Giấy phép lái xe', CAST(N'2022-07-17' AS Date))

INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('11', '1', N'Chúc bạn sớm tìm được lại CCCD', CAST(N'2022-06-17' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('12', '1', N'Chúc bạn sớm tìm được lại Ví', CAST(N'2022-06-21' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('13', '1', N'Chúc bạn sớm tìm được lại Giấy phép lái xe', CAST(N'2022-06-26' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('14', '1', N'Chúc bạn sớm tìm được lại Giấy tờ', CAST(N'2022-06-27' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('15', '1', N'Chúc bạn sớm tìm được lại Ví', CAST(N'2022-07-04' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('16', '1', N'Chúc bạn sớm tìm được lại Giấy phép lái xe', CAST(N'2022-07-07' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('17', '1', N'Chúc bạn sớm tìm được lại CMND', CAST(N'2022-07-08' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('18', '1', N'Chúc bạn sớm tìm được lại Giấy tờ', CAST(N'2022-07-11' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('19', '1', N'Chúc bạn sớm tìm được lại Ví', CAST(N'2022-07-12' AS Date))
INSERT [dbo].[Comment] ([ArticleID], [MemberID], [CommentContent], [CommentTime])
	VALUES ('20', '1', N'Chúc bạn sớm tìm được lại Giấy phép lái xe', CAST(N'2022-07-17' AS Date))

INSERT [dbo].[Report] ([ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus])
	VALUES ('2', '2', N'Đưa hình sai thông tin', CAST(N'2022-06-17' AS Date), '1')
INSERT [dbo].[Report] ([ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus])
	VALUES ('5', '5', N'Đưa hình đã photoshop', CAST(N'2022-07-04' AS Date), '1')
INSERT [dbo].[Report] ([ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus])
	VALUES ('8', '8', N'Đưa hình sai thông tin', CAST(N'2022-07-11' AS Date), '1')
INSERT [dbo].[Report] ([ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus])
	VALUES ('12', '12', N'Người này lừa đảo', CAST(N'2022-06-17' AS Date), '1')
INSERT [dbo].[Report] ([ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus])
	VALUES ('15', '15', N'Đưa hình đã photoshop', CAST(N'2022-07-04' AS Date), '1')
INSERT [dbo].[Report] ([ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus])
	VALUES ('20', '20', N'Đưa hình sai thông tin', CAST(N'2022-07-17' AS Date), '1')

SET IDENTITY_INSERT Blog ON;
INSERT [dbo].[Blog] ([BlogID], [BlogName], [BlogContent], [MemberID])
	VALUES ('1', 'Mẹo hay cho những người chuyên để thất lạc đồ', N'Đựng tai nghe vào cái ví nhỏ, Biến bút thành những bông hoa, Cách giữ chỉ, len hiệu quả, Giá đựng các dây cáp', '1')
INSERT [dbo].[Blog] ([BlogID], [BlogName], [BlogContent], [MemberID])
	VALUES ('2', 'Cách để phòng tránh bị thất lạc đồ', N'Chú ý đến mỗi việc mình làm, Đặt đồ vật ở vị trí cố định', '5')
INSERT [dbo].[Blog] ([BlogID], [BlogName], [BlogContent], [MemberID])
	VALUES ('3', 'Cách tìm kiếm điện thoại thất lạc nhanh nhất', N'Cách tốt nhất (và duy nhất) để lấy lại iPhone của bạn là thông qua tính năng gốc của Apple,  Find My iPhone.', '10')
INSERT [dbo].[Blog] ([BlogID], [BlogName], [BlogContent], [MemberID])
	VALUES ('4', 'Nếu tìm không thấy đồ thất lạc, cần làm gì?', N'Trước tiên, hãy thử quay lại nơi mà bạn vừa đi qua. Có thể là trong xe, nhà xe, nhà vệ sinh, cốp xe… 
	Ngoài ra, cũng cần lưu ý đến nhất túi quần hoặc túi áo mà bạn mặc gần nhất, hoặc trong túi xách, balo.', '15')
INSERT [dbo].[Blog] ([BlogID], [BlogName], [BlogContent], [MemberID])
	VALUES ('5', 'Ăn gì để khắc phục chứng hay quên?', N'Long nhãn – Cải thiện chứng hay quên hiệu quả, Nhân sâm – Thực phẩm cải thiện chứng hay quên, Đông trùng hạ thảo', '20')
SET IDENTITY_INSERT Blog OFF;