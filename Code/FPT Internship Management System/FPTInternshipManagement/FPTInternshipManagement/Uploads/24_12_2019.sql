USE [FPTInternshipManagerment]
GO
/****** Object:  Table [dbo].[Aspirations]    Script Date: 12/24/2019 2:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aspirations](
	[AspirationsID] [int] IDENTITY(1,1) NOT NULL,
	[AspirationsName] [nvarchar](256) NOT NULL,
	[ExperienceID] [int] NULL,
	[JobID] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Aspirations] PRIMARY KEY CLUSTERED 
(
	[AspirationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspirationSkills]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[Departments]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[Experience]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[FeedbackTypes]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[HistoryRecords]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[Images]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[InterviewSchedules]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[Jobs]    Script Date: 12/24/2019 2:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[JobName] [nvarchar](256) NOT NULL,
	[ContentJob] [nvarchar](max) NULL,
	[LocationID] [int] NULL,
	[RecruiterID] [int] NULL,
	[AmountStudent] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[SkillGen] [nvarchar](250) NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[Notifications]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[Rates]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[Reports]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[SkillDetails]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[Skills]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[Statistical]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[UserAspirations]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[UserJobs]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 12/24/2019 2:51:46 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 12/24/2019 2:51:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Phone] [int] NULL,
	[DOB] [date] NULL,
	[Gender] [bit] NULL,
	[Email] [nvarchar](50) NOT NULL,
	[LocationID] [int] NULL,
	[CreateDate] [date] NULL,
	[CV] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[ImageID] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[GPA] [nvarchar](50) NULL,
	[Semester] [nvarchar](50) NULL,
	[Specialized] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Aspirations] ON 

INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (1, N'Fullstack Developer (.Net/Java)', NULL, NULL, N'<p>Bachelor or Master degree within a relevant IT specialization<br />Good English skills both in writing and verbally.<br />At least 2-4 years of experience from a similar position.<br />Strong understanding of object-oriented programming and data modelling.<br />Experience in various design, architectural patterns and modern system development.<br />Open towards and able to quickly learn new technologies.<br />Ability to work both independently and collaboratively as part of an international team.<br />Professional pro-active attitude, taking responsibility and initiative.<br />Effectively estimate work and produce deliverables on time.</p>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (2, N'Senior Automation QC (C#)', NULL, NULL, N'<ul><li>Programming language skill:&nbsp;C#</li><li>Good knowledge on Selenium testing tool is a&nbsp;must</li><li>Good at English communication and self confident</li><li>Ability to learn quickly with good critical thinking</li><li>Testing skills</li><li>Self-monitor and teamwork</li><li>Knowledge on testing management tools: Jira, ...</li></ul>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (3, N'Automation QA/QC/Tester (Java, Selenium)', NULL, NULL, N'<ul><li>Degree in information technology or equivalent.</li><li>Have at least 3 years&#39; experience as QC/QA/Tester.</li><li>Have at least 1 year&#39;s experience on Java.</li><li>Have at least 1 year&#39;s experience on Automation testing (Selenium, Cucumber or Appium)</li><li>Good English skills</li><li>Have deep knowledge on Web server and Web services.</li></ul>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (4, N'10 Junior - Senior Dev (PHP)', NULL, NULL, N'<p>Mastering object-oriented programming.<br />Experienced in developing practical projects using PHP or NodeJS.<br />Basic knowledge of HTML, CSS, and Javascript.<br />Proficient in one of the PHP frameworks like CakePHP, Laravel or Symfony or the tools / framework of NodeJS.<br />Knowledge of RESTful, JSON, Web-sockets, Web Security, Caching, and Queuing.<br />Experience working with MySQL, PosgreSQL or Oracle<br />Knowledge of the development environment on Linux<br />Proficient at managing source code with GIT<br />Knowledge of minimum back-end security.<br />Having the desire to learn new programming languages and new techniques is an advantage.</p>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (5, N'Sr/Team Leader Java Developer (Database)', NULL, NULL, N'<ul><li>Degree in Computer Science or related fields with at least 6 years working experience;</li><li>Strong at Java or other OOP languages, data structure and functional programming.</li><li>Experience with enterprise system architectures.</li><li>Experience in database systems and data schema design (relational, semi-structured and no-structure data).</li><li>Hands-on experience designing and developing REST APIs.</li><li>Thinking big and acting fast. You&rsquo;ll need a startup mentality with enterprise awareness.</li><li>Ability to manage competing priorities.</li><li>Influential</li></ul>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (6, N'WordPress Theme Developer (PHP, CSS)', NULL, NULL, N'<ul><li>Basic in writing and reading skills.</li><li>2+ years front-end working experience. Understand front-end best practices and conventions.</li><li>Experienced in building themes or websites for the Western markets.</li><li>Experienced with HTML5 and SEO-friendly code.</li><li>Experienced with CSS3, especially Flexbox, Transitions, Transforms, Keyframes.</li><li>Confident implementing JavaScript without jQuery.</li><li>Know how to use Git (GitLab/Bitbucket), Gulp and Grunt. Bonus points for Webpack.</li><li>Bonus points for Vue / Vuex experience.</li><li>Bonus points for Sass, Less or postCSS experience.</li><li>Bonus points for ES6/7 experience.</li></ul>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (7, N'Shopify Theme Dev (JavaScript,HTML5,CSS)', NULL, NULL, N'<ul><li>Basic in writing and reading skills.</li><li>2-3 years front-end working experience. Understand front-end best practices and conventions.</li><li>Experienced in building themes or websites for the Western markets.</li><li>Experienced with HTML5 and SEO-friendly code.</li><li>Experienced with CSS3, especially Flexbox, Transitions, Transforms, Keyframes.</li><li>Confident implementing JavaScript without jQuery.</li><li>Know how to use Git (GitLab/Bitbucket), Gulp and Grunt. Bonus points for Webpack.</li><li>Solid experience with Shopify theme development (Liquid templating language).</li><li>Bonus points for Vue / Vuex experience.</li><li>Bonus points for Sass, Less or postCSS experience.</li><li>Bonus points for ES6/7 experience.</li></ul>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (8, N'Senior Software Engineer (.Net/C#/Java)', NULL, NULL, N'<p><em><strong>Must have:</strong></em></p><ul><li><strong>Minimum 6 years of software development using .Net</strong></li><li>Experience in implementing business process automation and management systems, BPMS (such as K2 Blackpearl v4/v5, K2 SmartForms) is preferable</li><li>Self-motivated technology enthusiast in new technologies and engineering best-practices</li><li>Technical leadership with solid experience in application solution design, technical proposal and design documentation.</li><li>Strong team player with effective communication skills</li></ul><p><em><strong>Big Plus:&nbsp;</strong></em></p><ul><li>Experience with Java is a big plus</li><li>Project experience in public sectors, finance or logistics is a big plus</li></ul>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (9, N'Sr/Jr Backend Java/Golang Up to 2000$', NULL, NULL, N'<p>Good candidate for Junior Back End Developer position should have the following</p><p>qualifications: &nbsp;</p><p> At least 1 year experiences in Java&nbsp;or Go</p><p> Strong knowledge in Computer Science, Have a strong ambition in software</p><p>programming</p><p> Knowledge of Git and best practices for merging, branching, and pull requests (used to</p><p>Github or Gitlab)</p><p> Know about API and used to build API (Restful API....)</p><p> Know about websocket, protobuf, messaging is a plus</p><p> Know React is a plus</p><p> Experience in&nbsp;Agile&nbsp;Environment is a plus</p><p>Good candidate for Senior Back End Developer position should have the following</p><p>qualifications: &nbsp;</p><p> At least 3-4 year experiences in Java&nbsp;or Go</p><p> Strong knowledge in Computer Science, Have a strong ambition in software</p><p>programming</p><p> Knowledge of Git and best practices for merging, branching, and pull requests (used to</p><p>Github or Gitlab)</p><p> Know about API and used to build API (Restful API....)</p><p> Know about websocket, protobuf, messaging is a plus</p><p> Know React is a plus</p><p> Experience in&nbsp;Agile&nbsp;Environment is a plus</p><p>All positions have been required to have the following qualifications:</p><p>Self-motivated, logical thinking and strong desire to build high-quality applications.</p><p> Ready to learn new languages and technologies</p><p> Ability to work independently and in a team environment.</p>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (10, N'Senior Back-end Developer (Java/ Spring)', NULL, NULL, N'<ul><li>Bachelor Degree in Information Technology, Computer Science, or equivalent.</li><li>At least 1 year of relevant working experience with strong Computer Science fundamentals in algorithms and data structures.</li><li>Knowledge in Restful API frameworks (Spring, Play, ...)</li><li>Knowledge in Linux OS (Ubuntu, CentOS,...) is a Plus Point</li><li>Programming Language: any language but we prefer Java</li><li>Knowledge in database programming or design skills, including relational database skills (SQL, etc.) and non-relational database skills (MongoDB, Redis, Cassandra, etc.)</li><li>Knowledge in in-memory cache (redis, memcache, ...)</li><li>Familiar with MessageQueue (Rabbit, ActiveMQ, ...)</li><li>Huge plus: strong English communications skills</li></ul><p><strong>FOR SENIOR LEVEL&nbsp;</strong></p><ul><li>At least 4 years of relevant working experience with strong fundamentals in algorithms and data structures</li><li>Experience working, designing microservice system with high performance, scalability.</li><li>Good leadership and effective communication in both verbal and nonverbal are preferred</li></ul>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (11, N'Frontend Dev (Angular, CSS, JavaScript)', NULL, NULL, N'<p>- Ability to design, code, unit test and fix bugs in web applications and cross-platform applications<br />- Experience in Angular, AngularJS, HTML, CSS<br />- Experienced in web applications and multi-platform applications<br />- Good knowledge of Firebase Firestore, Firebase cloud function<br />- Good understanding of mobile platform development such as iOS, Android<br />- Knowledge of web services API, JSON<br />- Good command of English (can speak and listen in basic communication, can read and write documents in English)<br />- Ability to use project management tools such as JIRA, Pivotal tracker and source control version tools like GIT<br />- Ability to learn new technologies quickly.</p>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (12, N'5 Backend Devs (Python, SQL, C++)', NULL, NULL, N'<ul><li>We need 3 IT Developers of Core Back-end:</li><li>Good programming skills at all language. You will have an advantage in one of the below languages: C / Pro &nbsp;C ++ / Python / Golang.</li><li>Understanding Oracle or any SQL database system is an advantage.</li><li>Priority for experienced candidates, especially who works in developing securities trading products.</li></ul><p>We appreciate</p><ul><li>Good attitude at work</li><li>Pro-active and willing to learn</li></ul>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (13, N'Fullstack Developer (Java, MySQL, HTML5)', NULL, NULL, N'<p>Logic, Data Structures and Algorithms<br />JS / TS hacker<br />HTML / SCSS hacker<br />Experience in developing products with at least 02 of the following skills:<br />Ionic<br />Angular<br />React Native<br />React.js<br />Flutter<br />iOS SDK<br />Android SDK<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. Good command of English (can speak and listen in basic communication, can read and write documents in English)</p><p>*** Prioritize:</p><p>iOS App Store, Android Google Play Store<br />Docker<br />Git<br />AWS and Google Cloud Platform<br />IDE such as Visual Studio Code</p>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (14, N'Frontend Developer (JavaScript, HTML5)', NULL, NULL, N'<p><strong>Must Have:</strong></p><ul><li>Minimum of 2 years of experience with HTML5, CSS3</li><li>Experience with CSS preprocessors such as SASS or LESS</li><li>Proficient in JavaScript frameworks such as ReactJS, AngularJS, Vue, JQuery, Bootstrap, etc...</li><li>Good working experience with Git</li><li>Proficient understanding of client-side scripting</li><li>Good understanding of SEO principles and ensuring that application will adhere to them.</li><li>Ability to incorporate feedback and both give and take direction well</li><li>Desire to work in a start-up environment</li><li>A team player with strong communication and presentation skills</li><li>Resourceful and able to independently solve problems</li><li>Good understandings of English (specifically reading)</li></ul><p><strong>Nice to Have:</strong></p><ul><li>Knowledge of video editing tools</li><li>Experience in marketing tools as well as Google SEO &amp; SEM</li><li>Knowledge of collaboration tools such as Notion, Trello, Airtable</li></ul>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (15, N'ASP.NET Developer (ASP.NET, HTML5) ~ 2000$', NULL, NULL, N'<p>At least 1 year experience with Asp.Net/Asp.Net Core<br />Mastering HTML, CSS, JavaScript, Ajax<br />Good programming thinking<br />Hard-working, careful, responsible for the job assigned.<br />Priority is given to candidates who have the following skills</p><p>Experience working with other languages such as NodeJs, PHP, Java, ...<br />Has analytical, software design skills<br />Ability to research new technology, read and understand English documents well<br />Proficient in multi-threaded programming, Asynchronous with C #<br />Knowledge of data structures &amp; algorithms, computer architecture, OOP, Design patterns<br />Experience working with AngularJS, AngularJS 2, SASS, SCSS, ...<br />Have experience using cache with Web Application<br />Knowledge of web security<br />Experience in working with Message Queue (Rabbitmq, Kafka), Redis, Varnish, Solr / Elastic search, Cassandra, ...</p>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (16, N'Java Developer (C, C++)', NULL, NULL, N'<p>- Experience in working with C and JAVA programming languages.</p><p>- Knowledge of object-oriented programming and system design.</p><p>- Skills to read and understand documents in English.</p><p>- Having interpersonal and teamwork skills is one such advantage</p><p>Priority skills</p><p>- Experience in working with Linux operating system is an advantage.</p><p>- Experience in handling natural language is an advantage.</p><p>- Ability to read and understand algorithms is an advantage</p>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (18, N'Senior Xamarin Dev (ASP.Net, C#)~1500$', NULL, NULL, N'<p><strong>MUST HAVE:</strong></p><ul><li>3+ years of .NET (C#) development and 2+ years with Xamarin Forms and XAML.</li><li>Experience working in an Agile Software Development environment.</li><li>Good Logistic - Creative - Manner.</li><li>Strong problem solving skills.</li><li>Must be self-starter, proactive and willing to learn and grow with the business.</li><li>Ability to work well under pressure and manage multiple tasks simultaneously. Have experience on technical backgrounds as:</li></ul><p><strong>HAVE TO NICE:&nbsp;</strong></p><ul><li>Database: MSSQL, SQLLite.</li><li>Have knowlegde about native platforms iOS (Objective-C, Swift) or Android (Java) or cross-platform mobile technologies.</li><li>Have knowledge on Xamarin or Flutter is a plus.</li><li>Have knowlegde about publishing an app on the AppStore or the Google Play Store.</li><li>Good at English communication skill</li></ul>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (19, N'10 ASP.NET Developers (MVC)', NULL, NULL, N'<p><strong>1. Technical requirements</strong></p><p>- At least 2 years experience in&nbsp;<strong>ASP.NET MVC</strong></p><p>- Experience with React is a plus</p><p>- Experience with KendoUI is a plus</p><p>- Use efficiently technology: AJAX, LinQ, Lambda Expressions</p><p>- Well understanding of Web Services, WCF, Web API</p><p>- Excellent in understanding &amp; using Best Practices and Design Patterns</p><p>- Good at understanding &amp; implementing stored procedure in Microsoft SQL Server<br /><br /><strong>2. Working skills</strong></p><p>- Good communication skills with team</p><p>- Careful, meticulous</p><p>- Minimize bugs, issues while implementing</p><p>- English proficiency is a plus.<br /><br />Candidates should provide the expected salary, the date you can start working in the resume or application letter.</p>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (20, N'PHP Developer (JavaScript, HTML5)', NULL, NULL, N'<p>- Skills to read and understand English documents.</p><p>- Experience in programming PHP, cutting HTML and CSS interfaces.</p><p>- Graduated from the school of information technology (Bach Khoa, Buu Chinh, University of Technology)</p><p>Priority skills</p><p>- Fluency in English, being able to write letters and communicate in English is a plus.</p><p>- Knowledge of object-oriented programming and system design.</p><p>- Proficiency in configuring Ngnix, Lua, NodeJS is an advantage</p><p>- Experience in working with PHP YII Framework is an advantage.</p>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (21, N'05 .NET Developer (C#, MVC)', NULL, NULL, N'<p><strong>Bollor&eacute; Group</strong></p><p>Driven by a strong entrepreneurial spirit and the desire to create a link between people and their environment, Bollor&eacute; group associates humanism with a results-based culture.&nbsp;<br />Thanks to its family shareholding stability, the Group has been conducting a long-term investment and visionary strategy for the past 200 years.&nbsp;<br />Operating in 143 countries with 80 000 employees generating more than 23 billion dollars revenue, Bollor&eacute; group is now holding strong positions in each of its business lines: transportation and logistics, communications and media, electricity storage and solutions.</p><p>B&#39; Information Services is Bollor&eacute; Group company based in Paris, deliver and implement IT solutions for Transportation, Logistics and Energy business line with 400 employees globally (Paris, Singapore, Ho Chi Minh, Montreal, Johannesburg, Abidjan...).</p><p><strong>B&#39; Information Services in Vietnam</strong></p><p>Looking to grow our development teams in Vietnam, B&#39; Information Services engage in a collaboration with ekino Vietnam, part of Havas Group / Bollor&eacute; Group. &nbsp;</p><p>Ho Chi Minh team is specialized on Microsoft&nbsp;.Net&nbsp;technologies (ASP.Net&nbsp;MVC,&nbsp;Winforms, API, Azure, Xamarin, Knockout JS...), ESB platform (Webmethods, Java...) and deliver projects using Agile methodology.&nbsp;</p><p>Working with B&#39; Information Services you&rsquo;ll have the opportunities to develop your skills and career in an exciting work-place in touch with an international and innovative environment.&nbsp;</p>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (22, N'Senior .NET Software Engineer (C#, MVC)', NULL, NULL, N'<ul><li><strong>3</strong>+ years&rsquo; experience in .NET competence;</li><li>Good knowledge of OOP, clean code.</li><li>Proficient C#, NET Framework, .NET Core, MVC, Web API, Entity Framework and SQL Server.</li><li>Good at writing Unit Tests with mocking frameworks</li><li>Good knowledge of programming patterns and principles e.g Seperation of Concern, Repository Pattern, UnitOfWork, DRY, SOLID</li><li>Basic knowledge of HTML, CSS, JavaScript. Having experience of any JavaScript front-end framework e.g. Angular, React, Vue&hellip;</li><li>Good knowledge of security and performance optimization</li><li>Be able to do code review and support junior developers</li><li>Basic knowledge of cloud technologies e.g. AWS, Azure</li><li>Knowledge of CMS, CRM system such as SharePoint, Microsoft Dynamics is a plus</li></ul>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (23, N'PHP Developers (HTML5, CSS)', NULL, NULL, N'<p>Experience in doing PHP projects for 1 year or more<br />Experience in HTML, Css, Javascript, Jquery.<br />Understanding webservice with Apache or Nginx<br />Experience in one of the PHP frameworks: Symfony Framework, Laravel Framework, CodeIgniter, CakePHP, ... is an advantage.<br />Skilled with analytical and problem solving skills. Responsibility and meticulous work.<br />Communication skills and teamwork.</p>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (24, N'Sr Software Engineer (C#, ASP.NET, SQL)', NULL, NULL, N'<p><strong>Required skill set: You will need to</strong></p><ul><li>Have 5+ years relevant technical experience</li><li>Be able to write clean, structured, secure and well-tested code</li><li>Understand and be proficient in industry standard testing techniques</li><li>C#</li><li>ASP.NET</li><li>HTML5, CSS3, javascript</li><li>TSQL</li></ul><p><strong>Personal characteristics: You should be:</strong></p><ul><li>Target driven</li><li>An excellent communicator with the ability to explain complex issues in a clear manner</li><li>An all-round team player with good interpersonal skills</li><li>Prepared to accept responsibility for the quality and timeliness of you own work</li></ul>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (25, N'Team Leader (C#, ASP.NET, SQL)', NULL, NULL, N'<p><strong>Required skill set: You will need to</strong></p><ul><li>Have good spoken and written English</li><li>Have relevant technical experience</li><li>Understand and be proficient in industry standard testing techniques</li><li>C#</li><li>ASP.NET</li><li>HTML 5 , CSS3</li><li>SQL Server.</li><li>Unit test using NUnit or XUnit.</li></ul><p><strong>Personal characteristics. You should be</strong></p><ul><li>Target driven</li><li>An excellent communicator with the ability to explain complex issues in a clear manner</li><li>An all-round team player with good interpersonal skills</li><li>Someone who possess the confidence to voice and put forward opinions</li><li>Able to delegate and manage a team of people</li><li>Highly Organised</li><li>Prepared to accept responsibility for your own actions and those of your team</li></ul>', N'Approve')
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (26, N'I want to develop java language', NULL, NULL, N'<p>I want to develop java language</p>', NULL)
INSERT [dbo].[Aspirations] ([AspirationsID], [AspirationsName], [ExperienceID], [JobID], [Description], [Status]) VALUES (27, N'I want to develop .net and c#', NULL, NULL, N'<p>I want to develop .net and c#</p>', NULL)
SET IDENTITY_INSERT [dbo].[Aspirations] OFF
SET IDENTITY_INSERT [dbo].[AspirationSkills] ON 

INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (1, 1, 1)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (3, 3, 2)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (4, 4, 3)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (5, 5, 4)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (6, 6, 5)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (7, 7, 6)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (8, 8, 7)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (9, 9, 8)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (10, 10, 9)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (11, 11, 10)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (12, 12, 11)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (13, 14, 12)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (14, 13, 13)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (15, 17, 14)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (16, 18, 15)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (17, 19, 16)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (18, 15, 18)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (19, 16, 18)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (20, 16, 19)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (21, 20, 20)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (22, 21, 21)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (23, 22, 22)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (24, 23, 23)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (25, 24, 24)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (26, 25, 25)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (27, 2, 26)
INSERT [dbo].[AspirationSkills] ([AspirationJobID], [SkillID], [AspirationID]) VALUES (28, 1, 27)
SET IDENTITY_INSERT [dbo].[AspirationSkills] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (1, N'Software Engineering')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (2, N'Business Administration')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (3, N'Japanese Language')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (4, N'Graphic Design')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Experience] ON 

INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (1, 44, 1, CAST(N'2019-12-24' AS Date), N' 1 year experience')
INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (2, 44, 2, CAST(N'2019-12-24' AS Date), N'1 year experience')
INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (3, 45, 4, CAST(N'2019-12-24' AS Date), N' 4 months ')
INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (4, 45, 5, CAST(N'2019-12-24' AS Date), N' 4 months ')
INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (5, 45, 2, CAST(N'2019-12-24' AS Date), N' 4 months ')
INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (6, 46, 5, CAST(N'2019-12-24' AS Date), N' 3 years')
INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (11, 47, 22, CAST(N'2019-12-24' AS Date), N'3 years')
INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (13, 47, 7, CAST(N'2019-12-24' AS Date), N'2 years')
INSERT [dbo].[Experience] ([ExperienceID], [UserID], [SkillID], [StartDate], [Description]) VALUES (14, 48, 6, CAST(N'2019-12-24' AS Date), N'1 years')
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

INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (1, N'Fullstack Developer (.Net/Java)', N'Analyze and understand business and technical requirements and work with clients across different domains and industries.
Produce high-quality design deliverables that describes how the solution will accommodate business and technical requirements.
Responsibility for larger functional and technical areas in the solution.
Design, develop, and maintain efficient, reusable, and reliable code using best practices.
Conduct continuous unit and manual testing and deliver high quality solutions.
Work and collaborate in an agile international environment with experienced and skilled colleagues in Vietnam and Europe.
Plan and organize your own work and accurately report issues and progress in a timely manner.
Identify areas for own personal development.', 1, 31, 5, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (3, N'Senior Automation QC (C#)', N'As a Senior Automation QC Engineer you will be responsible for ensuring the quality of our software products. This includes:

Design Automation test cases and execute them (including UI, Functional, Performance, Security, etc.) with minimal support/review from the superiors.
Analyzing clients'' requirements and expectations
Hands-on with design and implement test cases
Hands-on with automated testing tool (Selenium)
Hands-on with code implementation
Team collaboration and communication', 1, 31, 4, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (4, N'Automation QA/QC/Tester (Java, Selenium)', N'Follow test cases that provide by manual team to develop test scripts
Oversee the creation and execution of test cases and test scripts.
Guide the automation testing efforts and liaise with leads to ensure any developed QA frameworks are reusable across similar technologies.
Evangelize the QA practice and the QA professionals in the team.
Communicate status, risks and issues to senior management and team members.
Drive QA process and standards changes to benefit high-performing teams.
Train and coach junior QA engineers and ensure they have a great on-boarding experience.
Daily / Weekly / On-demand report to QC leader the progress and status of the assigned tasks.
Ensure the assigned tasks to be performed on-time and with high quality.
Follow the project and organization and regulations.', 1, 31, 2, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (5, N'10 Junior - Senior Dev (PHP)', N'Participate in web-based projects using the PHP programming language for the Japanese market with the following requirements:

Technical requirement analysis.
Design specifications, write code and can write unit tests with code according to the requirements of the project.
Review code to ensure project quality
As a Senior or Tech Lead, you act as a key member to provide technical solutions and participate in team management in the project.
Have the opportunity to work directly with PM and Japanese engineers.', 1, 31, 10, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (6, N'Sr/Team Leader Java Developer (Database)', N'At #Ecom365, we’re building the next generation ERP, supply chain solutions and e-commerce platforms for the retail and distribution industry. On a daily basis, we help our SME businesses automate their daily mundane tasks, so they can focus on what matters: sales, manage relationships with customers and suppliers. Furthermore, our SaaS platform enables those businesses to expand their operations effortlessly.

Do you like opportunity of building and leading your own development team?
Do you love challenges of a lead architect designing a scalable platform for millions of both corporate users and end consumers?
Do you like a challenging, yet at the same time flexible and rewarding environment?', 1, 34, 10, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (7, N'WordPress Theme Developer (PHP, CSS)', N'Your job is to work with us to build websites with millions of views per month for well-known brands around the world. The main platform and technologies you will work with are WordPress, HTML / CSS3 / JavaScript.', 1, 34, 10, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (8, N'Shopify Theme Dev (JavaScript,HTML5,CSS)', N'Your job is to work with us to build e-commerce stores with millions of views per month for well-known brands around the world. The main platform and technologies you will work with are Shopify, HTML5 / CSS3 / JavaScript.', 1, 35, 6, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (9, N'Senior Software Engineer (.Net/C#/Java)', N'Your Role

As a senior software engineer in a leading software engineering company, your role will be both essential and vital. You will work with highly skilled and experienced software engineers who have their work measured against the highest standards.
The projects you work on will not only solve the customers’ problems, but deliver the added value that defines all of AdNovum’s software solutions. You will also have the chance to be involved with multiple stages of multiple projects, thus enjoying exposure to various aspects of software engineering.

In your daily work, you will:

Work on implementation projects and systems integration
Consult on assignments in software and application security
Develop enterprise applications and/or mobile applications
Design and implement software systems', 1, 35, 10, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (10, N'Sr/Jr Backend Java/Golang Up to 2000$', N'Encapital Financial Technology is a leading financial technology company which focuses on

bringing financial products closer to everyone by developing a mobile platform and marketplace

where these products can be traded online. We are now looking for Back-End Developer

(Junior/Senior) for the Technology Division.

As a Back End Developer, your responsibilities will include:

 Collaborate other product team members to create secure, reliable, scalable software

solutions.

 Identify unsecured code areas and implement fixes.

 Identify, implement, and share technical solutions.

 Proactively reviews the Performance and Capacity of all aspects of production: code,

infrastructure, data and message processing.

 Research new technology trend and adapt to company’s projects.', 1, 35, 10, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (11, N'Senior Back-end Developer (Java/ Spring)', N'Develop back-end features using Restful API, Microservice, AWS stacks technologies.
Develop internal tools to support production users and to investigate technical issues.
Design and implement features that support client side and improve the availability, scalability, latency, and efficiency using Java, Python
Write high-quality, well-tested, clean, simple, and maintainable code; build common libraries.', 1, 35, 5, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (12, N'Frontend Dev (Angular, CSS, JavaScript)', N'- Design and implement front-end code of web and cross-platform applications with Typecript, HTML, CSS, Javascript using Angular, Ionic and AngularJS
- Collaborate with the product team and back-end team to enhance existing UI technology and create the best user experience possible
- Understand the business process to provide high quality products to meet customers'' needs
- Create UI prototypes quickly, as needed, for evaluation
- Participate in all aspects of the iterative software development process, including: scoping, detailed design, effort estimation, code, software testing, bug fixing, maintenance and support', 1, 19, 10, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (13, N'Fullstack Developer (Java, MySQL, HTML5)', N'Designing data structures, programming on servers for applications
Turn static interface design into web or mobile applications
Develop scripts to test program components on the server and interface.', 1, 20, 20, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (14, N'5 Backend Devs (Python, SQL, C++)', N'You will join to our core team to:

Study current trading system, business process, work flow, ...
Study current technology what we success on market now.
Develop & maintenance core trading system for securities company
Research new technology to build and upgrade system function more better
Support front-end team to integration system service to online trading system', 1, 19, 5, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (15, N'Senior Xamarin Dev (ASP.Net, C#)~1500$', N'You will join Mobile team to build Real Estate CRM app on iOS and Android via Xamarin Forms with high standard! 

Develop new features.
Maintain and enhance current features.
Responsible for quality of product, quality of code.
Ready to research new technologies to apply to our mobile apps as Flutter,....', 1, 21, 3, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (16, N'10 ASP.NET Developers (MVC)', N'- Analyze and discuss with Business Analyst to clarify requirements from US

- Provide technical approach before implementation and make detail plan for requirement

- Implement daily tasks & investigate issues from US & support members to complete their tasks with highest quality

- Do unit-test and/or load test

- Follow up working processing and report to managers

- Lead a team if you are strong technical and management skills (a team can consist of 3-7 members)', 1, 21, 10, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (17, N'Frontend Developer (JavaScript, HTML5)', N'Develop new user-facing features and maintaining existing features
Build reusable code and libraries for future use
Ensure the technical feasibility of UX/UI Designs
Optimize application for maximum speed and scalability
Assure that all user input is validated before submitting to Creative Directors
Collaborate with other team members and stakeholders', 1, 20, 5, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (18, N'.NET Developer (ASP.NET, HTML5) ~ 2000$', N'Participate in developing websosanh.vn and other products in the field of E-commerce, News (Developing multiple versions: Desktop, Mobile, Accelerated Mobile Pages, Progressive Web App)
Building and operating the leading electronic newspapers in Vietnam with traffic up to 20 million pageview / day
Building CMS system, realtime auction advertising system, customer management system ...
Build api for apps and 3rd parties.
Optimize the page to serve a large number of visits and fast response time, good user experience.', 1, 20, 5, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (19, N'Java Developer (C, C++)', N'Optimal participation of available features of Company services.

- Develop features about processing user behavior data for the Company''s services.

- Learn and deploy new data processing technologies to serve the Company''s services.', 1, 20, 5, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (20, N'PHP Developer (JavaScript, HTML5)', N'- Design and develop frontend websites to serve the Company''s services.

- Develop technology platforms that support video livestreaming.

- Daily, weekly work progress report.

- Participate in projects according to the leader of the group.', 1, 22, 10, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (21, N'05 .NET Developer (C#, MVC)', N'Contribute to analyze and develop new features in compliance with best practices
Design technical specifications
Ensure maintenance and management of developed solutions
Code unit tests and ensure required corrective actions implementation
Participate to common daily meeting with teams based in Paris
Realize daily and weekly activity reporting using Group tools', 1, 22, 5, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (22, N'Senior .NET Software Engineer (C#, MVC)', N'The Senior is responsible to write software programs from design specifications; Plans, executes and documents unit tests; Reports status and issues; Documents detailed designs; Accountable for unit test leakage; Contributes to system architecture and design decisions.

To develop software program with limited support from senior engineers.
To write program in compliance with established coding quality standard of the company
To run through all the test cases for assigned tasks and ensure all cases tested and passed before release for testing
To self-train on new technologies
Can perform technical lead or team lead role for project.
To implement strictly all the customer’s process if being requested, company’s processes and systems complied with CMMi standard
To document detailed designs as part of design team (lead by PSE or SA).
To perform other tasks assigned by the Line Manager, Project Manager & Technical Manager.', 1, 22, 10, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (23, N'PHP Developers (HTML5, CSS)', N'Experience in doing PHP projects for 1 year or more.
Experience in HTML, Css, Javascript, Jquery.
Understanding webservice with Apache or Nginx.
Experience in one of the PHP frameworks: Symfony Framework, Laravel Framework, CodeIgniter, CakePHP, ... is an advantage.
Skilled with analytical and problem solving skills. Responsibility and meticulous work.
Communication skills and teamwork.', 1, 22, 6, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (24, N'Sr Software Engineer (C#, ASP.NET, SQL)', N'Be part of team that is responsible for the development, support and maintenance of one of our solutions.
Be able to write and test computer programs in compliance with written specifications.
Carry out work in compliance with company standards as published and updated from time to time.
Guide and supervise the activities of more junior level colleagues.
Build an understanding of our products and take responsibility for teaching junior level colleagues.', 1, 25, 10, N'Available', NULL)
INSERT [dbo].[Jobs] ([JobID], [JobName], [ContentJob], [LocationID], [RecruiterID], [AmountStudent], [Status], [SkillGen]) VALUES (25, N'Team Leader (C#, ASP.NET, SQL)', N'Work closely with the Solutions Architect in understanding the business rationale behind our digital on-boarding and Anti money laundering solutions.
Take ownership and be responsible for the development, support and maintenance of those solutions
Manage a team of software engineers to bring in developments in an agreed time scale.
Be proficient in a range of technical systems and processes in order to critique and add value to the systems architecture and advise of approaches available.
Be capable of technical decision-making.
Be able to prepare suitable specifications from which team members can work.
Report progress to the Solutions Architect highlighting any blockers or issues which may cause project delays.
Guide and supervise the activities of your team.
Work closely with the Development Manager to ensure that that the work of your team meets with company technical, testing, documentation and procedural standards.', 1, 25, 5, N'Available', NULL)
SET IDENTITY_INSERT [dbo].[Jobs] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (1, N'Hà Nội', N'Hà Nội')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (2, N'Đà Nẵng', N'Đà Nẵng')
INSERT [dbo].[Locations] ([LocationID], [City], [LocationDetail]) VALUES (3, N'Hồ Chí Minh', N'Hồ Chí Minh')
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

INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (1, 1, NULL, NULL, 1)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (2, 2, NULL, NULL, 1)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (5, 20, NULL, NULL, 3)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (6, 25, NULL, NULL, 3)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (7, 2, NULL, NULL, 4)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (8, 25, NULL, NULL, 4)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (9, 7, NULL, NULL, 5)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (10, 2, NULL, NULL, 6)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (11, 22, NULL, NULL, 6)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (12, 7, NULL, NULL, 7)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (13, 21, NULL, NULL, 7)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (14, 6, NULL, NULL, 8)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (15, 10, NULL, NULL, 8)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (16, 21, NULL, NULL, 8)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (17, 1, NULL, NULL, 9)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (18, 2, NULL, NULL, 9)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (19, 20, NULL, NULL, 9)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (20, 2, NULL, NULL, 10)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (21, 9, NULL, NULL, 10)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (22, 2, NULL, NULL, 11)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (23, 10, NULL, NULL, 12)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (24, 21, NULL, NULL, 12)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (25, 2, NULL, NULL, 13)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (26, 6, NULL, NULL, 13)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (27, 26, NULL, NULL, 13)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (28, 4, NULL, NULL, 14)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (29, 9, NULL, NULL, 14)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (30, 22, NULL, NULL, 14)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (31, 1, NULL, NULL, 15)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (32, 20, NULL, NULL, 15)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (33, 1, NULL, NULL, 16)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (34, 6, NULL, NULL, 17)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (35, 10, NULL, NULL, 17)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (36, 21, NULL, NULL, 17)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (37, 1, NULL, NULL, 18)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (38, 6, NULL, NULL, 18)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (39, 3, NULL, NULL, 19)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (40, 4, NULL, NULL, 19)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (41, 5, NULL, NULL, 20)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (42, 6, NULL, NULL, 20)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (43, 10, NULL, NULL, 20)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (44, 1, NULL, NULL, 21)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (45, 20, NULL, NULL, 21)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (46, 1, NULL, NULL, 22)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (47, 20, NULL, NULL, 22)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (48, 5, NULL, NULL, 23)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (49, 6, NULL, NULL, 23)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (50, 21, NULL, NULL, 23)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (51, 1, NULL, NULL, 24)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (52, 20, NULL, NULL, 24)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (53, 22, NULL, NULL, 24)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (54, 1, NULL, NULL, 25)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (55, 20, NULL, NULL, 25)
INSERT [dbo].[SkillDetails] ([SkillDetailID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (56, 22, NULL, NULL, 25)
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

INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (1, 1, 31)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (2, 2, 31)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (3, 3, 31)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (4, 4, 31)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (5, 5, 34)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (6, 6, 34)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (7, 7, 35)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (8, 8, 35)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (9, 9, 35)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (10, 10, 35)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (11, 11, 19)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (12, 12, 19)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (13, 13, 20)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (14, 14, 20)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (15, 15, 20)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (16, 16, 20)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (18, 18, 21)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (19, 19, 21)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (20, 20, 22)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (21, 21, 22)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (22, 22, 22)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (23, 23, 22)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (24, 24, 25)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (25, 25, 25)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (26, 26, 44)
INSERT [dbo].[UserAspirations] ([UserAspirationID], [AspirationsID], [UserID]) VALUES (27, 27, 44)
SET IDENTITY_INSERT [dbo].[UserAspirations] OFF
SET IDENTITY_INSERT [dbo].[UserJobs] ON 

INSERT [dbo].[UserJobs] ([UserJobID], [JobID], [UserID], [Status]) VALUES (1, 1, 44, N'Not Activated')
INSERT [dbo].[UserJobs] ([UserJobID], [JobID], [UserID], [Status]) VALUES (3, 3, 44, N'Not Activated')
SET IDENTITY_INSERT [dbo].[UserJobs] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (1, 1, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (2, 2, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (3, 3, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (4, 19, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (5, 20, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (6, 21, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (7, 22, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (8, 23, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (9, 24, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (10, 25, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (11, 26, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (12, 27, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (13, 28, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (14, 29, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (15, 30, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (16, 31, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (17, 32, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (18, 33, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (19, 34, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (20, 35, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (21, 36, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (22, 37, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (23, 38, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (24, 39, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (25, 40, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (26, 41, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (27, 42, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (28, 43, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (29, 44, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (30, 45, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (31, 46, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (32, 47, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (33, 48, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (34, 49, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (35, 50, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (36, 51, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (37, 52, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (38, 53, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (39, 54, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (40, 55, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (41, 56, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (42, 57, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (43, 58, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (44, 59, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (45, 60, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (46, 61, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (47, 62, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (48, 63, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (49, 64, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (50, 65, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (51, 66, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (52, 67, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (53, 68, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (54, 69, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (55, 70, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (56, 71, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (57, 72, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (58, 73, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (59, 74, 4)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (1, N'kien@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Bùi Trung Kiên
', 968480365, CAST(N'1997-12-14' AS Date), 1, N'kien@gmail.com', 1, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL, N'870
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (2, N'hoanh@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Hoàng Long
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'hoanh@gmail.com', 2, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL, N'342
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (3, N'ducdd@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đỗ Đình Đức', 968480365, CAST(N'1997-12-14' AS Date), 1, N'ducdd@gmail.com', 3, NULL, NULL, NULL, NULL, N'Activated', NULL, NULL, NULL, N'730
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (19, N'NFQ@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'NFQ Asia', 968480365, CAST(N'1997-12-14' AS Date), 0, N'NFQ@gmail.com', 1, NULL, NULL, NULL, 2, N'Activated', NULL, NULL, NULL, N'720
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (20, N'BOCASAY@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'BOCASAY', 968480365, CAST(N'1997-12-14' AS Date), 1, N'BOCASAY@gmail.com', 1, NULL, NULL, NULL, 5, N'Activated', NULL, NULL, NULL, N'167
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (21, N'EastAgile@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'East Agile', 968480365, CAST(N'1997-12-14' AS Date), 1, N'EastAgile@gmail.com', 1, NULL, NULL, NULL, 3, N'Activated', NULL, NULL, NULL, N'736
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (22, N'Grab@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Grab (Vietnam) Ltd', 968480365, CAST(N'1997-12-14' AS Date), 1, N'Grab@gmail.com', 1, NULL, NULL, NULL, 4, N'Activated', NULL, NULL, NULL, N'777
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (23, N'Knorex@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Knorex', 968480365, CAST(N'1997-12-14' AS Date), 1, N'Knorex@gmail.com', 1, NULL, NULL, NULL, 5, N'Activated', NULL, NULL, NULL, N'459
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (24, N'NexusFrontierTech@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Nexus Frontier Tech', 968480365, CAST(N'1997-12-14' AS Date), 1, N'NexusFrontierTech@gmail.com', 1, NULL, NULL, NULL, 2, N'Activated', NULL, NULL, NULL, N'326
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (25, N'ZALORA@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'ZALORA Group', 968480365, CAST(N'1997-12-14' AS Date), 1, N'ZALORA@gmail.com', 1, NULL, NULL, NULL, 3, N'Activated', NULL, NULL, NULL, N'682
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (26, N'CinnamonAILabs@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Cinnamon AI Labs', 968480365, CAST(N'1997-12-14' AS Date), 1, N'CinnamonAILabs@gmail.com', 1, NULL, NULL, NULL, 4, N'Activated', NULL, NULL, NULL, N'475
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (27, N'Techbase@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Techbase Vietnam', 968480365, CAST(N'1997-12-14' AS Date), 1, N'Techbase@gmail.com', 1, NULL, NULL, NULL, 5, N'Activated', NULL, NULL, NULL, N'364
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (28, N'1PAC@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'1PAC Việt Nam', 968480365, CAST(N'1997-12-14' AS Date), 1, N'1PAC@gmail.com', 1, NULL, NULL, NULL, 6, N'Activated', NULL, NULL, NULL, N'541
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (29, N'KMS@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'KMS Technology', 968480365, CAST(N'1997-12-14' AS Date), 1, N'KMS@gmail.com', 3, NULL, NULL, NULL, 7, N'Activated', NULL, NULL, NULL, N'179
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (30, N'DEK@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'DEK Technologies', 968480365, CAST(N'1997-12-14' AS Date), 1, N'DEK@gmail.com', 2, NULL, NULL, NULL, 2, N'Activated', NULL, NULL, NULL, N'212
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (31, N'Vin@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Vin Software', 968480365, CAST(N'1997-12-14' AS Date), 1, N'Vin@gmail.com', 1, NULL, NULL, NULL, 3, N'Activated', NULL, NULL, NULL, N'674
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (32, N'Absolute@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Absolute Software (Vietnam) Ltd', 968480365, CAST(N'1997-12-14' AS Date), 1, N'Absolute@gmail.com', 2, NULL, NULL, NULL, 5, N'Activated', NULL, NULL, NULL, N'879
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (33, N'Hybrid@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Hybrid Technologies ', 968480365, CAST(N'1997-12-14' AS Date), 1, N'Hybrid@gmail.com', 3, NULL, NULL, NULL, 4, N'Activated', NULL, NULL, NULL, N'167
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (34, N'FPT@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'FPT Software', 968480365, CAST(N'1997-12-14' AS Date), 1, N'FPT@gmail.com', 3, NULL, NULL, NULL, 5, N'Activated', NULL, NULL, NULL, N'585
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (35, N'Viettel@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Viettel', 968480365, CAST(N'1997-12-14' AS Date), 1, N'Viettel@gmail.com', 2, NULL, NULL, NULL, 6, N'Activated', NULL, NULL, NULL, N'634
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (36, N'Panasonic@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Panasonic', 968480365, CAST(N'1997-12-14' AS Date), 1, N'Panasonic@gmail.com', 1, NULL, NULL, NULL, 7, N'Activated', NULL, NULL, NULL, N'885
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (37, N'SamSung@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'SamSung', 968480365, CAST(N'1997-12-14' AS Date), 1, N'SamSung@gmail.com', 2, NULL, NULL, NULL, 6, N'Activated', NULL, NULL, NULL, N'761
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (38, N'HomeCredit@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Home Credit', 968480365, CAST(N'1997-12-14' AS Date), 1, N'HomeCredit@gmail.com', 3, NULL, NULL, NULL, 5, N'Activated', NULL, NULL, NULL, N'910
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (39, N'BIDV@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'BIDV
', 968480365, CAST(N'1997-12-14' AS Date), 1, N'BIDV@gmail.com', 1, NULL, NULL, NULL, 4, N'Activated', NULL, NULL, NULL, N'371
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (40, N'Fossil@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Fossil Viet Nam
', 968480365, CAST(N'1997-12-14' AS Date), 1, N'Fossil@gmail.com', 2, NULL, NULL, NULL, 7, N'Activated', NULL, NULL, NULL, N'895
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (41, N'Toshiba@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Toshiba Software
', 968480365, CAST(N'1997-12-14' AS Date), 1, N'Toshiba@gmail.com', 3, NULL, NULL, NULL, 2, N'Activated', NULL, NULL, NULL, N'183
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (42, N'LG@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'LG Development Center
', 968480365, CAST(N'1997-12-14' AS Date), 1, N'LG@gmail.com', 2, NULL, NULL, NULL, 3, N'Activated', NULL, NULL, NULL, N'873
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (43, N'OPSWAT@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'OPSWAT Software
', 968480365, CAST(N'1997-12-14' AS Date), 1, N'OPSWAT@gmail.com', 1, NULL, NULL, NULL, 4, N'Activated', NULL, NULL, NULL, N'220
')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (44, N'HaiXN@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Xuân Hải', 968480365, CAST(N'1997-12-14' AS Date), 1, N'HaiXN@gmail.com', 2, NULL, N'cv.pdf', NULL, NULL, N'Activated', N'8.2', N'Spring 2018', NULL, N'SE04931')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (45, N'MyTTH@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Trịnh Thị Hà My
', 968480365, CAST(N'1997-12-14' AS Date), 1, N'MyTTH@gmail.com', 3, NULL, NULL, NULL, NULL, N'Activated', N'5.6', N'Spring 2019', NULL, N'SE04932')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (46, N'AnhNV@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Việt Anh
', 968480365, CAST(N'1997-12-14' AS Date), 1, N'AnhNV@gmail.com', 1, NULL, NULL, NULL, NULL, N'Activated', N'7.3', N'Spring 2018', NULL, N'SE04933')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (47, N'TuyenND@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Đức Tuyên
', 968480365, CAST(N'1997-12-14' AS Date), 1, N'TuyenND@gmail.com', 2, NULL, NULL, NULL, NULL, N'Activated', N'8.6', N'Spring 2019', NULL, N'SE04934')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (48, N'LoiHT@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Hà Thành Lợi
', 968480365, CAST(N'1997-12-14' AS Date), 1, N'LoiHT@gmail.com', 3, NULL, NULL, NULL, NULL, N'Activated', N'9.1', N'Spring 2019', NULL, N'SE04935')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (49, N'TuanLQ@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Lê Quang Tuấn
', 968480365, CAST(N'1997-12-14' AS Date), 1, N'TuanLQ@gmail.com', 2, NULL, NULL, NULL, NULL, N'Activated', N'6.2', N'Spring 2019', NULL, N'SE04936')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (50, N'HieuNM@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Minh Hiếu', 968480365, CAST(N'1997-12-14' AS Date), 0, N'HieuNM@gmail.com', 1, NULL, NULL, NULL, NULL, N'Activated', N'5.6', N'Summer 2018', NULL, N'SE04937')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (51, N'KhaiVD@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Vương Đắc Khải
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'KhaiVD@gmail.com', 2, NULL, NULL, NULL, NULL, N'Activated', N'8.7', N'Spring 2019', NULL, N'SE04938')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (52, N'TuanLDA@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Lê Dương Anh Tuấn
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'TuanLDA@gmail.com', 3, NULL, NULL, NULL, NULL, N'Activated', N'8.6', N'Spring 2019', NULL, N'SE04939')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (53, N'HienPV@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Phan Văn Hiển
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'HienPV@gmail.com', 2, NULL, NULL, NULL, NULL, N'Activated', N'7.4', N'Spring 2019', NULL, N'SE04940')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (54, N'MinhTB@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Bình Minh
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'MinhTB@gmail.com', 1, NULL, NULL, NULL, NULL, N'Activated', N'7.5', N'Spring 2019', NULL, N'SE04941')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (55, N'TuDB@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đỗ Bảo Tú', 968480365, CAST(N'1997-12-14' AS Date), 0, N'TuDB@gmail.com', 2, NULL, NULL, NULL, NULL, N'Activated', N'7.6', N'Spring 2019', NULL, N'SE04942')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (56, N'SonDH@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đỗ Hồng Sơn
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'SonDH@gmail.com', 3, NULL, NULL, NULL, NULL, N'Activated', N'7.7', N'Summer 2018', NULL, N'SE04943')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (57, N'LongNDN@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Đức Ngọc Long
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'LongNDN@gmail.com', 1, NULL, NULL, NULL, NULL, N'Activated', N'7.8', N'Spring 2019', NULL, N'SE04944')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (58, N'SangNV@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Văn Sang
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'SangNV@gmail.com', 2, NULL, NULL, NULL, NULL, N'Activated', N'7.9', N'Spring 2018', NULL, N'SE04945')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (59, N'BachTX@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Xuân Bách
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'BachTX@gmail.com', 3, NULL, NULL, NULL, NULL, N'Activated', N'8.0', N'Spring 2019', NULL, N'SE04946')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (60, N'HaNT@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Ngô Thái Hà
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'HaNT@gmail.com', 3, NULL, NULL, NULL, NULL, N'Activated', N'8.1', N'Spring 2019', NULL, N'SE04947')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (61, N'DucDM@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đậu Minh Đức
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'DucDM@gmail.com', 1, NULL, NULL, NULL, NULL, N'Activated', N'8.2', N'Spring 2019', NULL, N'SE04948')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (62, N'TungBT@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Bùi Thanh Tùng
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'TungBT@gmail.com', 2, NULL, NULL, NULL, NULL, N'Activated', N'8.3', N'Spring 2019', NULL, N'SE04949')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (63, N'TanDT@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đỗ Trọng Tân
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'TanDT@gmail.com', 3, NULL, NULL, NULL, NULL, N'Activated', N'8.4', N'Spring 2019', NULL, N'SE04950')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (64, N'DungDA@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đào Anh Dũng
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'DungDA@gmail.com', 3, NULL, NULL, NULL, NULL, N'Activated', N'8.5', N'Spring 2018', NULL, N'SE04951')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (65, N'DieuDQ@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đàm Quang Diệu
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'DieuDQ@gmail.com', 2, NULL, NULL, NULL, NULL, N'Activated', N'8.6', N'Spring 2019', NULL, N'SE04952')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (66, N'BinhTD@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Tạ Đức Bình
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'BinhTD@gmail.com', 1, NULL, NULL, NULL, NULL, N'Activated', N'8.7', N'Spring 2019', NULL, N'SE04953')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (67, N'LamNT@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Tùng Lâm
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'LamNT@gmail.com', 2, NULL, NULL, NULL, NULL, N'Activated', N'8.8', N'Spring 2019', NULL, N'SE04954')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (68, N'AnhPD@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Phương Đình Anh
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'AnhPD@gmail.com', 3, NULL, NULL, NULL, NULL, N'Activated', N'8.9', N'Summer 2018', NULL, N'SE04955')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (69, N'DungNT@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Tiến Dũng
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'DungNT@gmail.com', 2, NULL, NULL, NULL, NULL, N'Activated', N'9.0', N'Spring 2019', NULL, N'SE04956')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (70, N'TuNA@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Anh Tú
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'TuNA@gmail.com', 1, NULL, NULL, NULL, NULL, N'Activated', N'7.4', N'Spring 2018', NULL, N'SE04957')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (71, N'DatPM@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Phạm Minh Đạt
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'DatPM@gmail.com', 2, NULL, NULL, NULL, NULL, N'Activated', N'7.2', N'Spring 2019', NULL, N'SE04958')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (72, N'TrangNT@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn  Thị Trang
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'TrangNT@gmail.com', 3, NULL, NULL, NULL, NULL, N'Activated', N'6.5', N'Spring 2019', NULL, N'SE04959')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (73, N'DuongNT@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Thái Dương
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'DuongNT@gmail.com', 2, NULL, NULL, NULL, NULL, N'Activated', N'6.2', N'Spring 2019', NULL, N'SE04960')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [ImageID], [Status], [GPA], [Semester], [Specialized], [Code]) VALUES (74, N'DucDC@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đinh Công Đức
', 968480365, CAST(N'1997-12-14' AS Date), 0, N'DucDC@gmail.com', 1, NULL, NULL, NULL, NULL, N'Activated', N'6.4', N'Spring 2019', NULL, N'472
')
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
