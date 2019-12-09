USE [FPTInternshipManagerment]
GO
/****** Object:  Table [dbo].[Aspirations]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aspirations](
	[AspirationsID] [int] IDENTITY(1,1) NOT NULL,
	[AspirationsName] [nvarchar](50) NOT NULL,
	[ExperienceID] [int] NULL,
	[JobID] [int] NULL,
	[Description] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Aspirations] PRIMARY KEY CLUSTERED 
(
	[AspirationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Experience]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experience](
	[ExperienceID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Experience] PRIMARY KEY CLUSTERED 
(
	[ExperienceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[FeedbackTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackTypes]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackTypes](
	[FeedbackTypeID] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FeedbackTypes] PRIMARY KEY CLUSTERED 
(
	[FeedbackTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryRecords]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryRecords](
	[HistoryRecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[LastModifiedDate] [date] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_HistoryRecords] PRIMARY KEY CLUSTERED 
(
	[HistoryRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Path] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewSchedules]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewSchedules](
	[InterviewID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[LocationID] [int] NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_InterviewSchedules] PRIMARY KEY CLUSTERED 
(
	[InterviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[JobName] [nvarchar](50) NOT NULL,
	[ContentJob] [nvarchar](50) NULL,
	[LocationID] [int] NULL,
	[RecruiterID] [int] NULL,
	[AmountStudent] [int] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[LocationDetail] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[StudentID] [int] NOT NULL,
	[RecruiterID] [int] NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rates]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rates](
	[RateID] [int] IDENTITY(1,1) NOT NULL,
	[Star] [float] NOT NULL,
	[Comment] [nvarchar](50) NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
 CONSTRAINT [PK_Rates] PRIMARY KEY CLUSTERED 
(
	[RateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[RecruiterID] [int] NULL,
	[StudentID] [int] NULL,
	[Course] [nvarchar](50) NULL,
	[DepartmentID] [int] NULL,
	[Grade] [float] NULL,
	[Comment] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
	[LastModifyDate] [date] NULL,
	[RateID] [int] NULL,
 CONSTRAINT [PK_Reports] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillDetails]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillDetails](
	[SkillDetailID] [int] IDENTITY(1,1) NOT NULL,
	[SkillID] [int] NOT NULL,
	[AspirationsID] [int] NULL,
	[DepartmentID] [int] NULL,
	[JobID] [int] NULL,
 CONSTRAINT [PK_SkillDetail] PRIMARY KEY CLUSTERED 
(
	[SkillDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[SkillID] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statistical]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistical](
	[StatisticalID] [int] IDENTITY(1,1) NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[NumRequest] [int] NOT NULL,
	[NumPassed] [int] NOT NULL,
	[NumFail] [int] NOT NULL,
 CONSTRAINT [PK_Statistical] PRIMARY KEY CLUSTERED 
(
	[StatisticalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAspirations]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAspirations](
	[UserAspirationID] [int] IDENTITY(1,1) NOT NULL,
	[AspirationsID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_UserAspirations] PRIMARY KEY CLUSTERED 
(
	[UserAspirationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserJobs]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserJobs](
	[UserJobID] [int] IDENTITY(1,1) NOT NULL,
	[JobID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserJobs] PRIMARY KEY CLUSTERED 
(
	[UserJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/9/2019 7:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [int] NULL,
	[DOB] [date] NULL,
	[Gender] [bit] NULL,
	[Email] [nvarchar](50) NULL,
	[LocationID] [int] NULL,
	[CreateDate] [date] NULL,
	[CV] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[ImageID] [int] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (1, N'Software Engineering')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (2, N'Business Administration')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (3, N'Japanese Language')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (4, N'Graphic Design')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([ImageID], [Name], [Path]) VALUES (1, N'google', N'~/Assets/images/google_logo.png')
INSERT [dbo].[Images] ([ImageID], [Name], [Path]) VALUES (2, N'fpt', N'~/Assets/images/fpt2.png')
INSERT [dbo].[Images] ([ImageID], [Name], [Path]) VALUES (3, N'viettel', N'~/Assets/images/viettel.png')
INSERT [dbo].[Images] ([ImageID], [Name], [Path]) VALUES (4, N'vina', N'~/Assets/images/vina.png')
INSERT [dbo].[Images] ([ImageID], [Name], [Path]) VALUES (5, N'vina2', N'~/Assets/images/vina2.png')
INSERT [dbo].[Images] ([ImageID], [Name], [Path]) VALUES (6, N'mobi', N'~/Assets/images/mobi.png')
INSERT [dbo].[Images] ([ImageID], [Name], [Path]) VALUES (7, N'x', N'~/Assets/images/x.png')
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (1, N'JobName1', NULL, 1, 33, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (2, N'JobName2', NULL, 2, 34, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (3, N'JobName3', NULL, 3, 35, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (4, N'JobName4', NULL, 4, 36, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (5, N'JobName5', NULL, 5, 37, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (6, N'JobName6', NULL, 6, 38, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (7, N'JobName7', NULL, 7, 39, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (8, N'JobName8', NULL, 8, 40, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (9, N'JobName9', NULL, 9, 41, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (10, N'JobName10', NULL, 10, 42, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (11, N'JobName11', NULL, 11, 43, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (12, N'JobName12', NULL, 12, 44, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (13, N'JobName13', NULL, 13, 45, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (14, N'JobName14', NULL, 14, 46, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (15, N'JobName15', NULL, 15, 47, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (16, N'JobName16', NULL, 16, 48, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (17, N'JobName17', NULL, 17, 49, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (18, N'JobName18', NULL, 18, 50, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (19, N'JobName19', NULL, 19, 51, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (20, N'JobName20', NULL, 20, 52, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (21, N'JobName21', NULL, 21, 53, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (22, N'JobName22', NULL, 22, 54, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (23, N'JobName23', NULL, 23, 55, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (24, N'JobName24', NULL, 24, 56, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (25, N'JobName25', NULL, 25, 57, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (26, N'JobName26', NULL, 26, 33, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (27, N'JobName27', NULL, 27, 34, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (28, N'JobName28', NULL, 28, 35, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (29, N'JobName29', NULL, 29, 36, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (30, N'JobName30', NULL, 30, 37, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (31, N'JobName31', NULL, 31, 38, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (32, N'JobName32', NULL, 32, 39, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (33, N'JobName33', NULL, 33, 40, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (34, N'JobName34', NULL, 34, 41, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (35, N'JobName35', NULL, 35, 42, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (36, N'JobName36', NULL, 36, 43, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (37, N'JobName37', NULL, 37, 44, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (38, N'JobName38', NULL, 38, 45, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (39, N'JobName39', NULL, 39, 46, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (40, N'JobName40', NULL, 40, 47, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (41, N'JobName41', NULL, 41, 48, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (42, N'JobName42', NULL, 42, 49, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (43, N'JobName43', NULL, 43, 50, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (44, N'JobName44', NULL, 44, 51, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (45, N'JobName45', NULL, 45, 52, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (46, N'JobName46', NULL, 46, 53, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (47, N'JobName47', NULL, 47, 54, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (48, N'JobName48', NULL, 48, 55, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (49, N'JobName49', NULL, 49, 56, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (50, N'JobName50', NULL, 50, 57, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (51, N'JobName51', NULL, 51, 33, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (52, N'JobName52', NULL, 52, 34, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (53, N'JobName53', NULL, 53, 35, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (54, N'JobName54', NULL, 54, 36, NULL, N'Available')
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status]) VALUES (55, N'JobName55', NULL, 55, 37, NULL, N'Available')
SET IDENTITY_INSERT [dbo].[Jobs] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (1, N'Ha Noi', N'Ha Noi Detail1')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (2, N'Ha Noi', N'Ha Noi Detail2')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (3, N'Ha Noi', N'Ha Noi Detail3')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (4, N'Ha Noi', N'Ha Noi Detail4')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (5, N'Ha Noi', N'Ha Noi Detail5')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (6, N'Ha Noi', N'Ha Noi Detail6')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (7, N'Ha Noi', N'Ha Noi Detail7')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (8, N'Ha Noi', N'Ha Noi Detail8')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (9, N'Ha Noi', N'Ha Noi Detail9')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (10, N'Ha Noi', N'Ha Noi Detail10')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (11, N'Ha Noi', N'Ha Noi Detail11')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (12, N'Ha Noi', N'Ha Noi Detail12')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (13, N'Ha Noi', N'Ha Noi Detail13')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (14, N'Ha Noi', N'Ha Noi Detail14')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (15, N'Ha Noi', N'Ha Noi Detail15')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (16, N'Ha Noi', N'Ha Noi Detail16')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (17, N'Ha Noi', N'Ha Noi Detail17')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (18, N'Ha Noi', N'Ha Noi Detail18')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (19, N'Ha Noi', N'Ha Noi Detail19')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (20, N'Ha Noi', N'Ha Noi Detail20')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (21, N'Ha Noi', N'Ha Noi Detail21')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (22, N'Ha Noi', N'Ha Noi Detail22')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (23, N'Ha Noi', N'Ha Noi Detail23')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (24, N'Ho Chi Minh', N'Ho Chi Minh1')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (25, N'Ho Chi Minh', N'Ho Chi Minh2')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (26, N'Ho Chi Minh', N'Ho Chi Minh3')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (27, N'Ho Chi Minh', N'Ho Chi Minh4')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (28, N'Ho Chi Minh', N'Ho Chi Minh5')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (29, N'Ho Chi Minh', N'Ho Chi Minh6')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (30, N'Ho Chi Minh', N'Ho Chi Minh7')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (31, N'Ho Chi Minh', N'Ho Chi Minh8')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (32, N'Ho Chi Minh', N'Ho Chi Minh9')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (33, N'Ho Chi Minh', N'Ho Chi Minh10')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (34, N'Ho Chi Minh', N'Ho Chi Minh11')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (35, N'Ho Chi Minh', N'Ho Chi Minh12')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (36, N'Ho Chi Minh', N'Ho Chi Minh13')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (37, N'Ho Chi Minh', N'Ho Chi Minh14')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (38, N'Da Nang', N'Da Nang1')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (39, N'Da Nang', N'Da Nang2')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (40, N'Da Nang', N'Da Nang3')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (41, N'Da Nang', N'Da Nang4')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (42, N'Da Nang', N'Da Nang5')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (43, N'Da Nang', N'Da Nang6')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (44, N'Da Nang', N'Da Nang7')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (45, N'Da Nang', N'Da Nang8')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (46, N'Da Nang', N'Da Nang9')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (47, N'Da Nang', N'Da Nang10')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (48, N'Da Nang', N'Da Nang11')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (49, N'Da Nang', N'Da Nang12')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (50, N'Da Nang', N'Da Nang13')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (51, N'Da Nang', N'Da Nang14')
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[Rates] ON 

INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (1, 4.6, N'abc', 19, 44)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (2, 1.7, N'abc', 20, 45)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (3, 4.3, N'abc', 21, 46)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (4, 3.9, N'abc', 22, 47)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (5, 2.5, N'abc', 23, 48)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (6, 4.7, N'abc', 24, 49)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (7, 2.6, N'abc', 25, 50)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (8, 4.6, N'abc', 26, 51)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (9, 1.6, N'abc', 27, 52)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (10, 1.9, N'abc', 28, 53)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (11, 2.6, N'abc', 29, 54)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (12, 4.3, N'abc', 30, 55)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (13, 2.9, N'abc', 31, 56)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (14, 3.8, N'abc', 32, 57)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (15, 4.9, N'abc', 33, 58)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (16, 3.1, N'abc', 34, 59)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (17, 4.1, N'abc', 35, 60)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (18, 2.4, N'abc', 36, 61)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (19, 4.2, N'abc', 37, 62)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (20, 4, N'abc', 38, 63)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (21, 2.2, N'abc', 39, 64)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (22, 3.6, N'abc', 40, 65)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (23, 1, N'abc', 41, 66)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (24, 3.1, N'abc', 42, 67)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (25, 2.1, N'abc', 43, 68)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (26, 4.3, N'abc', 19, 69)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (27, 2.2, N'abc', 20, 70)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (28, 5, N'abc', 21, 71)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (29, 4.9, N'abc', 22, 72)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (30, 3.7, N'abc', 23, 73)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (31, 1.2, N'abc', 24, 44)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (32, 1, N'abc', 25, 45)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (33, 1, N'abc', 26, 46)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (34, 1.5, N'abc', 27, 47)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (35, 3.6, N'abc', 28, 48)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (36, 4.6, N'abc', 29, 49)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (37, 1.2, N'abc', 30, 50)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (38, 1.9, N'abc', 31, 51)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (39, 3.9, N'abc', 32, 52)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (40, 2.1, N'abc', 33, 53)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (41, 1.2, N'abc', 34, 54)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (42, 4.6, N'abc', 35, 55)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (43, 3.8, N'abc', 36, 56)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (44, 1.1, N'abc', 37, 57)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (45, 3.1, N'abc', 38, 58)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (46, 4.8, N'abc', 39, 59)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (47, 4.9, N'abc', 40, 60)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (48, 1.4, N'abc', 41, 61)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (49, 4.6, N'abc', 42, 62)
INSERT [dbo].[Rates] ([RateID], [Star], [Comment], [RecruiterID], [StudentID]) VALUES (50, 2.2, N'abc', 43, 63)
SET IDENTITY_INSERT [dbo].[Rates] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Student')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Recruiter')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (4, N'Staff')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[SkillDetails] ON 

INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (1, 1, NULL, 1, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (2, 2, NULL, 1, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (3, 3, NULL, 1, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (4, 4, NULL, 1, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (5, 5, NULL, 1, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (6, 6, NULL, 1, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (7, 7, NULL, 2, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (8, 8, NULL, 2, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (9, 9, NULL, 2, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (10, 10, NULL, 2, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (11, 11, NULL, 2, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (12, 12, NULL, 2, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (13, 13, NULL, 2, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (14, 14, NULL, 3, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (15, 15, NULL, 3, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (16, 16, NULL, 3, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (17, 17, NULL, 3, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (18, 18, NULL, 3, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (19, 19, NULL, 3, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (20, 20, NULL, 3, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (21, 21, NULL, 4, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (22, 22, NULL, 4, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (23, 23, NULL, 4, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (24, 24, NULL, 4, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (25, 25, NULL, 4, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (26, 26, NULL, 4, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (27, 27, NULL, 4, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (28, 1, NULL, NULL, NULL)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (29, 2, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SkillDetails] OFF
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (1, N'Asp.net')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (2, N'Java')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (3, N'C')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (4, N'C++')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (5, N'PHP')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (6, N'HTML')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (7, N'BSkill1')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (8, N'Bskill2')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (9, N'BSkill3')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (10, N'BSkill4')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (11, N'BSkill5')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (12, N'BSkill6')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (13, N'BSkill7')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (14, N'JSkill1')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (15, N'JSkill2')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (16, N'JSkill3')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (17, N'JSkill4')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (18, N'JSkill5')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (19, N'JSkill6')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (20, N'JSkill7')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (21, N'GSkill1')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (22, N'GSkill2')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (23, N'GSkill3')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (24, N'GSkill4')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (25, N'GSkill5')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (26, N'GSkill6')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (27, N'GSkill7')
SET IDENTITY_INSERT [dbo].[Skills] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (74, 1, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (75, 2, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (76, 3, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (77, 4, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (78, 5, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (79, 6, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (80, 7, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (81, 8, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (82, 9, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (83, 10, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (84, 11, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (85, 12, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (86, 13, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (87, 14, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (88, 15, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (89, 16, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (90, 17, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (91, 18, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (92, 19, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (93, 20, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (94, 21, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (95, 22, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (96, 23, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (97, 24, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (98, 25, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (99, 26, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (100, 27, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (101, 28, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (102, 29, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (103, 30, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (104, 31, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (105, 32, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (106, 33, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (107, 34, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (108, 35, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (109, 36, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (110, 37, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (111, 38, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (112, 39, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (113, 40, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (114, 41, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (115, 42, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (116, 43, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (117, 44, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (118, 45, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (119, 46, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (120, 47, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (121, 48, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (122, 49, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (123, 50, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (124, 51, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (125, 52, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (126, 53, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (127, 54, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (128, 55, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (129, 56, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (130, 57, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (131, 58, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (132, 59, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (133, 60, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (134, 61, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (135, 62, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (136, 63, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (137, 64, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (138, 65, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (139, 66, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (140, 67, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (141, 68, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (142, 69, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (143, 70, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (144, 71, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (145, 72, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (146, 73, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (147, 74, 4)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (1, N'Admin1', N'Admin1', N'Admin1', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (2, N'Admin2', N'Admin2', N'Admin2', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (3, N'Admin3', N'Admin3', N'Admin3', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (4, N'Admin4', N'Admin4', N'Admin4', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (5, N'Admin5', N'Admin5', N'Admin5', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (6, N'Admin6', N'Admin6', N'Admin6', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (7, N'Admin7', N'Admin7', N'Admin7', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (8, N'Admin8', N'Admin8', N'Admin8', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (9, N'Admin9', N'Admin9', N'Admin9', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (10, N'Admin10', N'Admin10', N'Admin10', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (11, N'Admin11', N'Admin11', N'Admin11', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (12, N'Admin12', N'Admin12', N'Admin12', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (13, N'Admin13', N'Admin13', N'Admin13', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (14, N'Admin14', N'Admin14', N'Admin14', NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (15, N'Admin15', N'Admin15', N'Admin15', NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (16, N'Admin16', N'Admin16', N'Admin16', NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (17, N'Admin17', N'Admin17', N'Admin17', NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (18, N'Admin18', N'Admin18', N'Admin18', NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (19, N'Recuiter1', N'Recuiter1', N'Recuiter1', NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, 2, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (20, N'Recuiter2', N'Recuiter2', N'Recuiter2', NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 5, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (21, N'Recuiter3', N'Recuiter3', N'Recuiter3', NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, 3, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (22, N'Recuiter4', N'Recuiter4', N'Recuiter4', NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, 4, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (23, N'Recuiter5', N'Recuiter5', N'Recuiter5', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, 5, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (24, N'Recuiter6', N'Recuiter6', N'Recuiter6', NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, 2, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (25, N'Recuiter7', N'Recuiter7', N'Recuiter7', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, 3, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (26, N'Recuiter8', N'Recuiter8', N'Recuiter8', NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, 4, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (27, N'Recuiter9', N'Recuiter9', N'Recuiter9', NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 5, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (28, N'Recuiter10', N'Recuiter10', N'Recuiter10', NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, 6, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (29, N'Recuiter11', N'Recuiter11', N'Recuiter11', NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, 7, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (30, N'Recuiter12', N'Recuiter12', N'Recuiter12', NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, 2, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (31, N'Recuiter13', N'Recuiter13', N'Recuiter13', NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, 3, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (32, N'Recuiter14', N'Recuiter14', N'Recuiter14', NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, 5, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (33, N'Recuiter15', N'Recuiter15', N'Recuiter15', NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, 4, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (34, N'Recuiter16', N'Recuiter16', N'Recuiter16', NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, 5, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (35, N'Recuiter17', N'Recuiter17', N'Recuiter17', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, 6, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (36, N'Recuiter18', N'Recuiter18', N'Recuiter18', NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, 7, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (37, N'Recuiter19', N'Recuiter19', N'Recuiter19', NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, 6, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (38, N'Recuiter20', N'Recuiter20', N'Recuiter20', NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, 5, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (39, N'Recuiter21', N'Recuiter21', N'Recuiter21', NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, 4, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (40, N'Recuiter22', N'Recuiter22', N'Recuiter22', NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, 7, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (41, N'Recuiter23', N'Recuiter23', N'Recuiter23', NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, 2, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (42, N'Recuiter24', N'Recuiter24', N'Recuiter24', NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, 3, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (43, N'Recuiter25', N'Recuiter25', N'Recuiter25', NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, 4, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (44, N'Student1', N'Student1', N'Student1', NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (45, N'Student2', N'Student2', N'Student2', NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (46, N'Student3', N'Student3', N'Student3', NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (47, N'Student4', N'Student4', N'Student4', NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (48, N'Student5', N'Student5', N'Student5', NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (49, N'Student6', N'Student6', N'Student6', NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (50, N'Student7', N'Student7', N'Student7', NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (51, N'Student8', N'Student8', N'Student8', NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (52, N'Student9', N'Student9', N'Student9', NULL, NULL, NULL, NULL, 46, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (53, N'Student10', N'Student10', N'Student10', NULL, NULL, NULL, NULL, 47, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (54, N'Student11', N'Student11', N'Student11', NULL, NULL, NULL, NULL, 48, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (55, N'Student12', N'Student12', N'Student12', NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (56, N'Student13', N'Student13', N'Student13', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (57, N'Student14', N'Student14', N'Student14', NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (58, N'Student15', N'Student15', N'Student15', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (59, N'Student16', N'Student16', N'Student16', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (60, N'Student17', N'Student17', N'Student17', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (61, N'Student18', N'Student18', N'Student18', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (62, N'Student19', N'Student19', N'Student19', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (63, N'Student20', N'Student20', N'Student20', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (64, N'Student21', N'Student21', N'Student21', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (65, N'Student22', N'Student22', N'Student22', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (66, N'Student23', N'Student23', N'Student23', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (67, N'Student24', N'Student24', N'Student24', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (68, N'Student25', N'Student25', N'Student25', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (69, N'Student26', N'Student26', N'Student26', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (70, N'Student27', N'Student27', N'Student27', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (71, N'Student28', N'Student28', N'Student28', NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (72, N'Student29', N'Student29', N'Student29', NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (73, N'Student30', N'Student30', N'Student30', NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, N'Not Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status]) VALUES (74, N'Staff', N'Staff', N'Staff', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'Activated')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Aspirations]  WITH CHECK ADD  CONSTRAINT [FK_Aspirations_Experience] FOREIGN KEY([ExperienceID])
REFERENCES [dbo].[Experience] ([ExperienceID])
GO
ALTER TABLE [dbo].[Aspirations] CHECK CONSTRAINT [FK_Aspirations_Experience]
GO
ALTER TABLE [dbo].[Aspirations]  WITH CHECK ADD  CONSTRAINT [FK_Aspirations_Jobs] FOREIGN KEY([JobID])
REFERENCES [dbo].[Jobs] ([JobID])
GO
ALTER TABLE [dbo].[Aspirations] CHECK CONSTRAINT [FK_Aspirations_Jobs]
GO
ALTER TABLE [dbo].[Experience]  WITH CHECK ADD  CONSTRAINT [FK_Experience_Skills] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([SkillID])
GO
ALTER TABLE [dbo].[Experience] CHECK CONSTRAINT [FK_Experience_Skills]
GO
ALTER TABLE [dbo].[Experience]  WITH CHECK ADD  CONSTRAINT [FK_Experience_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Experience] CHECK CONSTRAINT [FK_Experience_Users]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_FeedbackTypes] FOREIGN KEY([FeedbackTypeID])
REFERENCES [dbo].[FeedbackTypes] ([FeedbackTypeID])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_FeedbackTypes]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Users] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Users]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Users1] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Users1]
GO
ALTER TABLE [dbo].[HistoryRecords]  WITH CHECK ADD  CONSTRAINT [FK_HistoryRecords_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[HistoryRecords] CHECK CONSTRAINT [FK_HistoryRecords_Users]
GO
ALTER TABLE [dbo].[InterviewSchedules]  WITH CHECK ADD  CONSTRAINT [FK_InterviewSchedules_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[InterviewSchedules] CHECK CONSTRAINT [FK_InterviewSchedules_Locations]
GO
ALTER TABLE [dbo].[InterviewSchedules]  WITH CHECK ADD  CONSTRAINT [FK_InterviewSchedules_Users] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[InterviewSchedules] CHECK CONSTRAINT [FK_InterviewSchedules_Users]
GO
ALTER TABLE [dbo].[InterviewSchedules]  WITH CHECK ADD  CONSTRAINT [FK_InterviewSchedules_Users1] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[InterviewSchedules] CHECK CONSTRAINT [FK_InterviewSchedules_Users1]
GO
ALTER TABLE [dbo].[Jobs]  WITH NOCHECK ADD  CONSTRAINT [FK_Jobs_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Locations]
GO
ALTER TABLE [dbo].[Jobs]  WITH NOCHECK ADD  CONSTRAINT [FK_Jobs_Users] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Users]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Users3] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Users3]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Users4] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Users4]
GO
ALTER TABLE [dbo].[Rates]  WITH NOCHECK ADD  CONSTRAINT [FK_Rates_Users] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Rates] CHECK CONSTRAINT [FK_Rates_Users]
GO
ALTER TABLE [dbo].[Rates]  WITH NOCHECK ADD  CONSTRAINT [FK_Rates_Users1] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Rates] CHECK CONSTRAINT [FK_Rates_Users1]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Departments]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Rates] FOREIGN KEY([RateID])
REFERENCES [dbo].[Rates] ([RateID])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Rates]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Users] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Users]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Users1] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Users1]
GO
ALTER TABLE [dbo].[SkillDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_SkillDetails_Aspirations] FOREIGN KEY([AspirationsID])
REFERENCES [dbo].[Aspirations] ([AspirationsID])
GO
ALTER TABLE [dbo].[SkillDetails] CHECK CONSTRAINT [FK_SkillDetails_Aspirations]
GO
ALTER TABLE [dbo].[SkillDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_SkillDetails_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[SkillDetails] CHECK CONSTRAINT [FK_SkillDetails_Departments]
GO
ALTER TABLE [dbo].[SkillDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_SkillDetails_Jobs] FOREIGN KEY([JobID])
REFERENCES [dbo].[Jobs] ([JobID])
GO
ALTER TABLE [dbo].[SkillDetails] CHECK CONSTRAINT [FK_SkillDetails_Jobs]
GO
ALTER TABLE [dbo].[SkillDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_SkillDetails_Skills] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([SkillID])
GO
ALTER TABLE [dbo].[SkillDetails] CHECK CONSTRAINT [FK_SkillDetails_Skills]
GO
ALTER TABLE [dbo].[Statistical]  WITH CHECK ADD  CONSTRAINT [FK_Statistical_Users] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Statistical] CHECK CONSTRAINT [FK_Statistical_Users]
GO
ALTER TABLE [dbo].[UserAspirations]  WITH CHECK ADD  CONSTRAINT [FK_UserAspirations_Aspirations] FOREIGN KEY([AspirationsID])
REFERENCES [dbo].[Aspirations] ([AspirationsID])
GO
ALTER TABLE [dbo].[UserAspirations] CHECK CONSTRAINT [FK_UserAspirations_Aspirations]
GO
ALTER TABLE [dbo].[UserAspirations]  WITH CHECK ADD  CONSTRAINT [FK_UserAspirations_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserAspirations] CHECK CONSTRAINT [FK_UserAspirations_Users]
GO
ALTER TABLE [dbo].[UserJobs]  WITH CHECK ADD  CONSTRAINT [FK_UserJobs_Jobs] FOREIGN KEY([JobID])
REFERENCES [dbo].[Jobs] ([JobID])
GO
ALTER TABLE [dbo].[UserJobs] CHECK CONSTRAINT [FK_UserJobs_Jobs]
GO
ALTER TABLE [dbo].[UserJobs]  WITH CHECK ADD  CONSTRAINT [FK_UserJobs_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserJobs] CHECK CONSTRAINT [FK_UserJobs_Users]
GO
ALTER TABLE [dbo].[UserRole]  WITH NOCHECK ADD  CONSTRAINT [FK_UserRole_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Roles]
GO
ALTER TABLE [dbo].[UserRole]  WITH NOCHECK ADD  CONSTRAINT [FK_UserRole_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Users]
GO
ALTER TABLE [dbo].[Users]  WITH NOCHECK ADD  CONSTRAINT [FK_Users_Images] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Images] ([ImageID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Images]
GO
ALTER TABLE [dbo].[Users]  WITH NOCHECK ADD  CONSTRAINT [FK_Users_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Locations]
GO
