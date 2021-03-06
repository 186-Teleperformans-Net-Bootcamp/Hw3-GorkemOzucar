USE [master]
GO
/****** Object:  Database [Teleperformance]    Script Date: 4.06.2022 12:41:26 ******/
CREATE DATABASE [Teleperformance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Teleperformance', FILENAME = N'C:\Users\Görkem\Teleperformance.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Teleperformance_log', FILENAME = N'C:\Users\Görkem\Teleperformance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Teleperformance] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Teleperformance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Teleperformance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Teleperformance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Teleperformance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Teleperformance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Teleperformance] SET ARITHABORT OFF 
GO
ALTER DATABASE [Teleperformance] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Teleperformance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Teleperformance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Teleperformance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Teleperformance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Teleperformance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Teleperformance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Teleperformance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Teleperformance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Teleperformance] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Teleperformance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Teleperformance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Teleperformance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Teleperformance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Teleperformance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Teleperformance] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Teleperformance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Teleperformance] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Teleperformance] SET  MULTI_USER 
GO
ALTER DATABASE [Teleperformance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Teleperformance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Teleperformance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Teleperformance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Teleperformance] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Teleperformance] SET QUERY_STORE = OFF
GO
USE [Teleperformance]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Teleperformance]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4.06.2022 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FriendshipArchive]    Script Date: 4.06.2022 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendshipArchive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromUserId] [int] NOT NULL,
	[ToUserId] [int] NOT NULL,
	[IsAccepted] [bit] NULL,
 CONSTRAINT [PK_FriendshipArchive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friendships]    Script Date: 4.06.2022 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friendships](
	[FriendShipId] [int] IDENTITY(1,1) NOT NULL,
	[FromUserId] [int] NOT NULL,
	[ToUserId] [int] NOT NULL,
	[OfferTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Friendships] PRIMARY KEY CLUSTERED 
(
	[FriendShipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 4.06.2022 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](max) NOT NULL,
	[GroupOwnerId] [int] NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageArchive]    Script Date: 4.06.2022 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageArchive](
	[MessageId] [int] NOT NULL,
	[MessageType] [int] NOT NULL,
	[MessageContent] [nvarchar](500) NOT NULL,
	[MessageTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 4.06.2022 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[MessageType] [int] NOT NULL,
	[MessageContent] [nvarchar](max) NOT NULL,
	[IsPublicMessage] [bit] NOT NULL,
	[ToGroupId] [int] NOT NULL,
	[ToUserId] [int] NOT NULL,
	[UsersUserId] [int] NOT NULL,
	[MessageTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4.06.2022 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[GroupId] [int] NULL,
	[FriendShipId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_FriendShipId]    Script Date: 4.06.2022 17:44:35 ******/
CREATE NONCLUSTERED INDEX [IX_Users_FriendShipId] ON [dbo].[Users]
(
	[FriendShipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_GroupId]    Script Date: 4.06.2022 17:44:35 ******/
CREATE NONCLUSTERED INDEX [IX_Users_GroupId] ON [dbo].[Users]
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users_UsersUserId] FOREIGN KEY([UsersUserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users_UsersUserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Friendships_FriendShipId] FOREIGN KEY([FriendShipId])
REFERENCES [dbo].[Friendships] ([FriendShipId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Friendships_FriendShipId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Groups_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([GroupId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Groups_GroupId]
GO
/****** Object:  StoredProcedure [dbo].[maxmesajatankullanıcı]    Script Date: 4.06.2022 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[maxmesajatankullanıcı]

AS

BEGIN

	select top(10) 
	COUNT(m.UsersUserId) messagecount,
	u.UserName

	from Messages m
	inner join Users u on m.UsersUserId=u.UserId 
	group by u.UserName
	order by messagecount desc

END



GO
/****** Object:  Trigger [dbo].[FriendshipRequest]    Script Date: 4.06.2022 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[FriendshipRequest]
on [dbo].[Friendships]
after insert 
as 
begin
	Declare @FromUserId int ,@ToUserId int,@IsAccepted bit
	set @IsAccepted=0
	select  @FromUserId=i.FromUserId,@ToUserId=i.ToUserId from inserted i
	insert into FriendshipArchive (FromUserId,ToUserId,IsAccepted) values (@FromUserId,@ToUserId,@IsAccepted)
end
GO
ALTER TABLE [dbo].[Friendships] ENABLE TRIGGER [FriendshipRequest]
GO
/****** Object:  Trigger [dbo].[MessageUpdated]    Script Date: 4.06.2022 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[MessageUpdated]
on [dbo].[Messages]
after update
as
begin
	Declare @MessageId int,@MessageType int,@MessageContent nvarchar(max),@MessageTime datetime
	select @MessageId=d.MessageId,@MessageType=d.MessageType,@MessageTime=d.MessageTime,@MessageContent=d.MessageContent from deleted d
	insert into MessageArchive values(@MessageId,@MessageType,@MessageContent,@MessageTime)
end
GO
ALTER TABLE [dbo].[Messages] ENABLE TRIGGER [MessageUpdated]
GO
USE [master]
GO
ALTER DATABASE [Teleperformance] SET  READ_WRITE 
GO
