USE [master]
GO
/****** Object:  Database [UltimateTeam]    Script Date: 5/10/2025 3:43:59 PM ******/
CREATE DATABASE [UltimateTeam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UltimateTeam', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UltimateTeam.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UltimateTeam_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UltimateTeam_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UltimateTeam] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UltimateTeam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UltimateTeam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UltimateTeam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UltimateTeam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UltimateTeam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UltimateTeam] SET ARITHABORT OFF 
GO
ALTER DATABASE [UltimateTeam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UltimateTeam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UltimateTeam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UltimateTeam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UltimateTeam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UltimateTeam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UltimateTeam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UltimateTeam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UltimateTeam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UltimateTeam] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UltimateTeam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UltimateTeam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UltimateTeam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UltimateTeam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UltimateTeam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UltimateTeam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UltimateTeam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UltimateTeam] SET RECOVERY FULL 
GO
ALTER DATABASE [UltimateTeam] SET  MULTI_USER 
GO
ALTER DATABASE [UltimateTeam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UltimateTeam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UltimateTeam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UltimateTeam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UltimateTeam] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UltimateTeam', N'ON'
GO
ALTER DATABASE [UltimateTeam] SET QUERY_STORE = OFF
GO
USE [UltimateTeam]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 5/10/2025 3:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[id] [varchar](50) NOT NULL,
	[userId] [uniqueidentifier] NULL,
	[packId] [uniqueidentifier] NULL,
	[playerId] [varchar](500) NULL,
	[tier] [int] NULL,
	[cardImage] [varchar](5000) NULL,
 CONSTRAINT [PK__Cards__3213E83FE72C2A09] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packs]    Script Date: 5/10/2025 3:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packs](
	[id] [uniqueidentifier] NOT NULL,
	[packName] [varchar](100) NOT NULL,
	[packType] [int] NULL,
	[packImage] [varchar](5000) NULL,
	[status] [bit] NULL,
	[userId] [uniqueidentifier] NULL,
 CONSTRAINT [PK__Packs__3213E83F1E5A9EC4] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 5/10/2025 3:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[id] [varchar](500) NOT NULL,
	[teamId] [varchar](50) NULL,
	[firstName] [varchar](50) NULL,
	[lastName] [varchar](50) NULL,
	[playerImage] [varchar](5000) NULL,
	[age] [varchar](50) NULL,
	[height] [varchar](100) NULL,
	[weight] [varchar](100) NULL,
	[yearsPro] [varchar](50) NULL,
	[playerApiId] [varchar](50) NULL,
	[cardId] [varchar](50) NULL,
	[position] [varchar](50) NULL,
 CONSTRAINT [PK__Players__3213E83FB88F3C9D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stats]    Script Date: 5/10/2025 3:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stats](
	[id] [uniqueidentifier] NOT NULL,
	[playerId] [varchar](500) NOT NULL,
	[PPG] [varchar](100) NULL,
	[APG] [varchar](100) NULL,
	[RPG] [varchar](100) NULL,
	[BPG] [varchar](100) NULL,
	[SPG] [varchar](100) NULL,
	[MPG] [varchar](100) NULL,
	[gamesPlayed] [varchar](100) NULL,
	[statApiId] [varchar](500) NULL,
 CONSTRAINT [PK__Stats__3213E83F3216221B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 5/10/2025 3:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[id] [varchar](50) NOT NULL,
	[teamName] [varchar](50) NULL,
	[conference] [varchar](50) NULL,
	[teamApiId] [varchar](50) NULL,
	[teamLogo] [varchar](5000) NULL,
	[city] [varchar](50) NULL,
	[conferenceType] [int] NULL,
 CONSTRAINT [PK__Teams__3213E83FCB050A0A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/10/2025 3:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [uniqueidentifier] NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[customerEmail] [varchar](100) NOT NULL,
	[customerCreation] [datetime] NULL,
	[status] [bit] NULL,
	[googleId] [varchar](100) NULL,
 CONSTRAINT [PK__Users__3213E83F478C48B6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cards] ADD  CONSTRAINT [DF__Cards__id__3B75D760]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Packs] ADD  CONSTRAINT [DF__Packs__id__30F848ED]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Players] ADD  CONSTRAINT [DF__Players__id__33D4B598]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF__Stats__id__37A5467C]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [DF__Teams__id__2E1BDC42]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__id__2B3F6F97]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_Packs] FOREIGN KEY([packId])
REFERENCES [dbo].[Packs] ([id])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_Packs]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_Players] FOREIGN KEY([playerId])
REFERENCES [dbo].[Players] ([id])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_Players]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_Users]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Cards] FOREIGN KEY([cardId])
REFERENCES [dbo].[Cards] ([id])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Cards]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Teams] FOREIGN KEY([teamId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Teams]
GO
ALTER TABLE [dbo].[Stats]  WITH CHECK ADD  CONSTRAINT [FK_Stats_Players] FOREIGN KEY([playerId])
REFERENCES [dbo].[Players] ([id])
GO
ALTER TABLE [dbo].[Stats] CHECK CONSTRAINT [FK_Stats_Players]
GO
USE [master]
GO
ALTER DATABASE [UltimateTeam] SET  READ_WRITE 
GO
