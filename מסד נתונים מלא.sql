USE [NPA]
GO
/****** Object:  Table [dbo].[matmon]    Script Date: 18/04/2023 15:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matmon](
	[codeManuy] [int] IDENTITY(1,1) NOT NULL,
	[manuyType] [varchar](20) NOT NULL,
	[priceM] [int] NOT NULL,
	[long] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codeManuy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menuim]    Script Date: 18/04/2023 15:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menuim](
	[groupName] [varchar](20) NOT NULL,
	[groupCode] [int] NOT NULL,
	[long] [int] NOT NULL,
	[codeManuy] [int] NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[adress] [varchar](20) NOT NULL,
	[numMembars] [int] NOT NULL,
	[SignedBy] [int] NULL,
	[datee] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[groupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sites]    Script Date: 18/04/2023 15:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sites](
	[siteName] [varchar](20) NOT NULL,
	[codeSite] [int] IDENTITY(100,1) NOT NULL,
	[fromeAge] [int] NOT NULL,
	[toAge] [int] NOT NULL,
	[SiteTypeCode] [int] NOT NULL,
	[Price] [int] NULL,
	[PriceM] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[codeSite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiteTypes]    Script Date: 18/04/2023 15:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteTypes](
	[SiteTypeCode] [int] IDENTITY(1,1) NOT NULL,
	[SiteTypeName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SiteTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[visitingHoursS]    Script Date: 18/04/2023 15:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visitingHoursS](
	[codeHour] [int] IDENTITY(1,1) NOT NULL,
	[codeSite] [int] NOT NULL,
	[openingTime] [time](7) NULL,
	[closingTime] [time](7) NULL,
	[isopen] [bit] NULL,
	[remark] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[codeHour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[visitingHoursW]    Script Date: 18/04/2023 15:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visitingHoursW](
	[codeHour] [int] IDENTITY(1,1) NOT NULL,
	[codeSite] [int] NOT NULL,
	[openingTime] [time](7) NULL,
	[closingTime] [time](7) NULL,
	[isopen] [bit] NULL,
	[remark] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[codeHour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[visits]    Script Date: 18/04/2023 15:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visits](
	[codeVisit] [int] IDENTITY(1,1) NOT NULL,
	[codeSite] [int] NOT NULL,
	[date] [date] NOT NULL,
	[numMembars] [int] NULL,
	[groupCode] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[codeVisit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[matmon] ON 
GO
INSERT [dbo].[matmon] ([codeManuy], [manuyType], [priceM], [long]) VALUES (1, N'משפחתי', 446, 1)
GO
INSERT [dbo].[matmon] ([codeManuy], [manuyType], [priceM], [long]) VALUES (2, N'יחיד', 181, 1)
GO
INSERT [dbo].[matmon] ([codeManuy], [manuyType], [priceM], [long]) VALUES (3, N'משפחתי ', 846, 2)
GO
INSERT [dbo].[matmon] ([codeManuy], [manuyType], [priceM], [long]) VALUES (4, N'יחיד', 364, 2)
GO
SET IDENTITY_INSERT [dbo].[matmon] OFF
GO
INSERT [dbo].[menuim] ([groupName], [groupCode], [long], [codeManuy], [phone], [adress], [numMembars], [SignedBy], [datee]) VALUES (N'agf', 123456789, 1, 1, N'1234567890', N'grfd', 4, NULL, CAST(N'2000-02-02' AS Date))
GO
INSERT [dbo].[menuim] ([groupName], [groupCode], [long], [codeManuy], [phone], [adress], [numMembars], [SignedBy], [datee]) VALUES (N'אוריה', 325574507, 1, 2, N'0533145256', N'רכהכר', 1, 326385788, NULL)
GO
INSERT [dbo].[menuim] ([groupName], [groupCode], [long], [codeManuy], [phone], [adress], [numMembars], [SignedBy], [datee]) VALUES (N'אילה', 326385788, 2, 1, N'0533174769', N'כעיח', 4, NULL, NULL)
GO
INSERT [dbo].[menuim] ([groupName], [groupCode], [long], [codeManuy], [phone], [adress], [numMembars], [SignedBy], [datee]) VALUES (N'שירה', 329227144, 4, 3, N'0522361458', N'עהכגד', 20, NULL, NULL)
GO
INSERT [dbo].[menuim] ([groupName], [groupCode], [long], [codeManuy], [phone], [adress], [numMembars], [SignedBy], [datee]) VALUES (N'הנדא', 652158544, 2, 3, N'0255232156', N'כגדכ', 15, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[sites] ON 
GO
INSERT [dbo].[sites] ([siteName], [codeSite], [fromeAge], [toAge], [SiteTypeCode], [Price], [PriceM]) VALUES (N'נחל עמוד', 100, 5, 30, 2, 95, 0)
GO
INSERT [dbo].[sites] ([siteName], [codeSite], [fromeAge], [toAge], [SiteTypeCode], [Price], [PriceM]) VALUES (N'נחל דן', 101, 1, 60, 2, 210, 22)
GO
INSERT [dbo].[sites] ([siteName], [codeSite], [fromeAge], [toAge], [SiteTypeCode], [Price], [PriceM]) VALUES (N'נחל צלמון', 103, 1, 100, 2, 30, 0)
GO
INSERT [dbo].[sites] ([siteName], [codeSite], [fromeAge], [toAge], [SiteTypeCode], [Price], [PriceM]) VALUES (N'נחל קישון', 104, 1, 12, 2, 122, 39)
GO
SET IDENTITY_INSERT [dbo].[sites] OFF
GO
SET IDENTITY_INSERT [dbo].[SiteTypes] ON 
GO
INSERT [dbo].[SiteTypes] ([SiteTypeCode], [SiteTypeName]) VALUES (5, N'הסטוריה')
GO
INSERT [dbo].[SiteTypes] ([SiteTypeCode], [SiteTypeName]) VALUES (1, N'חניית לילה')
GO
INSERT [dbo].[SiteTypes] ([SiteTypeCode], [SiteTypeName]) VALUES (7, N'טבע')
GO
INSERT [dbo].[SiteTypes] ([SiteTypeCode], [SiteTypeName]) VALUES (6, N'מדבר')
GO
INSERT [dbo].[SiteTypes] ([SiteTypeCode], [SiteTypeName]) VALUES (3, N'מוזאון')
GO
INSERT [dbo].[SiteTypes] ([SiteTypeCode], [SiteTypeName]) VALUES (2, N'נחל')
GO
INSERT [dbo].[SiteTypes] ([SiteTypeCode], [SiteTypeName]) VALUES (4, N'פארק לאומי')
GO
SET IDENTITY_INSERT [dbo].[SiteTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[visits] ON 
GO
INSERT [dbo].[visits] ([codeVisit], [codeSite], [date], [numMembars], [groupCode]) VALUES (2, 100, CAST(N'2022-06-08' AS Date), 3, 326385788)
GO
INSERT [dbo].[visits] ([codeVisit], [codeSite], [date], [numMembars], [groupCode]) VALUES (3, 100, CAST(N'2022-08-07' AS Date), 5, 326385788)
GO
INSERT [dbo].[visits] ([codeVisit], [codeSite], [date], [numMembars], [groupCode]) VALUES (4, 100, CAST(N'2020-08-06' AS Date), 9, 326385788)
GO
INSERT [dbo].[visits] ([codeVisit], [codeSite], [date], [numMembars], [groupCode]) VALUES (6, 100, CAST(N'2021-08-06' AS Date), 2, 326385788)
GO
INSERT [dbo].[visits] ([codeVisit], [codeSite], [date], [numMembars], [groupCode]) VALUES (7, 101, CAST(N'2022-08-06' AS Date), 3, 326385788)
GO
INSERT [dbo].[visits] ([codeVisit], [codeSite], [date], [numMembars], [groupCode]) VALUES (8, 100, CAST(N'2022-08-06' AS Date), 3, 325574507)
GO
INSERT [dbo].[visits] ([codeVisit], [codeSite], [date], [numMembars], [groupCode]) VALUES (9, 100, CAST(N'2002-02-01' AS Date), 8, 326385788)
GO
INSERT [dbo].[visits] ([codeVisit], [codeSite], [date], [numMembars], [groupCode]) VALUES (10, 100, CAST(N'2002-02-05' AS Date), 1, 123456789)
GO
SET IDENTITY_INSERT [dbo].[visits] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__sites__77DF41FA979F3A30]    Script Date: 18/04/2023 15:58:37 ******/
ALTER TABLE [dbo].[sites] ADD UNIQUE NONCLUSTERED 
(
	[siteName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SiteType__3AB6FDCA15C3146A]    Script Date: 18/04/2023 15:58:37 ******/
ALTER TABLE [dbo].[SiteTypes] ADD UNIQUE NONCLUSTERED 
(
	[SiteTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[menuim]  WITH CHECK ADD FOREIGN KEY([SignedBy])
REFERENCES [dbo].[menuim] ([groupCode])
GO
ALTER TABLE [dbo].[menuim]  WITH CHECK ADD  CONSTRAINT [fk_codeManuy] FOREIGN KEY([codeManuy])
REFERENCES [dbo].[matmon] ([codeManuy])
GO
ALTER TABLE [dbo].[menuim] CHECK CONSTRAINT [fk_codeManuy]
GO
ALTER TABLE [dbo].[sites]  WITH CHECK ADD FOREIGN KEY([SiteTypeCode])
REFERENCES [dbo].[SiteTypes] ([SiteTypeCode])
GO
ALTER TABLE [dbo].[visitingHoursS]  WITH CHECK ADD FOREIGN KEY([codeSite])
REFERENCES [dbo].[sites] ([codeSite])
GO
ALTER TABLE [dbo].[visitingHoursW]  WITH CHECK ADD FOREIGN KEY([codeSite])
REFERENCES [dbo].[sites] ([codeSite])
GO
ALTER TABLE [dbo].[visits]  WITH CHECK ADD FOREIGN KEY([codeSite])
REFERENCES [dbo].[sites] ([codeSite])
GO
ALTER TABLE [dbo].[visits]  WITH CHECK ADD FOREIGN KEY([groupCode])
REFERENCES [dbo].[menuim] ([groupCode])
GO
ALTER TABLE [dbo].[sites]  WITH CHECK ADD  CONSTRAINT [check_toAgeFromeAge] CHECK  (([toAge]>[fromeAge]))
GO
ALTER TABLE [dbo].[sites] CHECK CONSTRAINT [check_toAgeFromeAge]
GO
