USE [master]
GO
/****** Object:  Database [BestBookDb]    Script Date: 2021-06-18 09:00:25 ******/
CREATE DATABASE [BestBookDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BestBookDb', FILENAME = N'C:\Users\oscar\BestBookDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BestBookDb_log', FILENAME = N'C:\Users\oscar\BestBookDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BestBookDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BestBookDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BestBookDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BestBookDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BestBookDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BestBookDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BestBookDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BestBookDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BestBookDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BestBookDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BestBookDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BestBookDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BestBookDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BestBookDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BestBookDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BestBookDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BestBookDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BestBookDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BestBookDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BestBookDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BestBookDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BestBookDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BestBookDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BestBookDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BestBookDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BestBookDb] SET  MULTI_USER 
GO
ALTER DATABASE [BestBookDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BestBookDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BestBookDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BestBookDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BestBookDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BestBookDb] SET QUERY_STORE = OFF
GO
USE [BestBookDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [BestBookDb]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 2021-06-18 09:00:26 ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 2021-06-18 09:00:26 ******/
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
/****** Object:  Table [dbo].[Genre]    Script Date: 2021-06-18 09:00:26 ******/
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
/****** Object:  Table [dbo].[Review]    Script Date: 2021-06-18 09:00:26 ******/
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

INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (2003, N'Bram Stoker', N'London')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (2004, N'Stephen King', N'Portland')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (2005, N'Sam Subity', N'Los Angeles')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (2006, N'Robert D. Ballard', N'Wichita')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (2007, N'Rivers Solomon', N'New York')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (2008, N'E.K. Johnston', N'McKillop Township')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (2009, N'Vincent Bugliosi', N'Hibbing')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (2010, N'Mia P. Manansala', N'Chicago')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (2011, N'J.K. Rowling', N'London')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (2012, N'Alan Moore', N'Northampton')
INSERT [dbo].[Author] ([ID], [Name], [HomeTown]) VALUES (2013, N'Dr. Suess', N'Springfield')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3013, N'Dracula', N'Dracula is an epistolary novel, told through letters, diary entries, newspaper articles, telegrams, and a ship''s log. The novel is set mostly in Transylvania and England, and unfolds mostly chronologically between 3 May and 6 November.', 1, 2003, N'cover_dracula_0205-719x1024211538065.jpg', CAST(3.75 AS Decimal(3, 2)))
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3014, N'It', N'It was the children who saw - and felt - what made the town so horribly different. In the storm drains and sewers ''It'' lurked, taking the shape of every nightmare, each one''s deepest dread. As the children grow up and move away, the horror of ''It'' is buried deep - until they are called back.', 1, 2004, N'it-9781501175466_hr212327593.jpg', CAST(4.00 AS Decimal(3, 2)))
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3015, N'The Dark Tower: The Gunslinger', N'The story centers upon Roland Deschain, the last gunslinger, who has been chasing his adversary, "the man in black," for many years. The novel fuses Western fiction with fantasy, science fiction, and horror, following Roland''s trek through a vast desert and beyond in search of the man in black. Roland meets several people along his journey, including a boy named Jake Chambers, who travels with him part of the way.', 8, 2004, N'The Dark Tower I - The Gunslinger [Revied and Expanded] hardback212606400.jpg', CAST(3.25 AS Decimal(3, 2)))
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3016, N'The Dark Tower IV: Wizard and Glass', N'The novel begins where The Waste Lands ended. After Jake, Eddie, Susannah and Roland fruitlessly riddle Blaine the Mono for several hours, Eddie defeats the mad computer by telling childish jokes. Blaine is unable to handle Eddie''s "illogical" riddles and short-circuits.', 8, 2004, N'the-dark-tower-iv-9781501161834_hr212734341.jpg', CAST(4.00 AS Decimal(3, 2)))
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3017, N'The Shining', N'The Shining centers on the life of Jack Torrance, a struggling writer and recovering alcoholic who accepts a position as the off-season caretaker of the historic Overlook Hotel in the Colorado Rockies. His family accompanies him on this job, including his young son Danny Torrance, who possesses "the shining", an array of psychic abilities that allow Danny to see the hotel''s horrific past.', 1, 2004, N'Shiningnovel213112389.jpg', NULL)
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3018, N'The Last Shadow Warrior', N'Twelve-year-old Abby Beckett is proud to come from a long line of elite Viking warriors known as the Aesir. She''s spent her entire life training to hunt the horrific creatures known as Grendels - the ancient foe of the Aesir - just like her mother did before she died.', 2, 2005, N'shadowwarrior213340938.jpg', CAST(2.00 AS Decimal(3, 2)))
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3019, N'Into the Deep: An Explorer''s Life', N'Best known for finding the doomed ship Titanic, celebrated adventurer Robert Ballard has a lifetime of stories about exploring the ocean depths.', 4, 2006, N'deep213606948.jpg', NULL)
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3020, N'Sorrowland', N'Vern - seven months pregnant and desperate to escape the strict religious compound where she was raised - flees for the shelter of the woods. There, she gives birth to twins, and plans to raise them far from the influence of the outside world.', 5, 2007, N'sorrow213803154.jpg', CAST(2.50 AS Decimal(3, 2)))
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3021, N'Aetherbound', N'Set on a family-run interstellar freighter called the Harland and a mysterious remote space station, E. K. Johnston''s latest is story of survival and self-determination.', 5, 2008, N'aether213928756.jpg', CAST(3.00 AS Decimal(3, 2)))
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3022, N'Helter Skelter: The True Story of the Manson Murders', N'Prosecuting attorney in the Manson trial, Vincent Bugliosi held a unique insider''s position in one of the most baffling and horrifying cases of the twentieth century: the cold-blooded Tate-LaBianca murders carried out by Charles Manson and four of his followers.', 6, 2009, N'helter214117506.jpg', NULL)
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3023, N'Reclaiming History – The Assassination of John F Kennedy', N'This extraordinary and historic book required twenty years to research and write. The oft-challenged findings of the Warren Commission Lee Harvey Oswald, acting alone, shot and killed President John F. Kennedy are here confirmed beyond all doubt.', 6, 2009, N'jfk214231896.jpg', CAST(2.50 AS Decimal(3, 2)))
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3024, N'Arsenic and Adobo', N'When Lila Macapagal moves back home to recover from a horrible breakup, her life seems to be following all the typical rom-com tropes.', 7, 2010, N'arsenic214435777.jpg', CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3025, N'Harry Potter and the Sorcerer''s Stone', N'Harry Potter''s life is miserable. His parents are dead and he''s stuck with his heartless relatives, who force him to live in a tiny closet under the stairs.', 8, 2011, N'harry1214602810.jpg', CAST(4.33 AS Decimal(3, 2)))
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3026, N'Harry Potter and the Prisoner of Azkaban', N'For twelve long years, the dread fortress of Azkaban held an infamous prisoner named Sirius Black. Convicted of killing thirteen people with a single curse, he was said to be the heir apparent to the Dark Lord, Voldemort.', 8, 2011, N'harry3214652259.jpg', NULL)
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3027, N'Watchmen', N'This Hugo Award-winning graphic novel chronicles the fall from grace of a group of super-heroes plagued by all-too-human failings. Along the way, the concept of the super-hero is dissected as the heroes are stalked by an unknown assassin.', 9, 2012, N'watchmen214827139.jpg', CAST(4.38 AS Decimal(3, 2)))
INSERT [dbo].[Book] ([ID], [Name], [Description], [GenreID], [AuthorID], [PicLink], [AvgStar]) VALUES (3028, N'Green Eggs and Ham', N'“Do you like green eggs and ham?” asks Sam-I-am in this Beginner Book by Dr. Seuss. In a house or with a mouse? In a boat or with a goat? On a train or in a tree? Sam keeps asking persistently.', 10, 2013, N'green214946094.jpg', CAST(4.00 AS Decimal(3, 2)))
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

INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1025, N'Oscar', N'Vilken häftig bok! 5/7!', 3013, 5, CAST(N'2021-06-17T20:22:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1026, N'Göran', N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 3015, 4, CAST(N'2021-06-17T20:50:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1027, N'Berit', N'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 3021, 3, CAST(N'2021-06-17T20:51:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1028, N'Kalle', N'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', 3027, 5, CAST(N'2021-06-17T20:51:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1029, N'Johanna', N'But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.', 3027, 5, CAST(N'2020-06-16T20:53:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1030, N'Karl Erik', N'But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.', 3023, 2, CAST(N'2020-06-16T20:53:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1031, N'Lars-Erik', N'But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.', 3024, 3, CAST(N'2020-06-16T20:53:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1032, N'Janne', N'But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.', 3020, 3, CAST(N'2020-06-16T20:54:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1033, N'Gösta', N'Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat', 3018, 2, CAST(N'2021-01-11T20:54:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1034, N'Johan', N'Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat', 3015, 3, CAST(N'2021-01-11T20:55:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1035, N'Britt', N'Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat', 3028, 5, CAST(N'2021-01-11T20:55:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1036, N'Hans', N'Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat', 3025, 3, CAST(N'2021-01-11T20:55:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1037, N'Natalie', N'Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it?', 3028, 3, CAST(N'2021-05-13T20:56:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1038, N'Larry', N'Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it?', 3013, 4, CAST(N'2021-05-13T20:57:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1039, N'Britt', N'Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it?', 3015, 3, CAST(N'2021-05-13T20:57:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1040, N'Hans', N'Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it?', 3023, 3, CAST(N'2021-05-13T20:58:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1041, N'Gösta', N'Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it?', 3027, 5, CAST(N'2021-05-13T20:58:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1042, N'Johanna', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3027, 4, CAST(N'2019-02-21T20:59:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1043, N'Natalie', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3020, 2, CAST(N'2019-02-21T20:59:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1044, N'Janne', N'Vilken trevlig bok!', 3027, 3, CAST(N'2019-02-21T21:00:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1045, N'Natalie', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3016, 4, CAST(N'2019-02-21T21:00:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1046, N'Janne', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3024, 4, CAST(N'2021-04-12T21:00:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1047, N'Hans', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3016, 4, CAST(N'2021-04-12T21:01:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1048, N'Britt', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3025, 5, CAST(N'2021-04-12T21:01:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1049, N'Natalie', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3015, 3, CAST(N'2021-04-12T21:01:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1050, N'Larry', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3013, 4, CAST(N'2021-04-12T21:02:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1051, N'Josef', N'Oj Vad mycket det är som händer i denna bok!', 3027, 5, CAST(N'2021-06-18T06:34:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1052, N'Göran', N'Det finns många olika varianter av Lorem Ipsum, men majoriteten av dessa har ändrats på någotvis. Antingen med inslag av humor, eller med inlägg av ord som knappast ser trovärdiga ut. Skall man använda långa stycken av Lorem Ipsum bör man försäkra sig om att det inte gömmer sig något pinsamt mitt i texten.', 3027, 3, CAST(N'2021-06-18T06:35:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1053, N'Emanuel', N'Best book ever!', 3025, 5, CAST(N'2021-06-18T06:50:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1054, N'Göran', N'What a great book!', 3027, 5, CAST(N'2021-06-18T06:52:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1055, N'Jan Banan', N'But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?', 3014, 4, CAST(N'2021-06-18T07:12:00' AS SmallDateTime))
INSERT [dbo].[Review] ([ID], [Name], [Text], [BookID], [Stars], [PostedDate]) VALUES (1056, N'Erik', N'Dracula?', 3013, 2, CAST(N'2021-06-18T08:47:00' AS SmallDateTime))
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
USE [master]
GO
ALTER DATABASE [BestBookDb] SET  READ_WRITE 
GO
