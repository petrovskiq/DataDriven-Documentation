USE [master]
GO
/****** Object:  Database [Workshop1]    Script Date: 7/4/2019 9:54:36 PM ******/
CREATE DATABASE [Workshop1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Workshop1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Workshop1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Workshop1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Workshop1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Workshop1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Workshop1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Workshop1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Workshop1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Workshop1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Workshop1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Workshop1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Workshop1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Workshop1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Workshop1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Workshop1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Workshop1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Workshop1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Workshop1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Workshop1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Workshop1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Workshop1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Workshop1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Workshop1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Workshop1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Workshop1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Workshop1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Workshop1] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Workshop1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Workshop1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Workshop1] SET  MULTI_USER 
GO
ALTER DATABASE [Workshop1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Workshop1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Workshop1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Workshop1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Workshop1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Workshop1] SET QUERY_STORE = OFF
GO
USE [Workshop1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/4/2019 9:54:36 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 7/4/2019 9:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[ToBeDelivered] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pizza]    Script Date: 7/4/2019 9:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pizza](
	[PizzaId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_Pizza] PRIMARY KEY CLUSTERED 
(
	[PizzaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PizzaOrder]    Script Date: 7/4/2019 9:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PizzaOrder](
	[PizzaOrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[PizzaSizeId] [int] NOT NULL,
	[NumberOfPizzas] [int] NOT NULL,
 CONSTRAINT [PK_PizzaOrder] PRIMARY KEY CLUSTERED 
(
	[PizzaOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PizzaSize]    Script Date: 7/4/2019 9:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PizzaSize](
	[PizzaSizeId] [int] IDENTITY(1,1) NOT NULL,
	[PizzaId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_PizzaSize] PRIMARY KEY CLUSTERED 
(
	[PizzaSizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 7/4/2019 9:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Dimension] [int] NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/4/2019 9:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Address] [varchar](150) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190626111031_Test1', N'2.2.4-servicing-10062')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190628005159_test003', N'2.2.4-servicing-10062')
SET IDENTITY_INSERT [dbo].[Pizza] ON 

INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (3, N'Capricciosa', N'Ham, Cheese and Mushrooms')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (4, N'Peperoni', N'Kulen, Mocarella, mushrooms')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (5, N'Vezuvia', N'Ham, Cheese')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (8, N'Napolitana', N'test 123 123 ')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (9, N'Salami', N'test')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (10, N'Testing', N'testing')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (11, N'TEstPizza2', N'testing')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (12, N'Mediteran', N'test description')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (13, N'Newest Pizza', N'The best pizza in town')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (14, N'SP inserted Pizza', N'testing')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (15, N'Testerska', N'Testeri bez granici!')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (16, N'Testing', N'tester')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (17, N'Riki', N'Testira')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (18, N'testtest', N'testtest')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (19, N'testtesttest', N'testtesttest')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (20, N'Capri', N'testing the app')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (21, N'test123	', N'test321')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (22, N'ewr', N'wer')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (23, N'test', N'test')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (24, N'test1\', N'desc1')
INSERT [dbo].[Pizza] ([PizzaId], [Name], [Description]) VALUES (25, N'test2', N'desc2')
SET IDENTITY_INSERT [dbo].[Pizza] OFF
SET IDENTITY_INSERT [dbo].[PizzaSize] ON 

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price]) VALUES (5, 3, 4, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price]) VALUES (6, 4, 6, CAST(220.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[PizzaSize] OFF
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([SizeId], [Name], [Dimension]) VALUES (4, N'Small', 14)
INSERT [dbo].[Size] ([SizeId], [Name], [Dimension]) VALUES (6, N'Medium', 20)
INSERT [dbo].[Size] ([SizeId], [Name], [Dimension]) VALUES (7, N'Large', 25)
SET IDENTITY_INSERT [dbo].[Size] OFF
/****** Object:  Index [IX_Order_UserId]    Script Date: 7/4/2019 9:54:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Order_UserId] ON [dbo].[Order]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PizzaOrder_OrderId]    Script Date: 7/4/2019 9:54:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_PizzaOrder_OrderId] ON [dbo].[PizzaOrder]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PizzaOrder_PizzaSizeId]    Script Date: 7/4/2019 9:54:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_PizzaOrder_PizzaSizeId] ON [dbo].[PizzaOrder]
(
	[PizzaSizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PizzaSize_PizzaId]    Script Date: 7/4/2019 9:54:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_PizzaSize_PizzaId] ON [dbo].[PizzaSize]
(
	[PizzaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PizzaSize_SizeId]    Script Date: 7/4/2019 9:54:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_PizzaSize_SizeId] ON [dbo].[PizzaSize]
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User_UserId]
GO
ALTER TABLE [dbo].[PizzaOrder]  WITH CHECK ADD  CONSTRAINT [FK_PizzaOrder_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PizzaOrder] CHECK CONSTRAINT [FK_PizzaOrder_Order_OrderId]
GO
ALTER TABLE [dbo].[PizzaOrder]  WITH CHECK ADD  CONSTRAINT [FK_PizzaOrder_PizzaSize_PizzaSizeId] FOREIGN KEY([PizzaSizeId])
REFERENCES [dbo].[PizzaSize] ([PizzaSizeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PizzaOrder] CHECK CONSTRAINT [FK_PizzaOrder_PizzaSize_PizzaSizeId]
GO
ALTER TABLE [dbo].[PizzaSize]  WITH CHECK ADD  CONSTRAINT [FK_PizzaSize_Pizza_PizzaId] FOREIGN KEY([PizzaId])
REFERENCES [dbo].[Pizza] ([PizzaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PizzaSize] CHECK CONSTRAINT [FK_PizzaSize_Pizza_PizzaId]
GO
ALTER TABLE [dbo].[PizzaSize]  WITH CHECK ADD  CONSTRAINT [FK_PizzaSize_Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PizzaSize] CHECK CONSTRAINT [FK_PizzaSize_Size_SizeId]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddPizza]    Script Date: 7/4/2019 9:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddPizza] 
	@Name nvarchar(50),   
    @Description nvarchar(250)  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into dbo.Pizza
	(Name, Description)
	Values
	(@Name, @Description)
END
GO
USE [master]
GO
ALTER DATABASE [Workshop1] SET  READ_WRITE 
GO
