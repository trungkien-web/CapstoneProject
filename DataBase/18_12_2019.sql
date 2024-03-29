USE [FPTInternshipManagerment]
GO
/****** Object:  Table [dbo].[Aspirations]    Script Date: 12/18/2019 1:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aspirations](
	[AspirationsID] [int] IDENTITY(1,1) NOT NULL,
	[AspirationsName] [nvarchar](50) NOT NULL,
	[ExperienceID] [int] NULL,
	[JobID] [int] NULL,
	[Description] [ntext] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Aspirations] PRIMARY KEY CLUSTERED 
(
	[AspirationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspirationSkills]    Script Date: 12/18/2019 1:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspirationSkills](
	[AspirationJobID] [int] IDENTITY(1,1) NOT NULL,
	[SkillID] [int] NOT NULL,
	[AspirationID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AspirationJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 12/18/2019 1:14:31 PM ******/
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
/****** Object:  Table [dbo].[Experience]    Script Date: 12/18/2019 1:14:31 PM ******/
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
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 12/18/2019 1:14:31 PM ******/
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
/****** Object:  Table [dbo].[FeedbackTypes]    Script Date: 12/18/2019 1:14:31 PM ******/
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
/****** Object:  Table [dbo].[HistoryRecords]    Script Date: 12/18/2019 1:14:31 PM ******/
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
/****** Object:  Table [dbo].[Images]    Script Date: 12/18/2019 1:14:31 PM ******/
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
/****** Object:  Table [dbo].[InterviewSchedules]    Script Date: 12/18/2019 1:14:31 PM ******/
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
/****** Object:  Table [dbo].[Jobs]    Script Date: 12/18/2019 1:14:31 PM ******/
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
	[SkillGen] [nvarchar](250) NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 12/18/2019 1:14:31 PM ******/
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
/****** Object:  Table [dbo].[Notifications]    Script Date: 12/18/2019 1:14:31 PM ******/
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
/****** Object:  Table [dbo].[Rates]    Script Date: 12/18/2019 1:14:31 PM ******/
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
/****** Object:  Table [dbo].[Reports]    Script Date: 12/18/2019 1:14:31 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 12/18/2019 1:14:31 PM ******/
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
/****** Object:  Table [dbo].[SkillDetails]    Script Date: 12/18/2019 1:14:32 PM ******/
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
/****** Object:  Table [dbo].[Skills]    Script Date: 12/18/2019 1:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[SkillID] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](50) NOT NULL,
	[SkillGen] [nvarchar](250) NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statistical]    Script Date: 12/18/2019 1:14:32 PM ******/
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
/****** Object:  Table [dbo].[UserAspirations]    Script Date: 12/18/2019 1:14:32 PM ******/
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
/****** Object:  Table [dbo].[UserJobs]    Script Date: 12/18/2019 1:14:32 PM ******/
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 12/18/2019 1:14:32 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 12/18/2019 1:14:32 PM ******/
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
	[GPA] [nvarchar](50) NULL,
	[Semester] [nvarchar](50) NULL,
	[Specialized] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Aspirations] ON 

INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (7, N'Java', NULL, NULL, N'<p>Lam Java</p>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (8, N'Muon Tim Nguoi Lam Java', NULL, NULL, N'<p>Muon Tim Nguoi Lam Java</p>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (9, N'Dev', NULL, NULL, N'<p>Dev</p>', N'Processing')
SET IDENTITY_INSERT [dbo].[Aspirations] OFF
SET IDENTITY_INSERT [dbo].[AspirationSkills] ON 

INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (1, 64, 7)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (3, 65, 8)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (4, 7, 9)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (5, 32, 9)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (6, 65, 9)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (7, 66, 9)
SET IDENTITY_INSERT [dbo].[AspirationSkills] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (1, N'Software Engineering')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (2, N'Business Administration')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (3, N'Japanese Language')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (4, N'Graphic Design')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Experience] ON 

INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (5, 60, 22, CAST(N'2019-01-01' AS Date), N' ASdas')
INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (6, 60, 8, CAST(N'2019-01-01' AS Date), N'á')
INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (7, 60, 2, CAST(N'2019-01-01' AS Date), N' sdfdsf')
INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (8, 60, 1, CAST(N'2019-01-01' AS Date), N' dsfsdfsdfsdf')
INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (10, 44, 3, CAST(N'2019-01-01' AS Date), N' A')
INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (11, 60, 7, CAST(N'2019-01-01' AS Date), N' zx')
INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (12, 50, 2, CAST(N'2019-01-01' AS Date), N'1 Nam')
SET IDENTITY_INSERT [dbo].[Experience] OFF
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

INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (1, N'Junior QA Engineer (Manual Tester)', NULL, 1, 33, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (2, N'Sr. Java Developer (JavaScript/SQL/CSS)', NULL, 2, 34, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (3, N'Mobile Apps Developer (iOS, Android)', NULL, 3, 35, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (4, N'Frontend Dev (ReactJS/ English)', NULL, 4, 36, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (5, N'Full Stack Developer', NULL, 5, 37, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (6, N'Devops Engineer', NULL, 6, 38, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (7, N'UI/UX Designer', NULL, 7, 39, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (8, N'Jr. NET Developers (C#/ ASP.NET) 1-2 yrs', NULL, 8, 40, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (9, N'08 Java Back-end (Spring)', NULL, 9, 41, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (10, N'Senior Android Developer (Java, Kotlin)', NULL, 10, 42, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (11, N'Product Manager (Mobile Games)', NULL, 11, 43, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (12, N'React Native Dev-Mobile Apps/iOS/Android', NULL, 12, 44, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (13, N'Data Engineers (Database, Java, Python)', NULL, 13, 45, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (14, N'05 Game Developers (Unity/C#) ~ 1.500$', NULL, 14, 46, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (15, N'Junior Python Web Developer (SQL, AWS)', NULL, 15, 47, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (16, N'Java Technical Lead/Architect', NULL, 16, 48, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (17, N'5 Backend Devs (Python, SQL, C++)', NULL, 17, 49, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (18, N'Python Developer ( UPTO $2500)', NULL, 18, 50, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (19, N'05 PHP Web Developer (MySQL, Laravel)', NULL, 19, 51, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (20, N'10+ Java Developer (1-5 year experience)', NULL, 20, 52, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (21, N'DevOps Engineer', NULL, 21, 53, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (22, N'Junior Backend Engineer (Ruby on Rails)', NULL, 22, 54, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (23, N'Java Developer ( Spring, MVC) ~ 2000$', NULL, 23, 55, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (24, N'Manual Tester (QA QC) - Sign on bonus', NULL, 24, 56, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (25, N'.NET Developer (C#, ASP.NET)', NULL, 25, 57, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (26, N'15 Java Developers (Spring, MVC)', NULL, 26, 33, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (27, N'C & SQL Developer (Training in Europe)', NULL, 27, 34, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (28, N'Core Backend/Protocol Engineer Remote OK', NULL, 28, 35, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (29, N'QA QC Engineer (Tester)', NULL, 29, 36, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (30, N'Mobile Developer (Android, iOS, Swift)', NULL, 30, 37, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (31, N'Business Analyst (Product Manager/UI-UX)', NULL, 31, 38, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (32, N'Backend Developer (Python, Database)', NULL, 32, 39, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (33, N'Junior 3D Designer (UI-UX)', NULL, 33, 40, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (34, N'Frontend Developer (JavaScript/HTML5)', NULL, 34, 41, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (35, N'QA Engineer (Automation & Manual)', NULL, 35, 42, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (36, N'Software QA Engineer (Manual)', NULL, 36, 43, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (37, N'Senior Web Developer (1200 - 2000 USD)', NULL, 37, 44, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (38, N'PHP Developer (Exp. 6-12 months)', NULL, 38, 45, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (39, N'Software Engineer for C (JD74)', NULL, 39, 46, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (40, N'Backend .NET Developer (ASP.NET, MVC)', NULL, 40, 47, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (41, N'02 Lead/Senior .Net Web Engineers', NULL, 41, 48, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (42, N'Backend Developers (Ruby on Rails, PHP)', NULL, 42, 49, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (43, N'10 Kỹ sư phát triển phần mềm (Java/.NET)', NULL, 43, 50, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (44, N'Backend Engineer (Java/Python)', NULL, 44, 51, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (45, N'Front-end Dev (Angular/ReactJS/VueJS)', NULL, 45, 52, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (46, N'QA Automation Engineer (Tester)', NULL, 46, 53, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (47, N'Mobile Apps Developer (React Native)', NULL, 47, 54, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (48, N'05 React Native Developer (iOS, Android)', NULL, 48, 55, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (49, N'20 Senior Fullstack Devs (Java, ReactJS)', NULL, 49, 56, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (50, N'(Junior/Senior) React Native Developer', NULL, 50, 57, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (51, N'Technical Lead (PHP/ReactJS)', NULL, 51, 33, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (52, N'Junior QA (Restful APIs/Automation)', NULL, 52, 34, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (53, N'Sr. Full-stack Dev (PHP/ReactJS/English)', NULL, 53, 35, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (54, N'4 PHP Web Developers (Mysql, JQuery)', NULL, 54, 36, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (55, N'Python Developer (Django, SQL)', NULL, 55, 37, NULL, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (58, N'Senior Android Developer (Sign-on bonus)', N'877', 1, 19, 787, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (60, N'Sr. Front-end Developer (Sign-on bonus)', N'asd', 1, 19, 4, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (63, N'Java dev', N'can 5 dev', 1, 25, 5, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (64, N'DevJava', N'Lam Java', 1, 20, 4, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (65, N'Java', N'Tim Dev Java', 1, 39, 3, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (66, N'Dev tai cong ty', N'Dev tai cong ty', 1, 39, 3, N'Available', NULL)
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
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (30, 2, NULL, NULL, 64)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (31, 18, NULL, NULL, 64)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (32, 2, NULL, NULL, 65)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (33, 1, NULL, NULL, 66)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (34, 3, NULL, NULL, 66)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (35, 7, NULL, NULL, 66)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (36, 12, NULL, NULL, 66)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (37, 19, NULL, NULL, 66)
SET IDENTITY_INSERT [dbo].[SkillDetails] OFF
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (1, N'Asp.net', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (2, N'Java', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (3, N'C', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (4, N'C++', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (5, N'PHP', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (6, N'HTML', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (7, N'PHP', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (8, N'UX Design', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (9, N'Python', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (10, N'JavaScript', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (11, N'Java', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (12, N'Ruby', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (13, N'IP Setup', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (14, N'TypeScript', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (15, N'Swift', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (16, N'Scala', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (17, N'Objective-C', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (18, N'Shell', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (19, N'Go', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (20, N'C#', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (21, N'CSS', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (22, N'SQL', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (23, N'OutSystems', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (24, N'Saleforece', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (25, N'Testing', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (26, N'MySql', NULL)
INSERT [dbo].[Skills] ([SkillID], [SkillName], [SkillGen]) VALUES (27, N'Oracel', NULL)
SET IDENTITY_INSERT [dbo].[Skills] OFF
SET IDENTITY_INSERT [dbo].[UserAspirations] ON 

INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (7, 7, 20)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (8, 8, 39)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (9, 9, 39)
SET IDENTITY_INSERT [dbo].[UserAspirations] OFF
SET IDENTITY_INSERT [dbo].[UserJobs] ON 

INSERT [dbo].[UserJobs] ([UserJobID], [JobID], [UserID], [Status]) VALUES (18, 7, 60, N'Not Activated')
INSERT [dbo].[UserJobs] ([UserJobID], [JobID], [UserID], [Status]) VALUES (19, 8, 60, N'Not Activated')
SET IDENTITY_INSERT [dbo].[UserJobs] OFF
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
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (148, 75, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (149, 79, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (150, 80, 1)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (1, N'AdminKien', N'e10adc3949ba59abbe56e057f20f883e', N'Bùi Trung Kiên
', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (2, N'Admin2', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Hoàng Long
', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (3, N'Admin3', N'e10adc3949ba59abbe56e057f20f883e', N'Admin3', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (4, N'Admin4', N'e10adc3949ba59abbe56e057f20f883e', N'Admin4', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (5, N'Admin5', N'e10adc3949ba59abbe56e057f20f883e', N'Admin5', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (6, N'Admin6', N'e10adc3949ba59abbe56e057f20f883e', N'Admin6', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (7, N'Admin7', N'e10adc3949ba59abbe56e057f20f883e', N'Admin7', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (8, N'Admin8', N'e10adc3949ba59abbe56e057f20f883e', N'Admin8', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (9, N'Admin9', N'e10adc3949ba59abbe56e057f20f883e', N'Admin9', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (10, N'Admin10', N'e10adc3949ba59abbe56e057f20f883e', N'Admin10', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (11, N'Admin11', N'e10adc3949ba59abbe56e057f20f883e', N'Admin11', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (12, N'Admin12', N'e10adc3949ba59abbe56e057f20f883e', N'Admin12', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (13, N'Admin13', N'e10adc3949ba59abbe56e057f20f883e', N'Admin13', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (14, N'Admin14', N'e10adc3949ba59abbe56e057f20f883e', N'Admin14', NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (15, N'Admin15', N'e10adc3949ba59abbe56e057f20f883e', N'Admin15', NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (16, N'Admin16', N'e10adc3949ba59abbe56e057f20f883e', N'Admin16', NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (17, N'Admin17', N'e10adc3949ba59abbe56e057f20f883e', N'Admin17', NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (18, N'Admin18', N'e10adc3949ba59abbe56e057f20f883e', N'Admin18', NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (19, N'Recuiter1', N'e10adc3949ba59abbe56e057f20f883e', N'NFQ Asia', NULL, NULL, NULL, N'kien@gmail.com.vn', 12, NULL, NULL, NULL, 2, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (20, N'Recuiter2', N'e10adc3949ba59abbe56e057f20f883e', N'BOCASAY', NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 5, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (21, N'Recuiter3', N'e10adc3949ba59abbe56e057f20f883e', N'East Agile', NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, 3, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (22, N'Recuiter4', N'e10adc3949ba59abbe56e057f20f883e', N'Grab (Vietnam) Ltd', NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, 4, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (23, N'Recuiter5', N'e10adc3949ba59abbe56e057f20f883e', N'Knorex
', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, 5, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (24, N'Recuiter6', N'e10adc3949ba59abbe56e057f20f883e', N'Nexus Frontier Tech
', NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, 2, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (25, N'Recuiter7', N'e10adc3949ba59abbe56e057f20f883e', N'ZALORA Group
', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, 3, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (26, N'Recuiter8', N'e10adc3949ba59abbe56e057f20f883e', N'Cinnamon AI Labs
', NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, 4, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (27, N'Recuiter9', N'e10adc3949ba59abbe56e057f20f883e', N'Techbase Vietnam
', NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 5, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (28, N'Recuiter10', N'e10adc3949ba59abbe56e057f20f883e', N'1PAC Việt Nam
', NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, 6, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (29, N'Recuiter11', N'e10adc3949ba59abbe56e057f20f883e', N'KMS Technology
', NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, 7, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (30, N'Recuiter12', N'e10adc3949ba59abbe56e057f20f883e', N'DEK Technologies
', NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, 2, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (31, N'Recuiter13', N'e10adc3949ba59abbe56e057f20f883e', N'Vin Software', NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, 3, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (32, N'Recuiter14', N'e10adc3949ba59abbe56e057f20f883e', N'Absolute Software (Vietnam) Ltd
', NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, 5, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (33, N'Recuiter15', N'e10adc3949ba59abbe56e057f20f883e', N'Hybrid Technologies 
', NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, 4, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (34, N'Recuiter16', N'e10adc3949ba59abbe56e057f20f883e', N'FPT Software
', NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, 5, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (35, N'Recuiter17', N'e10adc3949ba59abbe56e057f20f883e', N'Viettel
', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, 6, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (36, N'Recuiter18', N'e10adc3949ba59abbe56e057f20f883e', N'Panasonic
', NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, 7, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (37, N'Recuiter19', N'e10adc3949ba59abbe56e057f20f883e', N'TeachBase
', NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, 6, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (38, N'Recuiter20', N'e10adc3949ba59abbe56e057f20f883e', N'Home Credit
', NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, 5, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (39, N'Recuiter21', N'e10adc3949ba59abbe56e057f20f883e', N'Home Credit
', NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, 4, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (40, N'Recuiter22', N'e10adc3949ba59abbe56e057f20f883e', N'Fossil Viet Nam
', NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, 7, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (41, N'Recuiter23', N'e10adc3949ba59abbe56e057f20f883e', N'Toshiba Software
', NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, 2, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (42, N'Recuiter24', N'e10adc3949ba59abbe56e057f20f883e', N'LG Development Center
', NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, 3, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (43, N'Recuiter25', N'e10adc3949ba59abbe56e057f20f883e', N'OPSWAT Software
', NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, 4, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (44, N'Student1', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Xuân Hải
', NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, N'Activated', NULL, N'Spring 2018', NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (45, N'Student2', N'e10adc3949ba59abbe56e057f20f883e', N'Trịnh Thị Hà My
', NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, N'Activated', NULL, N'Spring 2019', NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (46, N'Student3', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Việt Anh
', NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (47, N'Student4', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Đức Tuyên
', NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (48, N'Student5', N'e10adc3949ba59abbe56e057f20f883e', N'Hà Thành Lợi
', NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (49, N'Student6', N'e10adc3949ba59abbe56e057f20f883e', N'Lê Quang Tuấn
', NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (50, N'Student7', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Minh Hiếu
', NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (51, N'Student8', N'e10adc3949ba59abbe56e057f20f883e', N'Vương Đắc Khải
', NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (52, N'Student9', N'e10adc3949ba59abbe56e057f20f883e', N'Lê Dương Anh Tuấn
', NULL, NULL, NULL, NULL, 46, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (53, N'Student10', N'e10adc3949ba59abbe56e057f20f883e', N'Phan Văn Hiển
', NULL, NULL, NULL, NULL, 47, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (54, N'Student11', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Bình Minh
', NULL, NULL, NULL, NULL, 48, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (55, N'Student12', N'e10adc3949ba59abbe56e057f20f883e', N'Đỗ Bảo Tú', NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (56, N'Student13', N'e10adc3949ba59abbe56e057f20f883e', N'Đỗ Hồng Sơn
', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (57, N'Student14', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Đức Ngọc Long
', NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (58, N'Student15', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Văn Sang
', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (59, N'Student16', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Xuân Bách
', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (60, N'Student17', N'e10adc3949ba59abbe56e057f20f883e', N'Ngô Thái Hà
', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (61, N'Student18', N'e10adc3949ba59abbe56e057f20f883e', N'Đậu Minh Đức
', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (62, N'Student19', N'e10adc3949ba59abbe56e057f20f883e', N'Bùi Thanh Tùng
', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (63, N'Student20', N'e10adc3949ba59abbe56e057f20f883e', N'Đỗ Trọng Tân
', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (64, N'Student21', N'e10adc3949ba59abbe56e057f20f883e', N'Đào Anh Dũng
', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (65, N'Student22', N'e10adc3949ba59abbe56e057f20f883e', N'Đàm Quang Diệu
', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (66, N'Student23', N'e10adc3949ba59abbe56e057f20f883e', N'Tạ Đức Bình
', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (67, N'Student24', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Tùng Lâm
', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (68, N'Student25', N'e10adc3949ba59abbe56e057f20f883e', N'Phương Đình Anh
', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (69, N'Student26', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Tiến Dũng
', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (70, N'Student27', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Anh Tú
', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (71, N'Student28', N'e10adc3949ba59abbe56e057f20f883e', N'Phạm Minh Đạt
', NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (72, N'Student29', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn  Thị Trang
', NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (73, N'Student30', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Thái Dương
', NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (74, N'Staff', N'e10adc3949ba59abbe56e057f20f883e', N'Đinh Công Đức
', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (75, N'', N'e10adc3949ba59abbe56e057f20f883e', N'', NULL, NULL, NULL, N'', 1, NULL, NULL, NULL, NULL, N'Delete', NULL, N'Spring', N'')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (76, N'', N'e10adc3949ba59abbe56e057f20f883e', N'', NULL, NULL, NULL, N'', 15, NULL, NULL, NULL, NULL, N'Not Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (77, N'', N'e10adc3949ba59abbe56e057f20f883e', N'', NULL, NULL, NULL, N'', 1, NULL, NULL, NULL, NULL, N'Not Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (78, N'FPT', N'e10adc3949ba59abbe56e057f20f883e', N'FPT', NULL, NULL, NULL, N'Fpt@gmail.com', 7, NULL, NULL, NULL, NULL, N'Not Activated', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (79, N'Do Dinh Duc', N'e10adc3949ba59abbe56e057f20f883e', N'AdminDuc', NULL, NULL, NULL, N'ducdd@gmail.com.vn', 1, NULL, NULL, NULL, NULL, N'Activated', NULL, N'Summer', N'SE')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized]) VALUES (80, N'AdminHoa', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Hữu Hóa', NULL, NULL, NULL, N'hoahh@gmail.com.vn', 1, NULL, NULL, NULL, NULL, N'Activated', NULL, N'Summer', N'123')
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
