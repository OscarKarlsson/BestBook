USE [BestBookDb]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 2021-06-17 13:14:14 ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 2021-06-17 13:14:14 ******/
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
/****** Object:  Table [dbo].[Genre]    Script Date: 2021-06-17 13:14:14 ******/
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
/****** Object:  Table [dbo].[Review]    Script Date: 2021-06-17 13:14:14 ******/
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
