USE [FPTInternshipManagerment]
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (1, N'Software Engineering')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (2, N'Business Administration')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (3, N'Japanese Language')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (4, N'Graphic Design')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Student')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Recruiter')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[SkillList] ON 

INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (1, 1, NULL, 1, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (2, 2, NULL, 1, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (3, 3, NULL, 1, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (4, 4, NULL, 1, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (5, 5, NULL, 1, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (6, 6, NULL, 1, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (7, 7, NULL, 2, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (8, 8, NULL, 2, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (9, 9, NULL, 2, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (11, 10, NULL, 2, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (12, 11, NULL, 2, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (13, 12, NULL, 2, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (14, 13, NULL, 2, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (15, 14, NULL, 3, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (16, 15, NULL, 3, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (17, 16, NULL, 3, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (18, 17, NULL, 3, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (19, 18, NULL, 3, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (20, 19, NULL, 3, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (21, 20, NULL, 3, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (22, 21, NULL, 4, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (23, 22, NULL, 4, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (24, 23, NULL, 4, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (25, 24, NULL, 4, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (26, 25, NULL, 4, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (27, 26, NULL, 4, NULL)
INSERT [dbo].[SkillList] ([SkillListID], [SkillID], [AspirationsID], [DepartmentID], [JobID]) VALUES (28, 27, NULL, 4, NULL)
SET IDENTITY_INSERT [dbo].[SkillList] OFF
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

INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (1, 1, 3)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (3, 2, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (4, 3, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (5, 4, 2)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [AspirationsID], [ImageID], [Status]) VALUES (1, N'recruiter', N'123456', N'DUCDD', 968480997, CAST(N'1997-12-14' AS Date), 1, N'ducddse04936@fpt.edu.vn', NULL, NULL, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [AspirationsID], [ImageID], [Status]) VALUES (2, N'admin', N'111111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [AspirationsID], [ImageID], [Status]) VALUES (3, N'student', N'222222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Activated')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Name], [Phone], [DOB], [Gender], [Email], [LocationID], [CreateDate], [CV], [Description], [AspirationsID], [ImageID], [Status]) VALUES (4, N'student1', N'33333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Not Activated')
SET IDENTITY_INSERT [dbo].[Users] OFF
