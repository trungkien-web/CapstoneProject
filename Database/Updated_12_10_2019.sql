
USE [FptInternshipManagerment]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 10/12/2019 5:15:37 PM ******/
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
/****** Object:  Table [dbo].[Experiences]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experiences](
	[ExperienceID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [nvarchar](50) NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Experiences] PRIMARY KEY CLUSTERED 
(
	[ExperienceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[FeedbackTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackTypes]    Script Date: 10/12/2019 5:15:37 PM ******/
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
/****** Object:  Table [dbo].[Images]    Script Date: 10/12/2019 5:15:37 PM ******/
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
/****** Object:  Table [dbo].[InterviewSchedules]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewSchedules](
	[InterviewID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[LocationID] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_InterviewSchedules] PRIMARY KEY CLUSTERED 
(
	[InterviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[JobName] [nvarchar](50) NOT NULL,
	[ContentJob] [nvarchar](50) NOT NULL,
	[LocationID] [int] NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[AmountStudent] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 10/12/2019 5:15:37 PM ******/
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
/****** Object:  Table [dbo].[Notifications]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	[RecruiterID] [int] NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rates]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rates](
	[RateID] [int] IDENTITY(1,1) NOT NULL,
	[Star] [float] NOT NULL,
	[Comment] [nvarchar](50) NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rates] PRIMARY KEY CLUSTERED 
(
	[RateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecruiterAspirations]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecruiterAspirations](
	[RecruiterAspirationsID] [int] IDENTITY(1,1) NOT NULL,
	[JobID] [int] NOT NULL,
	[Gender] [bit] NOT NULL,
	[Salary] [float] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RecruiterAspirations] PRIMARY KEY CLUSTERED 
(
	[RecruiterAspirationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruiters]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiters](
	[RecruiterID] [int] IDENTITY(1,1) NOT NULL,
	[RecruiterAspirationsID] [int] NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Recruiters] PRIMARY KEY CLUSTERED 
(
	[RecruiterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[RecruiterID] [int] NULL,
	[StudentID] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[Roles]    Script Date: 10/12/2019 5:15:37 PM ******/
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
/****** Object:  Table [dbo].[SkillDepartments]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillDepartments](
	[SkillDepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[SkillID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_SkillDepartments] PRIMARY KEY CLUSTERED 
(
	[SkillDepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillExperiences]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillExperiences](
	[SkillExperienceID] [int] IDENTITY(1,1) NOT NULL,
	[SkillID] [int] NOT NULL,
	[ExperienceID] [int] NULL,
 CONSTRAINT [PK_SkillExperiences] PRIMARY KEY CLUSTERED 
(
	[SkillExperienceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillJobs]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillJobs](
	[SkillJobID] [int] IDENTITY(1,1) NOT NULL,
	[SkillID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
 CONSTRAINT [PK_SkillJobs] PRIMARY KEY CLUSTERED 
(
	[SkillJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 10/12/2019 5:15:37 PM ******/
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
/****** Object:  Table [dbo].[SkillStudentAspirations]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillStudentAspirations](
	[SkillStudentAspirationID] [int] IDENTITY(1,1) NOT NULL,
	[SkillID] [int] NOT NULL,
	[StudentAspirationsID] [int] NOT NULL,
 CONSTRAINT [PK_SkillStudentAspirations] PRIMARY KEY CLUSTERED 
(
	[SkillStudentAspirationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statistical]    Script Date: 10/12/2019 5:15:37 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [nvarchar](50) NOT NULL,
	[ExperienceID] [int] NULL,
	[CV] [nvarchar](50) NULL,
	[StudentAspirationsID] [int] NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAspirations]    Script Date: 10/12/2019 5:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAspirations](
	[StudentAspirationsID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[Salary] [float] NOT NULL,
 CONSTRAINT [PK_StudentAspirations] PRIMARY KEY CLUSTERED 
(
	[StudentAspirationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 10/12/2019 5:15:37 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 10/12/2019 5:15:37 PM ******/
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
	[Description] [nvarchar](50) NULL,
	[ImageID] [int] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Experiences]  WITH CHECK ADD  CONSTRAINT [FK_Experiences_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Experiences] CHECK CONSTRAINT [FK_Experiences_Departments]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_FeedbackTypes] FOREIGN KEY([FeedbackTypeID])
