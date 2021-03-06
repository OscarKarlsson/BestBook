USE [BestBookDb]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 2021-06-17 13:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[HomeTown] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 2021-06-17 13:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[GenreID] [int] NULL,
	[AuthorID] [int] NOT NULL,
	[PicLink] [nvarchar](4000) NULL,
	[AvgStar] [decimal](3, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 2021-06-17 13:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nvarchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 2021-06-17 13:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NULL,
	[Text] [nvarchar](500) NULL,
	[BookID] [int] NULL,
	[Stars] [int] NULL,
	[PostedDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (1, N'Bram Stoker', N'London')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (3, N'Oscar Karlsson', N'Varberg')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (1002, N'Emanuel1', N'Varberg')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (1003, N'Emanuel2', N'Varberg')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (1004, N'Emanuel3', N'Varberg')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (1005, N'Bram Stock', N'London')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (2002, N'Testing', N'Varberg')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (1002, N'Harry Potter and the deathly hallows', N'Voldemort is a bad guy. Harry must stop him, and he does! The good guys win.
PS. Fred, Lupin and Tonks dies.
PS. Fred, Lupin and Tonks dies.', 1, 1, N'https://images-na.ssl-images-amazon.com/images/I/81XQ0e5LfsL.jpg', CAST(4.64 AS Decimal(3, 2)))
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (1003, N'Harry Potter and the philosopher''s stone', N'Harry Potter is a wizard. He is awesome.', 8, 1, N'data:image/webp;base64,UklGRkAzAABXRUJQVlA4IDQzAABw4wCdASq0ABgBPpU8l0glo6IhMfTOoLASiWwzX40AyI+n+WHNz', NULL)
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (1004, N'Harry potter and the chamber of secrets', N'Harry finds out voldemort is the heir of slytherin.', 8, 1, N'https://upload.wikimedia.org/wikipedia/en/c/c0/Harry_Potter_and_the_Chamber_of_Secrets_movie.jpg', NULL)
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (1005, N'Dracula test234', N'Dracula är en vampyr. Han är snäll', 1, 1, N'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Dracula1st.jpeg/200px-Dracula1st.jpeg', CAST(5.00 AS Decimal(3, 2)))
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (2010, N'test', N'test', 1, 1005, N'https://images-na.ssl-images-amazon.com/images/I/71oRXlB2aLL._AC_SL1453_.jpg', NULL)
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (2011, N'test', N'test', 1, 1005, N'https://images-na.ssl-images-amazon.com/images/I/71oRXlB2aLL._AC_SL1453_.jpg', NULL)
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (2014, N'Emanuel', N'test', 1, 1005, N'https://images-na.ssl-images-amazon.com/images/I/71oRXlB2aLL._AC_SL1453_.jpg', NULL)
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (2015, N'Emanuel', N'test', 1, 1005, N'https://images-na.ssl-images-amazon.com/images/I/71oRXlB2aLL._AC_SL1453_.jpg', NULL)
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (2017, N'fuckingtest', N'test', 1, 1005, N'https://images-na.ssl-images-amazon.com/images/I/71oRXlB2aLL._AC_SL1453_.jpg', NULL)
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (2018, N'Testing', N'Testar', 1, 1, NULL, NULL)
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3006, N'testidag', N'dsfsd', 1, 1, NULL, NULL)
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3007, N'fgdf', N'dfgd', 1, 1004, NULL, NULL)
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3008, N'dsfsd', N'sdfsd', 1, 1005, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([ID], [GenreName]) VALUES (1, N'Horror')
INSERT [dbo].[Genre] ([ID], [GenreName]) VALUES (2, N'Adventure')
INSERT [dbo].[Genre] ([ID], [GenreName]) VALUES (3, N'Romance')
INSERT [dbo].[Genre] ([ID], [GenreName]) VALUES (4, N'Biography')
INSERT [dbo].[Genre] ([ID], [GenreName]) VALUES (5, N'Science fiction')
INSERT [dbo].[Genre] ([ID], [GenreName]) VALUES (6, N'Thriller')
INSERT [dbo].[Genre] ([ID], [GenreName]) VALUES (7, N'Mystery')
INSERT [dbo].[Genre] ([ID], [GenreName]) VALUES (8, N'Fantasy')
INSERT [dbo].[Genre] ([ID], [GenreName]) VALUES (9, N'Comics')
INSERT [dbo].[Genre] ([ID], [GenreName]) VALUES (10, N'Childrens')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (6, N'Emanuel', N'Test1', 1002, 5, CAST(N'2021-06-17T13:32:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (9, N'Emanuel', N'Detta är den bästa boken någonsin. Jag tycker den är sååååååååå bra!', 1002, 5, CAST(N'2021-06-17T13:32:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (12, N'Emanuel', N'Test för att se att det fungerar med dolt fält', 1002, 5, CAST(N'2021-06-17T13:32:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (13, N'Emanuel', N'Bästa boken någonsin. Voldemort är en fjant och Snape är taskig.', 1003, 5, CAST(N'2021-06-17T13:32:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (14, N'Emanuel', N'Test avg stars', 1002, 5, CAST(N'2021-06-17T13:32:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (16, N'Emanuel', N'Testing', 1005, 5, CAST(N'2021-06-17T13:32:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (17, N'Emanuel', N'testing', 1002, 2, CAST(N'2021-06-17T13:32:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1016, N'Emanuel', N'Feett braaaaa', 1002, 5, CAST(N'2021-06-17T13:32:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1017, N'Emanuel', N'Test datetime', 1002, 5, CAST(N'2021-06-17T13:32:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1018, N'Emanuel', N'PostedDateTime', 1002, 5, CAST(N'2021-06-17T13:32:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1019, N'Emanuel', N'testdatetime', 1002, 4, CAST(N'2021-06-17T13:32:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1020, N'Emanuel', N'Test addhours', 1002, 5, CAST(N'2021-06-17T13:32:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1021, N'Emanuel', N'testtest', 1002, 5, CAST(N'2021-06-17T13:32:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK__Book__AuthorID__29572725] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK__Book__AuthorID__29572725]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genre] ([ID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK__Review__BookID__2B3F6F97] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK__Review__BookID__2B3F6F97]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD CHECK  (([Stars]<=(5) AND [Stars]>=(0)))
GO
