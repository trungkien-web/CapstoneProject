
/****** Object:  Database [MissVote]    Script Date: 5/17/2018 10:43:22 AM ******/
CREATE DATABASE [MissVote]
 
go
USE [MissVote]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/17/2018 10:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentId] [int] IDENTITY NOT NULL,
	[UserId] [int] NULL,
	[MissId] [int] NULL,
	[Content] [nvarchar](50) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Miss]    Script Date: 5/17/2018 10:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Miss](
	[MissId] [int] NOT NULL,
	[MissName] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[BirthOfDate] [date] NULL,
	[size1] [int] NULL,
	[size2] [int] NULL,
	[size3] [int] NULL,
	[Adress] [nvarchar](50) NULL,
 CONSTRAINT [PK_Miss] PRIMARY KEY CLUSTERED 
(
	[MissId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/17/2018 10:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Role] [nvarchar](10) NULL,
	[Pass] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vote]    Script Date: 5/17/2018 10:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vote](
	[VoteId] [int] IDENTITY NOT NULL,
	[UserId] [int] NULL,
	[MissId] [int] NULL,
 CONSTRAINT [PK_Vote] PRIMARY KEY CLUSTERED 
(
	[VoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Miss] FOREIGN KEY([MissId])
REFERENCES [dbo].[Miss] ([MissId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Miss]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FK_Vote_Miss] FOREIGN KEY([MissId])
REFERENCES [dbo].[Miss] ([MissId])
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FK_Vote_Miss]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FK_Vote_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FK_Vote_User]
GO

INSERT INTO dbo.[User]( UserName, Role, Pass )VALUES  (  N'Kienbt',N'Admin', N'Kienbt123' )
INSERT INTO dbo.[User](  UserName, Role, Pass )VALUES  (  N'Hoabt',N'Admin', N'Hoabt124' )
INSERT INTO dbo.[User](  UserName, Role, Pass )VALUES  (  N'Nhatnv',N'User', N'NhatNv123' )
INSERT INTO dbo.[User](  UserName, Role, Pass )VALUES  (  N'ManhNH',N'User', N'ManhNH123' )
INSERT INTO dbo.[User](  UserName, Role, Pass )VALUES  (  N'CuongNM',N'User', N'Ahihi123' )
INSERT INTO dbo.[User](  UserName, Role, Pass )VALUES  (  N'HieuBM',N'User', N'Ahihi1234' )
INSERT INTO dbo.[User](  UserName, Role, Pass )VALUES  ( N'LinhND',N'User', N'Khongpass' )
INSERT INTO dbo.[User](  UserName, Role, Pass )VALUES  (  N'PewPew',N'User', N'pewpewfuckkunwowshit' )
INSERT INTO dbo.[User](  UserName, Role, Pass )VALUES  (  N'Virus',N'User', N'NhatNv123' )
INSERT INTO dbo.[User](  UserName, Role, Pass )VALUES  (  N'UyenPu',N'User', N'UyenPubuomchua' )

GO
INSERT INTO dbo.Miss( MissId ,MissName ,Image ,BirthOfDate ,size1 ,size2 ,size3 ,Adress )VALUES  ( 1 ,  N'Pham Huong' ,N'phamhuong.png' , '1992-02-22' , 90 , 55 , 90 ,  N'Hai Phong'  )
INSERT INTO dbo.Miss( MissId ,MissName ,Image ,BirthOfDate ,size1 ,size2 ,size3 ,Adress )VALUES  ( 2 ,  N'Ky Duyen' ,N'kyduyen.png' , '1996-04-20' , 85 , 55 , 90 ,  N'Nam Dinh'  )
INSERT INTO dbo.Miss( MissId ,MissName ,Image ,BirthOfDate ,size1 ,size2 ,size3 ,Adress )VALUES  ( 3 ,  N'Mai Phương Thuý' ,N'phuongthuy.png' , '1994-02-22' , 78 , 55 , 80 ,  N'Tuyen Quang'  )
INSERT INTO dbo.Miss( MissId ,MissName ,Image ,BirthOfDate ,size1 ,size2 ,size3 ,Adress )VALUES  ( 4 ,  N'Đăng Thị Ngọc Hân' ,N'ngochan.png' , '1996-02-22' , 88 , 55 , 86 ,  N'Tuyen Quang'  )

GO
INSERT INTO dbo.Vote(  UserId, MissId )VALUES  ( 1,  1 )
INSERT INTO dbo.Vote(  UserId, MissId )VALUES  ( 1,  2 )
INSERT INTO dbo.Vote(  UserId, MissId )VALUES  ( 1, 4 )
INSERT INTO dbo.Vote(  UserId, MissId )VALUES  ( 2,  3 )
INSERT INTO dbo.Vote(  UserId, MissId )VALUES  ( 2,  2 )
INSERT INTO dbo.Vote(  UserId, MissId )VALUES  ( 3, 4 )
INSERT INTO dbo.Vote(  UserId, MissId )VALUES  ( 4,  1 )
INSERT INTO dbo.Vote(  UserId, MissId )VALUES  ( 5,  2 )
INSERT INTO dbo.Vote(  UserId, MissId )VALUES  ( 6,  4 )
INSERT INTO dbo.Vote(  MissId )VALUES  ( 8, 2 )
INSERT INTO dbo.Vote( UserId, MissId )VALUES  ( 9,  1 )
INSERT INTO dbo.Vote( UserId, MissId )VALUES  ( 9,  3 )
INSERT INTO dbo.Vote( UserId, MissId )VALUES  ( 10,  4 )

INSERT INTO dbo.Comment
        ( UserId, MissId, Content )
VALUES  ( 1, -- UserId - int
          1, -- MissId - int
          N'Ngon'  -- Content - nvarchar(50)
          )
INSERT INTO dbo.Comment
        ( UserId, MissId, Content )
VALUES  ( 3, -- UserId - int
          2, -- MissId - int
          N'Dep'  -- Content - nvarchar(50)
          )
INSERT INTO dbo.Comment
        ( UserId, MissId, Content )
VALUES  ( 3, -- UserId - int
          3, -- MissId - int
          N'Ngon'  -- Content - nvarchar(50)
          )
INSERT INTO dbo.Comment
        ( UserId, MissId, Content )
VALUES  ( 3, -- UserId - int
          1, -- MissId - int
          N'Tuyet Voi'  -- Content - nvarchar(50)
          )