REFERENCES [dbo].[FeedbackTypes] ([FeedbackTypeID])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_FeedbackTypes]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Recruiters] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiters] ([RecruiterID])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Recruiters]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Student]
GO
ALTER TABLE [dbo].[InterviewSchedules]  WITH CHECK ADD  CONSTRAINT [FK_InterviewSchedules_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[InterviewSchedules] CHECK CONSTRAINT [FK_InterviewSchedules_Locations]
GO
ALTER TABLE [dbo].[InterviewSchedules]  WITH CHECK ADD  CONSTRAINT [FK_InterviewSchedules_Recruiters] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiters] ([RecruiterID])
GO
ALTER TABLE [dbo].[InterviewSchedules] CHECK CONSTRAINT [FK_InterviewSchedules_Recruiters]
GO
ALTER TABLE [dbo].[InterviewSchedules]  WITH CHECK ADD  CONSTRAINT [FK_InterviewSchedules_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[InterviewSchedules] CHECK CONSTRAINT [FK_InterviewSchedules_Student]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Locations]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Recruiters] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiters] ([RecruiterID])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Recruiters]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Recruiters] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiters] ([RecruiterID])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Recruiters]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Student]
GO
ALTER TABLE [dbo].[RecruiterAspirations]  WITH CHECK ADD  CONSTRAINT [FK_RecruiterAspirations_Jobs] FOREIGN KEY([JobID])
REFERENCES [dbo].[Jobs] ([JobID])
GO
ALTER TABLE [dbo].[RecruiterAspirations] CHECK CONSTRAINT [FK_RecruiterAspirations_Jobs]
GO
ALTER TABLE [dbo].[Recruiters]  WITH CHECK ADD  CONSTRAINT [FK_Recruiters_RecruiterAspirations] FOREIGN KEY([RecruiterAspirationsID])
REFERENCES [dbo].[RecruiterAspirations] ([RecruiterAspirationsID])
GO
ALTER TABLE [dbo].[Recruiters] CHECK CONSTRAINT [FK_Recruiters_RecruiterAspirations]
GO
ALTER TABLE [dbo].[Recruiters]  WITH CHECK ADD  CONSTRAINT [FK_Recruiters_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Recruiters] CHECK CONSTRAINT [FK_Recruiters_Users]
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
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Recruiters] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiters] ([RecruiterID])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Recruiters]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Student]
GO
ALTER TABLE [dbo].[SkillDepartments]  WITH CHECK ADD  CONSTRAINT [FK_SkillDepartments_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[SkillDepartments] CHECK CONSTRAINT [FK_SkillDepartments_Departments]
GO
ALTER TABLE [dbo].[SkillDepartments]  WITH CHECK ADD  CONSTRAINT [FK_SkillDepartments_Skills] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([SkillID])
GO
ALTER TABLE [dbo].[SkillDepartments] CHECK CONSTRAINT [FK_SkillDepartments_Skills]
GO
ALTER TABLE [dbo].[SkillExperiences]  WITH CHECK ADD  CONSTRAINT [FK_SkillExperiences_Experiences] FOREIGN KEY([ExperienceID])
REFERENCES [dbo].[Experiences] ([ExperienceID])
GO
ALTER TABLE [dbo].[SkillExperiences] CHECK CONSTRAINT [FK_SkillExperiences_Experiences]
GO
ALTER TABLE [dbo].[SkillExperiences]  WITH CHECK ADD  CONSTRAINT [FK_SkillExperiences_Skills] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([SkillID])
GO
ALTER TABLE [dbo].[SkillExperiences] CHECK CONSTRAINT [FK_SkillExperiences_Skills]
GO
ALTER TABLE [dbo].[SkillJobs]  WITH CHECK ADD  CONSTRAINT [FK_SkillJobs_Jobs] FOREIGN KEY([JobID])
REFERENCES [dbo].[Jobs] ([JobID])
GO
ALTER TABLE [dbo].[SkillJobs] CHECK CONSTRAINT [FK_SkillJobs_Jobs]
GO
ALTER TABLE [dbo].[SkillJobs]  WITH CHECK ADD  CONSTRAINT [FK_SkillJobs_Skills] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([SkillID])
GO
ALTER TABLE [dbo].[SkillJobs] CHECK CONSTRAINT [FK_SkillJobs_Skills]
GO
ALTER TABLE [dbo].[SkillStudentAspirations]  WITH CHECK ADD  CONSTRAINT [FK_SkillStudentAspirations_Skills] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([SkillID])
GO
ALTER TABLE [dbo].[SkillStudentAspirations] CHECK CONSTRAINT [FK_SkillStudentAspirations_Skills]
GO
ALTER TABLE [dbo].[SkillStudentAspirations]  WITH CHECK ADD  CONSTRAINT [FK_SkillStudentAspirations_StudentAspirations] FOREIGN KEY([StudentAspirationsID])
REFERENCES [dbo].[StudentAspirations] ([StudentAspirationsID])
GO
ALTER TABLE [dbo].[SkillStudentAspirations] CHECK CONSTRAINT [FK_SkillStudentAspirations_StudentAspirations]
GO
ALTER TABLE [dbo].[Statistical]  WITH CHECK ADD  CONSTRAINT [FK_Statistical_Recruiters] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiters] ([RecruiterID])
GO
ALTER TABLE [dbo].[Statistical] CHECK CONSTRAINT [FK_Statistical_Recruiters]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Experiences] FOREIGN KEY([ExperienceID])
REFERENCES [dbo].[Experiences] ([ExperienceID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Experiences]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_StudentAspirations] FOREIGN KEY([StudentAspirationsID])
REFERENCES [dbo].[StudentAspirations] ([StudentAspirationsID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_StudentAspirations]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Users]
GO
ALTER TABLE [dbo].[StudentAspirations]  WITH CHECK ADD  CONSTRAINT [FK_StudentAspirations_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[StudentAspirations] CHECK CONSTRAINT [FK_StudentAspirations_Departments]
GO
ALTER TABLE [dbo].[StudentAspirations]  WITH CHECK ADD  CONSTRAINT [FK_StudentAspirations_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[StudentAspirations] CHECK CONSTRAINT [FK_StudentAspirations_Locations]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Roles]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Images] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Images] ([ImageID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Images]
GO
