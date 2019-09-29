USE [RecruitmentSystem]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Type] [int] NOT NULL,
	[StudentID] [nvarchar](50) NULL,
	[RecruiterID] [int] NULL,
	[AdminID] [int] NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](50) NOT NULL,
	[LocationID] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[SkillID] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Experience]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experience](
	[ExperienceID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [nvarchar](50) NOT NULL,
	[SkillID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Experience] PRIMARY KEY CLUSTERED 
(
	[ExperienceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackRecruiter]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackRecruiter](
	[FeedbackRecruiterID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackRecruiterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackStudent]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackStudent](
	[FeedbackStudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FeedbackStudent] PRIMARY KEY CLUSTERED 
(
	[FeedbackStudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[Image] [image] NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewSchedule]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewSchedule](
	[InterviewID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[LocationID] [int] NOT NULL,
	[StatusInterviewID] [int] NOT NULL,
 CONSTRAINT [PK_InterviewSchedule] PRIMARY KEY CLUSTERED 
(
	[InterviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[JobName] [nvarchar](50) NOT NULL,
	[SkillID] [int] NOT NULL,
	[ContentJob] [nvarchar](50) NOT NULL,
	[LocationID] [int] NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[AmountStudent] [int] NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[LocationDetail] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	[RecruiterID] [int] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rate]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[RateID] [int] IDENTITY(1,1) NOT NULL,
	[Star] [float] NOT NULL,
	[Comment] [nvarchar](50) NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rate] PRIMARY KEY CLUSTERED 
(
	[RateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recommend]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recommend](
	[RecommendID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	[RecruiterID] [int] NOT NULL,
 CONSTRAINT [PK_Recommend] PRIMARY KEY CLUSTERED 
(
	[RecommendID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruiter]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiter](
	[RecruiterID] [int] IDENTITY(1,1) NOT NULL,
	[RecruiterName] [nvarchar](50) NOT NULL,
	[RecruiterAspirationsID] [int] NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[LocationID] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[ImageID] [int] NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_Recruiter] PRIMARY KEY CLUSTERED 
(
	[RecruiterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecruiterAspirations]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecruiterAspirations](
	[RecruiterAspirationsID] [int] IDENTITY(1,1) NOT NULL,
	[ExperienceID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
	[Gender] [bit] NOT NULL,
	[Salary] [float] NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_RecruiterAspirations] PRIMARY KEY CLUSTERED 
(
	[RecruiterAspirationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecruiterReport]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecruiterReport](
	[RecruiterReportID] [int] IDENTITY(1,1) NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[RecruiterName] [nvarchar](50) NOT NULL,
	[RateID] [int] NOT NULL,
 CONSTRAINT [PK_RecruiterReport] PRIMARY KEY CLUSTERED 
(
	[RecruiterReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleType]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleType](
	[RoleTypeID] [int] IDENTITY(1,1) NOT NULL,
	[RoleTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RoleType] PRIMARY KEY CLUSTERED 
(
	[RoleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[SkillID] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](50) NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statistical]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistical](
	[StatisticalID] [int] IDENTITY(1,1) NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[RecruiterName] [nvarchar](50) NOT NULL,
	[NumRequest] [int] NOT NULL,
	[NumPassed] [int] NOT NULL,
	[NumFail] [int] NOT NULL,
 CONSTRAINT [PK_Statistical] PRIMARY KEY CLUSTERED 
(
	[StatisticalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusInterview]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusInterview](
	[StatusInterviewID] [int] IDENTITY(1,1) NOT NULL,
	[StatusInterview] [nvarchar](50) NOT NULL,
	[MessageID] [int] NOT NULL,
 CONSTRAINT [PK_StatusInterview] PRIMARY KEY CLUSTERED 
(
	[StatusInterviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [nvarchar](50) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[ExperienceID] [int] NULL,
	[DepartmentID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[DOB] [date] NOT NULL,
	[Gender] [bit] NOT NULL,
	[CV] [nvarchar](50) NULL,
	[StudentAspirationsID] [int] NULL,
	[PhoneNumber] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[SkillID] [int] NULL,
	[GPA] [float] NOT NULL,
	[ImageID] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAspirations]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAspirations](
	[StudentAspirationsID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Salary] [float] NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StudentAspirations] PRIMARY KEY CLUSTERED 
(
	[StudentAspirationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentReport]    Script Date: 9/29/2019 9:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentReport](
	[StudentReportID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[Course] [nvarchar](50) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[Grade] [float] NOT NULL,
	[Comment] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StudentReport] PRIMARY KEY CLUSTERED 
(
	[StudentReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Admin] FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Admin]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Recruiter]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_RoleType] FOREIGN KEY([Type])
REFERENCES [dbo].[RoleType] ([RoleTypeID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_RoleType]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Status]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Student]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Location]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Skill] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skill] ([SkillID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Skill]
GO
ALTER TABLE [dbo].[FeedbackRecruiter]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackRecruiter_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[FeedbackRecruiter] CHECK CONSTRAINT [FK_FeedbackRecruiter_Recruiter]
GO
ALTER TABLE [dbo].[FeedbackRecruiter]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackRecruiter_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[FeedbackRecruiter] CHECK CONSTRAINT [FK_FeedbackRecruiter_Student]
GO
ALTER TABLE [dbo].[FeedbackStudent]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[FeedbackStudent] CHECK CONSTRAINT [FK_Feedback_Recruiter]
GO
ALTER TABLE [dbo].[FeedbackStudent]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[FeedbackStudent] CHECK CONSTRAINT [FK_Feedback_Student]
GO
ALTER TABLE [dbo].[InterviewSchedule]  WITH CHECK ADD  CONSTRAINT [FK_InterviewSchedule_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[InterviewSchedule] CHECK CONSTRAINT [FK_InterviewSchedule_Location]
GO
ALTER TABLE [dbo].[InterviewSchedule]  WITH CHECK ADD  CONSTRAINT [FK_InterviewSchedule_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[InterviewSchedule] CHECK CONSTRAINT [FK_InterviewSchedule_Recruiter]
GO
ALTER TABLE [dbo].[InterviewSchedule]  WITH CHECK ADD  CONSTRAINT [FK_InterviewSchedule_StatusInterview] FOREIGN KEY([StatusInterviewID])
REFERENCES [dbo].[StatusInterview] ([StatusInterviewID])
GO
ALTER TABLE [dbo].[InterviewSchedule] CHECK CONSTRAINT [FK_InterviewSchedule_StatusInterview]
GO
ALTER TABLE [dbo].[InterviewSchedule]  WITH CHECK ADD  CONSTRAINT [FK_InterviewSchedule_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[InterviewSchedule] CHECK CONSTRAINT [FK_InterviewSchedule_Student]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_Skill] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skill] ([SkillID])
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_Skill]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Recruiter]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Student]
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD  CONSTRAINT [FK_Rate_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[Rate] CHECK CONSTRAINT [FK_Rate_Recruiter]
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD  CONSTRAINT [FK_Rate_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Rate] CHECK CONSTRAINT [FK_Rate_Student]
GO
ALTER TABLE [dbo].[Recommend]  WITH CHECK ADD  CONSTRAINT [FK_Recommend_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[Recommend] CHECK CONSTRAINT [FK_Recommend_Recruiter]
GO
ALTER TABLE [dbo].[Recommend]  WITH CHECK ADD  CONSTRAINT [FK_Recommend_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Recommend] CHECK CONSTRAINT [FK_Recommend_Student]
GO
ALTER TABLE [dbo].[Recruiter]  WITH CHECK ADD  CONSTRAINT [FK_Recruiter_Image] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Image] ([ImageID])
GO
ALTER TABLE [dbo].[Recruiter] CHECK CONSTRAINT [FK_Recruiter_Image]
GO
ALTER TABLE [dbo].[Recruiter]  WITH CHECK ADD  CONSTRAINT [FK_Recruiter_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Recruiter] CHECK CONSTRAINT [FK_Recruiter_Location]
GO
ALTER TABLE [dbo].[Recruiter]  WITH CHECK ADD  CONSTRAINT [FK_Recruiter_RecruiterAspirations] FOREIGN KEY([RecruiterAspirationsID])
REFERENCES [dbo].[RecruiterAspirations] ([RecruiterAspirationsID])
GO
ALTER TABLE [dbo].[Recruiter] CHECK CONSTRAINT [FK_Recruiter_RecruiterAspirations]
GO
ALTER TABLE [dbo].[Recruiter]  WITH CHECK ADD  CONSTRAINT [FK_Recruiter_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Recruiter] CHECK CONSTRAINT [FK_Recruiter_Status]
GO
ALTER TABLE [dbo].[RecruiterAspirations]  WITH CHECK ADD  CONSTRAINT [FK_RecruiterAspirations_Experience] FOREIGN KEY([ExperienceID])
REFERENCES [dbo].[Experience] ([ExperienceID])
GO
ALTER TABLE [dbo].[RecruiterAspirations] CHECK CONSTRAINT [FK_RecruiterAspirations_Experience]
GO
ALTER TABLE [dbo].[RecruiterAspirations]  WITH CHECK ADD  CONSTRAINT [FK_RecruiterAspirations_Job] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
GO
ALTER TABLE [dbo].[RecruiterAspirations] CHECK CONSTRAINT [FK_RecruiterAspirations_Job]
GO
ALTER TABLE [dbo].[RecruiterAspirations]  WITH CHECK ADD  CONSTRAINT [FK_RecruiterAspirations_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[RecruiterAspirations] CHECK CONSTRAINT [FK_RecruiterAspirations_Status]
GO
ALTER TABLE [dbo].[RecruiterReport]  WITH CHECK ADD  CONSTRAINT [FK_RecruiterReport_Rate] FOREIGN KEY([RateID])
REFERENCES [dbo].[Rate] ([RateID])
GO
ALTER TABLE [dbo].[RecruiterReport] CHECK CONSTRAINT [FK_RecruiterReport_Rate]
GO
ALTER TABLE [dbo].[RecruiterReport]  WITH CHECK ADD  CONSTRAINT [FK_RecruiterReport_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[RecruiterReport] CHECK CONSTRAINT [FK_RecruiterReport_Recruiter]
GO
ALTER TABLE [dbo].[Statistical]  WITH CHECK ADD  CONSTRAINT [FK_Statistical_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[Statistical] CHECK CONSTRAINT [FK_Statistical_Recruiter]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department1] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department1]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Experience] FOREIGN KEY([ExperienceID])
REFERENCES [dbo].[Experience] ([ExperienceID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Experience]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Image] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Image] ([ImageID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Image]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Location]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_StudentAspirations] FOREIGN KEY([StudentAspirationsID])
REFERENCES [dbo].[StudentAspirations] ([StudentAspirationsID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_StudentAspirations]
GO
ALTER TABLE [dbo].[StudentReport]  WITH CHECK ADD  CONSTRAINT [FK_StudentReport_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[StudentReport] CHECK CONSTRAINT [FK_StudentReport_Department]
GO
ALTER TABLE [dbo].[StudentReport]  WITH CHECK ADD  CONSTRAINT [FK_StudentReport_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[StudentReport] CHECK CONSTRAINT [FK_StudentReport_Recruiter]
GO
ALTER TABLE [dbo].[StudentReport]  WITH CHECK ADD  CONSTRAINT [FK_StudentReport_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentReport] CHECK CONSTRAINT [FK_StudentReport_Student]
GO
