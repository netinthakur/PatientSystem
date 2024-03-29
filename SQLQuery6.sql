USE [master]
GO
/****** Object:  Database [PMS]    Script Date: 06/18/2019 10:44:30 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PMS')
BEGIN
CREATE DATABASE [PMS]

GO

USE [PMS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PMS]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 06/18/2019 10:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Doctor](
	[ID] [uniqueidentifier] NOT NULL,
	[RegistrationNumber] [nvarchar](50) NOT NULL,
	[DoctorName] [nvarchar](50) NOT NULL,
	[Qualification] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Experience] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Login]    Script Date: 06/18/2019 10:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Login]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Login](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [varchar](200) NOT NULL,
	[Password] [nvarchar](510) NULL,
	[IsLocked] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 06/18/2019 10:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Patient](
	[ID] [uniqueidentifier] NOT NULL,
	[RegistrationNumber] [nvarchar](50) NOT NULL,
	[PatientName] [nvarchar](50) NOT NULL,
	[FatherName] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[HealthIssue] [nvarchar](100) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientTiming]    Script Date: 06/18/2019 10:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientTiming]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientTiming](
	[ID] [uniqueidentifier] NOT NULL,
	[PatientID] [uniqueidentifier] NOT NULL,
	[DoctorID] [uniqueidentifier] NOT NULL,
	[Timing] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[AppointmentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PatientTiming] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Doctor] ([ID], [RegistrationNumber], [DoctorName], [Qualification], [Address], [PhoneNumber], [Experience], [IsDeleted], [CreatedDateTime], [CreatedBy], [UpdatedDateTime], [UpdatedBy]) VALUES (N'f69d2418-a201-40f4-bd54-310fa4f8917c', N'1234', N'Urvashi', N'MS', N'USA', N'12345678', N'7', 0, CAST(N'2019-06-17T23:18:12.097' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Doctor] ([ID], [RegistrationNumber], [DoctorName], [Qualification], [Address], [PhoneNumber], [Experience], [IsDeleted], [CreatedDateTime], [CreatedBy], [UpdatedDateTime], [UpdatedBy]) VALUES (N'97098f18-9811-40ce-bcd7-4e3a7ebe56ee', N'1234', N'Urvashi', N'MS', N'USA', N'12345678', N'7', 1, CAST(N'2019-06-17T22:52:35.967' AS DateTime), 1, CAST(N'2019-06-17T22:56:16.867' AS DateTime), 1)
GO
INSERT [dbo].[Login] ([ID], [UserID], [Password], [IsLocked], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedOn], [UpdatedBy]) VALUES (N'42b30974-ca58-4821-8b7b-11a0bbf7fb34', N'admin', N'welcome', 0, 0, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Patient] ([ID], [RegistrationNumber], [PatientName], [FatherName], [Age], [Address], [HealthIssue], [IsDeleted], [CreatedDateTime], [CreatedBy], [UpdatedDateTime], [UpdatedBy]) VALUES (N'5c0e40be-65d8-4b29-ab86-8b0cc142e7cb', N'3456', N'URvashi', N'KC Jaiswal', 24, N'802', N'PCOS', 0, CAST(N'2019-06-17T23:05:28.710' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Patient] ([ID], [RegistrationNumber], [PatientName], [FatherName], [Age], [Address], [HealthIssue], [IsDeleted], [CreatedDateTime], [CreatedBy], [UpdatedDateTime], [UpdatedBy]) VALUES (N'017b119c-a5e8-4b8e-adeb-949217318548', N'3456', N'URvashi', N'KC Jaiswal', 24, N'802', N'PCOS', 1, CAST(N'2019-06-17T23:06:33.733' AS DateTime), 1, CAST(N'2019-06-17T23:06:48.850' AS DateTime), 1)
GO
INSERT [dbo].[PatientTiming] ([ID], [PatientID], [DoctorID], [Timing], [IsDeleted], [CreatedDateTime], [CreatedBy], [UpdatedDateTime], [UpdatedBy], [AppointmentDate]) VALUES (N'12e4df45-5184-4ec2-a9e6-93bbc9533ff4', N'5c0e40be-65d8-4b29-ab86-8b0cc142e7cb', N'f69d2418-a201-40f4-bd54-310fa4f8917c', N'2pm', 0, CAST(N'2019-06-17T23:24:14.397' AS DateTime), 1, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime))
GO
