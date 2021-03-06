USE [spa_db]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_LogError]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ELMAH_LogError]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_GetErrorXml]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ELMAH_GetErrorXml]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_GetErrorsXml]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ELMAH_GetErrorsXml]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_time_spa_basic_info]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_time]'))
ALTER TABLE [dbo].[spa_time] DROP CONSTRAINT [FK_spa_time_spa_basic_info]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_prices_spa_basic_info]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_prices]'))
ALTER TABLE [dbo].[spa_prices] DROP CONSTRAINT [FK_spa_prices_spa_basic_info]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_prices_CategeogySubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_prices]'))
ALTER TABLE [dbo].[spa_prices] DROP CONSTRAINT [FK_spa_prices_CategeogySubCategory]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_images_spa_images]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_images]'))
ALTER TABLE [dbo].[spa_images] DROP CONSTRAINT [FK_spa_images_spa_images]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_basic_info_citys]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_basic_info]'))
ALTER TABLE [dbo].[spa_basic_info] DROP CONSTRAINT [FK_spa_basic_info_citys]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_spa_images_updated_at]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[spa_images] DROP CONSTRAINT [DF_spa_images_updated_at]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_spa_images_created_at]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[spa_images] DROP CONSTRAINT [DF_spa_images_created_at]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_spa_images_is_default]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[spa_images] DROP CONSTRAINT [DF_spa_images_is_default]
END

GO
/****** Object:  Index [IX_ELMAH_Error_App_Time_Seq]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND name = N'IX_ELMAH_Error_App_Time_Seq')
DROP INDEX [IX_ELMAH_Error_App_Time_Seq] ON [dbo].[ELMAH_Error]
GO
/****** Object:  Index [PK_ELMAH_Error]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND name = N'PK_ELMAH_Error')
ALTER TABLE [dbo].[ELMAH_Error] DROP CONSTRAINT [PK_ELMAH_Error]
GO
/****** Object:  Index [UserNameIndex]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND name = N'UserNameIndex')
DROP INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_UserId]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_UserId')
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_RoleId')
DROP INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_UserId]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND name = N'IX_UserId')
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
GO
/****** Object:  Index [IX_UserId]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND name = N'IX_UserId')
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND name = N'RoleNameIndex')
DROP INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[spa_time]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spa_time]') AND type in (N'U'))
DROP TABLE [dbo].[spa_time]
GO
/****** Object:  Table [dbo].[spa_prices]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spa_prices]') AND type in (N'U'))
DROP TABLE [dbo].[spa_prices]
GO
/****** Object:  Table [dbo].[spa_images]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spa_images]') AND type in (N'U'))
DROP TABLE [dbo].[spa_images]
GO
/****** Object:  Table [dbo].[spa_basic_info]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spa_basic_info]') AND type in (N'U'))
DROP TABLE [dbo].[spa_basic_info]
GO
/****** Object:  Table [dbo].[price_range]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[price_range]') AND type in (N'U'))
DROP TABLE [dbo].[price_range]
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND type in (N'U'))
DROP TABLE [dbo].[ELMAH_Error]
GO
/****** Object:  Table [dbo].[citys]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[citys]') AND type in (N'U'))
DROP TABLE [dbo].[citys]
GO
/****** Object:  Table [dbo].[CategeogySubCategory]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategeogySubCategory]') AND type in (N'U'))
DROP TABLE [dbo].[CategeogySubCategory]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
USE [master]
GO
/****** Object:  Database [spa_db]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'spa_db')
DROP DATABASE [spa_db]
GO
/****** Object:  Database [spa_db]    Script Date: 31-07-2017 AM 12:47:36 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'spa_db')
BEGIN
CREATE DATABASE [spa_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'spa_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\spa_db.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'spa_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\spa_db_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [spa_db] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [spa_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [spa_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [spa_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [spa_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [spa_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [spa_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [spa_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [spa_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [spa_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [spa_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [spa_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [spa_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [spa_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [spa_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [spa_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [spa_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [spa_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [spa_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [spa_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [spa_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [spa_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [spa_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [spa_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [spa_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [spa_db] SET  MULTI_USER 
GO
ALTER DATABASE [spa_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [spa_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [spa_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [spa_db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [spa_db]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 31-07-2017 AM 12:47:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CategeogySubCategory]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategeogySubCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CategeogySubCategory](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[parentId] [bigint] NULL,
	[name] [varchar](500) NOT NULL,
	[subheading] [varchar](500) NULL,
	[description] [varchar](500) NULL,
	[isActive] [bit] NOT NULL CONSTRAINT [DF_CategeogySubCategory_isActive]  DEFAULT ((0)),
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_CategeogySubCategory_created_at]  DEFAULT (getdate()),
	[updated_at] [datetime] NOT NULL CONSTRAINT [DF_CategeogySubCategory_updated_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_CategeogySubCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[citys]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[citys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[citys](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[zipcode] [varchar](20) NULL,
	[description] [varchar](500) NULL,
	[isActive] [bit] NOT NULL CONSTRAINT [DF_citys_isActive]  DEFAULT ((0)),
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_citys_created_at]  DEFAULT (getdate()),
	[updated_at] [datetime] NOT NULL CONSTRAINT [DF_citys_updated_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_citys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ELMAH_Error](
	[ErrorId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ELMAH_Error_ErrorId]  DEFAULT (newid()),
	[Application] [nvarchar](60) NOT NULL,
	[Host] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Source] [nvarchar](60) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[TimeUtc] [datetime] NOT NULL,
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[AllXml] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[price_range]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[price_range]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[price_range](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price_range_name] [varchar](500) NULL,
	[min_price] [numeric](18, 0) NULL,
	[max_price] [numeric](18, 0) NULL,
	[description] [varchar](1000) NULL,
	[isActive] [bit] NOT NULL CONSTRAINT [DF_price_range_isActive]  DEFAULT ((0)),
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_price_range_created_at]  DEFAULT (getdate()),
	[update_at] [datetime] NOT NULL CONSTRAINT [DF_price_range_update_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_price_range] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[spa_basic_info]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spa_basic_info]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[spa_basic_info](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NOT NULL,
	[cityId] [bigint] NULL,
	[info_about] [varchar](max) NULL,
	[website_url] [varchar](500) NULL,
	[address] [varchar](2000) NULL,
	[contact_name] [varchar](100) NULL,
	[contact_email] [varchar](500) NULL,
	[contact_no] [varchar](100) NULL,
	[is_active] [bit] NOT NULL CONSTRAINT [DF_spa_basic_info_is_active]  DEFAULT ((0)),
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_spa_basic_info_created_at]  DEFAULT (getdate()),
	[updated_at] [datetime] NOT NULL CONSTRAINT [DF_spa_basic_info_updated_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_spa_basic_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[spa_images]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spa_images]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[spa_images](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[spa_id] [bigint] NOT NULL,
	[image_url] [varchar](max) NOT NULL,
	[seq_no] [int] NULL,
	[is_default] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_spa_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[spa_prices]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spa_prices]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[spa_prices](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[spa_id] [bigint] NOT NULL,
	[cat_id] [bigint] NOT NULL,
	[price] [varchar](100) NULL,
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_spa_prices_created_at]  DEFAULT (getdate()),
	[updated_at] [datetime] NOT NULL CONSTRAINT [DF_spa_prices_updated_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_spa_prices] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[spa_time]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spa_time]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[spa_time](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[spa_id] [bigint] NOT NULL,
	[week_day] [varchar](100) NOT NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[frm_to_times] [varchar](200) NULL,
	[isclosed] [bit] NOT NULL CONSTRAINT [DF_spa_time_isclosed]  DEFAULT ((0)),
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_spa_time_created_at]  DEFAULT (getdate()),
	[updated_at] [datetime] NOT NULL CONSTRAINT [DF_spa_time_updated_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_spa_time] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201707161848320_InitialCreate', N'code.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EDC36107D2FD07F10F4D416CECA9726488DDD04CEDA6E8DC617649DA06F0157E2AE8548942A518E8DA25FD6877E527FA14389BAF1A2CBAEBCBB0E0A1459717866381C92C3D191FFFBE7DFF1DB07DF33EE7114BB01999807A37DD3C0C40E1C972C276642172F5E9B6FDF7CFFDDF8CCF11F8C4FB9DC1193839E249E98779486C79615DB77D847F1C877ED288883051DD9816F2127B00EF7F77FB10E0E2C0C10266019C6F84342A8EBE3F407FC9C06C4C6214D90771938D88BF9736899A5A8C615F2711C221B4F4CB00D8F3231D338F15C0426CCB0B7300D4448401105038F3FC67846A3802C67213C40DEED6388416E81BC1873C38F4BF1AE63D83F6463B0CA8E39949DC434F07B021E1C71A75862F7955C6B164E03B79D817BE9231B75EABA8979E1E0F4D187C00307880A8FA75EC48427E665A1E2240EAF301DE51D4719E47904705F83E8CBA88AB86774EEB75704D1E1689FFDB7674C138F26119E109CD008797BC64D32F75CFB77FC781B7CC1647274305F1CBD7EF90A3947AF7EC6472FAB2385B1825CED013CBA89821047601B5E14E3370DABDECF123B16DD2A7D32AF402CC17A308D4BF4F01E9325BD839572F8DA34CEDD07ECE44F78707D242E0BD18949A3047E5E259E87E61E2EDAAD469DECFF0D5A0F5FBE1A44EB15BA7797E9D40BFA61E144B0AE3E602F6D8DEFDC305B5EB5F9FECCC5CEA3C067BFEBF195B57E9E054964B3C1045A915B142D31AD5B37B6CAE0ED14D20C6AF8B0CE51773FB499A572782B45D980565909B98A4DAF86DCDEA7D5DB39E24EC210262F0D2DE691A680AB9C5223A1DB9EC11ACB6039E81A2C0406F12DEF7D673E72BD0136BF0E5A20E158B8918F8B51BE0B20D410E96DF30D8A6358FBCE6F28BE6B301DFE3980E9336C271184E48C223F7C726D377701C157893F6791BE395D834DCDEDD7E01CD93488CE08EBB536DEFBC0FE1224F48C38A788E28FD4CE01D9CF5BD7EF0E30883927B68DE3F81C82193BD300F2E91CF082D0A3C3DE706C67DA76F231F590EBABB30F610FFD9C8B9619885A42CA423462AA4CA4C9D4F7C1D225DD4CCD45F5A66612ADA672B1BEA632B06E967249BDA1A940AB9D99D460B95D3A43C3277729ECEE6777EB1DDEBABDA0E2C619EC90F8574C7004DB98738328C5112967A0CBBEB18D64219D3EA6F4C9CFA654D327E42543AB5A6935A49BC0F0AB2185DDFDD5909A098FEF5D8765251DAE3CB930C0779257DFA6DAD79C60D9A697436D989B56BE993D40B75C4EE238B0DD7415288A5DBC5451B71F7238A3BD6E918D46AC7DC0C020D05D76E4C113189B2906D53539C51EA6D838B1B362E014C536726437C2809C1E86E527AAC2B0B2065237EE274927443A8E5827C42E4131AC5497507959B8C47643E4B57A49E8D9F10863632F74882DA738C484296CF54417E5EA920733A0D0234C4A9B87C65625E29A035193B5EAE6BC2D852DE75DAA446C24265B72674D5CF2FCED4902B3D9631B08CE66977431405BBEDB4680F2BB4AD700102F2EBB16A0C28D4913A03CA5DA4880D63DB68500ADBBE4D905687645ED3AFFC27D75D7C2B37E51DEFCB1DEE8AE2DC466CD1F3B169A59EE097D28F4C0911C9EA773D6881FA8E2720676F2FB59CC535D314418F80CD37AC9A6CC779579A8D50C220651136019682DA0FCC59F04242DA81EC6E5B5BC46EB7816D10336AFBB35C2F2BD5F80ADC4808C5D7D015A11D4BF261583B3D3EDA31859110D529077BA2C54701401216E5EF58177708AAE2E2B3BA64B2EDC271BAE0C8C4F4683835A32578D93F2C10CEEA53C34DBBDA44AC8FAA4646B7949489F345ECA0733B897788CB63B499114F4480BD67251FD081F68B1E5958EE2B429DAC6564688E20FC696863935BE4461E892658549C59F18B38C46357D31EB4F33F2330CCB8E156CA3C2DA42130D22B4C4422BA8064BCFDD28A6A788A23962759EA9E34B62CAB355B3FDE72AABC7A73C89F939904BB37F673DAAAFEB6B87AC9C85F0CEE730349FA53269FD5C31F1EAEE06A3B4210F458A92FD34F0129FE8332B7DEFECC55DB57FF64446185B82FD52E624B949CA6FEB3EEF3423F26A5877768A8C65F519D243E8FC9CE79B554FEB72503D4A5E92AAA2E8CA545B9B315DEAD26D96C474B0FF24B5223CCD4AE21C942A007FD413A3426390C02A6DDD51EB4C932A66BDA53BA24027A9420A4D3DACAC92466A46561B56C2D378542DD15D834C13A9A2CBADDD911584912AB4A279056C85CD625B775405A7A40AAC68EE8E5D124CC4DD7387CF2AED25A5FF61955D60D73BAD34184FB3150E73D855DED357812A8F7B62F137F112187FBE9361A4BDC5F50FA3AC60B15E186930F47B4DEDD5767DAB697C1FAFC7ACBDAFAE6DE74DEFEBF578FD82F5494342BABD892285F6E21627DCD6C6FCE6D4FE318C7495CA444C2377231CE58F31C5FE88098C667F7A53CFC56CE3CE052E11711738A61947C3849BDE6BE1B39ADDF9C4C58A63C753DC3C75DFB9D4E76C03742B728F22FB0E4532F9618DCF404A50A9AE7C411CFC3031FF4A7B1DA7250AF6AFF4F19E71117F24EE9F0934DC460936FE96C99CC3D0E29BEF533BFA114377AF5EFCF139EBBA675C47B0628E8D7DC197ABCC70FDD3865ED6645DD7B066E50F1E9EEF82AA7D5BA0441516C4EA9F12CC5D3AC86704B9953FF8E8E1C7BEA6293F15580B51F139C0507883B85047F75F054B4BF577E0274DA9FEFD06ABA6FEAF629A96F6EF92FE6022E9BFFB3694F7DCE251A3B80C6D624B4AFDDC4A9A5E8B41B9EDB349E256AFB5D065FE740FB83538D22B44C633A3170F763A2AD8C383616F33B49F9C32BC2B2CE192BFB15D72F026F9C00D6F80BE291AF00E10D714449CED937D371D6BBA02EE8E3326FB517A772CD8383D6BFBC4DD4D079BAECCBBE3C1D68B9EBB63B1B6ADF373CB91D6F908DD3AD956E60D695EC4A86AC16D64DAAC700E37FC790041906594D937906AF65613F3B4456129A257AAA78D898AA58523E995249AD5F61B2B3FF01B07CB659AD56AC8964DBAF9FEDFA89BCB34EBD65018B7410356920855D4EC967DAC89EFF49C68BFB591B4B0CCDB72D6C6B7EACF89E53B88536AAB47F38EF8F9907A0771C9904BA70789577EDD0B6767E52F24C2F91DBBCB1282FDBD4482EDDAA959C85C9045901FDE8245B98850A1B9C4143970A49E44D45D209B4233AB31A71F71A7753BF6A6638E9D0B729DD030A13064ECCFBD5AC18B25014DFA53A672DDE6F17598FE3D9221860066BAAC367F4DDE25AEE714769F2B6A421A08965DF08A2E9B4BCA2ABBCBC702E92A201D81B8FB8AA4E816FBA10760F13599A17BBC8A6D107EEFF112D98F65055007D23E1175B78F4F5DB48C901F738CB23FFC841876FC8737FF03A54A8CF628540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'SiteUser')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'13198579-cce8-4edc-85cc-25277024c932', N'1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'13198579-cce8-4edc-85cc-25277024c932', N'yagneshdxt@gmail.com', 0, N'AAXQaP78k4WkLs5pTEUl5YcWM74nrUcEIAYBDdb28KK6aTi4WE4emyLK8DZfxHvtpw==', N'6b691d29-59bd-4bab-8f6b-8d262b61861e', NULL, 0, 0, NULL, 1, 0, N'yagneshdxt@gmail.com')
SET IDENTITY_INSERT [dbo].[CategeogySubCategory] ON 

INSERT [dbo].[CategeogySubCategory] ([id], [parentId], [name], [subheading], [description], [isActive], [created_at], [updated_at]) VALUES (1, NULL, N'Category One', NULL, NULL, 1, CAST(N'2017-07-23 14:56:47.000' AS DateTime), CAST(N'2017-07-23 14:57:00.013' AS DateTime))
INSERT [dbo].[CategeogySubCategory] ([id], [parentId], [name], [subheading], [description], [isActive], [created_at], [updated_at]) VALUES (2, NULL, N'category two', N'asdf ', N'asdf ', 1, CAST(N'2017-07-23 14:57:10.643' AS DateTime), CAST(N'2017-07-23 14:57:10.643' AS DateTime))
INSERT [dbo].[CategeogySubCategory] ([id], [parentId], [name], [subheading], [description], [isActive], [created_at], [updated_at]) VALUES (3, NULL, N'cat 3', N'ads', N'sdg addsfg adf a', 1, CAST(N'2017-07-23 14:57:21.350' AS DateTime), CAST(N'2017-07-23 14:57:21.350' AS DateTime))
INSERT [dbo].[CategeogySubCategory] ([id], [parentId], [name], [subheading], [description], [isActive], [created_at], [updated_at]) VALUES (6, 1, N'menu One', NULL, NULL, 1, CAST(N'2017-07-23 15:14:40.000' AS DateTime), CAST(N'2017-07-23 15:18:57.470' AS DateTime))
INSERT [dbo].[CategeogySubCategory] ([id], [parentId], [name], [subheading], [description], [isActive], [created_at], [updated_at]) VALUES (7, 1, N'menu two', N'asdf', N'asdf', 1, CAST(N'2017-07-24 23:19:23.593' AS DateTime), CAST(N'2017-07-24 23:19:23.593' AS DateTime))
INSERT [dbo].[CategeogySubCategory] ([id], [parentId], [name], [subheading], [description], [isActive], [created_at], [updated_at]) VALUES (8, 1, N'menu three', N'asdf', N'asdf', 1, CAST(N'2017-07-24 23:19:34.007' AS DateTime), CAST(N'2017-07-24 23:19:34.007' AS DateTime))
INSERT [dbo].[CategeogySubCategory] ([id], [parentId], [name], [subheading], [description], [isActive], [created_at], [updated_at]) VALUES (9, 2, N'ca 2 sub 1', N'adf', NULL, 1, CAST(N'2017-07-24 23:19:52.793' AS DateTime), CAST(N'2017-07-24 23:19:52.793' AS DateTime))
INSERT [dbo].[CategeogySubCategory] ([id], [parentId], [name], [subheading], [description], [isActive], [created_at], [updated_at]) VALUES (10, 2, N'cat 2 sub 2', N'as', N'a', 1, CAST(N'2017-07-24 23:20:04.537' AS DateTime), CAST(N'2017-07-24 23:20:04.537' AS DateTime))
INSERT [dbo].[CategeogySubCategory] ([id], [parentId], [name], [subheading], [description], [isActive], [created_at], [updated_at]) VALUES (11, 3, N'cat 3 sub 1', NULL, NULL, 1, CAST(N'2017-07-24 23:20:21.280' AS DateTime), CAST(N'2017-07-24 23:20:21.280' AS DateTime))
INSERT [dbo].[CategeogySubCategory] ([id], [parentId], [name], [subheading], [description], [isActive], [created_at], [updated_at]) VALUES (12, 3, N'cat 3 sub 2', NULL, NULL, 1, CAST(N'2017-07-24 23:20:32.730' AS DateTime), CAST(N'2017-07-24 23:20:32.730' AS DateTime))
SET IDENTITY_INSERT [dbo].[CategeogySubCategory] OFF
SET IDENTITY_INSERT [dbo].[citys] ON 

INSERT [dbo].[citys] ([id], [name], [zipcode], [description], [isActive], [created_at], [updated_at]) VALUES (2, N'Yagnesh', N'420035', N'dasf asdf', 1, CAST(N'2017-07-17 15:52:20.000' AS DateTime), CAST(N'2017-07-17 20:40:01.857' AS DateTime))
INSERT [dbo].[citys] ([id], [name], [zipcode], [description], [isActive], [created_at], [updated_at]) VALUES (3, N'city two', N'50005', N'asdf asdfas df', 1, CAST(N'2017-07-23 14:52:25.000' AS DateTime), CAST(N'2017-07-23 14:52:49.583' AS DateTime))
SET IDENTITY_INSERT [dbo].[citys] OFF
SET IDENTITY_INSERT [dbo].[ELMAH_Error] ON 

INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'bd132874-1c61-44f8-91f7-0200d82a1312', N'spa_db', N'DATAFUSION-PC', N'System.NotSupportedException', N'mscorlib', N'The given path''s format is not supported.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 14:29:32.090' AS DateTime), 1, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.NotSupportedException"
  message="The given path''s format is not supported."
  source="mscorlib"
  detail="System.NotSupportedException: The given path''s format is not supported.&#xD;&#xA;   at System.Security.Permissions.FileIOPermission.EmulateFileIOPermissionChecks(String fullPath)&#xD;&#xA;   at System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)&#xD;&#xA;   at System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share, Int32 bufferSize, FileOptions options, String msgPath, Boolean bFromProxy)&#xD;&#xA;   at System.IO.FileStream..ctor(String path, FileMode mode)&#xD;&#xA;   at System.Web.HttpPostedFile.SaveAs(String filename)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Create(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 96"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T14:29:32.0897358Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:5091&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundaryA56uekSAredxvoBk&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Create&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 5091&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryA56uekSAredxvoBk&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Create&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="5091" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundaryA56uekSAredxvoBk" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Create" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="50698" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="5091" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundaryA56uekSAredxvoBk" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Create" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="Uu5-qD3HN4dBIe4bHlhG9DJoZXYUeUPVYYdpbxgjoFiNOnWayUUI5NLjpHQZcakXbxKNZP2gchfAD3KHI5n9cU3LVdGksQJcv-5wYWkivYuoFqZQcHkcjpz4e47Cb3XLLjd3k2gsmixu4ZBsUzNeWA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="asdfa" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="6" />
    </item>
    <item
      name="Selectedprices[0].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="12" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="7" />
    </item>
    <item
      name="Selectedprices[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="12" />
    </item>
    <item
      name="Selectedprices[2].Id">
      <value
        string="8" />
    </item>
    <item
      name="Selectedprices[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="12" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'505cbfa1-48bc-41e8-b37a-2d5b7750ff92', N'spa_db', N'DATAFUSION-PC', N'System.Web.HttpException', N'System.Web.Mvc', N'The controller for path ''/admin/'' was not found or does not implement IController.', N'yagneshdxt@gmail.com', 404, CAST(N'2017-07-29 14:41:20.317' AS DateTime), 2, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.Web.HttpException"
  message="The controller for path ''/admin/'' was not found or does not implement IController."
  source="System.Web.Mvc"
  detail="System.Web.HttpException (0x80004005): The controller for path ''/admin/'' was not found or does not implement IController.&#xD;&#xA;   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)&#xD;&#xA;   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController&amp; controller, IControllerFactory&amp; factory)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T14:41:20.3152439Z"
  statusCode="404">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g&#xD;&#xA;Host: localhost:82&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/admin/" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\admin\" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="51059" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/admin/" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/admin/" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'0b41ed55-9ff9-453e-a07a-27d35c6e43f0', N'spa_db', N'DATAFUSION-PC', N'System.Web.HttpException', N'System.Web.Mvc', N'The controller for path ''/admin/index'' was not found or does not implement IController.', N'yagneshdxt@gmail.com', 404, CAST(N'2017-07-29 14:41:47.590' AS DateTime), 3, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.Web.HttpException"
  message="The controller for path ''/admin/index'' was not found or does not implement IController."
  source="System.Web.Mvc"
  detail="System.Web.HttpException (0x80004005): The controller for path ''/admin/index'' was not found or does not implement IController.&#xD;&#xA;   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)&#xD;&#xA;   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController&amp; controller, IControllerFactory&amp; factory)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T14:41:47.5908040Z"
  statusCode="404">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g&#xD;&#xA;Host: localhost:82&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/admin/index" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\admin\index" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="51059" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/admin/index" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/admin/index" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'b079eb6f-3e97-49a7-904f-f2d77a86b998', N'spa_db', N'DATAFUSION-PC', N'System.Web.HttpException', N'System.Web.Mvc', N'The controller for path ''/admin/home'' was not found or does not implement IController.', N'yagneshdxt@gmail.com', 404, CAST(N'2017-07-29 14:41:52.653' AS DateTime), 4, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.Web.HttpException"
  message="The controller for path ''/admin/home'' was not found or does not implement IController."
  source="System.Web.Mvc"
  detail="System.Web.HttpException (0x80004005): The controller for path ''/admin/home'' was not found or does not implement IController.&#xD;&#xA;   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)&#xD;&#xA;   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController&amp; controller, IControllerFactory&amp; factory)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T14:41:52.6520935Z"
  statusCode="404">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g&#xD;&#xA;Host: localhost:82&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/admin/home" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\admin\home" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="51059" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/admin/home" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/admin/home" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="IZC0Up2nR-EvaAWN2r68UMajCRQMmtcYNQFuquCG5vwyTPNTmA29nWsNv8cUMfZV4SimogHYNacXjeLNfIlcPSsHVilYjwg1c4MmWuGJFTcJLxKNSUpEWApManY3q_bfI4gpaTpYSHUODYUkhCBXVUHPuSrx_oyrAReUOCpTkPSor2VlkukMeJFnTjai-qFcOYpzlM67ZVJ63mlNWFrlrsOnR8GZSWCzW3q8q-trWs5vLSNRN9fHsVGjsPTTY-lzu7fPD-_-DI0ONVYq6aHnPwn7f5HkzwWAP_gW8h4KFTy36XGPwSKKPt4hKDHruCx-fwrLNcKvT7XU7IR4EvMXEv_PBAA40dsfDUeB7nzCLc3t2ga34WT3v8vu3wSjX1GMof_aTsedTGoAVpf0GyzYeQ8A0FWTRV53tJhx0ZJ_pdKld5p6oILHpQ4yIT2rG5kO53XosIYXPJgyknXK40032EJ8R4w-jqXxffMOvrqDI2HjOiCvJ8lwGuE4wv6iqNp8FITNnWc1exihVypVJWgt3g" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'a6c08c96-469f-4fbb-8298-593caa3a5d2b', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'System.Web.Mvc', N'The view ''Edit'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Areas/Admin/Views/spa/Edit.aspx
~/Areas/Admin/Views/spa/Edit.ascx
~/Areas/Admin/Views/Shared/Edit.aspx
~/Areas/Admin/Views/Shared/Edit.ascx
~/Views/spa/Edit.aspx
~/Views/spa/Edit.ascx
~/Views/Shared/Edit.aspx
~/Views/Shared/Edit.ascx
~/Areas/Admin/Views/spa/Edit.cshtml
~/Areas/Admin/Views/spa/Edit.vbhtml
~/Areas/Admin/Views/Shared/Edit.cshtml
~/Areas', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 15:30:03.320' AS DateTime), 9, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The view ''Edit'' or its master was not found or no view engine supports the searched locations. The following locations were searched:&#xD;&#xA;~/Areas/Admin/Views/spa/Edit.aspx&#xD;&#xA;~/Areas/Admin/Views/spa/Edit.ascx&#xD;&#xA;~/Areas/Admin/Views/Shared/Edit.aspx&#xD;&#xA;~/Areas/Admin/Views/Shared/Edit.ascx&#xD;&#xA;~/Views/spa/Edit.aspx&#xD;&#xA;~/Views/spa/Edit.ascx&#xD;&#xA;~/Views/Shared/Edit.aspx&#xD;&#xA;~/Views/Shared/Edit.ascx&#xD;&#xA;~/Areas/Admin/Views/spa/Edit.cshtml&#xD;&#xA;~/Areas/Admin/Views/spa/Edit.vbhtml&#xD;&#xA;~/Areas/Admin/Views/Shared/Edit.cshtml&#xD;&#xA;~/Areas/Admin/Views/Shared/Edit.vbhtml&#xD;&#xA;~/Views/spa/Edit.cshtml&#xD;&#xA;~/Views/spa/Edit.vbhtml&#xD;&#xA;~/Views/Shared/Edit.cshtml&#xD;&#xA;~/Views/Shared/Edit.vbhtml"
  source="System.Web.Mvc"
  detail="System.InvalidOperationException: The view ''Edit'' or its master was not found or no view engine supports the searched locations. The following locations were searched:&#xD;&#xA;~/Areas/Admin/Views/spa/Edit.aspx&#xD;&#xA;~/Areas/Admin/Views/spa/Edit.ascx&#xD;&#xA;~/Areas/Admin/Views/Shared/Edit.aspx&#xD;&#xA;~/Areas/Admin/Views/Shared/Edit.ascx&#xD;&#xA;~/Views/spa/Edit.aspx&#xD;&#xA;~/Views/spa/Edit.ascx&#xD;&#xA;~/Views/Shared/Edit.aspx&#xD;&#xA;~/Views/Shared/Edit.ascx&#xD;&#xA;~/Areas/Admin/Views/spa/Edit.cshtml&#xD;&#xA;~/Areas/Admin/Views/spa/Edit.vbhtml&#xD;&#xA;~/Areas/Admin/Views/Shared/Edit.cshtml&#xD;&#xA;~/Areas/Admin/Views/Shared/Edit.vbhtml&#xD;&#xA;~/Views/spa/Edit.cshtml&#xD;&#xA;~/Views/spa/Edit.vbhtml&#xD;&#xA;~/Views/Shared/Edit.cshtml&#xD;&#xA;~/Views/Shared/Edit.vbhtml&#xD;&#xA;   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T15:30:03.3184302Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=dhOajXVHGEDl-2Nk2bK_u9RkXj23AlTA2K2_Lgc7kXwywgQXCdHWP_9mJ23rVuB1xcGNyDv6ESFM4DKwaLr-Wltk3fcNi8e_XpACCwujmzaiUxbTPmBYv5OEvjxTysMpzG24uW2B-QZHxAaqYtUthB78vcOZnbf8jbDgf6xR1vF0WqrCZXXPX94H3wcx3V4G3GhI1Na-ZKcTF_0VSLOIu8p6egD_DjIS7dOQ4BMuGmXTBWVUCaI73iaKSKJNvmkX9pV0QYu_tKqEpTPazLwgBK_V0xX_-lcMXKZBGe48_-UmZSMKOArJrfzWg0X4JgAt0Q07wWZtcG2enQ18kbICMfYXwkWTa1mFdXVbSWwSM23E-mqSbMZfwNQTpIoesYgRXgkJ0ZUbjoJqiB39XlYPiarFOW1cQsDrWPTMCwGW0Ztt70XaQVIsCGG3ZOXSK9L3wGxAG5kdzIfGO5Bc-vmvGzLKw2L3lekxzgfZEaaZGW3gypBdJk9CAboeFfuga2HW3TPFgTaXzG3Aw1w-Ril8Tg&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=dhOajXVHGEDl-2Nk2bK_u9RkXj23AlTA2K2_Lgc7kXwywgQXCdHWP_9mJ23rVuB1xcGNyDv6ESFM4DKwaLr-Wltk3fcNi8e_XpACCwujmzaiUxbTPmBYv5OEvjxTysMpzG24uW2B-QZHxAaqYtUthB78vcOZnbf8jbDgf6xR1vF0WqrCZXXPX94H3wcx3V4G3GhI1Na-ZKcTF_0VSLOIu8p6egD_DjIS7dOQ4BMuGmXTBWVUCaI73iaKSKJNvmkX9pV0QYu_tKqEpTPazLwgBK_V0xX_-lcMXKZBGe48_-UmZSMKOArJrfzWg0X4JgAt0Q07wWZtcG2enQ18kbICMfYXwkWTa1mFdXVbSWwSM23E-mqSbMZfwNQTpIoesYgRXgkJ0ZUbjoJqiB39XlYPiarFOW1cQsDrWPTMCwGW0Ztt70XaQVIsCGG3ZOXSK9L3wGxAG5kdzIfGO5Bc-vmvGzLKw2L3lekxzgfZEaaZGW3gypBdJk9CAboeFfuga2HW3TPFgTaXzG3Aw1w-Ril8Tg&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="52158" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=dhOajXVHGEDl-2Nk2bK_u9RkXj23AlTA2K2_Lgc7kXwywgQXCdHWP_9mJ23rVuB1xcGNyDv6ESFM4DKwaLr-Wltk3fcNi8e_XpACCwujmzaiUxbTPmBYv5OEvjxTysMpzG24uW2B-QZHxAaqYtUthB78vcOZnbf8jbDgf6xR1vF0WqrCZXXPX94H3wcx3V4G3GhI1Na-ZKcTF_0VSLOIu8p6egD_DjIS7dOQ4BMuGmXTBWVUCaI73iaKSKJNvmkX9pV0QYu_tKqEpTPazLwgBK_V0xX_-lcMXKZBGe48_-UmZSMKOArJrfzWg0X4JgAt0Q07wWZtcG2enQ18kbICMfYXwkWTa1mFdXVbSWwSM23E-mqSbMZfwNQTpIoesYgRXgkJ0ZUbjoJqiB39XlYPiarFOW1cQsDrWPTMCwGW0Ztt70XaQVIsCGG3ZOXSK9L3wGxAG5kdzIfGO5Bc-vmvGzLKw2L3lekxzgfZEaaZGW3gypBdJk9CAboeFfuga2HW3TPFgTaXzG3Aw1w-Ril8Tg" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="dhOajXVHGEDl-2Nk2bK_u9RkXj23AlTA2K2_Lgc7kXwywgQXCdHWP_9mJ23rVuB1xcGNyDv6ESFM4DKwaLr-Wltk3fcNi8e_XpACCwujmzaiUxbTPmBYv5OEvjxTysMpzG24uW2B-QZHxAaqYtUthB78vcOZnbf8jbDgf6xR1vF0WqrCZXXPX94H3wcx3V4G3GhI1Na-ZKcTF_0VSLOIu8p6egD_DjIS7dOQ4BMuGmXTBWVUCaI73iaKSKJNvmkX9pV0QYu_tKqEpTPazLwgBK_V0xX_-lcMXKZBGe48_-UmZSMKOArJrfzWg0X4JgAt0Q07wWZtcG2enQ18kbICMfYXwkWTa1mFdXVbSWwSM23E-mqSbMZfwNQTpIoesYgRXgkJ0ZUbjoJqiB39XlYPiarFOW1cQsDrWPTMCwGW0Ztt70XaQVIsCGG3ZOXSK9L3wGxAG5kdzIfGO5Bc-vmvGzLKw2L3lekxzgfZEaaZGW3gypBdJk9CAboeFfuga2HW3TPFgTaXzG3Aw1w-Ril8Tg" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'd01d49ad-1d17-4312-9ad7-2380c6a0490b', N'spa_db', N'DATAFUSION-PC', N'System.NullReferenceException', N'App_Web_pnewdxir', N'Object reference not set to an instance of an object.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 16:16:02.713' AS DateTime), 10, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.NullReferenceException"
  message="Object reference not set to an instance of an object."
  source="App_Web_pnewdxir"
  detail="System.NullReferenceException: Object reference not set to an instance of an object.&#xD;&#xA;   at ASP._Page_Areas_Admin_Views_spa_Create_cshtml.Execute() in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Views\spa\Create.cshtml:line 61&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.StartPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T16:16:02.7132585Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=4cX5FWZkZkOmJlE_aUXu_BKKngmsdOgTN_TkorvXVcZ_Qwer0rRh8XtLBivlzVSR7RdQpVdJhSJJ4VhHzUuPxXzW8imW3BJkG9jgcwonUBwE5bKEsdOll0JQyM1Yof78N1L6T0THeGzbuOZbBAoWinSoIom_3d5aROLfO8v1FXx-hmgzUJu47zcIxBbTxX7E4JO2yFbwyTUX_Egs0dAReWhLvacjdof9Iq31zEk8mHFNllfM-GIHykO8Ge5VINOK558ANnPY__-ge-GV8uNc8VO8XpAVP4-f23ezM41kSg99GIye_J1YB_f3a9XZdvM0ZCeYv02L-IMua2EV-CKS_UJD0bsezxvPpsuJA4LYn2lVkSar0s_ht4El96aLSQTCK-b6AlUxA70it6HmqpnDNcye75pcg5XRCEw3MqnR3ibH_YI1suUaYm0hZy1UiwVO9gb4mQC_UhDDfQMgoDMm04xHLVeL89tlPnar4a11lTtcckvpBYsCt-FtCinWPiB_74gmkBZQZ4DlB9F3r6k73g&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=4cX5FWZkZkOmJlE_aUXu_BKKngmsdOgTN_TkorvXVcZ_Qwer0rRh8XtLBivlzVSR7RdQpVdJhSJJ4VhHzUuPxXzW8imW3BJkG9jgcwonUBwE5bKEsdOll0JQyM1Yof78N1L6T0THeGzbuOZbBAoWinSoIom_3d5aROLfO8v1FXx-hmgzUJu47zcIxBbTxX7E4JO2yFbwyTUX_Egs0dAReWhLvacjdof9Iq31zEk8mHFNllfM-GIHykO8Ge5VINOK558ANnPY__-ge-GV8uNc8VO8XpAVP4-f23ezM41kSg99GIye_J1YB_f3a9XZdvM0ZCeYv02L-IMua2EV-CKS_UJD0bsezxvPpsuJA4LYn2lVkSar0s_ht4El96aLSQTCK-b6AlUxA70it6HmqpnDNcye75pcg5XRCEw3MqnR3ibH_YI1suUaYm0hZy1UiwVO9gb4mQC_UhDDfQMgoDMm04xHLVeL89tlPnar4a11lTtcckvpBYsCt-FtCinWPiB_74gmkBZQZ4DlB9F3r6k73g&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Create" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="52267" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=4cX5FWZkZkOmJlE_aUXu_BKKngmsdOgTN_TkorvXVcZ_Qwer0rRh8XtLBivlzVSR7RdQpVdJhSJJ4VhHzUuPxXzW8imW3BJkG9jgcwonUBwE5bKEsdOll0JQyM1Yof78N1L6T0THeGzbuOZbBAoWinSoIom_3d5aROLfO8v1FXx-hmgzUJu47zcIxBbTxX7E4JO2yFbwyTUX_Egs0dAReWhLvacjdof9Iq31zEk8mHFNllfM-GIHykO8Ge5VINOK558ANnPY__-ge-GV8uNc8VO8XpAVP4-f23ezM41kSg99GIye_J1YB_f3a9XZdvM0ZCeYv02L-IMua2EV-CKS_UJD0bsezxvPpsuJA4LYn2lVkSar0s_ht4El96aLSQTCK-b6AlUxA70it6HmqpnDNcye75pcg5XRCEw3MqnR3ibH_YI1suUaYm0hZy1UiwVO9gb4mQC_UhDDfQMgoDMm04xHLVeL89tlPnar4a11lTtcckvpBYsCt-FtCinWPiB_74gmkBZQZ4DlB9F3r6k73g" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="4cX5FWZkZkOmJlE_aUXu_BKKngmsdOgTN_TkorvXVcZ_Qwer0rRh8XtLBivlzVSR7RdQpVdJhSJJ4VhHzUuPxXzW8imW3BJkG9jgcwonUBwE5bKEsdOll0JQyM1Yof78N1L6T0THeGzbuOZbBAoWinSoIom_3d5aROLfO8v1FXx-hmgzUJu47zcIxBbTxX7E4JO2yFbwyTUX_Egs0dAReWhLvacjdof9Iq31zEk8mHFNllfM-GIHykO8Ge5VINOK558ANnPY__-ge-GV8uNc8VO8XpAVP4-f23ezM41kSg99GIye_J1YB_f3a9XZdvM0ZCeYv02L-IMua2EV-CKS_UJD0bsezxvPpsuJA4LYn2lVkSar0s_ht4El96aLSQTCK-b6AlUxA70it6HmqpnDNcye75pcg5XRCEw3MqnR3ibH_YI1suUaYm0hZy1UiwVO9gb4mQC_UhDDfQMgoDMm04xHLVeL89tlPnar4a11lTtcckvpBYsCt-FtCinWPiB_74gmkBZQZ4DlB9F3r6k73g" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'fbd1fa8c-244e-408d-bc8e-3fbd67550bd3', N'spa_db', N'DATAFUSION-PC', N'System.NullReferenceException', N'code', N'Object reference not set to an instance of an object.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 17:13:52.063' AS DateTime), 11, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.NullReferenceException"
  message="Object reference not set to an instance of an object."
  source="code"
  detail="System.NullReferenceException: Object reference not set to an instance of an object.&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.&lt;&gt;c.&lt;getSpaVMFromSpaBasicInfo&gt;b__10_0(spa_prices x) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 178&#xD;&#xA;   at System.Linq.Enumerable.WhereSelectListIterator`2.MoveNext()&#xD;&#xA;   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)&#xD;&#xA;   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.getSpaVMFromSpaBasicInfo(Int64 spaId) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 178&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(Int64 id) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 122&#xD;&#xA;   at lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;BeginInvokeSynchronousActionMethod&gt;b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3d()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;&gt;c__DisplayClass46.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3f()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;&gt;c__DisplayClass2b.&lt;BeginInvokeAction&gt;b__1c()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T17:13:52.0626940Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=g0pZ0zWL9jn3QMFlNZRTiVxF7SjSRdaa8vgrkarn1QshL2tTciORFH1cKuyej8eJPzBTHteih_GPfU7KqF2mvwG0bevjDot_fihtJv3JhVgQ_NYQIVY1K7LtUpfNOxHSadaF2xsidsq1_o6INkaAljIsIChyj8g1dws_L2Nr71LAqckH7kQTDmzZJ4BeoRLyXWTYFRcAkNgaUYRbaFlSC42LNf1qxDTh_TUehsIWY6soGls2UWR9MeEwUaIAMWaZEcpzpWHrs2PkjSPdrZwjxY3df911VueGtEKNo59yy-lZIJfCHq8HDcDhOr07WjxbTylYRATg04cHoEx-AX3XoS8eA_bVLUpNrXhawm3uky6BtGkUAjZjqslb1jcoyWScqopzSwHCh0AYyEYhnoX__0j36NfoUo-mqfSTpGdJhgIYEPZqEoDU2KXUfVgSkKA3L3LNtMbRZTCaGRU-yslu_u1RwgIM8fA1SrVh1m4KOnxk5437Ro7BPmhQDJ7_lzG_1UOCe2wLcLVluZE0NaWOAg&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=g0pZ0zWL9jn3QMFlNZRTiVxF7SjSRdaa8vgrkarn1QshL2tTciORFH1cKuyej8eJPzBTHteih_GPfU7KqF2mvwG0bevjDot_fihtJv3JhVgQ_NYQIVY1K7LtUpfNOxHSadaF2xsidsq1_o6INkaAljIsIChyj8g1dws_L2Nr71LAqckH7kQTDmzZJ4BeoRLyXWTYFRcAkNgaUYRbaFlSC42LNf1qxDTh_TUehsIWY6soGls2UWR9MeEwUaIAMWaZEcpzpWHrs2PkjSPdrZwjxY3df911VueGtEKNo59yy-lZIJfCHq8HDcDhOr07WjxbTylYRATg04cHoEx-AX3XoS8eA_bVLUpNrXhawm3uky6BtGkUAjZjqslb1jcoyWScqopzSwHCh0AYyEYhnoX__0j36NfoUo-mqfSTpGdJhgIYEPZqEoDU2KXUfVgSkKA3L3LNtMbRZTCaGRU-yslu_u1RwgIM8fA1SrVh1m4KOnxk5437Ro7BPmhQDJ7_lzG_1UOCe2wLcLVluZE0NaWOAg&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="62586" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=g0pZ0zWL9jn3QMFlNZRTiVxF7SjSRdaa8vgrkarn1QshL2tTciORFH1cKuyej8eJPzBTHteih_GPfU7KqF2mvwG0bevjDot_fihtJv3JhVgQ_NYQIVY1K7LtUpfNOxHSadaF2xsidsq1_o6INkaAljIsIChyj8g1dws_L2Nr71LAqckH7kQTDmzZJ4BeoRLyXWTYFRcAkNgaUYRbaFlSC42LNf1qxDTh_TUehsIWY6soGls2UWR9MeEwUaIAMWaZEcpzpWHrs2PkjSPdrZwjxY3df911VueGtEKNo59yy-lZIJfCHq8HDcDhOr07WjxbTylYRATg04cHoEx-AX3XoS8eA_bVLUpNrXhawm3uky6BtGkUAjZjqslb1jcoyWScqopzSwHCh0AYyEYhnoX__0j36NfoUo-mqfSTpGdJhgIYEPZqEoDU2KXUfVgSkKA3L3LNtMbRZTCaGRU-yslu_u1RwgIM8fA1SrVh1m4KOnxk5437Ro7BPmhQDJ7_lzG_1UOCe2wLcLVluZE0NaWOAg" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="g0pZ0zWL9jn3QMFlNZRTiVxF7SjSRdaa8vgrkarn1QshL2tTciORFH1cKuyej8eJPzBTHteih_GPfU7KqF2mvwG0bevjDot_fihtJv3JhVgQ_NYQIVY1K7LtUpfNOxHSadaF2xsidsq1_o6INkaAljIsIChyj8g1dws_L2Nr71LAqckH7kQTDmzZJ4BeoRLyXWTYFRcAkNgaUYRbaFlSC42LNf1qxDTh_TUehsIWY6soGls2UWR9MeEwUaIAMWaZEcpzpWHrs2PkjSPdrZwjxY3df911VueGtEKNo59yy-lZIJfCHq8HDcDhOr07WjxbTylYRATg04cHoEx-AX3XoS8eA_bVLUpNrXhawm3uky6BtGkUAjZjqslb1jcoyWScqopzSwHCh0AYyEYhnoX__0j36NfoUo-mqfSTpGdJhgIYEPZqEoDU2KXUfVgSkKA3L3LNtMbRZTCaGRU-yslu_u1RwgIM8fA1SrVh1m4KOnxk5437Ro7BPmhQDJ7_lzG_1UOCe2wLcLVluZE0NaWOAg" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'b46bda77-9b4b-406b-8583-61f7124e25bd', N'spa_db', N'DATAFUSION-PC', N'System.NullReferenceException', N'code', N'Object reference not set to an instance of an object.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 17:15:42.860' AS DateTime), 12, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.NullReferenceException"
  message="Object reference not set to an instance of an object."
  source="code"
  detail="System.NullReferenceException: Object reference not set to an instance of an object.&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.&lt;&gt;c.&lt;getSpaVMFromSpaBasicInfo&gt;b__10_0(spa_prices x) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 178&#xD;&#xA;   at System.Linq.Enumerable.WhereSelectListIterator`2.MoveNext()&#xD;&#xA;   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)&#xD;&#xA;   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.getSpaVMFromSpaBasicInfo(Int64 spaId) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 178&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(Int64 id) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 122&#xD;&#xA;   at lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;BeginInvokeSynchronousActionMethod&gt;b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3d()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;&gt;c__DisplayClass46.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3f()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;&gt;c__DisplayClass2b.&lt;BeginInvokeAction&gt;b__1c()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T17:15:42.8590311Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=g0pZ0zWL9jn3QMFlNZRTiVxF7SjSRdaa8vgrkarn1QshL2tTciORFH1cKuyej8eJPzBTHteih_GPfU7KqF2mvwG0bevjDot_fihtJv3JhVgQ_NYQIVY1K7LtUpfNOxHSadaF2xsidsq1_o6INkaAljIsIChyj8g1dws_L2Nr71LAqckH7kQTDmzZJ4BeoRLyXWTYFRcAkNgaUYRbaFlSC42LNf1qxDTh_TUehsIWY6soGls2UWR9MeEwUaIAMWaZEcpzpWHrs2PkjSPdrZwjxY3df911VueGtEKNo59yy-lZIJfCHq8HDcDhOr07WjxbTylYRATg04cHoEx-AX3XoS8eA_bVLUpNrXhawm3uky6BtGkUAjZjqslb1jcoyWScqopzSwHCh0AYyEYhnoX__0j36NfoUo-mqfSTpGdJhgIYEPZqEoDU2KXUfVgSkKA3L3LNtMbRZTCaGRU-yslu_u1RwgIM8fA1SrVh1m4KOnxk5437Ro7BPmhQDJ7_lzG_1UOCe2wLcLVluZE0NaWOAg&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=g0pZ0zWL9jn3QMFlNZRTiVxF7SjSRdaa8vgrkarn1QshL2tTciORFH1cKuyej8eJPzBTHteih_GPfU7KqF2mvwG0bevjDot_fihtJv3JhVgQ_NYQIVY1K7LtUpfNOxHSadaF2xsidsq1_o6INkaAljIsIChyj8g1dws_L2Nr71LAqckH7kQTDmzZJ4BeoRLyXWTYFRcAkNgaUYRbaFlSC42LNf1qxDTh_TUehsIWY6soGls2UWR9MeEwUaIAMWaZEcpzpWHrs2PkjSPdrZwjxY3df911VueGtEKNo59yy-lZIJfCHq8HDcDhOr07WjxbTylYRATg04cHoEx-AX3XoS8eA_bVLUpNrXhawm3uky6BtGkUAjZjqslb1jcoyWScqopzSwHCh0AYyEYhnoX__0j36NfoUo-mqfSTpGdJhgIYEPZqEoDU2KXUfVgSkKA3L3LNtMbRZTCaGRU-yslu_u1RwgIM8fA1SrVh1m4KOnxk5437Ro7BPmhQDJ7_lzG_1UOCe2wLcLVluZE0NaWOAg&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="62586" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=g0pZ0zWL9jn3QMFlNZRTiVxF7SjSRdaa8vgrkarn1QshL2tTciORFH1cKuyej8eJPzBTHteih_GPfU7KqF2mvwG0bevjDot_fihtJv3JhVgQ_NYQIVY1K7LtUpfNOxHSadaF2xsidsq1_o6INkaAljIsIChyj8g1dws_L2Nr71LAqckH7kQTDmzZJ4BeoRLyXWTYFRcAkNgaUYRbaFlSC42LNf1qxDTh_TUehsIWY6soGls2UWR9MeEwUaIAMWaZEcpzpWHrs2PkjSPdrZwjxY3df911VueGtEKNo59yy-lZIJfCHq8HDcDhOr07WjxbTylYRATg04cHoEx-AX3XoS8eA_bVLUpNrXhawm3uky6BtGkUAjZjqslb1jcoyWScqopzSwHCh0AYyEYhnoX__0j36NfoUo-mqfSTpGdJhgIYEPZqEoDU2KXUfVgSkKA3L3LNtMbRZTCaGRU-yslu_u1RwgIM8fA1SrVh1m4KOnxk5437Ro7BPmhQDJ7_lzG_1UOCe2wLcLVluZE0NaWOAg" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="g0pZ0zWL9jn3QMFlNZRTiVxF7SjSRdaa8vgrkarn1QshL2tTciORFH1cKuyej8eJPzBTHteih_GPfU7KqF2mvwG0bevjDot_fihtJv3JhVgQ_NYQIVY1K7LtUpfNOxHSadaF2xsidsq1_o6INkaAljIsIChyj8g1dws_L2Nr71LAqckH7kQTDmzZJ4BeoRLyXWTYFRcAkNgaUYRbaFlSC42LNf1qxDTh_TUehsIWY6soGls2UWR9MeEwUaIAMWaZEcpzpWHrs2PkjSPdrZwjxY3df911VueGtEKNo59yy-lZIJfCHq8HDcDhOr07WjxbTylYRATg04cHoEx-AX3XoS8eA_bVLUpNrXhawm3uky6BtGkUAjZjqslb1jcoyWScqopzSwHCh0AYyEYhnoX__0j36NfoUo-mqfSTpGdJhgIYEPZqEoDU2KXUfVgSkKA3L3LNtMbRZTCaGRU-yslu_u1RwgIM8fA1SrVh1m4KOnxk5437Ro7BPmhQDJ7_lzG_1UOCe2wLcLVluZE0NaWOAg" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'b6f81164-4b21-4d09-bf95-a865bfd227f2', N'spa_db', N'DATAFUSION-PC', N'System.NullReferenceException', N'code', N'Object reference not set to an instance of an object.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 17:20:25.480' AS DateTime), 13, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.NullReferenceException"
  message="Object reference not set to an instance of an object."
  source="code"
  detail="System.NullReferenceException: Object reference not set to an instance of an object.&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.getSpaVMFromSpaBasicInfo(Int64 spaId) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 178&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(Int64 id) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 122&#xD;&#xA;   at lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;BeginInvokeSynchronousActionMethod&gt;b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3d()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;&gt;c__DisplayClass46.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3f()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;&gt;c__DisplayClass2b.&lt;BeginInvokeAction&gt;b__1c()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T17:20:25.4791961Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=g0pZ0zWL9jn3QMFlNZRTiVxF7SjSRdaa8vgrkarn1QshL2tTciORFH1cKuyej8eJPzBTHteih_GPfU7KqF2mvwG0bevjDot_fihtJv3JhVgQ_NYQIVY1K7LtUpfNOxHSadaF2xsidsq1_o6INkaAljIsIChyj8g1dws_L2Nr71LAqckH7kQTDmzZJ4BeoRLyXWTYFRcAkNgaUYRbaFlSC42LNf1qxDTh_TUehsIWY6soGls2UWR9MeEwUaIAMWaZEcpzpWHrs2PkjSPdrZwjxY3df911VueGtEKNo59yy-lZIJfCHq8HDcDhOr07WjxbTylYRATg04cHoEx-AX3XoS8eA_bVLUpNrXhawm3uky6BtGkUAjZjqslb1jcoyWScqopzSwHCh0AYyEYhnoX__0j36NfoUo-mqfSTpGdJhgIYEPZqEoDU2KXUfVgSkKA3L3LNtMbRZTCaGRU-yslu_u1RwgIM8fA1SrVh1m4KOnxk5437Ro7BPmhQDJ7_lzG_1UOCe2wLcLVluZE0NaWOAg&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=g0pZ0zWL9jn3QMFlNZRTiVxF7SjSRdaa8vgrkarn1QshL2tTciORFH1cKuyej8eJPzBTHteih_GPfU7KqF2mvwG0bevjDot_fihtJv3JhVgQ_NYQIVY1K7LtUpfNOxHSadaF2xsidsq1_o6INkaAljIsIChyj8g1dws_L2Nr71LAqckH7kQTDmzZJ4BeoRLyXWTYFRcAkNgaUYRbaFlSC42LNf1qxDTh_TUehsIWY6soGls2UWR9MeEwUaIAMWaZEcpzpWHrs2PkjSPdrZwjxY3df911VueGtEKNo59yy-lZIJfCHq8HDcDhOr07WjxbTylYRATg04cHoEx-AX3XoS8eA_bVLUpNrXhawm3uky6BtGkUAjZjqslb1jcoyWScqopzSwHCh0AYyEYhnoX__0j36NfoUo-mqfSTpGdJhgIYEPZqEoDU2KXUfVgSkKA3L3LNtMbRZTCaGRU-yslu_u1RwgIM8fA1SrVh1m4KOnxk5437Ro7BPmhQDJ7_lzG_1UOCe2wLcLVluZE0NaWOAg&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="62794" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=g0pZ0zWL9jn3QMFlNZRTiVxF7SjSRdaa8vgrkarn1QshL2tTciORFH1cKuyej8eJPzBTHteih_GPfU7KqF2mvwG0bevjDot_fihtJv3JhVgQ_NYQIVY1K7LtUpfNOxHSadaF2xsidsq1_o6INkaAljIsIChyj8g1dws_L2Nr71LAqckH7kQTDmzZJ4BeoRLyXWTYFRcAkNgaUYRbaFlSC42LNf1qxDTh_TUehsIWY6soGls2UWR9MeEwUaIAMWaZEcpzpWHrs2PkjSPdrZwjxY3df911VueGtEKNo59yy-lZIJfCHq8HDcDhOr07WjxbTylYRATg04cHoEx-AX3XoS8eA_bVLUpNrXhawm3uky6BtGkUAjZjqslb1jcoyWScqopzSwHCh0AYyEYhnoX__0j36NfoUo-mqfSTpGdJhgIYEPZqEoDU2KXUfVgSkKA3L3LNtMbRZTCaGRU-yslu_u1RwgIM8fA1SrVh1m4KOnxk5437Ro7BPmhQDJ7_lzG_1UOCe2wLcLVluZE0NaWOAg" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="g0pZ0zWL9jn3QMFlNZRTiVxF7SjSRdaa8vgrkarn1QshL2tTciORFH1cKuyej8eJPzBTHteih_GPfU7KqF2mvwG0bevjDot_fihtJv3JhVgQ_NYQIVY1K7LtUpfNOxHSadaF2xsidsq1_o6INkaAljIsIChyj8g1dws_L2Nr71LAqckH7kQTDmzZJ4BeoRLyXWTYFRcAkNgaUYRbaFlSC42LNf1qxDTh_TUehsIWY6soGls2UWR9MeEwUaIAMWaZEcpzpWHrs2PkjSPdrZwjxY3df911VueGtEKNo59yy-lZIJfCHq8HDcDhOr07WjxbTylYRATg04cHoEx-AX3XoS8eA_bVLUpNrXhawm3uky6BtGkUAjZjqslb1jcoyWScqopzSwHCh0AYyEYhnoX__0j36NfoUo-mqfSTpGdJhgIYEPZqEoDU2KXUfVgSkKA3L3LNtMbRZTCaGRU-yslu_u1RwgIM8fA1SrVh1m4KOnxk5437Ro7BPmhQDJ7_lzG_1UOCe2wLcLVluZE0NaWOAg" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'8be07000-a264-4931-9f05-c6ae08de1746', N'spa_db', N'DATAFUSION-PC', N'System.NullReferenceException', N'code', N'Object reference not set to an instance of an object.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 17:30:23.737' AS DateTime), 14, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.NullReferenceException"
  message="Object reference not set to an instance of an object."
  source="code"
  detail="System.NullReferenceException: Object reference not set to an instance of an object.&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.getSpaVMFromSpaBasicInfo(Int64 spaId) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 178&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(Int64 id) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 122&#xD;&#xA;   at lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;BeginInvokeSynchronousActionMethod&gt;b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3d()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;&gt;c__DisplayClass46.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3f()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;&gt;c__DisplayClass2b.&lt;BeginInvokeAction&gt;b__1c()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T17:30:23.7354144Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=iz-RLn9YRVbQLwFk6UKuL0uh5qWiUHr4YPyliv4uthpHIUWCdmIlFAtUMWyAdv2v5AxhTMoFOtFyfunT1aIvyXHkw3V9tYXVc97JAXJ2LjJJDVCEsBnPph7W1CHqbMAghBEud6Za5x6y89kCIFSG-wnsYVucXl4PUhCVeyWfyR1MrFR5GP5qhH6uWMqBJjQk-DzMTPWHZ-otEDCJcUe_c-hA2KEAffMCyzYtGGSkAbaGVmf1YygdOnndSp8GMDZI4eSqyw8YtgQMxySLBWPdRn-vk5pgNkmbjLG2y0R4r4ie5FM9_Vl0GKWXrWIrfhSbIkZ7vRZgwoGmGT6R_7vIijdUDulbE90xaa1WW_o8_jLBbNxu6QtABQiHIuAHc9Wn2k4GiFqi-NOf_4olS9Uxzvbt7Bb_vui0n7G1AosUXu5u0T0pXhl57v72jyC2ExhiCr5tFRUbIxgEQOddrRAC-2oK_PRkKLzGmqoPUp8Ek3s_LMtOvews88F-jU5GrZGIxkWksdzKidW3DT4IXjr8sQ&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=iz-RLn9YRVbQLwFk6UKuL0uh5qWiUHr4YPyliv4uthpHIUWCdmIlFAtUMWyAdv2v5AxhTMoFOtFyfunT1aIvyXHkw3V9tYXVc97JAXJ2LjJJDVCEsBnPph7W1CHqbMAghBEud6Za5x6y89kCIFSG-wnsYVucXl4PUhCVeyWfyR1MrFR5GP5qhH6uWMqBJjQk-DzMTPWHZ-otEDCJcUe_c-hA2KEAffMCyzYtGGSkAbaGVmf1YygdOnndSp8GMDZI4eSqyw8YtgQMxySLBWPdRn-vk5pgNkmbjLG2y0R4r4ie5FM9_Vl0GKWXrWIrfhSbIkZ7vRZgwoGmGT6R_7vIijdUDulbE90xaa1WW_o8_jLBbNxu6QtABQiHIuAHc9Wn2k4GiFqi-NOf_4olS9Uxzvbt7Bb_vui0n7G1AosUXu5u0T0pXhl57v72jyC2ExhiCr5tFRUbIxgEQOddrRAC-2oK_PRkKLzGmqoPUp8Ek3s_LMtOvews88F-jU5GrZGIxkWksdzKidW3DT4IXjr8sQ&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="63043" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=iz-RLn9YRVbQLwFk6UKuL0uh5qWiUHr4YPyliv4uthpHIUWCdmIlFAtUMWyAdv2v5AxhTMoFOtFyfunT1aIvyXHkw3V9tYXVc97JAXJ2LjJJDVCEsBnPph7W1CHqbMAghBEud6Za5x6y89kCIFSG-wnsYVucXl4PUhCVeyWfyR1MrFR5GP5qhH6uWMqBJjQk-DzMTPWHZ-otEDCJcUe_c-hA2KEAffMCyzYtGGSkAbaGVmf1YygdOnndSp8GMDZI4eSqyw8YtgQMxySLBWPdRn-vk5pgNkmbjLG2y0R4r4ie5FM9_Vl0GKWXrWIrfhSbIkZ7vRZgwoGmGT6R_7vIijdUDulbE90xaa1WW_o8_jLBbNxu6QtABQiHIuAHc9Wn2k4GiFqi-NOf_4olS9Uxzvbt7Bb_vui0n7G1AosUXu5u0T0pXhl57v72jyC2ExhiCr5tFRUbIxgEQOddrRAC-2oK_PRkKLzGmqoPUp8Ek3s_LMtOvews88F-jU5GrZGIxkWksdzKidW3DT4IXjr8sQ" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="iz-RLn9YRVbQLwFk6UKuL0uh5qWiUHr4YPyliv4uthpHIUWCdmIlFAtUMWyAdv2v5AxhTMoFOtFyfunT1aIvyXHkw3V9tYXVc97JAXJ2LjJJDVCEsBnPph7W1CHqbMAghBEud6Za5x6y89kCIFSG-wnsYVucXl4PUhCVeyWfyR1MrFR5GP5qhH6uWMqBJjQk-DzMTPWHZ-otEDCJcUe_c-hA2KEAffMCyzYtGGSkAbaGVmf1YygdOnndSp8GMDZI4eSqyw8YtgQMxySLBWPdRn-vk5pgNkmbjLG2y0R4r4ie5FM9_Vl0GKWXrWIrfhSbIkZ7vRZgwoGmGT6R_7vIijdUDulbE90xaa1WW_o8_jLBbNxu6QtABQiHIuAHc9Wn2k4GiFqi-NOf_4olS9Uxzvbt7Bb_vui0n7G1AosUXu5u0T0pXhl57v72jyC2ExhiCr5tFRUbIxgEQOddrRAC-2oK_PRkKLzGmqoPUp8Ek3s_LMtOvews88F-jU5GrZGIxkWksdzKidW3DT4IXjr8sQ" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'69f9e548-159b-4fdf-b253-e3ae0f88e2ff', N'spa_db', N'DATAFUSION-PC', N'System.Web.HttpException', N'System.Web.Mvc', N'A public action method ''Download'' was not found on controller ''code.Areas.Admin.Controllers.spaController''.', N'yagneshdxt@gmail.com', 404, CAST(N'2017-07-29 18:40:30.087' AS DateTime), 15, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.Web.HttpException"
  message="A public action method ''Download'' was not found on controller ''code.Areas.Admin.Controllers.spaController''."
  source="System.Web.Mvc"
  detail="System.Web.HttpException (0x80004005): A public action method ''Download'' was not found on controller ''code.Areas.Admin.Controllers.spaController''.&#xD;&#xA;   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T18:40:30.0850038Z"
  statusCode="404">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=T_HxVXfiPIr5GPsoRNk_j5WGiHnnKJM5rmt5PXhZyiYtLk-qKMeOAFOa-cwOyolRRqn9qSNxjiBZkW2xf2W1gPXJdaICIp2B9MJ1P4fd62_45S7uoOWdjsxWrS4uPtlLA2EEWOTSpX_SJYPwKsaI5rwkN5kI8s5pMgZNe4eKKnydnZ0iU_bHaSSOCUSBXQ8ftuVfdqqzKqao1wX7VUsOtkFR4hoF75ydCK8ehvrDOuqxflxGVIuLQsLugMFbPo8pWVJxUkivqQRIFmOJMexcOdKyNkIlhLdpope8-ZZUsbEbx3XEfEuJGkHmipI6T3QtoWYQquvE2TABgN__miiyHSFSbDSDFJEbQj-b2dM0mRqwhsRyrphZIxE6Lx-WlWTfHGsv0Sx6MSz7EPrUreaZhI-yIbsKoax3CVC3_tYQg2xWrrqVHerZtwTuEEgTO1XjLHWkau9j5lRf4047i5pEdnYN9qN4eSAl69Rwh1cgd-cPs0Bw8ls3cdI1fj_XWfNlPRf8zsXDnbcXYbVwoWCU1Q&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=T_HxVXfiPIr5GPsoRNk_j5WGiHnnKJM5rmt5PXhZyiYtLk-qKMeOAFOa-cwOyolRRqn9qSNxjiBZkW2xf2W1gPXJdaICIp2B9MJ1P4fd62_45S7uoOWdjsxWrS4uPtlLA2EEWOTSpX_SJYPwKsaI5rwkN5kI8s5pMgZNe4eKKnydnZ0iU_bHaSSOCUSBXQ8ftuVfdqqzKqao1wX7VUsOtkFR4hoF75ydCK8ehvrDOuqxflxGVIuLQsLugMFbPo8pWVJxUkivqQRIFmOJMexcOdKyNkIlhLdpope8-ZZUsbEbx3XEfEuJGkHmipI6T3QtoWYQquvE2TABgN__miiyHSFSbDSDFJEbQj-b2dM0mRqwhsRyrphZIxE6Lx-WlWTfHGsv0Sx6MSz7EPrUreaZhI-yIbsKoax3CVC3_tYQg2xWrrqVHerZtwTuEEgTO1XjLHWkau9j5lRf4047i5pEdnYN9qN4eSAl69Rwh1cgd-cPs0Bw8ls3cdI1fj_XWfNlPRf8zsXDnbcXYbVwoWCU1Q&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/spa/Download/" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\spa\Download\" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="p=~/App_Data/Upload/BeforeImage_636369579781612339BeforeImage_636369579781612339" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="63781" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/spa/Download/" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/spa/Download/" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=T_HxVXfiPIr5GPsoRNk_j5WGiHnnKJM5rmt5PXhZyiYtLk-qKMeOAFOa-cwOyolRRqn9qSNxjiBZkW2xf2W1gPXJdaICIp2B9MJ1P4fd62_45S7uoOWdjsxWrS4uPtlLA2EEWOTSpX_SJYPwKsaI5rwkN5kI8s5pMgZNe4eKKnydnZ0iU_bHaSSOCUSBXQ8ftuVfdqqzKqao1wX7VUsOtkFR4hoF75ydCK8ehvrDOuqxflxGVIuLQsLugMFbPo8pWVJxUkivqQRIFmOJMexcOdKyNkIlhLdpope8-ZZUsbEbx3XEfEuJGkHmipI6T3QtoWYQquvE2TABgN__miiyHSFSbDSDFJEbQj-b2dM0mRqwhsRyrphZIxE6Lx-WlWTfHGsv0Sx6MSz7EPrUreaZhI-yIbsKoax3CVC3_tYQg2xWrrqVHerZtwTuEEgTO1XjLHWkau9j5lRf4047i5pEdnYN9qN4eSAl69Rwh1cgd-cPs0Bw8ls3cdI1fj_XWfNlPRf8zsXDnbcXYbVwoWCU1Q" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <queryString>
    <item
      name="p">
      <value
        string="~/App_Data/Upload/BeforeImage_636369579781612339BeforeImage_636369579781612339" />
    </item>
  </queryString>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="T_HxVXfiPIr5GPsoRNk_j5WGiHnnKJM5rmt5PXhZyiYtLk-qKMeOAFOa-cwOyolRRqn9qSNxjiBZkW2xf2W1gPXJdaICIp2B9MJ1P4fd62_45S7uoOWdjsxWrS4uPtlLA2EEWOTSpX_SJYPwKsaI5rwkN5kI8s5pMgZNe4eKKnydnZ0iU_bHaSSOCUSBXQ8ftuVfdqqzKqao1wX7VUsOtkFR4hoF75ydCK8ehvrDOuqxflxGVIuLQsLugMFbPo8pWVJxUkivqQRIFmOJMexcOdKyNkIlhLdpope8-ZZUsbEbx3XEfEuJGkHmipI6T3QtoWYQquvE2TABgN__miiyHSFSbDSDFJEbQj-b2dM0mRqwhsRyrphZIxE6Lx-WlWTfHGsv0Sx6MSz7EPrUreaZhI-yIbsKoax3CVC3_tYQg2xWrrqVHerZtwTuEEgTO1XjLHWkau9j5lRf4047i5pEdnYN9qN4eSAl69Rwh1cgd-cPs0Bw8ls3cdI1fj_XWfNlPRf8zsXDnbcXYbVwoWCU1Q" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'de621630-25a9-4ab5-9498-a964fbce7615', N'spa_db', N'DATAFUSION-PC', N'System.IO.DirectoryNotFoundException', N'mscorlib', N'Could not find a part of the path ''D:\Yagnesh\Deepen\Deepen_SPA\code\App_Data\Upload\~\App_Data\Upload\BeforeImage_636369579781612339BeforeImage_636369579781612339''.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 18:44:19.993' AS DateTime), 16, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.IO.DirectoryNotFoundException"
  message="Could not find a part of the path ''D:\Yagnesh\Deepen\Deepen_SPA\code\App_Data\Upload\~\App_Data\Upload\BeforeImage_636369579781612339BeforeImage_636369579781612339''."
  source="mscorlib"
  detail="System.IO.DirectoryNotFoundException: Could not find a part of the path ''D:\Yagnesh\Deepen\Deepen_SPA\code\App_Data\Upload\~\App_Data\Upload\BeforeImage_636369579781612339BeforeImage_636369579781612339''.&#xD;&#xA;   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)&#xD;&#xA;   at System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)&#xD;&#xA;   at System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share)&#xD;&#xA;   at System.Web.HttpResponse.TransmitFile(String filename, Int64 offset, Int64 length)&#xD;&#xA;   at System.Web.HttpResponseWrapper.TransmitFile(String filename)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T18:44:19.9941539Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=T_HxVXfiPIr5GPsoRNk_j5WGiHnnKJM5rmt5PXhZyiYtLk-qKMeOAFOa-cwOyolRRqn9qSNxjiBZkW2xf2W1gPXJdaICIp2B9MJ1P4fd62_45S7uoOWdjsxWrS4uPtlLA2EEWOTSpX_SJYPwKsaI5rwkN5kI8s5pMgZNe4eKKnydnZ0iU_bHaSSOCUSBXQ8ftuVfdqqzKqao1wX7VUsOtkFR4hoF75ydCK8ehvrDOuqxflxGVIuLQsLugMFbPo8pWVJxUkivqQRIFmOJMexcOdKyNkIlhLdpope8-ZZUsbEbx3XEfEuJGkHmipI6T3QtoWYQquvE2TABgN__miiyHSFSbDSDFJEbQj-b2dM0mRqwhsRyrphZIxE6Lx-WlWTfHGsv0Sx6MSz7EPrUreaZhI-yIbsKoax3CVC3_tYQg2xWrrqVHerZtwTuEEgTO1XjLHWkau9j5lRf4047i5pEdnYN9qN4eSAl69Rwh1cgd-cPs0Bw8ls3cdI1fj_XWfNlPRf8zsXDnbcXYbVwoWCU1Q&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=T_HxVXfiPIr5GPsoRNk_j5WGiHnnKJM5rmt5PXhZyiYtLk-qKMeOAFOa-cwOyolRRqn9qSNxjiBZkW2xf2W1gPXJdaICIp2B9MJ1P4fd62_45S7uoOWdjsxWrS4uPtlLA2EEWOTSpX_SJYPwKsaI5rwkN5kI8s5pMgZNe4eKKnydnZ0iU_bHaSSOCUSBXQ8ftuVfdqqzKqao1wX7VUsOtkFR4hoF75ydCK8ehvrDOuqxflxGVIuLQsLugMFbPo8pWVJxUkivqQRIFmOJMexcOdKyNkIlhLdpope8-ZZUsbEbx3XEfEuJGkHmipI6T3QtoWYQquvE2TABgN__miiyHSFSbDSDFJEbQj-b2dM0mRqwhsRyrphZIxE6Lx-WlWTfHGsv0Sx6MSz7EPrUreaZhI-yIbsKoax3CVC3_tYQg2xWrrqVHerZtwTuEEgTO1XjLHWkau9j5lRf4047i5pEdnYN9qN4eSAl69Rwh1cgd-cPs0Bw8ls3cdI1fj_XWfNlPRf8zsXDnbcXYbVwoWCU1Q&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/spa/Download/" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\spa\Download\" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="p=~/App_Data/Upload/BeforeImage_636369579781612339BeforeImage_636369579781612339&amp;d=file_0" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="63822" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/spa/Download/" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/spa/Download/" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=T_HxVXfiPIr5GPsoRNk_j5WGiHnnKJM5rmt5PXhZyiYtLk-qKMeOAFOa-cwOyolRRqn9qSNxjiBZkW2xf2W1gPXJdaICIp2B9MJ1P4fd62_45S7uoOWdjsxWrS4uPtlLA2EEWOTSpX_SJYPwKsaI5rwkN5kI8s5pMgZNe4eKKnydnZ0iU_bHaSSOCUSBXQ8ftuVfdqqzKqao1wX7VUsOtkFR4hoF75ydCK8ehvrDOuqxflxGVIuLQsLugMFbPo8pWVJxUkivqQRIFmOJMexcOdKyNkIlhLdpope8-ZZUsbEbx3XEfEuJGkHmipI6T3QtoWYQquvE2TABgN__miiyHSFSbDSDFJEbQj-b2dM0mRqwhsRyrphZIxE6Lx-WlWTfHGsv0Sx6MSz7EPrUreaZhI-yIbsKoax3CVC3_tYQg2xWrrqVHerZtwTuEEgTO1XjLHWkau9j5lRf4047i5pEdnYN9qN4eSAl69Rwh1cgd-cPs0Bw8ls3cdI1fj_XWfNlPRf8zsXDnbcXYbVwoWCU1Q" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <queryString>
    <item
      name="p">
      <value
        string="~/App_Data/Upload/BeforeImage_636369579781612339BeforeImage_636369579781612339" />
    </item>
    <item
      name="d">
      <value
        string="file_0" />
    </item>
  </queryString>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="T_HxVXfiPIr5GPsoRNk_j5WGiHnnKJM5rmt5PXhZyiYtLk-qKMeOAFOa-cwOyolRRqn9qSNxjiBZkW2xf2W1gPXJdaICIp2B9MJ1P4fd62_45S7uoOWdjsxWrS4uPtlLA2EEWOTSpX_SJYPwKsaI5rwkN5kI8s5pMgZNe4eKKnydnZ0iU_bHaSSOCUSBXQ8ftuVfdqqzKqao1wX7VUsOtkFR4hoF75ydCK8ehvrDOuqxflxGVIuLQsLugMFbPo8pWVJxUkivqQRIFmOJMexcOdKyNkIlhLdpope8-ZZUsbEbx3XEfEuJGkHmipI6T3QtoWYQquvE2TABgN__miiyHSFSbDSDFJEbQj-b2dM0mRqwhsRyrphZIxE6Lx-WlWTfHGsv0Sx6MSz7EPrUreaZhI-yIbsKoax3CVC3_tYQg2xWrrqVHerZtwTuEEgTO1XjLHWkau9j5lRf4047i5pEdnYN9qN4eSAl69Rwh1cgd-cPs0Bw8ls3cdI1fj_XWfNlPRf8zsXDnbcXYbVwoWCU1Q" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'ab84bf58-4608-4453-8e93-4359de8ffb68', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'EntityFramework', N'The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:09:14.503' AS DateTime), 17, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted."
  source="EntityFramework"
  detail="System.InvalidOperationException: The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.PrepareToSaveChanges(SaveOptions options)&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)&#xD;&#xA;   at System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 269"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:09:14.5045421Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4378&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4378&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="62820" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="6fAfbZIxaURbB3BGtvzxR7bYUlAaLh91FPoJBB0TwR9jgJ1FdHr92ZxngFTVgTmOaoCj8FuyXIukW9tyaVsqefoLbMGYwm7f0dr7wfXPgaxBXK_tXKs2csyG4T9y-izOYITaDh4V-guYrMfv1KUxEA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="yagnesh" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="yag@asdf.com" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="8806028939" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="3" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="50" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="4" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="74" />
    </item>
    <item
      name="Selectedprices[2].Id">
      <value
        string="5" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="55" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'c0861831-4d25-4733-b2f0-e709ea7e9337', N'spa_db', N'DATAFUSION-PC', N'System.NullReferenceException', N'code', N'Object reference not set to an instance of an object.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:09:14.583' AS DateTime), 18, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.NullReferenceException"
  message="Object reference not set to an instance of an object."
  source="code"
  detail="System.NullReferenceException: Object reference not set to an instance of an object.&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.&lt;&gt;c__DisplayClass12_1.&lt;getSpaVMFromSpaBasicInfo&gt;b__1(spa_prices e) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at System.Linq.Enumerable.Any[TSource](IEnumerable`1 source, Func`2 predicate)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.&lt;&gt;c__DisplayClass12_0.&lt;getSpaVMFromSpaBasicInfo&gt;b__0(Intcheckboxmodel x) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()&#xD;&#xA;   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)&#xD;&#xA;   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.getSpaVMFromSpaBasicInfo(Int64 spaId) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 277&#xD;&#xA;   at lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;BeginInvokeSynchronousActionMethod&gt;b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3d()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;&gt;c__DisplayClass46.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3f()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;&gt;c__DisplayClass2b.&lt;BeginInvokeAction&gt;b__1c()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:09:14.5825466Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4378&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4378&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="62820" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="6fAfbZIxaURbB3BGtvzxR7bYUlAaLh91FPoJBB0TwR9jgJ1FdHr92ZxngFTVgTmOaoCj8FuyXIukW9tyaVsqefoLbMGYwm7f0dr7wfXPgaxBXK_tXKs2csyG4T9y-izOYITaDh4V-guYrMfv1KUxEA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="yagnesh" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="yag@asdf.com" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="8806028939" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="3" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="50" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="4" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="74" />
    </item>
    <item
      name="Selectedprices[2].Id">
      <value
        string="5" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="55" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'3131b9e9-9fae-43fb-b2af-39280bc7b2fb', N'spa_db', N'DATAFUSION-PC', N'System.Web.HttpCompileException', N'System.Web', N'D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml(54): error CS1002: ; expected', N'', 500, CAST(N'2017-07-30 16:40:24.777' AS DateTime), 35, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.Web.HttpCompileException"
  message="D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml(54): error CS1002: ; expected"
  source="System.Web"
  detail="System.Web.HttpCompileException (0x80004005): D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml(54): error CS1002: ; expected&#xD;&#xA;   at System.Web.Compilation.AssemblyBuilder.Compile()&#xD;&#xA;   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()&#xD;&#xA;   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)&#xD;&#xA;   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)&#xD;&#xA;   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)&#xD;&#xA;   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)&#xD;&#xA;   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.&lt;&gt;c__DisplayClass3.&lt;RenderPageCore&gt;b__2(TextWriter writer)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.Write(HelperResult result)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.PopContext()&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2017-07-30T16:40:24.7773019Z"
  statusCode="500"
  webHostHtmlMessage="&lt;!DOCTYPE html&gt;&#xD;&#xA;&lt;html&gt;&#xD;&#xA;    &lt;head&gt;&#xD;&#xA;        &lt;title&gt;Compilation Error&lt;/title&gt;&#xD;&#xA;        &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width&quot; /&gt;&#xD;&#xA;        &lt;style&gt;&#xD;&#xA;         body {font-family:&quot;Verdana&quot;;font-weight:normal;font-size: .7em;color:black;} &#xD;&#xA;         p {font-family:&quot;Verdana&quot;;font-weight:normal;color:black;margin-top: -5px}&#xD;&#xA;         b {font-family:&quot;Verdana&quot;;font-weight:bold;color:black;margin-top: -5px}&#xD;&#xA;         H1 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:18pt;color:red }&#xD;&#xA;         H2 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:14pt;color:maroon }&#xD;&#xA;         pre {font-family:&quot;Consolas&quot;,&quot;Lucida Console&quot;,Monospace;font-size:11pt;margin:0;padding:0.5em;line-height:14pt}&#xD;&#xA;         .marker {font-weight: bold; color: black;text-decoration: none;}&#xD;&#xA;         .version {color: gray;}&#xD;&#xA;         .error {margin-bottom: 10px;}&#xD;&#xA;         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }&#xD;&#xA;         @media screen and (max-width: 639px) {&#xD;&#xA;          pre { width: 440px; overflow: auto; white-space: pre-wrap; word-wrap: break-word; }&#xD;&#xA;         }&#xD;&#xA;         @media screen and (max-width: 479px) {&#xD;&#xA;          pre { width: 280px; }&#xD;&#xA;         }&#xD;&#xA;        &lt;/style&gt;&#xD;&#xA;    &lt;/head&gt;&#xD;&#xA;&#xD;&#xA;    &lt;body bgcolor=&quot;white&quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;span&gt;&lt;H1&gt;Server Error in ''/'' Application.&lt;hr width=100% size=1 color=silver&gt;&lt;/H1&gt;&#xD;&#xA;&#xD;&#xA;            &lt;h2&gt; &lt;i&gt;Compilation Error&lt;/i&gt; &lt;/h2&gt;&lt;/span&gt;&#xD;&#xA;&#xD;&#xA;            &lt;font face=&quot;Arial, Helvetica, Geneva, SunSans-Regular, sans-serif &quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; Description: &lt;/b&gt;An error occurred during the compilation of a resource required to service this request. Please review the following specific error details and modify your source code appropriately.&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; Compiler Error Message: &lt;/b&gt;CS1002: ; expected&lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;b&gt;Source Error:&lt;/b&gt;&lt;br&gt;&lt;br&gt;&#xD;&#xA;            &lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&lt;td&gt;&#xD;&#xA;                              &lt;/td&gt;&lt;/tr&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;Line 52:                 &amp;lt;div class=&amp;quot;i-slogan&amp;quot;&amp;gt;Find the best prices near you&amp;lt;/div&amp;gt;&#xD;&#xA;Line 53:             &amp;lt;/div&amp;gt;&#xD;&#xA;&lt;font color=red&gt;Line 54:             @{Html.RenderAction(&amp;quot;SearchPanel&amp;quot;, &amp;quot;Home&amp;quot;)}&#xD;&#xA;&lt;/font&gt;Line 55:             &amp;lt;h1 class=&amp;quot;i-home-tlt&amp;quot;&amp;gt;Take care of yourself&amp;lt;/h1&amp;gt;&#xD;&#xA;Line 56:         &amp;lt;/div&amp;gt;&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt;Source File:&lt;/b&gt; D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&#xD;&#xA;            &amp;nbsp;&amp;nbsp; &lt;b&gt;Line:&lt;/b&gt;  54&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''compilerOutputDiv'')&quot;&gt;Show Detailed Compiler Output:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;compilerOutputDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;c:\windows\system32\inetsrv&amp;gt;D:\Yagnesh\Deepen\Deepen_SPA\code\bin\roslyn\csc.exe /t:library /utf8output /nostdlib+ /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\mscorlib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Runtime\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_64\System.Data\v4.0_4.0.0.0__b77a5c561934e089\System.Data.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Data.DataSetExtensions\v4.0_4.0.0.0__b77a5c561934e089\System.Data.DataSetExtensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\ec8f7895\00457b1b_813ad001\System.Web.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml.Linq\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.Linq.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\3d8e0692\00df286a_813ad001\System.Web.WebPages.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\333a3526\0097992d_58c5d201\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\2ed99b54\007e822a_d5add201\Microsoft.Owin.Host.SystemWeb.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.DynamicData\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.DynamicData.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_64\System.EnterpriseServices\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.EnterpriseServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\4f4f4b20\00abb32b_d5add201\Microsoft.Owin.Security.Cookies.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Web\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\e994ec33\00df08f7_1418cf01\WebGrease.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Drawing\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Drawing.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c6ab0581\005ef620_71cccd01\Owin.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\e6bed9fc\00df286a_813ad001\System.Web.Helpers.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\26389304\00f599b1_9d54d001\EntityFramework.SqlServer.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activation\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activation.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Runtime.Serialization\v4.0_4.0.0.0__b77a5c561934e089\System.Runtime.Serialization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\7b95bab4\0032472f_d5add201\Microsoft.Owin.Security.Twitter.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ComponentModel.DataAnnotations\v4.0_4.0.0.0__31bf3856ad364e35\System.ComponentModel.DataAnnotations.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\79b01fc2\004ab69c_aa10ce01\Antlr3.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\b5fdb4ff\00d8e42c_d5add201\Microsoft.Owin.Security.Google.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\3f329b8e\0005162e_d5add201\Microsoft.Owin.Security.OAuth.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c98fac55\00df286a_813ad001\System.Web.WebPages.Deployment.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_64\System.Web\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\625e249f\00d2e379_0f27cf01\System.Web.Optimization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.WorkflowServices\v4.0_4.0.0.0__31bf3856ad364e35\System.WorkflowServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.CSharp\v4.0_4.0.0.0__b03f5f7f11d50a3a\Microsoft.CSharp.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel\v4.0_4.0.0.0__b77a5c561934e089\System.ServiceModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c62df296\0005818c_026ed001\Microsoft.AspNet.Identity.Core.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\mscorlib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\eb3d10b6\0005818c_026ed001\Microsoft.AspNet.Identity.Owin.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\9e89153c\0080d323_813ad001\System.Web.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\f16c2952\1c315a3a_5009d301\code.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.ApplicationServices\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.ApplicationServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\b6800707\007f9000_3721cd01\Microsoft.Web.Infrastructure.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Services\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.Services.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\3f01b36c\63546105_8208d301\DataAccess.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Core\v4.0_4.0.0.0__b77a5c561934e089\System.Core.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.IdentityModel\v4.0_4.0.0.0__b77a5c561934e089\System.IdentityModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\5c3ae4ba\0005818c_026ed001\Microsoft.AspNet.Identity.EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\6b116fe4\0043c8ad_0ce8d201\Newtonsoft.Json.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Configuration\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Configuration.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\16b42220\00d8e42c_d5add201\Microsoft.Owin.Security.Facebook.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_global.asax.jtone_xh.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\d8dd2d67\00df286a_813ad001\System.Web.WebPages.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\7337447a\00d8ec18_b318cd01\Elmah.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.VisualStudio.Web.PageInspector.Loader\v4.0_1.0.0.0__b03f5f7f11d50a3a\Microsoft.VisualStudio.Web.PageInspector.Loader.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Extensions\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.Extensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\99ca1996\0005162e_d5add201\Microsoft.Owin.Security.MicrosoftAccount.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System\v4.0_4.0.0.0__b77a5c561934e089\System.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c2168d5c\00242028_d5add201\Microsoft.Owin.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\e2996681\00abb32b_d5add201\Microsoft.Owin.Security.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\78ae0968\00f599b1_9d54d001\EntityFramework.dll&amp;quot; /out:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web__layout.cshtml.639c3968.gzwifher.dll&amp;quot; /D:DEBUG /debug+ /optimize- /warnaserror- /w:4 /nowarn:1659;1699;1701;612;618 /langversion:6 /nowarn:1659;1699;1701  &amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web__layout.cshtml.639c3968.gzwifher.0.cs&amp;quot; &amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web__layout.cshtml.639c3968.gzwifher.1.cs&amp;quot;&#xD;&#xA;&#xD;&#xA;&#xD;&#xA;Microsoft (R) Visual C# Compiler version 2.3.0.61908 (281ac90b)&#xD;&#xA;Copyright (C) Microsoft Corporation. All rights reserved.&#xD;&#xA;&#xD;&#xA;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml(54,55): error CS1002: ; expected&#xD;&#xA;&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''dynamicCodeDiv'')&quot;&gt;Show Complete Compilation Source:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;dynamicCodeDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;Line 1:    #pragma checksum &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot; &amp;quot;{ff1816ec-aa5e-4d10-87f7-6f4963833460}&amp;quot; &amp;quot;5815CF16C14C7F29642CDCB408DDAC6DEF5ACFD6&amp;quot;&#xD;Line 2:    //------------------------------------------------------------------------------&#xD;Line 3:    // &amp;lt;auto-generated&amp;gt;&#xD;Line 4:    //     This code was generated by a tool.&#xD;Line 5:    //     Runtime Version:4.0.30319.42000&#xD;Line 6:    //&#xD;Line 7:    //     Changes to this file may cause incorrect behavior and will be lost if&#xD;Line 8:    //     the code is regenerated.&#xD;Line 9:    // &amp;lt;/auto-generated&amp;gt;&#xD;Line 10:   //------------------------------------------------------------------------------&#xD;Line 11:   &#xD;Line 12:   namespace ASP {&#xD;Line 13:       using System;&#xD;Line 14:       using System.Collections.Generic;&#xD;Line 15:       using System.IO;&#xD;Line 16:       using System.Linq;&#xD;Line 17:       using System.Net;&#xD;Line 18:       using System.Web;&#xD;Line 19:       using System.Web.Helpers;&#xD;Line 20:       using System.Web.Security;&#xD;Line 21:       using System.Web.UI;&#xD;Line 22:       using System.Web.WebPages;&#xD;Line 23:       using System.Web.Mvc;&#xD;Line 24:       using System.Web.Mvc.Ajax;&#xD;Line 25:       using System.Web.Mvc.Html;&#xD;Line 26:       using System.Web.Optimization;&#xD;Line 27:       using System.Web.Routing;&#xD;Line 28:       using code;&#xD;Line 29:       &#xD;Line 30:       &#xD;Line 31:       public class _Page_Views_Shared__Layout_cshtml : System.Web.Mvc.WebViewPage&amp;lt;dynamic&amp;gt; {&#xD;Line 32:           &#xD;Line 33:   #line hidden&#xD;Line 34:           &#xD;Line 35:           public _Page_Views_Shared__Layout_cshtml() {&#xD;Line 36:           }&#xD;Line 37:           &#xD;Line 38:           protected ASP.global_asax ApplicationInstance {&#xD;Line 39:               get {&#xD;Line 40:                   return ((ASP.global_asax)(Context.ApplicationInstance));&#xD;Line 41:               }&#xD;Line 42:           }&#xD;Line 43:           &#xD;Line 44:           public override void Execute() {&#xD;Line 45:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 0, 102, true);&#xD;Line 46:   &#xD;Line 47:   WriteLiteral(&amp;quot;&amp;lt;!DOCTYPE html&amp;gt;\r\n&amp;lt;html&amp;gt;\r\n&amp;lt;head&amp;gt;\r\n    &amp;lt;title&amp;gt;Inkarn :: Find the best prices near y&amp;quot; +&#xD;Line 48:   &amp;quot;ou&amp;lt;/title&amp;gt;\r\n    &amp;lt;meta&amp;quot;);&#xD;Line 49:   &#xD;Line 50:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 0, 102, true);&#xD;Line 51:   &#xD;Line 52:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 102, 16, true);&#xD;Line 53:   &#xD;Line 54:   WriteLiteral(&amp;quot; charset=\&amp;quot;utf-8\&amp;quot;&amp;quot;);&#xD;Line 55:   &#xD;Line 56:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 102, 16, true);&#xD;Line 57:   &#xD;Line 58:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 118, 12, true);&#xD;Line 59:   &#xD;Line 60:   WriteLiteral(&amp;quot;&amp;gt;\r\n    &amp;lt;meta&amp;quot;);&#xD;Line 61:   &#xD;Line 62:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 118, 12, true);&#xD;Line 63:   &#xD;Line 64:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 130, 29, true);&#xD;Line 65:   &#xD;Line 66:   WriteLiteral(&amp;quot; http-equiv=\&amp;quot;X-UA-Compatible\&amp;quot;&amp;quot;);&#xD;Line 67:   &#xD;Line 68:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 130, 29, true);&#xD;Line 69:   &#xD;Line 70:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 159, 18, true);&#xD;Line 71:   &#xD;Line 72:   WriteLiteral(&amp;quot; content=\&amp;quot;IE=edge\&amp;quot;&amp;quot;);&#xD;Line 73:   &#xD;Line 74:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 159, 18, true);&#xD;Line 75:   &#xD;Line 76:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 177, 12, true);&#xD;Line 77:   &#xD;Line 78:   WriteLiteral(&amp;quot;&amp;gt;\r\n    &amp;lt;meta&amp;quot;);&#xD;Line 79:   &#xD;Line 80:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 177, 12, true);&#xD;Line 81:   &#xD;Line 82:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 189, 16, true);&#xD;Line 83:   &#xD;Line 84:   WriteLiteral(&amp;quot; name=\&amp;quot;viewport\&amp;quot;&amp;quot;);&#xD;Line 85:   &#xD;Line 86:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 189, 16, true);&#xD;Line 87:   &#xD;Line 88:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 205, 86, true);&#xD;Line 89:   &#xD;Line 90:   WriteLiteral(&amp;quot; content=\&amp;quot;width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale&amp;quot; +&#xD;Line 91:   &amp;quot;=1.0\&amp;quot;&amp;quot;);&#xD;Line 92:   &#xD;Line 93:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 205, 86, true);&#xD;Line 94:   &#xD;Line 95:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 291, 14, true);&#xD;Line 96:   &#xD;Line 97:   WriteLiteral(&amp;quot; /&amp;gt;\r\n    &amp;lt;meta&amp;quot;);&#xD;Line 98:   &#xD;Line 99:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 291, 14, true);&#xD;Line 100:  &#xD;Line 101:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 305, 36, true);&#xD;Line 102:  &#xD;Line 103:  WriteLiteral(&amp;quot; name=\&amp;quot;apple-mobile-web-app-capable\&amp;quot;&amp;quot;);&#xD;Line 104:  &#xD;Line 105:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 305, 36, true);&#xD;Line 106:  &#xD;Line 107:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 341, 14, true);&#xD;Line 108:  &#xD;Line 109:  WriteLiteral(&amp;quot; content=\&amp;quot;yes\&amp;quot;&amp;quot;);&#xD;Line 110:  &#xD;Line 111:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 341, 14, true);&#xD;Line 112:  &#xD;Line 113:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 355, 14, true);&#xD;Line 114:  &#xD;Line 115:  WriteLiteral(&amp;quot; /&amp;gt;\r\n    &amp;lt;meta&amp;quot;);&#xD;Line 116:  &#xD;Line 117:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 355, 14, true);&#xD;Line 118:  &#xD;Line 119:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 369, 24, true);&#xD;Line 120:  &#xD;Line 121:  WriteLiteral(&amp;quot; name=\&amp;quot;format-detection\&amp;quot;&amp;quot;);&#xD;Line 122:  &#xD;Line 123:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 369, 24, true);&#xD;Line 124:  &#xD;Line 125:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 393, 23, true);&#xD;Line 126:  &#xD;Line 127:  WriteLiteral(&amp;quot; content=\&amp;quot;telephone=no\&amp;quot;&amp;quot;);&#xD;Line 128:  &#xD;Line 129:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 393, 23, true);&#xD;Line 130:  &#xD;Line 131:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 416, 14, true);&#xD;Line 132:  &#xD;Line 133:  WriteLiteral(&amp;quot; /&amp;gt;\r\n    &amp;lt;link&amp;quot;);&#xD;Line 134:  &#xD;Line 135:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 416, 14, true);&#xD;Line 136:  &#xD;Line 137:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 430, 20, true);&#xD;Line 138:  &#xD;Line 139:  WriteLiteral(&amp;quot; rel=\&amp;quot;shortcut icon\&amp;quot;&amp;quot;);&#xD;Line 140:  &#xD;Line 141:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 430, 20, true);&#xD;Line 142:  &#xD;Line 143:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 450, 33, true);&#xD;Line 144:  &#xD;Line 145:  WriteLiteral(&amp;quot; href=\&amp;quot;images/favicon-inkarn.ico\&amp;quot;&amp;quot;);&#xD;Line 146:  &#xD;Line 147:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 450, 33, true);&#xD;Line 148:  &#xD;Line 149:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 483, 20, true);&#xD;Line 150:  &#xD;Line 151:  WriteLiteral(&amp;quot; type=\&amp;quot;image/x-icon\&amp;quot;&amp;quot;);&#xD;Line 152:  &#xD;Line 153:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 483, 20, true);&#xD;Line 154:  &#xD;Line 155:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 503, 5, true);&#xD;Line 156:  &#xD;Line 157:  WriteLiteral(&amp;quot; /&amp;gt;\r\n&amp;quot;);&#xD;Line 158:  &#xD;Line 159:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 503, 5, true);&#xD;Line 160:  &#xD;Line 161:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 508, 4, true);&#xD;Line 162:  &#xD;Line 163:  WriteLiteral(&amp;quot;    &amp;quot;);&#xD;Line 164:  &#xD;Line 165:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 508, 4, true);&#xD;Line 166:  &#xD;Line 167:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 513, 38, false);&#xD;Line 168:  &#xD;Line 169:              &#xD;Line 170:              #line 11 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot;&#xD;Line 171:  Write(Styles.Render(&amp;quot;~/Content/TheamOnecss&amp;quot;));&#xD;Line 172:  &#xD;Line 173:              &#xD;Line 174:              #line default&#xD;Line 175:              #line hidden&#xD;Line 176:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 513, 38, false);&#xD;Line 177:  &#xD;Line 178:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 551, 18, true);&#xD;Line 179:  &#xD;Line 180:  WriteLiteral(&amp;quot;\r\n\r\n&amp;lt;/head&amp;gt;\r\n&amp;lt;body&amp;quot;);&#xD;Line 181:  &#xD;Line 182:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 551, 18, true);&#xD;Line 183:  &#xD;Line 184:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 569, 12, true);&#xD;Line 185:  &#xD;Line 186:  WriteLiteral(&amp;quot; id=\&amp;quot;myPage\&amp;quot;&amp;quot;);&#xD;Line 187:  &#xD;Line 188:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 569, 12, true);&#xD;Line 189:  &#xD;Line 190:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 581, 18, true);&#xD;Line 191:  &#xD;Line 192:  WriteLiteral(&amp;quot; data-spy=\&amp;quot;scroll\&amp;quot;&amp;quot;);&#xD;Line 193:  &#xD;Line 194:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 581, 18, true);&#xD;Line 195:  &#xD;Line 196:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 599, 22, true);&#xD;Line 197:  &#xD;Line 198:  WriteLiteral(&amp;quot; data-target=\&amp;quot;.navbar\&amp;quot;&amp;quot;);&#xD;Line 199:  &#xD;Line 200:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 599, 22, true);&#xD;Line 201:  &#xD;Line 202:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 621, 17, true);&#xD;Line 203:  &#xD;Line 204:  WriteLiteral(&amp;quot; data-offset=\&amp;quot;60\&amp;quot;&amp;quot;);&#xD;Line 205:  &#xD;Line 206:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 621, 17, true);&#xD;Line 207:  &#xD;Line 208:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 638, 13, true);&#xD;Line 209:  &#xD;Line 210:  WriteLiteral(&amp;quot;&amp;gt;\r\n\r\n    &amp;lt;nav&amp;quot;);&#xD;Line 211:  &#xD;Line 212:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 638, 13, true);&#xD;Line 213:  &#xD;Line 214:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 651, 47, true);&#xD;Line 215:  &#xD;Line 216:  WriteLiteral(&amp;quot; class=\&amp;quot;navbar navbar-default navbar-fixed-top\&amp;quot;&amp;quot;);&#xD;Line 217:  &#xD;Line 218:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 651, 47, true);&#xD;Line 219:  &#xD;Line 220:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 698, 15, true);&#xD;Line 221:  &#xD;Line 222:  WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;div&amp;quot;);&#xD;Line 223:  &#xD;Line 224:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 698, 15, true);&#xD;Line 225:  &#xD;Line 226:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 713, 18, true);&#xD;Line 227:  &#xD;Line 228:  WriteLiteral(&amp;quot; class=\&amp;quot;container\&amp;quot;&amp;quot;);&#xD;Line 229:  &#xD;Line 230:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 713, 18, true);&#xD;Line 231:  &#xD;Line 232:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 731, 19, true);&#xD;Line 233:  &#xD;Line 234:  WriteLiteral(&amp;quot;&amp;gt;\r\n            &amp;lt;div&amp;quot;);&#xD;Line 235:  &#xD;Line 236:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 731, 19, true);&#xD;Line 237:  &#xD;Line 238:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 750, 22, true);&#xD;Line 239:  &#xD;Line 240:  WriteLiteral(&amp;quot; class=\&amp;quot;navbar-header\&amp;quot;&amp;quot;);&#xD;Line 241:  &#xD;Line 242:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 750, 22, true);&#xD;Line 243:  &#xD;Line 244:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 772, 26, true);&#xD;Line 245:  &#xD;Line 246:  WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;lt;button&amp;quot;);&#xD;Line 247:  &#xD;Line 248:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 772, 26, true);&#xD;Line 249:  &#xD;Line 250:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 798, 14, true);&#xD;Line 251:  &#xD;Line 252:  WriteLiteral(&amp;quot; type=\&amp;quot;button\&amp;quot;&amp;quot;);&#xD;Line 253:  &#xD;Line 254:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 798, 14, true);&#xD;Line 255:  &#xD;Line 256:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 812, 22, true);&#xD;Line 257:  &#xD;Line 258:  WriteLiteral(&amp;quot; class=\&amp;quot;navbar-toggle\&amp;quot;&amp;quot;);&#xD;Line 259:  &#xD;Line 260:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 812, 22, true);&#xD;Line 261:  &#xD;Line 262:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 834, 23, true);&#xD;Line 263:  &#xD;Line 264:  WriteLiteral(&amp;quot; data-toggle=\&amp;quot;collapse\&amp;quot;&amp;quot;);&#xD;Line 265:  &#xD;Line 266:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 834, 23, true);&#xD;Line 267:  &#xD;Line 268:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 857, 24, true);&#xD;Line 269:  &#xD;Line 270:  WriteLiteral(&amp;quot; data-target=\&amp;quot;#myNavbar\&amp;quot;&amp;quot;);&#xD;Line 271:  &#xD;Line 272:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 857, 24, true);&#xD;Line 273:  &#xD;Line 274:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 881, 28, true);&#xD;Line 275:  &#xD;Line 276:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;span&amp;quot;);&#xD;Line 277:  &#xD;Line 278:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 881, 28, true);&#xD;Line 279:  &#xD;Line 280:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 909, 17, true);&#xD;Line 281:  &#xD;Line 282:  WriteLiteral(&amp;quot; class=\&amp;quot;icon-bar\&amp;quot;&amp;quot;);&#xD;Line 283:  &#xD;Line 284:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 909, 17, true);&#xD;Line 285:  &#xD;Line 286:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 926, 35, true);&#xD;Line 287:  &#xD;Line 288:  WriteLiteral(&amp;quot;&amp;gt;&amp;lt;/span&amp;gt;\r\n                    &amp;lt;span&amp;quot;);&#xD;Line 289:  &#xD;Line 290:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 926, 35, true);&#xD;Line 291:  &#xD;Line 292:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 961, 17, true);&#xD;Line 293:  &#xD;Line 294:  WriteLiteral(&amp;quot; class=\&amp;quot;icon-bar\&amp;quot;&amp;quot;);&#xD;Line 295:  &#xD;Line 296:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 961, 17, true);&#xD;Line 297:  &#xD;Line 298:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 978, 35, true);&#xD;Line 299:  &#xD;Line 300:  WriteLiteral(&amp;quot;&amp;gt;&amp;lt;/span&amp;gt;\r\n                    &amp;lt;span&amp;quot;);&#xD;Line 301:  &#xD;Line 302:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 978, 35, true);&#xD;Line 303:  &#xD;Line 304:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1013, 17, true);&#xD;Line 305:  &#xD;Line 306:  WriteLiteral(&amp;quot; class=\&amp;quot;icon-bar\&amp;quot;&amp;quot;);&#xD;Line 307:  &#xD;Line 308:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1013, 17, true);&#xD;Line 309:  &#xD;Line 310:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1030, 55, true);&#xD;Line 311:  &#xD;Line 312:  WriteLiteral(&amp;quot;&amp;gt;&amp;lt;/span&amp;gt;\r\n                &amp;lt;/button&amp;gt;\r\n                &amp;lt;a&amp;quot;);&#xD;Line 313:  &#xD;Line 314:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1030, 55, true);&#xD;Line 315:  &#xD;Line 316:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1085, 21, true);&#xD;Line 317:  &#xD;Line 318:  WriteLiteral(&amp;quot; class=\&amp;quot;navbar-brand\&amp;quot;&amp;quot;);&#xD;Line 319:  &#xD;Line 320:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1085, 21, true);&#xD;Line 321:  &#xD;Line 322:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1106, 15, true);&#xD;Line 323:  &#xD;Line 324:  WriteLiteral(&amp;quot; href=\&amp;quot;#myPage\&amp;quot;&amp;quot;);&#xD;Line 325:  &#xD;Line 326:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1106, 15, true);&#xD;Line 327:  &#xD;Line 328:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1121, 27, true);&#xD;Line 329:  &#xD;Line 330:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;div&amp;quot;);&#xD;Line 331:  &#xD;Line 332:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1121, 27, true);&#xD;Line 333:  &#xD;Line 334:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1148, 25, true);&#xD;Line 335:  &#xD;Line 336:  WriteLiteral(&amp;quot; class=\&amp;quot;i-desk-logo-wrap\&amp;quot;&amp;quot;);&#xD;Line 337:  &#xD;Line 338:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1148, 25, true);&#xD;Line 339:  &#xD;Line 340:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1173, 31, true);&#xD;Line 341:  &#xD;Line 342:  WriteLiteral(&amp;quot;&amp;gt;\r\n                        &amp;lt;div&amp;quot;);&#xD;Line 343:  &#xD;Line 344:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1173, 31, true);&#xD;Line 345:  &#xD;Line 346:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1204, 20, true);&#xD;Line 347:  &#xD;Line 348:  WriteLiteral(&amp;quot; class=\&amp;quot;i-desk-logo\&amp;quot;&amp;quot;);&#xD;Line 349:  &#xD;Line 350:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1204, 20, true);&#xD;Line 351:  &#xD;Line 352:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1224, 36, true);&#xD;Line 353:  &#xD;Line 354:  WriteLiteral(&amp;quot;&amp;gt;\r\n                            &amp;lt;span&amp;quot;);&#xD;Line 355:  &#xD;Line 356:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1224, 36, true);&#xD;Line 357:  &#xD;Line 358:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1260, 19, true);&#xD;Line 359:  &#xD;Line 360:  WriteLiteral(&amp;quot; class=\&amp;quot;i-logo-txt\&amp;quot;&amp;quot;);&#xD;Line 361:  &#xD;Line 362:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1260, 19, true);&#xD;Line 363:  &#xD;Line 364:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1279, 49, true);&#xD;Line 365:  &#xD;Line 366:  WriteLiteral(&amp;quot;&amp;gt;Inkarn&amp;lt;/span&amp;gt;\r\n                            &amp;lt;span&amp;quot;);&#xD;Line 367:  &#xD;Line 368:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1279, 49, true);&#xD;Line 369:  &#xD;Line 370:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1328, 17, true);&#xD;Line 371:  &#xD;Line 372:  WriteLiteral(&amp;quot; class=\&amp;quot;i-slogan\&amp;quot;&amp;quot;);&#xD;Line 373:  &#xD;Line 374:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1328, 17, true);&#xD;Line 375:  &#xD;Line 376:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1345, 159, true);&#xD;Line 377:  &#xD;Line 378:  WriteLiteral(&amp;quot;&amp;gt;Find the best prices near you&amp;lt;/span&amp;gt;\r\n                        &amp;lt;/div&amp;gt;\r\n\r\n        &amp;quot; +&#xD;Line 379:  &amp;quot;            &amp;lt;/div&amp;gt;\r\n                &amp;lt;/a&amp;gt;\r\n            &amp;lt;/div&amp;gt;\r\n            &amp;lt;div&amp;quot;);&#xD;Line 380:  &#xD;Line 381:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1345, 159, true);&#xD;Line 382:  &#xD;Line 383:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1504, 33, true);&#xD;Line 384:  &#xD;Line 385:  WriteLiteral(&amp;quot; class=\&amp;quot;collapse navbar-collapse\&amp;quot;&amp;quot;);&#xD;Line 386:  &#xD;Line 387:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1504, 33, true);&#xD;Line 388:  &#xD;Line 389:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1537, 14, true);&#xD;Line 390:  &#xD;Line 391:  WriteLiteral(&amp;quot; id=\&amp;quot;myNavbar\&amp;quot;&amp;quot;);&#xD;Line 392:  &#xD;Line 393:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1537, 14, true);&#xD;Line 394:  &#xD;Line 395:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1551, 22, true);&#xD;Line 396:  &#xD;Line 397:  WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;lt;ul&amp;quot;);&#xD;Line 398:  &#xD;Line 399:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1551, 22, true);&#xD;Line 400:  &#xD;Line 401:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1573, 36, true);&#xD;Line 402:  &#xD;Line 403:  WriteLiteral(&amp;quot; class=\&amp;quot;nav navbar-nav navbar-right\&amp;quot;&amp;quot;);&#xD;Line 404:  &#xD;Line 405:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1573, 36, true);&#xD;Line 406:  &#xD;Line 407:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1609, 55, true);&#xD;Line 408:  &#xD;Line 409:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;li&amp;gt;\r\n                        &amp;lt;a&amp;quot;);&#xD;Line 410:  &#xD;Line 411:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1609, 55, true);&#xD;Line 412:  &#xD;Line 413:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1664, 13, true);&#xD;Line 414:  &#xD;Line 415:  WriteLiteral(&amp;quot; href=\&amp;quot;#home\&amp;quot;&amp;quot;);&#xD;Line 416:  &#xD;Line 417:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1664, 13, true);&#xD;Line 418:  &#xD;Line 419:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1677, 11, true);&#xD;Line 420:  &#xD;Line 421:  WriteLiteral(&amp;quot;&amp;gt;Home&amp;lt;/a&amp;gt;\r\n&amp;quot;);&#xD;Line 422:  &#xD;Line 423:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1677, 11, true);&#xD;Line 424:  &#xD;Line 425:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1688, 24, true);&#xD;Line 426:  &#xD;Line 427:  WriteLiteral(&amp;quot;                        &amp;quot;);&#xD;Line 428:  &#xD;Line 429:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1688, 24, true);&#xD;Line 430:  &#xD;Line 431:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1713, 65, false);&#xD;Line 432:  &#xD;Line 433:              &#xD;Line 434:              #line 38 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot;&#xD;Line 435:                     Write(Html.ActionLink(&amp;quot;Home&amp;quot;, &amp;quot;Index&amp;quot;, &amp;quot;Home&amp;quot;, new { area = &amp;quot;&amp;quot; }, null));&#xD;Line 436:  &#xD;Line 437:              &#xD;Line 438:              #line default&#xD;Line 439:              #line hidden&#xD;Line 440:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1713, 65, false);&#xD;Line 441:  &#xD;Line 442:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1778, 55, true);&#xD;Line 443:  &#xD;Line 444:  WriteLiteral(&amp;quot;\r\n                    &amp;lt;/li&amp;gt;\r\n                    &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 445:  &#xD;Line 446:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1778, 55, true);&#xD;Line 447:  &#xD;Line 448:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1833, 16, true);&#xD;Line 449:  &#xD;Line 450:  WriteLiteral(&amp;quot; href=\&amp;quot;#aboutus\&amp;quot;&amp;quot;);&#xD;Line 451:  &#xD;Line 452:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1833, 16, true);&#xD;Line 453:  &#xD;Line 454:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1849, 46, true);&#xD;Line 455:  &#xD;Line 456:  WriteLiteral(&amp;quot;&amp;gt;About Us&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                    &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 457:  &#xD;Line 458:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1849, 46, true);&#xD;Line 459:  &#xD;Line 460:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1895, 18, true);&#xD;Line 461:  &#xD;Line 462:  WriteLiteral(&amp;quot; href=\&amp;quot;#contactus\&amp;quot;&amp;quot;);&#xD;Line 463:  &#xD;Line 464:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1895, 18, true);&#xD;Line 465:  &#xD;Line 466:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1913, 45, true);&#xD;Line 467:  &#xD;Line 468:  WriteLiteral(&amp;quot;&amp;gt;Contact Us&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                &amp;lt;/ul&amp;gt;\r\n&amp;quot;);&#xD;Line 469:  &#xD;Line 470:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1913, 45, true);&#xD;Line 471:  &#xD;Line 472:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1958, 16, true);&#xD;Line 473:  &#xD;Line 474:  WriteLiteral(&amp;quot;                &amp;quot;);&#xD;Line 475:  &#xD;Line 476:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1958, 16, true);&#xD;Line 477:  &#xD;Line 478:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1975, 29, false);&#xD;Line 479:  &#xD;Line 480:              &#xD;Line 481:              #line 43 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot;&#xD;Line 482:             Write(Html.Partial(&amp;quot;_LoginPartial&amp;quot;));&#xD;Line 483:  &#xD;Line 484:              &#xD;Line 485:              #line default&#xD;Line 486:              #line hidden&#xD;Line 487:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1975, 29, false);&#xD;Line 488:  &#xD;Line 489:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2004, 60, true);&#xD;Line 490:  &#xD;Line 491:  WriteLiteral(&amp;quot;\r\n            &amp;lt;/div&amp;gt;\r\n        &amp;lt;/div&amp;gt;\r\n    &amp;lt;/nav&amp;gt;\r\n\r\n    &amp;lt;div&amp;quot;);&#xD;Line 492:  &#xD;Line 493:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2004, 60, true);&#xD;Line 494:  &#xD;Line 495:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2064, 44, true);&#xD;Line 496:  &#xD;Line 497:  WriteLiteral(&amp;quot; class=\&amp;quot;jumbotron i-home-banner text-center\&amp;quot;&amp;quot;);&#xD;Line 498:  &#xD;Line 499:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2064, 44, true);&#xD;Line 500:  &#xD;Line 501:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2108, 15, true);&#xD;Line 502:  &#xD;Line 503:  WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;div&amp;quot;);&#xD;Line 504:  &#xD;Line 505:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2108, 15, true);&#xD;Line 506:  &#xD;Line 507:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2123, 22, true);&#xD;Line 508:  &#xD;Line 509:  WriteLiteral(&amp;quot; class=\&amp;quot;i-banner-form\&amp;quot;&amp;quot;);&#xD;Line 510:  &#xD;Line 511:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2123, 22, true);&#xD;Line 512:  &#xD;Line 513:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2145, 19, true);&#xD;Line 514:  &#xD;Line 515:  WriteLiteral(&amp;quot;&amp;gt;\r\n            &amp;lt;div&amp;quot;);&#xD;Line 516:  &#xD;Line 517:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2145, 19, true);&#xD;Line 518:  &#xD;Line 519:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2164, 25, true);&#xD;Line 520:  &#xD;Line 521:  WriteLiteral(&amp;quot; class=\&amp;quot;i-desk-logo-wrap\&amp;quot;&amp;quot;);&#xD;Line 522:  &#xD;Line 523:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2164, 25, true);&#xD;Line 524:  &#xD;Line 525:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2189, 23, true);&#xD;Line 526:  &#xD;Line 527:  WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 528:  &#xD;Line 529:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2189, 23, true);&#xD;Line 530:  &#xD;Line 531:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2212, 20, true);&#xD;Line 532:  &#xD;Line 533:  WriteLiteral(&amp;quot; class=\&amp;quot;i-desk-logo\&amp;quot;&amp;quot;);&#xD;Line 534:  &#xD;Line 535:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2212, 20, true);&#xD;Line 536:  &#xD;Line 537:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2232, 34, true);&#xD;Line 538:  &#xD;Line 539:  WriteLiteral(&amp;quot;&amp;gt;nkarn&amp;lt;/div&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 540:  &#xD;Line 541:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2232, 34, true);&#xD;Line 542:  &#xD;Line 543:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2266, 17, true);&#xD;Line 544:  &#xD;Line 545:  WriteLiteral(&amp;quot; class=\&amp;quot;i-slogan\&amp;quot;&amp;quot;);&#xD;Line 546:  &#xD;Line 547:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2266, 17, true);&#xD;Line 548:  &#xD;Line 549:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2283, 58, true);&#xD;Line 550:  &#xD;Line 551:  WriteLiteral(&amp;quot;&amp;gt;Find the best prices near you&amp;lt;/div&amp;gt;\r\n            &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;Line 552:  &#xD;Line 553:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2283, 58, true);&#xD;Line 554:  &#xD;Line 555:              &#xD;Line 556:              #line 54 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot;&#xD;Line 557:              &#xD;Line 558:              &#xD;Line 559:              #line default&#xD;Line 560:              #line hidden&#xD;Line 561:              &#xD;Line 562:              #line 54 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot;&#xD;Line 563:                Html.RenderAction(&amp;quot;SearchPanel&amp;quot;, &amp;quot;Home&amp;quot;)&#xD;Line 564:              &#xD;Line 565:              #line default&#xD;Line 566:              #line hidden&#xD;Line 567:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2396, 17, true);&#xD;Line 568:  &#xD;Line 569:  WriteLiteral(&amp;quot;\r\n            &amp;lt;h1&amp;quot;);&#xD;Line 570:  &#xD;Line 571:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2396, 17, true);&#xD;Line 572:  &#xD;Line 573:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2413, 19, true);&#xD;Line 574:  &#xD;Line 575:  WriteLiteral(&amp;quot; class=\&amp;quot;i-home-tlt\&amp;quot;&amp;quot;);&#xD;Line 576:  &#xD;Line 577:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2413, 19, true);&#xD;Line 578:  &#xD;Line 579:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2432, 65, true);&#xD;Line 580:  &#xD;Line 581:  WriteLiteral(&amp;quot;&amp;gt;Take care of yourself&amp;lt;/h1&amp;gt;\r\n        &amp;lt;/div&amp;gt;\r\n    &amp;lt;/div&amp;gt;\r\n    &amp;lt;div&amp;quot;);&#xD;Line 582:  &#xD;Line 583:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2432, 65, true);&#xD;Line 584:  &#xD;Line 585:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2497, 35, true);&#xD;Line 586:  &#xD;Line 587:  WriteLiteral(&amp;quot; class=\&amp;quot;container-fluid i-bor-top6\&amp;quot;&amp;quot;);&#xD;Line 588:  &#xD;Line 589:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2497, 35, true);&#xD;Line 590:  &#xD;Line 591:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2532, 37, true);&#xD;Line 592:  &#xD;Line 593:  WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;footer&amp;gt;\r\n            &amp;lt;div&amp;quot;);&#xD;Line 594:  &#xD;Line 595:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2532, 37, true);&#xD;Line 596:  &#xD;Line 597:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2569, 22, true);&#xD;Line 598:  &#xD;Line 599:  WriteLiteral(&amp;quot; class=\&amp;quot;row slideanim\&amp;quot;&amp;quot;);&#xD;Line 600:  &#xD;Line 601:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2569, 22, true);&#xD;Line 602:  &#xD;Line 603:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2591, 23, true);&#xD;Line 604:  &#xD;Line 605:  WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 606:  &#xD;Line 607:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2591, 23, true);&#xD;Line 608:  &#xD;Line 609:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2614, 31, true);&#xD;Line 610:  &#xD;Line 611:  WriteLiteral(&amp;quot; class=\&amp;quot;col-md-6 col-md-push-6\&amp;quot;&amp;quot;);&#xD;Line 612:  &#xD;Line 613:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2614, 31, true);&#xD;Line 614:  &#xD;Line 615:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2645, 76, true);&#xD;Line 616:  &#xD;Line 617:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;!-- Contact Form START --&amp;gt;\r\n                    &amp;lt;div&amp;quot;);&#xD;Line 618:  &#xD;Line 619:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2645, 76, true);&#xD;Line 620:  &#xD;Line 621:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2721, 13, true);&#xD;Line 622:  &#xD;Line 623:  WriteLiteral(&amp;quot; id=\&amp;quot;contact\&amp;quot;&amp;quot;);&#xD;Line 624:  &#xD;Line 625:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2721, 13, true);&#xD;Line 626:  &#xD;Line 627:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2734, 23, true);&#xD;Line 628:  &#xD;Line 629:  WriteLiteral(&amp;quot; class=\&amp;quot;i-contact-form\&amp;quot;&amp;quot;);&#xD;Line 630:  &#xD;Line 631:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2734, 23, true);&#xD;Line 632:  &#xD;Line 633:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2757, 81, true);&#xD;Line 634:  &#xD;Line 635:  WriteLiteral(&amp;quot;&amp;gt;\r\n                        &amp;lt;h4&amp;gt;Give A Feedback&amp;lt;/h4&amp;gt;\r\n                        &amp;lt;div&amp;quot; +&#xD;Line 636:  &amp;quot;&amp;quot;);&#xD;Line 637:  &#xD;Line 638:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2757, 81, true);&#xD;Line 639:  &#xD;Line 640:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2838, 12, true);&#xD;Line 641:  &#xD;Line 642:  WriteLiteral(&amp;quot; class=\&amp;quot;row\&amp;quot;&amp;quot;);&#xD;Line 643:  &#xD;Line 644:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2838, 12, true);&#xD;Line 645:  &#xD;Line 646:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2850, 35, true);&#xD;Line 647:  &#xD;Line 648:  WriteLiteral(&amp;quot;&amp;gt;\r\n                            &amp;lt;div&amp;quot;);&#xD;Line 649:  &#xD;Line 650:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2850, 35, true);&#xD;Line 651:  &#xD;Line 652:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2885, 29, true);&#xD;Line 653:  &#xD;Line 654:  WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-12 form-group\&amp;quot;&amp;quot;);&#xD;Line 655:  &#xD;Line 656:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2885, 29, true);&#xD;Line 657:  &#xD;Line 658:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2914, 44, true);&#xD;Line 659:  &#xD;Line 660:  WriteLiteral(&amp;quot;&amp;gt;\r\n                                &amp;lt;textarea&amp;quot;);&#xD;Line 661:  &#xD;Line 662:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2914, 44, true);&#xD;Line 663:  &#xD;Line 664:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2958, 21, true);&#xD;Line 665:  &#xD;Line 666:  WriteLiteral(&amp;quot; class=\&amp;quot;form-control\&amp;quot;&amp;quot;);&#xD;Line 667:  &#xD;Line 668:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2958, 21, true);&#xD;Line 669:  &#xD;Line 670:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2979, 14, true);&#xD;Line 671:  &#xD;Line 672:  WriteLiteral(&amp;quot; id=\&amp;quot;comments\&amp;quot;&amp;quot;);&#xD;Line 673:  &#xD;Line 674:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2979, 14, true);&#xD;Line 675:  &#xD;Line 676:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2993, 16, true);&#xD;Line 677:  &#xD;Line 678:  WriteLiteral(&amp;quot; name=\&amp;quot;comments\&amp;quot;&amp;quot;);&#xD;Line 679:  &#xD;Line 680:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2993, 16, true);&#xD;Line 681:  &#xD;Line 682:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3009, 42, true);&#xD;Line 683:  &#xD;Line 684:  WriteLiteral(&amp;quot; placeholder=\&amp;quot;Write Your Comment Here ...\&amp;quot;&amp;quot;);&#xD;Line 685:  &#xD;Line 686:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3009, 42, true);&#xD;Line 687:  &#xD;Line 688:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3051, 9, true);&#xD;Line 689:  &#xD;Line 690:  WriteLiteral(&amp;quot; rows=\&amp;quot;5\&amp;quot;&amp;quot;);&#xD;Line 691:  &#xD;Line 692:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3051, 9, true);&#xD;Line 693:  &#xD;Line 694:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3060, 82, true);&#xD;Line 695:  &#xD;Line 696:  WriteLiteral(&amp;quot;&amp;gt;&amp;lt;/textarea&amp;gt;\r\n                            &amp;lt;/div&amp;gt;\r\n                            &amp;lt;di&amp;quot; +&#xD;Line 697:  &amp;quot;v&amp;quot;);&#xD;Line 698:  &#xD;Line 699:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3060, 82, true);&#xD;Line 700:  &#xD;Line 701:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3142, 29, true);&#xD;Line 702:  &#xD;Line 703:  WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-12 form-group\&amp;quot;&amp;quot;);&#xD;Line 704:  &#xD;Line 705:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3142, 29, true);&#xD;Line 706:  &#xD;Line 707:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3171, 42, true);&#xD;Line 708:  &#xD;Line 709:  WriteLiteral(&amp;quot;&amp;gt;\r\n                                &amp;lt;button&amp;quot;);&#xD;Line 710:  &#xD;Line 711:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3171, 42, true);&#xD;Line 712:  &#xD;Line 713:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3213, 34, true);&#xD;Line 714:  &#xD;Line 715:  WriteLiteral(&amp;quot; class=\&amp;quot;btn btn-warning pull-left\&amp;quot;&amp;quot;);&#xD;Line 716:  &#xD;Line 717:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3213, 34, true);&#xD;Line 718:  &#xD;Line 719:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3247, 14, true);&#xD;Line 720:  &#xD;Line 721:  WriteLiteral(&amp;quot; type=\&amp;quot;submit\&amp;quot;&amp;quot;);&#xD;Line 722:  &#xD;Line 723:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3247, 14, true);&#xD;Line 724:  &#xD;Line 725:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3261, 205, true);&#xD;Line 726:  &#xD;Line 727:  WriteLiteral(&amp;quot;&amp;gt;Submit&amp;lt;/button&amp;gt;\r\n                            &amp;lt;/div&amp;gt;\r\n                        &amp;lt;/d&amp;quot; +&#xD;Line 728:  &amp;quot;iv&amp;gt;\r\n                    &amp;lt;/div&amp;gt;\r\n                    &amp;lt;!-- Contact Form END --&amp;gt;\r\n&amp;quot; +&#xD;Line 729:  &amp;quot;                &amp;lt;/div&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 730:  &#xD;Line 731:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3261, 205, true);&#xD;Line 732:  &#xD;Line 733:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3466, 45, true);&#xD;Line 734:  &#xD;Line 735:  WriteLiteral(&amp;quot; class=\&amp;quot;col-md-6 col-md-pull-6 i-footer-link\&amp;quot;&amp;quot;);&#xD;Line 736:  &#xD;Line 737:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3466, 45, true);&#xD;Line 738:  &#xD;Line 739:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3511, 27, true);&#xD;Line 740:  &#xD;Line 741:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;div&amp;quot;);&#xD;Line 742:  &#xD;Line 743:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3511, 27, true);&#xD;Line 744:  &#xD;Line 745:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3538, 12, true);&#xD;Line 746:  &#xD;Line 747:  WriteLiteral(&amp;quot; class=\&amp;quot;row\&amp;quot;&amp;quot;);&#xD;Line 748:  &#xD;Line 749:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3538, 12, true);&#xD;Line 750:  &#xD;Line 751:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3550, 31, true);&#xD;Line 752:  &#xD;Line 753:  WriteLiteral(&amp;quot;&amp;gt;\r\n                        &amp;lt;div&amp;quot;);&#xD;Line 754:  &#xD;Line 755:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3550, 31, true);&#xD;Line 756:  &#xD;Line 757:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3581, 26, true);&#xD;Line 758:  &#xD;Line 759:  WriteLiteral(&amp;quot; class=\&amp;quot;col-xs-6 col-md-6\&amp;quot;&amp;quot;);&#xD;Line 760:  &#xD;Line 761:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3581, 26, true);&#xD;Line 762:  &#xD;Line 763:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3607, 123, true);&#xD;Line 764:  &#xD;Line 765:  WriteLiteral(&amp;quot;&amp;gt;\r\n                            &amp;lt;h4&amp;gt;Corporate&amp;lt;/h4&amp;gt;\r\n                            &amp;lt;u&amp;quot; +&#xD;Line 766:  &amp;quot;l&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 767:  &#xD;Line 768:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3607, 123, true);&#xD;Line 769:  &#xD;Line 770:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3730, 26, true);&#xD;Line 771:  &#xD;Line 772:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 773:  &#xD;Line 774:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3730, 26, true);&#xD;Line 775:  &#xD;Line 776:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3756, 17, true);&#xD;Line 777:  &#xD;Line 778:  WriteLiteral(&amp;quot; title=\&amp;quot;About us\&amp;quot;&amp;quot;);&#xD;Line 779:  &#xD;Line 780:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3756, 17, true);&#xD;Line 781:  &#xD;Line 782:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3773, 58, true);&#xD;Line 783:  &#xD;Line 784:  WriteLiteral(&amp;quot;&amp;gt;About us&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 785:  &#xD;Line 786:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3773, 58, true);&#xD;Line 787:  &#xD;Line 788:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3831, 26, true);&#xD;Line 789:  &#xD;Line 790:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 791:  &#xD;Line 792:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3831, 26, true);&#xD;Line 793:  &#xD;Line 794:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3857, 19, true);&#xD;Line 795:  &#xD;Line 796:  WriteLiteral(&amp;quot; title=\&amp;quot;Contact us\&amp;quot;&amp;quot;);&#xD;Line 797:  &#xD;Line 798:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3857, 19, true);&#xD;Line 799:  &#xD;Line 800:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3876, 60, true);&#xD;Line 801:  &#xD;Line 802:  WriteLiteral(&amp;quot;&amp;gt;Contact us&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 803:  &#xD;Line 804:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3876, 60, true);&#xD;Line 805:  &#xD;Line 806:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3936, 26, true);&#xD;Line 807:  &#xD;Line 808:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 809:  &#xD;Line 810:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3936, 26, true);&#xD;Line 811:  &#xD;Line 812:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3962, 27, true);&#xD;Line 813:  &#xD;Line 814:  WriteLiteral(&amp;quot; title=\&amp;quot;Terms &amp;amp; Conditions\&amp;quot;&amp;quot;);&#xD;Line 815:  &#xD;Line 816:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3962, 27, true);&#xD;Line 817:  &#xD;Line 818:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3989, 68, true);&#xD;Line 819:  &#xD;Line 820:  WriteLiteral(&amp;quot;&amp;gt;Terms &amp;amp; Conditions&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 821:  &#xD;Line 822:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3989, 68, true);&#xD;Line 823:  &#xD;Line 824:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4057, 26, true);&#xD;Line 825:  &#xD;Line 826:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 827:  &#xD;Line 828:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4057, 26, true);&#xD;Line 829:  &#xD;Line 830:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4083, 23, true);&#xD;Line 831:  &#xD;Line 832:  WriteLiteral(&amp;quot; title=\&amp;quot;Privacy policy\&amp;quot;&amp;quot;);&#xD;Line 833:  &#xD;Line 834:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4083, 23, true);&#xD;Line 835:  &#xD;Line 836:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4106, 64, true);&#xD;Line 837:  &#xD;Line 838:  WriteLiteral(&amp;quot;&amp;gt;Privacy policy&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 839:  &#xD;Line 840:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4106, 64, true);&#xD;Line 841:  &#xD;Line 842:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4170, 26, true);&#xD;Line 843:  &#xD;Line 844:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 845:  &#xD;Line 846:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4170, 26, true);&#xD;Line 847:  &#xD;Line 848:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4196, 25, true);&#xD;Line 849:  &#xD;Line 850:  WriteLiteral(&amp;quot; title=\&amp;quot;Copyright policy\&amp;quot;&amp;quot;);&#xD;Line 851:  &#xD;Line 852:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4196, 25, true);&#xD;Line 853:  &#xD;Line 854:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4221, 123, true);&#xD;Line 855:  &#xD;Line 856:  WriteLiteral(&amp;quot;&amp;gt;Copyright policy&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                            &amp;lt;/ul&amp;gt;\r\n                  &amp;quot; +&#xD;Line 857:  &amp;quot;      &amp;lt;/div&amp;gt;\r\n                        &amp;lt;div&amp;quot;);&#xD;Line 858:  &#xD;Line 859:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4221, 123, true);&#xD;Line 860:  &#xD;Line 861:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4344, 17, true);&#xD;Line 862:  &#xD;Line 863:  WriteLiteral(&amp;quot; class=\&amp;quot;col-xs-6\&amp;quot;&amp;quot;);&#xD;Line 864:  &#xD;Line 865:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4344, 17, true);&#xD;Line 866:  &#xD;Line 867:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4361, 124, true);&#xD;Line 868:  &#xD;Line 869:  WriteLiteral(&amp;quot;&amp;gt;\r\n                            &amp;lt;h4&amp;gt;Top Cities&amp;lt;/h4&amp;gt;\r\n                            &amp;lt;&amp;quot; +&#xD;Line 870:  &amp;quot;ul&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 871:  &#xD;Line 872:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4361, 124, true);&#xD;Line 873:  &#xD;Line 874:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4485, 26, true);&#xD;Line 875:  &#xD;Line 876:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 877:  &#xD;Line 878:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4485, 26, true);&#xD;Line 879:  &#xD;Line 880:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4511, 16, true);&#xD;Line 881:  &#xD;Line 882:  WriteLiteral(&amp;quot; title=\&amp;quot;Chicago\&amp;quot;&amp;quot;);&#xD;Line 883:  &#xD;Line 884:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4511, 16, true);&#xD;Line 885:  &#xD;Line 886:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4527, 57, true);&#xD;Line 887:  &#xD;Line 888:  WriteLiteral(&amp;quot;&amp;gt;Chicago&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 889:  &#xD;Line 890:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4527, 57, true);&#xD;Line 891:  &#xD;Line 892:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4584, 26, true);&#xD;Line 893:  &#xD;Line 894:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 895:  &#xD;Line 896:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4584, 26, true);&#xD;Line 897:  &#xD;Line 898:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4610, 20, true);&#xD;Line 899:  &#xD;Line 900:  WriteLiteral(&amp;quot; title=\&amp;quot;Atlanta, GA\&amp;quot;&amp;quot;);&#xD;Line 901:  &#xD;Line 902:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4610, 20, true);&#xD;Line 903:  &#xD;Line 904:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4630, 61, true);&#xD;Line 905:  &#xD;Line 906:  WriteLiteral(&amp;quot;&amp;gt;Atlanta, GA&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 907:  &#xD;Line 908:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4630, 61, true);&#xD;Line 909:  &#xD;Line 910:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4691, 26, true);&#xD;Line 911:  &#xD;Line 912:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 913:  &#xD;Line 914:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4691, 26, true);&#xD;Line 915:  &#xD;Line 916:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4717, 20, true);&#xD;Line 917:  &#xD;Line 918:  WriteLiteral(&amp;quot; title=\&amp;quot;Detroit, MI\&amp;quot;&amp;quot;);&#xD;Line 919:  &#xD;Line 920:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4717, 20, true);&#xD;Line 921:  &#xD;Line 922:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4737, 61, true);&#xD;Line 923:  &#xD;Line 924:  WriteLiteral(&amp;quot;&amp;gt;Detroit, MI&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 925:  &#xD;Line 926:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4737, 61, true);&#xD;Line 927:  &#xD;Line 928:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4798, 26, true);&#xD;Line 929:  &#xD;Line 930:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 931:  &#xD;Line 932:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4798, 26, true);&#xD;Line 933:  &#xD;Line 934:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4824, 21, true);&#xD;Line 935:  &#xD;Line 936:  WriteLiteral(&amp;quot; title=\&amp;quot;New York, NY\&amp;quot;&amp;quot;);&#xD;Line 937:  &#xD;Line 938:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4824, 21, true);&#xD;Line 939:  &#xD;Line 940:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4845, 62, true);&#xD;Line 941:  &#xD;Line 942:  WriteLiteral(&amp;quot;&amp;gt;New York, NY&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 943:  &#xD;Line 944:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4845, 62, true);&#xD;Line 945:  &#xD;Line 946:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4907, 26, true);&#xD;Line 947:  &#xD;Line 948:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 949:  &#xD;Line 950:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4907, 26, true);&#xD;Line 951:  &#xD;Line 952:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4933, 19, true);&#xD;Line 953:  &#xD;Line 954:  WriteLiteral(&amp;quot; title=\&amp;quot;Newark, NJ\&amp;quot;&amp;quot;);&#xD;Line 955:  &#xD;Line 956:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4933, 19, true);&#xD;Line 957:  &#xD;Line 958:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4952, 326, true);&#xD;Line 959:  &#xD;Line 960:  WriteLiteral(@&amp;quot;&amp;gt;Newark, NJ&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;&#xD;Line 961:                              &amp;lt;/ul&amp;gt;&#xD;Line 962:                          &amp;lt;/div&amp;gt;&#xD;Line 963:                      &amp;lt;/div&amp;gt;&#xD;Line 964:                  &amp;lt;/div&amp;gt;&#xD;Line 965:              &amp;lt;/div&amp;gt;&#xD;Line 966:  &#xD;Line 967:              &amp;lt;!--  &amp;lt;a href=&amp;quot;&amp;quot;#myPage&amp;quot;&amp;quot; title=&amp;quot;&amp;quot;To Top&amp;quot;&amp;quot;&amp;gt;&#xD;Line 968:                 &amp;lt;span class=&amp;quot;&amp;quot;glyphicon glyphicon-chevron-up&amp;quot;&amp;quot;&amp;gt;&amp;lt;/span&amp;gt;&#xD;Line 969:               &amp;lt;/a&amp;gt; --&amp;gt;&#xD;Line 970:  &#xD;Line 971:              &amp;lt;div&amp;quot;);&#xD;Line 972:  &#xD;Line 973:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4952, 326, true);&#xD;Line 974:  &#xD;Line 975:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5278, 36, true);&#xD;Line 976:  &#xD;Line 977:  WriteLiteral(&amp;quot; class=\&amp;quot;i-copyright-txt text-center\&amp;quot;&amp;quot;);&#xD;Line 978:  &#xD;Line 979:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5278, 36, true);&#xD;Line 980:  &#xD;Line 981:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5314, 60, true);&#xD;Line 982:  &#xD;Line 983:  WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;amp;copy; Copyright\r\n                &amp;lt;script&amp;quot;);&#xD;Line 984:  &#xD;Line 985:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5314, 60, true);&#xD;Line 986:  &#xD;Line 987:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5374, 22, true);&#xD;Line 988:  &#xD;Line 989:  WriteLiteral(&amp;quot; language=\&amp;#39;javascript\&amp;#39;&amp;quot;);&#xD;Line 990:  &#xD;Line 991:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5374, 22, true);&#xD;Line 992:  &#xD;Line 993:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5396, 194, true);&#xD;Line 994:  &#xD;Line 995:  WriteLiteral(&amp;quot;&amp;gt;var yy = (new Date()).getYear(); var year = (yy &amp;lt; 1000) ? yy + 1900 : yy; docume&amp;quot; +&#xD;Line 996:  &amp;quot;nt.write(\&amp;quot;\&amp;quot; + year);&amp;lt;/script&amp;gt; By Inkan. All Rights Reserved.\r\n            &amp;lt;/div&amp;gt;&amp;quot; +&#xD;Line 997:  &amp;quot;\r\n        &amp;lt;/footer&amp;gt;\r\n    &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;Line 998:  &#xD;Line 999:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5396, 194, true);&#xD;Line 1000: &#xD;Line 1001: BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5590, 4, true);&#xD;Line 1002: &#xD;Line 1003: WriteLiteral(&amp;quot;    &amp;quot;);&#xD;Line 1004: &#xD;Line 1005: EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5590, 4, true);&#xD;Line 1006: &#xD;Line 1007: BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5595, 30, false);&#xD;Line 1008: &#xD;Line 1009:             &#xD;Line 1010:             #line 112 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot;&#xD;Line 1011: Write(Scripts.Render(&amp;quot;~/TheamOneJs&amp;quot;));&#xD;Line 1012: &#xD;Line 1013:             &#xD;Line 1014:             #line default&#xD;Line 1015:             #line hidden&#xD;Line 1016: EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5595, 30, false);&#xD;Line 1017: &#xD;Line 1018: BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5625, 2, true);&#xD;Line 1019: &#xD;Line 1020: WriteLiteral(&amp;quot;\r\n&amp;quot;);&#xD;Line 1021: &#xD;Line 1022: EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5625, 2, true);&#xD;Line 1023: &#xD;Line 1024: BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5627, 4, true);&#xD;Line 1025: &#xD;Line 1026: WriteLiteral(&amp;quot;    &amp;quot;);&#xD;Line 1027: &#xD;Line 1028: EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5627, 4, true);&#xD;Line 1029: &#xD;Line 1030: BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5632, 41, false);&#xD;Line 1031: &#xD;Line 1032:             &#xD;Line 1033:             #line 113 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot;&#xD;Line 1034: Write(RenderSection(&amp;quot;scripts&amp;quot;, required: false));&#xD;Line 1035: &#xD;Line 1036:             &#xD;Line 1037:             #line default&#xD;Line 1038:             #line hidden&#xD;Line 1039: EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5632, 41, false);&#xD;Line 1040: &#xD;Line 1041: BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5673, 1659, true);&#xD;Line 1042: &#xD;Line 1043: WriteLiteral(&amp;quot;\r\n    &amp;lt;script&amp;gt;\r\n        $(document).ready(function () {\r\n            // Add smoot&amp;quot; +&#xD;Line 1044: &amp;quot;h scrolling to all links in navbar + footer link\r\n            $(\&amp;quot;.navbar a, foot&amp;quot; +&#xD;Line 1045: &amp;quot;er a[href=\&amp;#39;#myPage\&amp;#39;]\&amp;quot;).on(\&amp;#39;click\&amp;#39;, function (event) {\r\n                // Make s&amp;quot; +&#xD;Line 1046: &amp;quot;ure this.hash has a value before overriding default behavior\r\n                if&amp;quot; +&#xD;Line 1047: &amp;quot; (this.hash !== \&amp;quot;\&amp;quot;) {\r\n                    // Prevent default anchor click behav&amp;quot; +&#xD;Line 1048: &amp;quot;ior\r\n                    event.preventDefault();\r\n\r\n                    // Store&amp;quot; +&#xD;Line 1049: &amp;quot; hash\r\n                    var hash = this.hash;\r\n\r\n                    // Using&amp;quot; +&#xD;Line 1050: &amp;quot; jQuery\&amp;#39;s animate() method to add smooth page scroll\r\n                    // The&amp;quot; +&#xD;Line 1051: &amp;quot; optional number (900) specifies the number of milliseconds it takes to scroll t&amp;quot; +&#xD;Line 1052: &amp;quot;o the specified area\r\n                    $(\&amp;#39;html, body\&amp;#39;).animate({\r\n           &amp;quot; +&#xD;Line 1053: &amp;quot;             scrollTop: $(hash).offset().top\r\n                    }, 900, functi&amp;quot; +&#xD;Line 1054: &amp;quot;on () {\r\n\r\n                        // Add hash (#) to URL when done scrolling (d&amp;quot; +&#xD;Line 1055: &amp;quot;efault click behavior)\r\n                        window.location.hash = hash;\r\n  &amp;quot; +&#xD;Line 1056: &amp;quot;                  });\r\n                } // End if\r\n            });\r\n\r\n         &amp;quot; +&#xD;Line 1057: &amp;quot;   $(window).scroll(function () {\r\n                $(\&amp;quot;.slideanim\&amp;quot;).each(function&amp;quot; +&#xD;Line 1058: &amp;quot; () {\r\n                    var pos = $(this).offset().top;\r\n\r\n                  &amp;quot; +&#xD;Line 1059: &amp;quot;  var winTop = $(window).scrollTop();\r\n                    if (pos &amp;lt; winTop + 60&amp;quot; +&#xD;Line 1060: &amp;quot;0) {\r\n                        $(this).addClass(\&amp;quot;fademein\&amp;quot;);\r\n                   &amp;quot; +&#xD;Line 1061: &amp;quot; }\r\n                });\r\n            });\r\n            $(\&amp;#39;.selectpicker\&amp;#39;).selectp&amp;quot; +&#xD;Line 1062: &amp;quot;icker({\r\n                style: \&amp;#39;btn-info\&amp;#39;,\r\n                size: 4\r\n          &amp;quot; +&#xD;Line 1063: &amp;quot;  });\r\n\r\n\r\n        })\r\n    &amp;lt;/script&amp;gt;\r\n\r\n&amp;lt;/body&amp;gt;\r\n&amp;lt;/html&amp;gt;\r\n&amp;quot;);&#xD;Line 1064: &#xD;Line 1065: EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5673, 1659, true);&#xD;Line 1066: &#xD;Line 1067:         }&#xD;Line 1068:     }&#xD;Line 1069: }&#xD;Line 1070: &lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&#xD;&#xA;    &lt;script type=&quot;text/javascript&quot;&gt;&#xD;&#xA;    function OnToggleTOCLevel1(level2ID)&#xD;&#xA;    {&#xD;&#xA;      var elemLevel2 = document.getElementById(level2ID);&#xD;&#xA;      if (elemLevel2.style.display == ''none'')&#xD;&#xA;      {&#xD;&#xA;        elemLevel2.style.display = '''';&#xD;&#xA;      }&#xD;&#xA;      else {&#xD;&#xA;        elemLevel2.style.display = ''none'';&#xD;&#xA;      }&#xD;&#xA;    }&#xD;&#xA;    &lt;/script&gt;&#xD;&#xA;                          &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;    &lt;/body&gt;&#xD;&#xA;&lt;/html&gt;&#xD;&#xA;">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;Host: localhost:82&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="53051" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'1fd14b06-9966-4deb-900a-310ba2145b14', N'spa_db', N'DATAFUSION-PC', N'System.Web.HttpException', N'System.Web.Mvc', N'A public action method ''SearchPanel'' was not found on controller ''code.Controllers.HomeController''.', N'', 500, CAST(N'2017-07-30 16:40:54.367' AS DateTime), 36, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.Web.HttpException"
  message="A public action method ''SearchPanel'' was not found on controller ''code.Controllers.HomeController''."
  source="System.Web.Mvc"
  detail="System.Web.HttpException (0x80004005): Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''. ---&gt; System.Web.HttpException (0x80004005): Execution of the child request failed. Please examine the InnerException for more information. ---&gt; System.Web.HttpException (0x80004005): A public action method ''SearchPanel'' was not found on controller ''code.Controllers.HomeController''.&#xD;&#xA;   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.HttpHandlerUtil.ServerExecuteHttpHandlerWrapper.&lt;&gt;c__DisplayClass4.&lt;Wrap&gt;b__3()&#xD;&#xA;   at System.Web.Mvc.HttpHandlerUtil.ServerExecuteHttpHandlerWrapper.Wrap[TResult](Func`1 func)&#xD;&#xA;   at System.Web.Mvc.HttpHandlerUtil.ServerExecuteHttpHandlerWrapper.Wrap[TResult](Func`1 func)&#xD;&#xA;   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)&#xD;&#xA;   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)&#xD;&#xA;   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)&#xD;&#xA;   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)&#xD;&#xA;   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)&#xD;&#xA;   at System.Web.Mvc.Html.ChildActionExtensions.RenderAction(HtmlHelper htmlHelper, String actionName, String controllerName)&#xD;&#xA;   at ASP._Page_Views_Shared__Layout_cshtml.Execute() in D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml:line 54&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.&lt;&gt;c__DisplayClass3.&lt;RenderPageCore&gt;b__2(TextWriter writer)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.Write(HelperResult result)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.PopContext()&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2017-07-30T16:40:54.3669944Z"
  statusCode="500">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;Host: localhost:82&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="53070" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'11513ce9-98e5-4750-99bb-37bdca90442f', N'spa_db', N'DATAFUSION-PC', N'System.Web.HttpException', N'System.Web.WebPages', N'The "RenderBody" method has not been called for layout page "~/Views/Shared/_Layout.cshtml".', N'', 500, CAST(N'2017-07-30 16:41:55.713' AS DateTime), 37, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.Web.HttpException"
  message="The &quot;RenderBody&quot; method has not been called for layout page &quot;~/Views/Shared/_Layout.cshtml&quot;."
  source="System.Web.WebPages"
  detail="System.Web.HttpException (0x80004005): The &quot;RenderBody&quot; method has not been called for layout page &quot;~/Views/Shared/_Layout.cshtml&quot;.&#xD;&#xA;   at System.Web.WebPages.WebPageBase.VerifyRenderedBodyOrSections()&#xD;&#xA;   at System.Web.WebPages.WebPageBase.PopContext()&#xD;&#xA;   at System.Web.WebPages.WebPageBase.&lt;&gt;c__DisplayClass3.&lt;RenderPageCore&gt;b__2(TextWriter writer)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.Write(HelperResult result)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.PopContext()&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2017-07-30T16:41:55.7145032Z"
  statusCode="500">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;Host: localhost:82&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="53091" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'169694c5-7e1a-4acd-81e6-1f4a0856d140', N'spa_db', N'DATAFUSION-PC', N'System.NotSupportedException', N'mscorlib', N'The given path''s format is not supported.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 15:06:43.463' AS DateTime), 5, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.NotSupportedException"
  message="The given path''s format is not supported."
  source="mscorlib"
  detail="System.NotSupportedException: The given path''s format is not supported.&#xD;&#xA;   at System.Security.Permissions.FileIOPermission.EmulateFileIOPermissionChecks(String fullPath)&#xD;&#xA;   at System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)&#xD;&#xA;   at System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share, Int32 bufferSize, FileOptions options, String msgPath, Boolean bFromProxy)&#xD;&#xA;   at System.IO.FileStream..ctor(String path, FileMode mode)&#xD;&#xA;   at System.Web.HttpPostedFile.SaveAs(String filename)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Create(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 96"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T15:06:43.4643631Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4760&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundarybs96rs2bvcZRMUXE&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Create&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4760&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundarybs96rs2bvcZRMUXE&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Create&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4760" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundarybs96rs2bvcZRMUXE" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Create" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="51587" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4760" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundarybs96rs2bvcZRMUXE" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Create" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="4ZZRMyx4k3-NTCLBUmB1rwULdTOaNur1BjKpCfLvgsVTVdfZ85hAmwjVlHcNdQcxu17UoKBlgTwcK1az3bQh-WKkdJzRYIQT3hnxJAsMz-w-Jh1sziQ3PcAfQIu5jEXEdTRsl9RjifFS0Mw6ELU9Lg2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="adfs asdf asdf" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="12" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="13" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="14" />
    </item>
    <item
      name="Selectedprices[3].prices">
      <value
        string="15" />
    </item>
    <item
      name="Selectedprices[4].prices">
      <value
        string="16" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'0be01b07-3565-4079-99c4-78c603963f8a', N'spa_db', N'DATAFUSION-PC', N'System.NotSupportedException', N'mscorlib', N'The given path''s format is not supported.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 15:09:02.807' AS DateTime), 6, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.NotSupportedException"
  message="The given path''s format is not supported."
  source="mscorlib"
  detail="System.NotSupportedException: The given path''s format is not supported.&#xD;&#xA;   at System.Security.Permissions.FileIOPermission.EmulateFileIOPermissionChecks(String fullPath)&#xD;&#xA;   at System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)&#xD;&#xA;   at System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share, Int32 bufferSize, FileOptions options, String msgPath, Boolean bFromProxy)&#xD;&#xA;   at System.IO.FileStream..ctor(String path, FileMode mode)&#xD;&#xA;   at System.Web.HttpPostedFile.SaveAs(String filename)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Create(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 96"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T15:09:02.8053329Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4419&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundaryqeKmh6g5skeMRLK6&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Create&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4419&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryqeKmh6g5skeMRLK6&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Create&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4419" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundaryqeKmh6g5skeMRLK6" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Create" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="51607" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4419" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundaryqeKmh6g5skeMRLK6" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Create" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="BIQI6Y8Ur0dDBlk_8kAi6GI9_44Qlm0GTZ3RM3mUOqnfLQw6PHGD8EVUQswC_zgW-LYEcWKHIVHll9nY-wrpEoBx6t0QW7qgdSiZ7kQKIyg-WoSpBT2g5zN0-Y7Hc8J6kgkkrTF8wOIJ_FkN1kPSeA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="adfs asdf asdf" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="13" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="14" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="15" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'd41895ba-afe4-41b7-9570-abbfb975a080', N'spa_db', N'DATAFUSION-PC', N'System.Data.SqlClient.SqlException', N'.Net SqlClient Data Provider', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_spa_prices_CategeogySubCategory". The conflict occurred in database "spa_db", table "dbo.CategeogySubCategory", column ''id''.
The statement has been terminated.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 15:12:14.047' AS DateTime), 7, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.Data.SqlClient.SqlException"
  message="The INSERT statement conflicted with the FOREIGN KEY constraint &quot;FK_spa_prices_CategeogySubCategory&quot;. The conflict occurred in database &quot;spa_db&quot;, table &quot;dbo.CategeogySubCategory&quot;, column ''id''.&#xD;&#xA;The statement has been terminated."
  source=".Net SqlClient Data Provider"
  detail="System.Data.Entity.Infrastructure.DbUpdateException: An error occurred while updating the entries. See the inner exception for details. ---&gt; System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---&gt; System.Data.SqlClient.SqlException: The INSERT statement conflicted with the FOREIGN KEY constraint &quot;FK_spa_prices_CategeogySubCategory&quot;. The conflict occurred in database &quot;spa_db&quot;, table &quot;dbo.CategeogySubCategory&quot;, column ''id''.&#xD;&#xA;The statement has been terminated.&#xD;&#xA;   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)&#xD;&#xA;   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)&#xD;&#xA;   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean&amp; dataReady)&#xD;&#xA;   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()&#xD;&#xA;   at System.Data.SqlClient.SqlDataReader.get_MetaData()&#xD;&#xA;   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)&#xD;&#xA;   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task&amp; task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)&#xD;&#xA;   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task&amp; task, Boolean&amp; usedCache, Boolean asyncWrite, Boolean inRetry)&#xD;&#xA;   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)&#xD;&#xA;   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)&#xD;&#xA;   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)&#xD;&#xA;   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)&#xD;&#xA;   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)&#xD;&#xA;   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()&#xD;&#xA;   --- End of inner exception stack trace ---&#xD;&#xA;   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)&#xD;&#xA;   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)&#xD;&#xA;   at System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   --- End of inner exception stack trace ---&#xD;&#xA;   at System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Create(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 101"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T15:12:14.0472713Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4418&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundaryoEb5CgorMjYHbaIz&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Create&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4418&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryoEb5CgorMjYHbaIz&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Create&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4418" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundaryoEb5CgorMjYHbaIz" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Create" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="51686" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4418" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundaryoEb5CgorMjYHbaIz" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Create" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="f1tA3GLofVYql8Fm0TvoYzxrKDvT2BWSy6nmelIDtb0vds6Z0tertFsuOawP0XaM7Low592z2FEVyRRnkccY5MfKmuaGymMhXibWIhPPhtqhJyiQA_Z42bR-UJIDtvCrKr6vkbt2MMxgKDCPwpfkSg2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="50" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="14" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="16" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'6cf4e663-7cf4-425f-9ecb-444d190a63ea', N'spa_db', N'DATAFUSION-PC', N'System.Data.SqlClient.SqlException', N'.Net SqlClient Data Provider', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_spa_prices_CategeogySubCategory". The conflict occurred in database "spa_db", table "dbo.CategeogySubCategory", column ''id''.
The statement has been terminated.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 15:13:15.463' AS DateTime), 8, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.Data.SqlClient.SqlException"
  message="The INSERT statement conflicted with the FOREIGN KEY constraint &quot;FK_spa_prices_CategeogySubCategory&quot;. The conflict occurred in database &quot;spa_db&quot;, table &quot;dbo.CategeogySubCategory&quot;, column ''id''.&#xD;&#xA;The statement has been terminated."
  source=".Net SqlClient Data Provider"
  detail="System.Data.Entity.Infrastructure.DbUpdateException: An error occurred while updating the entries. See the inner exception for details. ---&gt; System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---&gt; System.Data.SqlClient.SqlException: The INSERT statement conflicted with the FOREIGN KEY constraint &quot;FK_spa_prices_CategeogySubCategory&quot;. The conflict occurred in database &quot;spa_db&quot;, table &quot;dbo.CategeogySubCategory&quot;, column ''id''.&#xD;&#xA;The statement has been terminated.&#xD;&#xA;   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)&#xD;&#xA;   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)&#xD;&#xA;   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean&amp; dataReady)&#xD;&#xA;   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()&#xD;&#xA;   at System.Data.SqlClient.SqlDataReader.get_MetaData()&#xD;&#xA;   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption)&#xD;&#xA;   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task&amp; task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)&#xD;&#xA;   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task&amp; task, Boolean&amp; usedCache, Boolean asyncWrite, Boolean inRetry)&#xD;&#xA;   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)&#xD;&#xA;   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)&#xD;&#xA;   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)&#xD;&#xA;   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)&#xD;&#xA;   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)&#xD;&#xA;   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()&#xD;&#xA;   --- End of inner exception stack trace ---&#xD;&#xA;   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)&#xD;&#xA;   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)&#xD;&#xA;   at System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   --- End of inner exception stack trace ---&#xD;&#xA;   at System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Create(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 101"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T15:13:15.4637842Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4418&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundaryTXSJoouxmBpdAdB0&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Create&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4418&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryTXSJoouxmBpdAdB0&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Create&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4418" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundaryTXSJoouxmBpdAdB0" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Create" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="51706" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Create" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4418" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundaryTXSJoouxmBpdAdB0" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Create" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="mobxJgAjWN8uBas2Kuiabw6gSM5k8SEprjU321FY3eohOHnlAmMXCcCDF-1LzHfz88UAk5zcBZnD9ZVwKaicW2BjP4lwnm3jnYO8jEUoOtKYP0Wi9mBlc9BLLdVT77BBV6RFjlms4NF1_oFdX0OvlA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="50" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="14" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="16" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="QjfNK-YShBM1VHD9-hbEXKerh8iGQdKW8ACBeQmazVGbWBZfh0mY1gQEwpCZGSBiTgqPF1zgiR2THXy_XldPhp68z5o0Zijh0RjVx16f9XHQlTOawCtmcdP-vfG6MP0bddwHSbSy4v8yq06CzZs6-c0GmgeHgzQQO2aYD26JRrMSVtWOXCbMOIx-VqsieaE0xm43gPFi-EqUTeY1LdfBOyaKPiaEpEdxBY_Nai_3_CMWptN1k-kgpjsZyiSXqjx35b2D4nyA15-3LWzGYjGxGlP5cuTTLOeC2623Jf3AwhFm1uapfF6eacih1TF_l0j6mi8xyhk-dG1mmFykGxNcc7p_aF9TvxibJyNSavzPadAPvrW8LdM4FN1JIGN5dmkl6Smx9dIhNam4ahOG9Oj5cy6Fw_0XEx81TYPSykiJtNGjmGwyDSmmo4YlGAo73dUr5XUyQAENK2IagPJiAMv6hnLDIvhUCKvijv_AOQxRWK_KhQls94BEoJ6YW8zIeMtiUM47zsP2tqR6gxQmhXO6EQ" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'54feb945-2ddd-4a48-b8c9-b2577a320f9f', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'EntityFramework', N'The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:29:41.507' AS DateTime), 30, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted."
  source="EntityFramework"
  detail="System.InvalidOperationException: The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.PrepareToSaveChanges(SaveOptions options)&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)&#xD;&#xA;   at System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 270"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:29:41.5067226Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4129&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundaryv0b1vAZabAoU14wA&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4129&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryv0b1vAZabAoU14wA&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4129" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundaryv0b1vAZabAoU14wA" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="63208" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4129" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundaryv0b1vAZabAoU14wA" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="Hpu71z27AA0G_hFoZ1CbXxrwGkz8mjZfPMxbNkAIxIIj9lHOENTeYcihOeh1YhVJvMTf9EkOZeYk8SlHeI1SKaSjCwh6RB1NGzP2nAntU6Fe5n23TMH2z8oqRFqqSQU0NO-BOq24BSDJeYRNUh5JjA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="9" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="62" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="10" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="88" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'6f1a6dcc-0e18-4bf7-9126-39057926ab39', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'EntityFramework', N'The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:30:09.230' AS DateTime), 31, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted."
  source="EntityFramework"
  detail="System.InvalidOperationException: The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.PrepareToSaveChanges(SaveOptions options)&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)&#xD;&#xA;   at System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 270"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:30:09.2303083Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4129&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundarygoT14T6rqTGlhmRq&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4129&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundarygoT14T6rqTGlhmRq&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4129" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundarygoT14T6rqTGlhmRq" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="63238" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4129" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundarygoT14T6rqTGlhmRq" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="P1g7tQoHVXUAagisSxjkzEu26B2y5TW-OGLPTNeL6JL-j5LVUif-tStPald3n4xedJ_iByQIhFg4JSZYd6r53pdP9TKFY4tpKCNF_aiOe2TGhpcZqlB2fK9uV63XmlaLwF6pzSEeYHlU8PaV_PQq-g2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="9" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="62" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="10" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="88" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'a0fb1a63-870e-4b9a-a24d-83201e76462d', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'System.Web.Mvc', N'The view ''Details'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Areas/Admin/Views/spa/Details.aspx
~/Areas/Admin/Views/spa/Details.ascx
~/Areas/Admin/Views/Shared/Details.aspx
~/Areas/Admin/Views/Shared/Details.ascx
~/Views/spa/Details.aspx
~/Views/spa/Details.ascx
~/Views/Shared/Details.aspx
~/Views/Shared/Details.ascx
~/Areas/Admin/Views/spa/Details.cshtml
~/Areas/Admin/Views/spa/Details.vbhtml
~/Areas/Admin/', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-30 15:54:41.873' AS DateTime), 33, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The view ''Details'' or its master was not found or no view engine supports the searched locations. The following locations were searched:&#xD;&#xA;~/Areas/Admin/Views/spa/Details.aspx&#xD;&#xA;~/Areas/Admin/Views/spa/Details.ascx&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.aspx&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.ascx&#xD;&#xA;~/Views/spa/Details.aspx&#xD;&#xA;~/Views/spa/Details.ascx&#xD;&#xA;~/Views/Shared/Details.aspx&#xD;&#xA;~/Views/Shared/Details.ascx&#xD;&#xA;~/Areas/Admin/Views/spa/Details.cshtml&#xD;&#xA;~/Areas/Admin/Views/spa/Details.vbhtml&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.cshtml&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.vbhtml&#xD;&#xA;~/Views/spa/Details.cshtml&#xD;&#xA;~/Views/spa/Details.vbhtml&#xD;&#xA;~/Views/Shared/Details.cshtml&#xD;&#xA;~/Views/Shared/Details.vbhtml"
  source="System.Web.Mvc"
  detail="System.InvalidOperationException: The view ''Details'' or its master was not found or no view engine supports the searched locations. The following locations were searched:&#xD;&#xA;~/Areas/Admin/Views/spa/Details.aspx&#xD;&#xA;~/Areas/Admin/Views/spa/Details.ascx&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.aspx&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.ascx&#xD;&#xA;~/Views/spa/Details.aspx&#xD;&#xA;~/Views/spa/Details.ascx&#xD;&#xA;~/Views/Shared/Details.aspx&#xD;&#xA;~/Views/Shared/Details.ascx&#xD;&#xA;~/Areas/Admin/Views/spa/Details.cshtml&#xD;&#xA;~/Areas/Admin/Views/spa/Details.vbhtml&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.cshtml&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.vbhtml&#xD;&#xA;~/Views/spa/Details.cshtml&#xD;&#xA;~/Views/spa/Details.vbhtml&#xD;&#xA;~/Views/Shared/Details.cshtml&#xD;&#xA;~/Views/Shared/Details.vbhtml&#xD;&#xA;   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-30T15:54:41.8723070Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1; .AspNet.ApplicationCookie=URqKLlddmJBkYx49cqeBGMiV-s9hsxzLMIEIHCW0ZyfmHgJUsogqvB1opnT7rFLTlG4va6cRF-rDfwpbjEC6DwaUgF6c0x5sSPZ7sh7GZUxTOIcllw8yyZaNaZeDiuTa4B3GDopOZ4U1RKjJFT1ac9yHPQhwOgNqfGR6RXLJp99S3wQvI8tcZCy1kex_mchRjbav3ZNWtJcrlkzUJjlqIiQQE-kNAKjoVeCaY1wm5jaA_Do_o8yVhmFLIJtmUDNXJDFmZVfOVcHgYyZxhUM0PPwGPKOq9I2J--cUF5-DSeMrUmfXgShs02s2W7RNv15qp4wkhqMTp_r87rvCoEYsXXaSPzH-NeZvcdx1vuN5Ryo1iN_9R1jH3TT-FqLwZt4a9yu2oJwIyBbHgyLIeEX1VLxCmqHWaWXtsakl6EPCA3EgkNVsRdF4cPymhBLYCV-lsown5cHPmRxj-2JdHzDd49zQBI31MTf-ax4lVzE2UAzB7Fy1pTLwinaKNrwUG2xK95PaK7rl91gWTZDB9b4oVg&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1; .AspNet.ApplicationCookie=URqKLlddmJBkYx49cqeBGMiV-s9hsxzLMIEIHCW0ZyfmHgJUsogqvB1opnT7rFLTlG4va6cRF-rDfwpbjEC6DwaUgF6c0x5sSPZ7sh7GZUxTOIcllw8yyZaNaZeDiuTa4B3GDopOZ4U1RKjJFT1ac9yHPQhwOgNqfGR6RXLJp99S3wQvI8tcZCy1kex_mchRjbav3ZNWtJcrlkzUJjlqIiQQE-kNAKjoVeCaY1wm5jaA_Do_o8yVhmFLIJtmUDNXJDFmZVfOVcHgYyZxhUM0PPwGPKOq9I2J--cUF5-DSeMrUmfXgShs02s2W7RNv15qp4wkhqMTp_r87rvCoEYsXXaSPzH-NeZvcdx1vuN5Ryo1iN_9R1jH3TT-FqLwZt4a9yu2oJwIyBbHgyLIeEX1VLxCmqHWaWXtsakl6EPCA3EgkNVsRdF4cPymhBLYCV-lsown5cHPmRxj-2JdHzDd49zQBI31MTf-ax4lVzE2UAzB7Fy1pTLwinaKNrwUG2xK95PaK7rl91gWTZDB9b4oVg&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Details/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Details\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="52499" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Details/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Details/3" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1; .AspNet.ApplicationCookie=URqKLlddmJBkYx49cqeBGMiV-s9hsxzLMIEIHCW0ZyfmHgJUsogqvB1opnT7rFLTlG4va6cRF-rDfwpbjEC6DwaUgF6c0x5sSPZ7sh7GZUxTOIcllw8yyZaNaZeDiuTa4B3GDopOZ4U1RKjJFT1ac9yHPQhwOgNqfGR6RXLJp99S3wQvI8tcZCy1kex_mchRjbav3ZNWtJcrlkzUJjlqIiQQE-kNAKjoVeCaY1wm5jaA_Do_o8yVhmFLIJtmUDNXJDFmZVfOVcHgYyZxhUM0PPwGPKOq9I2J--cUF5-DSeMrUmfXgShs02s2W7RNv15qp4wkhqMTp_r87rvCoEYsXXaSPzH-NeZvcdx1vuN5Ryo1iN_9R1jH3TT-FqLwZt4a9yu2oJwIyBbHgyLIeEX1VLxCmqHWaWXtsakl6EPCA3EgkNVsRdF4cPymhBLYCV-lsown5cHPmRxj-2JdHzDd49zQBI31MTf-ax4lVzE2UAzB7Fy1pTLwinaKNrwUG2xK95PaK7rl91gWTZDB9b4oVg" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="URqKLlddmJBkYx49cqeBGMiV-s9hsxzLMIEIHCW0ZyfmHgJUsogqvB1opnT7rFLTlG4va6cRF-rDfwpbjEC6DwaUgF6c0x5sSPZ7sh7GZUxTOIcllw8yyZaNaZeDiuTa4B3GDopOZ4U1RKjJFT1ac9yHPQhwOgNqfGR6RXLJp99S3wQvI8tcZCy1kex_mchRjbav3ZNWtJcrlkzUJjlqIiQQE-kNAKjoVeCaY1wm5jaA_Do_o8yVhmFLIJtmUDNXJDFmZVfOVcHgYyZxhUM0PPwGPKOq9I2J--cUF5-DSeMrUmfXgShs02s2W7RNv15qp4wkhqMTp_r87rvCoEYsXXaSPzH-NeZvcdx1vuN5Ryo1iN_9R1jH3TT-FqLwZt4a9yu2oJwIyBbHgyLIeEX1VLxCmqHWaWXtsakl6EPCA3EgkNVsRdF4cPymhBLYCV-lsown5cHPmRxj-2JdHzDd49zQBI31MTf-ax4lVzE2UAzB7Fy1pTLwinaKNrwUG2xK95PaK7rl91gWTZDB9b4oVg" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'6d4b8621-2aca-408e-a274-56da6719cf6f', N'spa_db', N'DATAFUSION-PC', N'System.Web.HttpCompileException', N'System.Web', N'C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web_searchpanel.cshtml.639c3968.lb7wnprw.0.cs(31): error CS0234: The type or namespace name ''SearchModel'' does not exist in the namespace ''code.Models'' (are you missing an assembly reference?)', N'', 500, CAST(N'2017-07-30 17:19:53.860' AS DateTime), 38, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.Web.HttpCompileException"
  message="C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web_searchpanel.cshtml.639c3968.lb7wnprw.0.cs(31): error CS0234: The type or namespace name ''SearchModel'' does not exist in the namespace ''code.Models'' (are you missing an assembly reference?)"
  source="System.Web"
  detail="System.Web.HttpException (0x80004005): Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''. ---&gt; System.Web.HttpCompileException (0x80004005): C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web_searchpanel.cshtml.639c3968.lb7wnprw.0.cs(31): error CS0234: The type or namespace name ''SearchModel'' does not exist in the namespace ''code.Models'' (are you missing an assembly reference?)&#xD;&#xA;   at System.Web.Compilation.AssemblyBuilder.Compile()&#xD;&#xA;   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()&#xD;&#xA;   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)&#xD;&#xA;   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)&#xD;&#xA;   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)&#xD;&#xA;   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.HttpHandlerUtil.ServerExecuteHttpHandlerWrapper.&lt;&gt;c__DisplayClass4.&lt;Wrap&gt;b__3()&#xD;&#xA;   at System.Web.Mvc.HttpHandlerUtil.ServerExecuteHttpHandlerWrapper.Wrap[TResult](Func`1 func)&#xD;&#xA;   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)&#xD;&#xA;   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)&#xD;&#xA;   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)&#xD;&#xA;   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)&#xD;&#xA;   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)&#xD;&#xA;   at System.Web.Mvc.Html.ChildActionExtensions.RenderAction(HtmlHelper htmlHelper, String actionName, String controllerName)&#xD;&#xA;   at ASP._Page_Views_Home_Index_cshtml.Execute() in D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Home\Index.cshtml:line 11&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.StartPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2017-07-30T17:19:53.8613932Z"
  statusCode="500"
  webHostHtmlMessage="&lt;!DOCTYPE html&gt;&#xD;&#xA;&lt;html&gt;&#xD;&#xA;    &lt;head&gt;&#xD;&#xA;        &lt;title&gt;Compilation Error&lt;/title&gt;&#xD;&#xA;        &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width&quot; /&gt;&#xD;&#xA;        &lt;style&gt;&#xD;&#xA;         body {font-family:&quot;Verdana&quot;;font-weight:normal;font-size: .7em;color:black;} &#xD;&#xA;         p {font-family:&quot;Verdana&quot;;font-weight:normal;color:black;margin-top: -5px}&#xD;&#xA;         b {font-family:&quot;Verdana&quot;;font-weight:bold;color:black;margin-top: -5px}&#xD;&#xA;         H1 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:18pt;color:red }&#xD;&#xA;         H2 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:14pt;color:maroon }&#xD;&#xA;         pre {font-family:&quot;Consolas&quot;,&quot;Lucida Console&quot;,Monospace;font-size:11pt;margin:0;padding:0.5em;line-height:14pt}&#xD;&#xA;         .marker {font-weight: bold; color: black;text-decoration: none;}&#xD;&#xA;         .version {color: gray;}&#xD;&#xA;         .error {margin-bottom: 10px;}&#xD;&#xA;         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }&#xD;&#xA;         @media screen and (max-width: 639px) {&#xD;&#xA;          pre { width: 440px; overflow: auto; white-space: pre-wrap; word-wrap: break-word; }&#xD;&#xA;         }&#xD;&#xA;         @media screen and (max-width: 479px) {&#xD;&#xA;          pre { width: 280px; }&#xD;&#xA;         }&#xD;&#xA;        &lt;/style&gt;&#xD;&#xA;    &lt;/head&gt;&#xD;&#xA;&#xD;&#xA;    &lt;body bgcolor=&quot;white&quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;span&gt;&lt;H1&gt;Server Error in ''/'' Application.&lt;hr width=100% size=1 color=silver&gt;&lt;/H1&gt;&#xD;&#xA;&#xD;&#xA;            &lt;h2&gt; &lt;i&gt;Compilation Error&lt;/i&gt; &lt;/h2&gt;&lt;/span&gt;&#xD;&#xA;&#xD;&#xA;            &lt;font face=&quot;Arial, Helvetica, Geneva, SunSans-Regular, sans-serif &quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; Description: &lt;/b&gt;An error occurred during the compilation of a resource required to service this request. Please review the following specific error details and modify your source code appropriately.&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; Compiler Error Message: &lt;/b&gt;CS0234: The type or namespace name &amp;#39;SearchModel&amp;#39; does not exist in the namespace &amp;#39;code.Models&amp;#39; (are you missing an assembly reference?)&lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;b&gt;Source Error:&lt;/b&gt;&lt;br&gt;&lt;br&gt;&#xD;&#xA;            &lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&lt;td&gt;&#xD;&#xA;                              &lt;/td&gt;&lt;/tr&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;Line 29:     &#xD;&#xA;Line 30:     &#xD;&#xA;&lt;font color=red&gt;Line 31:     public class _Page_Views_Shared_SearchPanel_cshtml : System.Web.Mvc.WebViewPage&amp;lt;code.Models.SearchModel&amp;gt; {&#xD;&#xA;&lt;/font&gt;Line 32:         &#xD;&#xA;Line 33: #line hidden&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt;Source File:&lt;/b&gt; C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web_searchpanel.cshtml.639c3968.lb7wnprw.0.cs&#xD;&#xA;            &amp;nbsp;&amp;nbsp; &lt;b&gt;Line:&lt;/b&gt;  31&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''compilerOutputDiv'')&quot;&gt;Show Detailed Compiler Output:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;compilerOutputDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;c:\windows\system32\inetsrv&amp;gt;D:\Yagnesh\Deepen\Deepen_SPA\code\bin\roslyn\csc.exe /t:library /utf8output /nostdlib+ /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\mscorlib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Runtime\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\16b42220\00d8e42c_d5add201\Microsoft.Owin.Security.Facebook.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Core\v4.0_4.0.0.0__b77a5c561934e089\System.Core.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\9e89153c\0080d323_813ad001\System.Web.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Services\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.Services.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Extensions\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.Extensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\3d8e0692\00df286a_813ad001\System.Web.WebPages.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml.Linq\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.Linq.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.CSharp\v4.0_4.0.0.0__b03f5f7f11d50a3a\Microsoft.CSharp.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_64\System.Web\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Drawing\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Drawing.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\3f329b8e\0005162e_d5add201\Microsoft.Owin.Security.OAuth.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_64\System.EnterpriseServices\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.EnterpriseServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_64\System.Data\v4.0_4.0.0.0__b77a5c561934e089\System.Data.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\79b01fc2\004ab69c_aa10ce01\Antlr3.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.ApplicationServices\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.ApplicationServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\26389304\00f599b1_9d54d001\EntityFramework.SqlServer.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\e994ec33\00df08f7_1418cf01\WebGrease.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel\v4.0_4.0.0.0__b77a5c561934e089\System.ServiceModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\e2996681\00abb32b_d5add201\Microsoft.Owin.Security.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\b6800707\007f9000_3721cd01\Microsoft.Web.Infrastructure.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\6b116fe4\0043c8ad_0ce8d201\Newtonsoft.Json.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\625e249f\00d2e379_0f27cf01\System.Web.Optimization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.VisualStudio.Web.PageInspector.Loader\v4.0_1.0.0.0__b03f5f7f11d50a3a\Microsoft.VisualStudio.Web.PageInspector.Loader.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_global.asax.qrbzfeuh.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c62df296\0005818c_026ed001\Microsoft.AspNet.Identity.Core.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\2ed99b54\007e822a_d5add201\Microsoft.Owin.Host.SystemWeb.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\f16c2952\a948fca5_5209d301\code.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\b5fdb4ff\00d8e42c_d5add201\Microsoft.Owin.Security.Google.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System\v4.0_4.0.0.0__b77a5c561934e089\System.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\ec8f7895\00457b1b_813ad001\System.Web.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c6ab0581\005ef620_71cccd01\Owin.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\7b95bab4\0032472f_d5add201\Microsoft.Owin.Security.Twitter.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\eb3d10b6\0005818c_026ed001\Microsoft.AspNet.Identity.Owin.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.WorkflowServices\v4.0_4.0.0.0__31bf3856ad364e35\System.WorkflowServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.IdentityModel\v4.0_4.0.0.0__b77a5c561934e089\System.IdentityModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\7337447a\00d8ec18_b318cd01\Elmah.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\mscorlib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Web\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.DynamicData\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.DynamicData.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\99ca1996\0005162e_d5add201\Microsoft.Owin.Security.MicrosoftAccount.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\4f4f4b20\00abb32b_d5add201\Microsoft.Owin.Security.Cookies.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Runtime.Serialization\v4.0_4.0.0.0__b77a5c561934e089\System.Runtime.Serialization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\78ae0968\00f599b1_9d54d001\EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\d8dd2d67\00df286a_813ad001\System.Web.WebPages.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activation\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activation.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Data.DataSetExtensions\v4.0_4.0.0.0__b77a5c561934e089\System.Data.DataSetExtensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\e6bed9fc\00df286a_813ad001\System.Web.Helpers.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\5c3ae4ba\0005818c_026ed001\Microsoft.AspNet.Identity.EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c98fac55\00df286a_813ad001\System.Web.WebPages.Deployment.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\3f01b36c\63546105_8208d301\DataAccess.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\333a3526\0097992d_58c5d201\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Configuration\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Configuration.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c2168d5c\00242028_d5add201\Microsoft.Owin.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ComponentModel.DataAnnotations\v4.0_4.0.0.0__31bf3856ad364e35\System.ComponentModel.DataAnnotations.dll&amp;quot; /out:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web_searchpanel.cshtml.639c3968.lb7wnprw.dll&amp;quot; /D:DEBUG /debug+ /optimize- /warnaserror- /w:4 /nowarn:1659;1699;1701;612;618 /langversion:6 /nowarn:1659;1699;1701  &amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web_searchpanel.cshtml.639c3968.lb7wnprw.0.cs&amp;quot; &amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web_searchpanel.cshtml.639c3968.lb7wnprw.1.cs&amp;quot;&#xD;&#xA;&#xD;&#xA;&#xD;&#xA;Microsoft (R) Visual C# Compiler version 2.3.0.61908 (281ac90b)&#xD;&#xA;Copyright (C) Microsoft Corporation. All rights reserved.&#xD;&#xA;&#xD;&#xA;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web_searchpanel.cshtml.639c3968.lb7wnprw.0.cs(31,97): error CS0234: The type or namespace name &amp;#39;SearchModel&amp;#39; does not exist in the namespace &amp;#39;code.Models&amp;#39; (are you missing an assembly reference?)&#xD;&#xA;&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''dynamicCodeDiv'')&quot;&gt;Show Complete Compilation Source:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;dynamicCodeDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;Line 1:    #pragma checksum &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\SearchPanel.cshtml&amp;quot; &amp;quot;{ff1816ec-aa5e-4d10-87f7-6f4963833460}&amp;quot; &amp;quot;3BAAE32F893FC69F370CE39820D333DE4132E96B&amp;quot;&#xD;Line 2:    //------------------------------------------------------------------------------&#xD;Line 3:    // &amp;lt;auto-generated&amp;gt;&#xD;Line 4:    //     This code was generated by a tool.&#xD;Line 5:    //     Runtime Version:4.0.30319.42000&#xD;Line 6:    //&#xD;Line 7:    //     Changes to this file may cause incorrect behavior and will be lost if&#xD;Line 8:    //     the code is regenerated.&#xD;Line 9:    // &amp;lt;/auto-generated&amp;gt;&#xD;Line 10:   //------------------------------------------------------------------------------&#xD;Line 11:   &#xD;Line 12:   namespace ASP {&#xD;Line 13:       using System;&#xD;Line 14:       using System.Collections.Generic;&#xD;Line 15:       using System.IO;&#xD;Line 16:       using System.Linq;&#xD;Line 17:       using System.Net;&#xD;Line 18:       using System.Web;&#xD;Line 19:       using System.Web.Helpers;&#xD;Line 20:       using System.Web.Security;&#xD;Line 21:       using System.Web.UI;&#xD;Line 22:       using System.Web.WebPages;&#xD;Line 23:       using System.Web.Mvc;&#xD;Line 24:       using System.Web.Mvc.Ajax;&#xD;Line 25:       using System.Web.Mvc.Html;&#xD;Line 26:       using System.Web.Optimization;&#xD;Line 27:       using System.Web.Routing;&#xD;Line 28:       using code;&#xD;Line 29:       &#xD;Line 30:       &#xD;Line 31:       public class _Page_Views_Shared_SearchPanel_cshtml : System.Web.Mvc.WebViewPage&amp;lt;code.Models.SearchModel&amp;gt; {&#xD;Line 32:           &#xD;Line 33:   #line hidden&#xD;Line 34:           &#xD;Line 35:           public _Page_Views_Shared_SearchPanel_cshtml() {&#xD;Line 36:           }&#xD;Line 37:           &#xD;Line 38:           protected ASP.global_asax ApplicationInstance {&#xD;Line 39:               get {&#xD;Line 40:                   return ((ASP.global_asax)(Context.ApplicationInstance));&#xD;Line 41:               }&#xD;Line 42:           }&#xD;Line 43:           &#xD;Line 44:           public override void Execute() {&#xD;Line 45:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 32, 16, true);&#xD;Line 46:   &#xD;Line 47:   WriteLiteral(&amp;quot;&amp;lt;form&amp;gt;\r\n    &amp;lt;div&amp;quot;);&#xD;Line 48:   &#xD;Line 49:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 32, 16, true);&#xD;Line 50:   &#xD;Line 51:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 48, 35, true);&#xD;Line 52:   &#xD;Line 53:   WriteLiteral(&amp;quot; class=\&amp;quot;container i-home-form-wrap\&amp;quot;&amp;quot;);&#xD;Line 54:   &#xD;Line 55:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 48, 35, true);&#xD;Line 56:   &#xD;Line 57:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 83, 15, true);&#xD;Line 58:   &#xD;Line 59:   WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;div&amp;quot;);&#xD;Line 60:   &#xD;Line 61:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 83, 15, true);&#xD;Line 62:   &#xD;Line 63:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 98, 19, true);&#xD;Line 64:   &#xD;Line 65:   WriteLiteral(&amp;quot; class=\&amp;quot;form-group\&amp;quot;&amp;quot;);&#xD;Line 66:   &#xD;Line 67:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 98, 19, true);&#xD;Line 68:   &#xD;Line 69:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 117, 19, true);&#xD;Line 70:   &#xD;Line 71:   WriteLiteral(&amp;quot;&amp;gt;\r\n            &amp;lt;div&amp;quot;);&#xD;Line 72:   &#xD;Line 73:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 117, 19, true);&#xD;Line 74:   &#xD;Line 75:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 136, 26, true);&#xD;Line 76:   &#xD;Line 77:   WriteLiteral(&amp;quot; class=\&amp;quot;row i-search-wrap\&amp;quot;&amp;quot;);&#xD;Line 78:   &#xD;Line 79:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 136, 26, true);&#xD;Line 80:   &#xD;Line 81:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 162, 23, true);&#xD;Line 82:   &#xD;Line 83:   WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 84:   &#xD;Line 85:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 162, 23, true);&#xD;Line 86:   &#xD;Line 87:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 185, 39, true);&#xD;Line 88:   &#xD;Line 89:   WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-1 i-col-pad i-bor-right\&amp;quot;&amp;quot;);&#xD;Line 90:   &#xD;Line 91:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 185, 39, true);&#xD;Line 92:   &#xD;Line 93:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 224, 30, true);&#xD;Line 94:   &#xD;Line 95:   WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;select&amp;quot;);&#xD;Line 96:   &#xD;Line 97:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 224, 30, true);&#xD;Line 98:   &#xD;Line 99:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 254, 21, true);&#xD;Line 100:  &#xD;Line 101:  WriteLiteral(&amp;quot; class=\&amp;quot;selectpicker\&amp;quot;&amp;quot;);&#xD;Line 102:  &#xD;Line 103:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 254, 21, true);&#xD;Line 104:  &#xD;Line 105:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 275, 13, true);&#xD;Line 106:  &#xD;Line 107:  WriteLiteral(&amp;quot; title=\&amp;quot;City\&amp;quot;&amp;quot;);&#xD;Line 108:  &#xD;Line 109:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 275, 13, true);&#xD;Line 110:  &#xD;Line 111:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 288, 34, true);&#xD;Line 112:  &#xD;Line 113:  WriteLiteral(&amp;quot;&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 114:  &#xD;Line 115:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 288, 34, true);&#xD;Line 116:  &#xD;Line 117:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 322, 9, true);&#xD;Line 118:  &#xD;Line 119:  WriteLiteral(&amp;quot; value=\&amp;quot;\&amp;quot;&amp;quot;);&#xD;Line 120:  &#xD;Line 121:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 322, 9, true);&#xD;Line 122:  &#xD;Line 123:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 331, 65, true);&#xD;Line 124:  &#xD;Line 125:  WriteLiteral(&amp;quot; selected disabled&amp;gt;City&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 126:  &#xD;Line 127:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 331, 65, true);&#xD;Line 128:  &#xD;Line 129:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 396, 10, true);&#xD;Line 130:  &#xD;Line 131:  WriteLiteral(&amp;quot; value=\&amp;quot;1\&amp;quot;&amp;quot;);&#xD;Line 132:  &#xD;Line 133:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 396, 10, true);&#xD;Line 134:  &#xD;Line 135:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 406, 49, true);&#xD;Line 136:  &#xD;Line 137:  WriteLiteral(&amp;quot;&amp;gt;City 1&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 138:  &#xD;Line 139:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 406, 49, true);&#xD;Line 140:  &#xD;Line 141:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 455, 10, true);&#xD;Line 142:  &#xD;Line 143:  WriteLiteral(&amp;quot; value=\&amp;quot;2\&amp;quot;&amp;quot;);&#xD;Line 144:  &#xD;Line 145:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 455, 10, true);&#xD;Line 146:  &#xD;Line 147:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 465, 49, true);&#xD;Line 148:  &#xD;Line 149:  WriteLiteral(&amp;quot;&amp;gt;City 2&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 150:  &#xD;Line 151:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 465, 49, true);&#xD;Line 152:  &#xD;Line 153:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 514, 10, true);&#xD;Line 154:  &#xD;Line 155:  WriteLiteral(&amp;quot; value=\&amp;quot;3\&amp;quot;&amp;quot;);&#xD;Line 156:  &#xD;Line 157:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 514, 10, true);&#xD;Line 158:  &#xD;Line 159:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 524, 93, true);&#xD;Line 160:  &#xD;Line 161:  WriteLiteral(&amp;quot;&amp;gt;City 3&amp;lt;/option&amp;gt;\r\n                    &amp;lt;/select&amp;gt;\r\n                &amp;lt;/div&amp;gt;\r\n        &amp;quot; +&#xD;Line 162:  &amp;quot;        &amp;lt;div&amp;quot;);&#xD;Line 163:  &#xD;Line 164:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 524, 93, true);&#xD;Line 165:  &#xD;Line 166:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 617, 39, true);&#xD;Line 167:  &#xD;Line 168:  WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-2 i-col-pad i-bor-right\&amp;quot;&amp;quot;);&#xD;Line 169:  &#xD;Line 170:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 617, 39, true);&#xD;Line 171:  &#xD;Line 172:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 656, 7, true);&#xD;Line 173:  &#xD;Line 174:  WriteLiteral(&amp;quot;&amp;gt;&amp;lt;input&amp;quot;);&#xD;Line 175:  &#xD;Line 176:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 656, 7, true);&#xD;Line 177:  &#xD;Line 178:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 663, 12, true);&#xD;Line 179:  &#xD;Line 180:  WriteLiteral(&amp;quot; type=\&amp;quot;text\&amp;quot;&amp;quot;);&#xD;Line 181:  &#xD;Line 182:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 663, 12, true);&#xD;Line 183:  &#xD;Line 184:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 675, 21, true);&#xD;Line 185:  &#xD;Line 186:  WriteLiteral(&amp;quot; class=\&amp;quot;form-control\&amp;quot;&amp;quot;);&#xD;Line 187:  &#xD;Line 188:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 675, 21, true);&#xD;Line 189:  &#xD;Line 190:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 696, 10, true);&#xD;Line 191:  &#xD;Line 192:  WriteLiteral(&amp;quot; size=\&amp;quot;50\&amp;quot;&amp;quot;);&#xD;Line 193:  &#xD;Line 194:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 696, 10, true);&#xD;Line 195:  &#xD;Line 196:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 706, 29, true);&#xD;Line 197:  &#xD;Line 198:  WriteLiteral(&amp;quot; placeholder=\&amp;quot;Enter Zip Code\&amp;quot;&amp;quot;);&#xD;Line 199:  &#xD;Line 200:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 706, 29, true);&#xD;Line 201:  &#xD;Line 202:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 735, 31, true);&#xD;Line 203:  &#xD;Line 204:  WriteLiteral(&amp;quot; /&amp;gt;&amp;lt;/div&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 205:  &#xD;Line 206:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 735, 31, true);&#xD;Line 207:  &#xD;Line 208:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 766, 39, true);&#xD;Line 209:  &#xD;Line 210:  WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-4 i-col-pad i-bor-right\&amp;quot;&amp;quot;);&#xD;Line 211:  &#xD;Line 212:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 766, 39, true);&#xD;Line 213:  &#xD;Line 214:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 805, 7, true);&#xD;Line 215:  &#xD;Line 216:  WriteLiteral(&amp;quot;&amp;gt;&amp;lt;input&amp;quot;);&#xD;Line 217:  &#xD;Line 218:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 805, 7, true);&#xD;Line 219:  &#xD;Line 220:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 812, 12, true);&#xD;Line 221:  &#xD;Line 222:  WriteLiteral(&amp;quot; type=\&amp;quot;text\&amp;quot;&amp;quot;);&#xD;Line 223:  &#xD;Line 224:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 812, 12, true);&#xD;Line 225:  &#xD;Line 226:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 824, 21, true);&#xD;Line 227:  &#xD;Line 228:  WriteLiteral(&amp;quot; class=\&amp;quot;form-control\&amp;quot;&amp;quot;);&#xD;Line 229:  &#xD;Line 230:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 824, 21, true);&#xD;Line 231:  &#xD;Line 232:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 845, 10, true);&#xD;Line 233:  &#xD;Line 234:  WriteLiteral(&amp;quot; size=\&amp;quot;50\&amp;quot;&amp;quot;);&#xD;Line 235:  &#xD;Line 236:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 845, 10, true);&#xD;Line 237:  &#xD;Line 238:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 855, 33, true);&#xD;Line 239:  &#xD;Line 240:  WriteLiteral(&amp;quot; placeholder=\&amp;quot;Enter Your Keyword\&amp;quot;&amp;quot;);&#xD;Line 241:  &#xD;Line 242:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 855, 33, true);&#xD;Line 243:  &#xD;Line 244:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 888, 31, true);&#xD;Line 245:  &#xD;Line 246:  WriteLiteral(&amp;quot; /&amp;gt;&amp;lt;/div&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 247:  &#xD;Line 248:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 888, 31, true);&#xD;Line 249:  &#xD;Line 250:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 919, 39, true);&#xD;Line 251:  &#xD;Line 252:  WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-2 i-col-pad i-bor-right\&amp;quot;&amp;quot;);&#xD;Line 253:  &#xD;Line 254:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 919, 39, true);&#xD;Line 255:  &#xD;Line 256:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 958, 30, true);&#xD;Line 257:  &#xD;Line 258:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;select&amp;quot;);&#xD;Line 259:  &#xD;Line 260:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 958, 30, true);&#xD;Line 261:  &#xD;Line 262:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 988, 21, true);&#xD;Line 263:  &#xD;Line 264:  WriteLiteral(&amp;quot; class=\&amp;quot;selectpicker\&amp;quot;&amp;quot;);&#xD;Line 265:  &#xD;Line 266:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 988, 21, true);&#xD;Line 267:  &#xD;Line 268:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1009, 17, true);&#xD;Line 269:  &#xD;Line 270:  WriteLiteral(&amp;quot; title=\&amp;quot;Category\&amp;quot;&amp;quot;);&#xD;Line 271:  &#xD;Line 272:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1009, 17, true);&#xD;Line 273:  &#xD;Line 274:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1026, 34, true);&#xD;Line 275:  &#xD;Line 276:  WriteLiteral(&amp;quot;&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 277:  &#xD;Line 278:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1026, 34, true);&#xD;Line 279:  &#xD;Line 280:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1060, 9, true);&#xD;Line 281:  &#xD;Line 282:  WriteLiteral(&amp;quot; value=\&amp;quot;\&amp;quot;&amp;quot;);&#xD;Line 283:  &#xD;Line 284:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1060, 9, true);&#xD;Line 285:  &#xD;Line 286:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1069, 69, true);&#xD;Line 287:  &#xD;Line 288:  WriteLiteral(&amp;quot; selected disabled&amp;gt;Category&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 289:  &#xD;Line 290:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1069, 69, true);&#xD;Line 291:  &#xD;Line 292:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1138, 10, true);&#xD;Line 293:  &#xD;Line 294:  WriteLiteral(&amp;quot; value=\&amp;quot;1\&amp;quot;&amp;quot;);&#xD;Line 295:  &#xD;Line 296:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1138, 10, true);&#xD;Line 297:  &#xD;Line 298:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1148, 53, true);&#xD;Line 299:  &#xD;Line 300:  WriteLiteral(&amp;quot;&amp;gt;Category 1&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 301:  &#xD;Line 302:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1148, 53, true);&#xD;Line 303:  &#xD;Line 304:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1201, 10, true);&#xD;Line 305:  &#xD;Line 306:  WriteLiteral(&amp;quot; value=\&amp;quot;2\&amp;quot;&amp;quot;);&#xD;Line 307:  &#xD;Line 308:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1201, 10, true);&#xD;Line 309:  &#xD;Line 310:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1211, 53, true);&#xD;Line 311:  &#xD;Line 312:  WriteLiteral(&amp;quot;&amp;gt;Category 2&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 313:  &#xD;Line 314:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1211, 53, true);&#xD;Line 315:  &#xD;Line 316:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1264, 10, true);&#xD;Line 317:  &#xD;Line 318:  WriteLiteral(&amp;quot; value=\&amp;quot;3\&amp;quot;&amp;quot;);&#xD;Line 319:  &#xD;Line 320:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1264, 10, true);&#xD;Line 321:  &#xD;Line 322:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1274, 97, true);&#xD;Line 323:  &#xD;Line 324:  WriteLiteral(&amp;quot;&amp;gt;Category 3&amp;lt;/option&amp;gt;\r\n                    &amp;lt;/select&amp;gt;\r\n                &amp;lt;/div&amp;gt;\r\n    &amp;quot; +&#xD;Line 325:  &amp;quot;            &amp;lt;div&amp;quot;);&#xD;Line 326:  &#xD;Line 327:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1274, 97, true);&#xD;Line 328:  &#xD;Line 329:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1371, 39, true);&#xD;Line 330:  &#xD;Line 331:  WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-2 i-col-pad i-bor-right\&amp;quot;&amp;quot;);&#xD;Line 332:  &#xD;Line 333:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1371, 39, true);&#xD;Line 334:  &#xD;Line 335:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1410, 30, true);&#xD;Line 336:  &#xD;Line 337:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;select&amp;quot;);&#xD;Line 338:  &#xD;Line 339:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1410, 30, true);&#xD;Line 340:  &#xD;Line 341:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1440, 21, true);&#xD;Line 342:  &#xD;Line 343:  WriteLiteral(&amp;quot; class=\&amp;quot;selectpicker\&amp;quot;&amp;quot;);&#xD;Line 344:  &#xD;Line 345:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1440, 21, true);&#xD;Line 346:  &#xD;Line 347:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1461, 21, true);&#xD;Line 348:  &#xD;Line 349:  WriteLiteral(&amp;quot; title=\&amp;quot;Sub Category\&amp;quot;&amp;quot;);&#xD;Line 350:  &#xD;Line 351:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1461, 21, true);&#xD;Line 352:  &#xD;Line 353:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1482, 34, true);&#xD;Line 354:  &#xD;Line 355:  WriteLiteral(&amp;quot;&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 356:  &#xD;Line 357:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1482, 34, true);&#xD;Line 358:  &#xD;Line 359:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1516, 9, true);&#xD;Line 360:  &#xD;Line 361:  WriteLiteral(&amp;quot; value=\&amp;quot;\&amp;quot;&amp;quot;);&#xD;Line 362:  &#xD;Line 363:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1516, 9, true);&#xD;Line 364:  &#xD;Line 365:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1525, 73, true);&#xD;Line 366:  &#xD;Line 367:  WriteLiteral(&amp;quot; selected disabled&amp;gt;Sub Category&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 368:  &#xD;Line 369:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1525, 73, true);&#xD;Line 370:  &#xD;Line 371:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1598, 10, true);&#xD;Line 372:  &#xD;Line 373:  WriteLiteral(&amp;quot; value=\&amp;quot;1\&amp;quot;&amp;quot;);&#xD;Line 374:  &#xD;Line 375:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1598, 10, true);&#xD;Line 376:  &#xD;Line 377:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1608, 57, true);&#xD;Line 378:  &#xD;Line 379:  WriteLiteral(&amp;quot;&amp;gt;Sub Category 1&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 380:  &#xD;Line 381:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1608, 57, true);&#xD;Line 382:  &#xD;Line 383:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1665, 10, true);&#xD;Line 384:  &#xD;Line 385:  WriteLiteral(&amp;quot; value=\&amp;quot;2\&amp;quot;&amp;quot;);&#xD;Line 386:  &#xD;Line 387:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1665, 10, true);&#xD;Line 388:  &#xD;Line 389:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1675, 57, true);&#xD;Line 390:  &#xD;Line 391:  WriteLiteral(&amp;quot;&amp;gt;Sub Category 2&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 392:  &#xD;Line 393:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1675, 57, true);&#xD;Line 394:  &#xD;Line 395:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1732, 10, true);&#xD;Line 396:  &#xD;Line 397:  WriteLiteral(&amp;quot; value=\&amp;quot;3\&amp;quot;&amp;quot;);&#xD;Line 398:  &#xD;Line 399:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1732, 10, true);&#xD;Line 400:  &#xD;Line 401:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1742, 101, true);&#xD;Line 402:  &#xD;Line 403:  WriteLiteral(&amp;quot;&amp;gt;Sub Category 3&amp;lt;/option&amp;gt;\r\n                    &amp;lt;/select&amp;gt;\r\n                &amp;lt;/div&amp;gt;\r\n&amp;quot; +&#xD;Line 404:  &amp;quot;                &amp;lt;div&amp;quot;);&#xD;Line 405:  &#xD;Line 406:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1742, 101, true);&#xD;Line 407:  &#xD;Line 408:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1843, 27, true);&#xD;Line 409:  &#xD;Line 410:  WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-1 i-col-pad\&amp;quot;&amp;quot;);&#xD;Line 411:  &#xD;Line 412:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1843, 27, true);&#xD;Line 413:  &#xD;Line 414:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1870, 30, true);&#xD;Line 415:  &#xD;Line 416:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;select&amp;quot;);&#xD;Line 417:  &#xD;Line 418:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1870, 30, true);&#xD;Line 419:  &#xD;Line 420:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1900, 21, true);&#xD;Line 421:  &#xD;Line 422:  WriteLiteral(&amp;quot; class=\&amp;quot;selectpicker\&amp;quot;&amp;quot;);&#xD;Line 423:  &#xD;Line 424:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1900, 21, true);&#xD;Line 425:  &#xD;Line 426:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1921, 14, true);&#xD;Line 427:  &#xD;Line 428:  WriteLiteral(&amp;quot; title=\&amp;quot;Price\&amp;quot;&amp;quot;);&#xD;Line 429:  &#xD;Line 430:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1921, 14, true);&#xD;Line 431:  &#xD;Line 432:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1935, 34, true);&#xD;Line 433:  &#xD;Line 434:  WriteLiteral(&amp;quot;&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 435:  &#xD;Line 436:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1935, 34, true);&#xD;Line 437:  &#xD;Line 438:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1969, 9, true);&#xD;Line 439:  &#xD;Line 440:  WriteLiteral(&amp;quot; value=\&amp;quot;\&amp;quot;&amp;quot;);&#xD;Line 441:  &#xD;Line 442:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1969, 9, true);&#xD;Line 443:  &#xD;Line 444:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1978, 66, true);&#xD;Line 445:  &#xD;Line 446:  WriteLiteral(&amp;quot; selected disabled&amp;gt;Price&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 447:  &#xD;Line 448:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1978, 66, true);&#xD;Line 449:  &#xD;Line 450:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 2044, 10, true);&#xD;Line 451:  &#xD;Line 452:  WriteLiteral(&amp;quot; value=\&amp;quot;1\&amp;quot;&amp;quot;);&#xD;Line 453:  &#xD;Line 454:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 2044, 10, true);&#xD;Line 455:  &#xD;Line 456:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 2054, 50, true);&#xD;Line 457:  &#xD;Line 458:  WriteLiteral(&amp;quot;&amp;gt;Price 1&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 459:  &#xD;Line 460:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 2054, 50, true);&#xD;Line 461:  &#xD;Line 462:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 2104, 10, true);&#xD;Line 463:  &#xD;Line 464:  WriteLiteral(&amp;quot; value=\&amp;quot;2\&amp;quot;&amp;quot;);&#xD;Line 465:  &#xD;Line 466:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 2104, 10, true);&#xD;Line 467:  &#xD;Line 468:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 2114, 50, true);&#xD;Line 469:  &#xD;Line 470:  WriteLiteral(&amp;quot;&amp;gt;Price 2&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 471:  &#xD;Line 472:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 2114, 50, true);&#xD;Line 473:  &#xD;Line 474:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 2164, 10, true);&#xD;Line 475:  &#xD;Line 476:  WriteLiteral(&amp;quot; value=\&amp;quot;3\&amp;quot;&amp;quot;);&#xD;Line 477:  &#xD;Line 478:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 2164, 10, true);&#xD;Line 479:  &#xD;Line 480:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 2174, 131, true);&#xD;Line 481:  &#xD;Line 482:  WriteLiteral(&amp;quot;&amp;gt;Price 3&amp;lt;/option&amp;gt;\r\n                    &amp;lt;/select&amp;gt;\r\n                &amp;lt;/div&amp;gt;\r\n       &amp;quot; +&#xD;Line 483:  &amp;quot;     &amp;lt;/div&amp;gt;\r\n        &amp;lt;/div&amp;gt;\r\n    &amp;lt;/div&amp;gt;\r\n&amp;lt;/form&amp;gt;\r\n&amp;quot;);&#xD;Line 484:  &#xD;Line 485:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 2174, 131, true);&#xD;Line 486:  &#xD;Line 487:          }&#xD;Line 488:      }&#xD;Line 489:  }&#xD;Line 490:  &lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&#xD;&#xA;    &lt;script type=&quot;text/javascript&quot;&gt;&#xD;&#xA;    function OnToggleTOCLevel1(level2ID)&#xD;&#xA;    {&#xD;&#xA;      var elemLevel2 = document.getElementById(level2ID);&#xD;&#xA;      if (elemLevel2.style.display == ''none'')&#xD;&#xA;      {&#xD;&#xA;        elemLevel2.style.display = '''';&#xD;&#xA;      }&#xD;&#xA;      else {&#xD;&#xA;        elemLevel2.style.display = ''none'';&#xD;&#xA;      }&#xD;&#xA;    }&#xD;&#xA;    &lt;/script&gt;&#xD;&#xA;                          &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;    &lt;/body&gt;&#xD;&#xA;&lt;/html&gt;&#xD;&#xA;">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="56018" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'30bdbc29-b751-4b4e-8292-c6c22e272e6e', N'spa_db', N'DATAFUSION-PC', N'System.Web.HttpCompileException', N'System.Web', N'D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\SearchPanel.cshtml(10): error CS1061: ''SearchModel'' does not contain a definition for ''zipCode'' and no extension method ''zipCode'' accepting a first argument of type ''SearchModel'' could be found (are you missing a using directive or an assembly reference?)', N'', 500, CAST(N'2017-07-30 18:09:08.350' AS DateTime), 39, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.Web.HttpCompileException"
  message="D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\SearchPanel.cshtml(10): error CS1061: ''SearchModel'' does not contain a definition for ''zipCode'' and no extension method ''zipCode'' accepting a first argument of type ''SearchModel'' could be found (are you missing a using directive or an assembly reference?)"
  source="System.Web"
  detail="System.Web.HttpException (0x80004005): Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''. ---&gt; System.Web.HttpCompileException (0x80004005): D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\SearchPanel.cshtml(10): error CS1061: ''SearchModel'' does not contain a definition for ''zipCode'' and no extension method ''zipCode'' accepting a first argument of type ''SearchModel'' could be found (are you missing a using directive or an assembly reference?)&#xD;&#xA;   at System.Web.Compilation.AssemblyBuilder.Compile()&#xD;&#xA;   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()&#xD;&#xA;   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)&#xD;&#xA;   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)&#xD;&#xA;   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)&#xD;&#xA;   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.HttpHandlerUtil.ServerExecuteHttpHandlerWrapper.&lt;&gt;c__DisplayClass4.&lt;Wrap&gt;b__3()&#xD;&#xA;   at System.Web.Mvc.HttpHandlerUtil.ServerExecuteHttpHandlerWrapper.Wrap[TResult](Func`1 func)&#xD;&#xA;   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)&#xD;&#xA;   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)&#xD;&#xA;   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)&#xD;&#xA;   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)&#xD;&#xA;   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)&#xD;&#xA;   at System.Web.Mvc.Html.ChildActionExtensions.RenderAction(HtmlHelper htmlHelper, String actionName, String controllerName)&#xD;&#xA;   at ASP._Page_Views_Home_Index_cshtml.Execute() in D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Home\Index.cshtml:line 11&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.StartPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2017-07-30T18:09:08.3496231Z"
  statusCode="500"
  webHostHtmlMessage="&lt;!DOCTYPE html&gt;&#xD;&#xA;&lt;html&gt;&#xD;&#xA;    &lt;head&gt;&#xD;&#xA;        &lt;title&gt;Compilation Error&lt;/title&gt;&#xD;&#xA;        &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width&quot; /&gt;&#xD;&#xA;        &lt;style&gt;&#xD;&#xA;         body {font-family:&quot;Verdana&quot;;font-weight:normal;font-size: .7em;color:black;} &#xD;&#xA;         p {font-family:&quot;Verdana&quot;;font-weight:normal;color:black;margin-top: -5px}&#xD;&#xA;         b {font-family:&quot;Verdana&quot;;font-weight:bold;color:black;margin-top: -5px}&#xD;&#xA;         H1 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:18pt;color:red }&#xD;&#xA;         H2 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:14pt;color:maroon }&#xD;&#xA;         pre {font-family:&quot;Consolas&quot;,&quot;Lucida Console&quot;,Monospace;font-size:11pt;margin:0;padding:0.5em;line-height:14pt}&#xD;&#xA;         .marker {font-weight: bold; color: black;text-decoration: none;}&#xD;&#xA;         .version {color: gray;}&#xD;&#xA;         .error {margin-bottom: 10px;}&#xD;&#xA;         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }&#xD;&#xA;         @media screen and (max-width: 639px) {&#xD;&#xA;          pre { width: 440px; overflow: auto; white-space: pre-wrap; word-wrap: break-word; }&#xD;&#xA;         }&#xD;&#xA;         @media screen and (max-width: 479px) {&#xD;&#xA;          pre { width: 280px; }&#xD;&#xA;         }&#xD;&#xA;        &lt;/style&gt;&#xD;&#xA;    &lt;/head&gt;&#xD;&#xA;&#xD;&#xA;    &lt;body bgcolor=&quot;white&quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;span&gt;&lt;H1&gt;Server Error in ''/'' Application.&lt;hr width=100% size=1 color=silver&gt;&lt;/H1&gt;&#xD;&#xA;&#xD;&#xA;            &lt;h2&gt; &lt;i&gt;Compilation Error&lt;/i&gt; &lt;/h2&gt;&lt;/span&gt;&#xD;&#xA;&#xD;&#xA;            &lt;font face=&quot;Arial, Helvetica, Geneva, SunSans-Regular, sans-serif &quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; Description: &lt;/b&gt;An error occurred during the compilation of a resource required to service this request. Please review the following specific error details and modify your source code appropriately.&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; Compiler Error Message: &lt;/b&gt;CS1061: &amp;#39;SearchModel&amp;#39; does not contain a definition for &amp;#39;zipCode&amp;#39; and no extension method &amp;#39;zipCode&amp;#39; accepting a first argument of type &amp;#39;SearchModel&amp;#39; could be found (are you missing a using directive or an assembly reference?)&lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;b&gt;Source Error:&lt;/b&gt;&lt;br&gt;&lt;br&gt;&#xD;&#xA;            &lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&lt;td&gt;&#xD;&#xA;                              &lt;/td&gt;&lt;/tr&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;Line 8:                  &amp;lt;/div&amp;gt;&#xD;&#xA;Line 9:                  &amp;lt;div class=&amp;quot;col-sm-2 i-col-pad i-bor-right&amp;quot;&amp;gt;&#xD;&#xA;&lt;font color=red&gt;Line 10:                     @Html.TextBoxFor(x=&amp;gt;x.zipCode, new {@class = &amp;quot;form-control&amp;quot;, placeholder = &amp;quot;Enter Zip Code&amp;quot; })&#xD;&#xA;&lt;/font&gt;Line 11:                 &amp;lt;/div&amp;gt;&#xD;&#xA;Line 12:                 &amp;lt;div class=&amp;quot;col-sm-4 i-col-pad i-bor-right&amp;quot;&amp;gt;&amp;lt;input type=&amp;quot;text&amp;quot; class=&amp;quot;form-control&amp;quot; size=&amp;quot;50&amp;quot; placeholder=&amp;quot;Enter Your Keyword&amp;quot; /&amp;gt;&amp;lt;/div&amp;gt;&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt;Source File:&lt;/b&gt; D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\SearchPanel.cshtml&#xD;&#xA;            &amp;nbsp;&amp;nbsp; &lt;b&gt;Line:&lt;/b&gt;  10&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''compilerOutputDiv'')&quot;&gt;Show Detailed Compiler Output:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;compilerOutputDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;c:\windows\system32\inetsrv&amp;gt;D:\Yagnesh\Deepen\Deepen_SPA\code\bin\roslyn\csc.exe /t:library /utf8output /nostdlib+ /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\mscorlib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Runtime\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Services\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.Services.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\4f4f4b20\00abb32b_d5add201\Microsoft.Owin.Security.Cookies.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ComponentModel.DataAnnotations\v4.0_4.0.0.0__31bf3856ad364e35\System.ComponentModel.DataAnnotations.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\3f329b8e\0005162e_d5add201\Microsoft.Owin.Security.OAuth.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml.Linq\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.Linq.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\e2996681\00abb32b_d5add201\Microsoft.Owin.Security.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\3d8e0692\00df286a_813ad001\System.Web.WebPages.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\6b116fe4\0043c8ad_0ce8d201\Newtonsoft.Json.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Web\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\e6bed9fc\00df286a_813ad001\System.Web.Helpers.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.ApplicationServices\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.ApplicationServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activation\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activation.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\99ca1996\0005162e_d5add201\Microsoft.Owin.Security.MicrosoftAccount.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel\v4.0_4.0.0.0__b77a5c561934e089\System.ServiceModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System\v4.0_4.0.0.0__b77a5c561934e089\System.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_64\System.Data\v4.0_4.0.0.0__b77a5c561934e089\System.Data.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\2ed99b54\007e822a_d5add201\Microsoft.Owin.Host.SystemWeb.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.CSharp\v4.0_4.0.0.0__b03f5f7f11d50a3a\Microsoft.CSharp.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\333a3526\0097992d_58c5d201\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Drawing\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Drawing.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\3f01b36c\dab7d8d8_5909d301\DataAccess.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\d8dd2d67\00df286a_813ad001\System.Web.WebPages.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_global.asax.13taqive.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.DynamicData\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.DynamicData.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\78ae0968\00f599b1_9d54d001\EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\16b42220\00d8e42c_d5add201\Microsoft.Owin.Security.Facebook.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c62df296\0005818c_026ed001\Microsoft.AspNet.Identity.Core.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.WorkflowServices\v4.0_4.0.0.0__31bf3856ad364e35\System.WorkflowServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\26389304\00f599b1_9d54d001\EntityFramework.SqlServer.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\5c3ae4ba\0005818c_026ed001\Microsoft.AspNet.Identity.EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_64\System.EnterpriseServices\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.EnterpriseServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.VisualStudio.Web.PageInspector.Loader\v4.0_1.0.0.0__b03f5f7f11d50a3a\Microsoft.VisualStudio.Web.PageInspector.Loader.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Data.DataSetExtensions\v4.0_4.0.0.0__b77a5c561934e089\System.Data.DataSetExtensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c2168d5c\00242028_d5add201\Microsoft.Owin.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\f16c2952\cd92d250_5c09d301\code.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.IdentityModel\v4.0_4.0.0.0__b77a5c561934e089\System.IdentityModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\79b01fc2\004ab69c_aa10ce01\Antlr3.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\e994ec33\00df08f7_1418cf01\WebGrease.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\b6800707\007f9000_3721cd01\Microsoft.Web.Infrastructure.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\9e89153c\0080d323_813ad001\System.Web.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\b5fdb4ff\00d8e42c_d5add201\Microsoft.Owin.Security.Google.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\7337447a\00d8ec18_b318cd01\Elmah.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c6ab0581\005ef620_71cccd01\Owin.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\mscorlib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\625e249f\00d2e379_0f27cf01\System.Web.Optimization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\ec8f7895\00457b1b_813ad001\System.Web.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\7b95bab4\0032472f_d5add201\Microsoft.Owin.Security.Twitter.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Core\v4.0_4.0.0.0__b77a5c561934e089\System.Core.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c98fac55\00df286a_813ad001\System.Web.WebPages.Deployment.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\eb3d10b6\0005818c_026ed001\Microsoft.AspNet.Identity.Owin.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Runtime.Serialization\v4.0_4.0.0.0__b77a5c561934e089\System.Runtime.Serialization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_64\System.Web\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Configuration\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Configuration.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Extensions\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.Extensions.dll&amp;quot; /out:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web_searchpanel.cshtml.639c3968.frzixec_.dll&amp;quot; /D:DEBUG /debug+ /optimize- /warnaserror- /w:4 /nowarn:1659;1699;1701;612;618 /langversion:6 /nowarn:1659;1699;1701  &amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web_searchpanel.cshtml.639c3968.frzixec_.0.cs&amp;quot; &amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web_searchpanel.cshtml.639c3968.frzixec_.1.cs&amp;quot;&#xD;&#xA;&#xD;&#xA;&#xD;&#xA;Microsoft (R) Visual C# Compiler version 2.3.0.61908 (281ac90b)&#xD;&#xA;Copyright (C) Microsoft Corporation. All rights reserved.&#xD;&#xA;&#xD;&#xA;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\SearchPanel.cshtml(10,43): error CS1061: &amp;#39;SearchModel&amp;#39; does not contain a definition for &amp;#39;zipCode&amp;#39; and no extension method &amp;#39;zipCode&amp;#39; accepting a first argument of type &amp;#39;SearchModel&amp;#39; could be found (are you missing a using directive or an assembly reference?)&#xD;&#xA;&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''dynamicCodeDiv'')&quot;&gt;Show Complete Compilation Source:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;dynamicCodeDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;Line 1:    #pragma checksum &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\SearchPanel.cshtml&amp;quot; &amp;quot;{ff1816ec-aa5e-4d10-87f7-6f4963833460}&amp;quot; &amp;quot;DA9EF18EB90F80C335F592A8C370B4BB3B449577&amp;quot;&#xD;Line 2:    //------------------------------------------------------------------------------&#xD;Line 3:    // &amp;lt;auto-generated&amp;gt;&#xD;Line 4:    //     This code was generated by a tool.&#xD;Line 5:    //     Runtime Version:4.0.30319.42000&#xD;Line 6:    //&#xD;Line 7:    //     Changes to this file may cause incorrect behavior and will be lost if&#xD;Line 8:    //     the code is regenerated.&#xD;Line 9:    // &amp;lt;/auto-generated&amp;gt;&#xD;Line 10:   //------------------------------------------------------------------------------&#xD;Line 11:   &#xD;Line 12:   namespace ASP {&#xD;Line 13:       using System;&#xD;Line 14:       using System.Collections.Generic;&#xD;Line 15:       using System.IO;&#xD;Line 16:       using System.Linq;&#xD;Line 17:       using System.Net;&#xD;Line 18:       using System.Web;&#xD;Line 19:       using System.Web.Helpers;&#xD;Line 20:       using System.Web.Security;&#xD;Line 21:       using System.Web.UI;&#xD;Line 22:       using System.Web.WebPages;&#xD;Line 23:       using System.Web.Mvc;&#xD;Line 24:       using System.Web.Mvc.Ajax;&#xD;Line 25:       using System.Web.Mvc.Html;&#xD;Line 26:       using System.Web.Optimization;&#xD;Line 27:       using System.Web.Routing;&#xD;Line 28:       using code;&#xD;Line 29:       &#xD;Line 30:       &#xD;Line 31:       public class _Page_Views_Shared_SearchPanel_cshtml : System.Web.Mvc.WebViewPage&amp;lt;code.Models.SearchModel&amp;gt; {&#xD;Line 32:           &#xD;Line 33:   #line hidden&#xD;Line 34:           &#xD;Line 35:           public _Page_Views_Shared_SearchPanel_cshtml() {&#xD;Line 36:           }&#xD;Line 37:           &#xD;Line 38:           protected ASP.global_asax ApplicationInstance {&#xD;Line 39:               get {&#xD;Line 40:                   return ((ASP.global_asax)(Context.ApplicationInstance));&#xD;Line 41:               }&#xD;Line 42:           }&#xD;Line 43:           &#xD;Line 44:           public override void Execute() {&#xD;Line 45:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 32, 16, true);&#xD;Line 46:   &#xD;Line 47:   WriteLiteral(&amp;quot;&amp;lt;form&amp;gt;\r\n    &amp;lt;div&amp;quot;);&#xD;Line 48:   &#xD;Line 49:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 32, 16, true);&#xD;Line 50:   &#xD;Line 51:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 48, 35, true);&#xD;Line 52:   &#xD;Line 53:   WriteLiteral(&amp;quot; class=\&amp;quot;container i-home-form-wrap\&amp;quot;&amp;quot;);&#xD;Line 54:   &#xD;Line 55:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 48, 35, true);&#xD;Line 56:   &#xD;Line 57:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 83, 15, true);&#xD;Line 58:   &#xD;Line 59:   WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;div&amp;quot;);&#xD;Line 60:   &#xD;Line 61:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 83, 15, true);&#xD;Line 62:   &#xD;Line 63:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 98, 19, true);&#xD;Line 64:   &#xD;Line 65:   WriteLiteral(&amp;quot; class=\&amp;quot;form-group\&amp;quot;&amp;quot;);&#xD;Line 66:   &#xD;Line 67:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 98, 19, true);&#xD;Line 68:   &#xD;Line 69:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 117, 19, true);&#xD;Line 70:   &#xD;Line 71:   WriteLiteral(&amp;quot;&amp;gt;\r\n            &amp;lt;div&amp;quot;);&#xD;Line 72:   &#xD;Line 73:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 117, 19, true);&#xD;Line 74:   &#xD;Line 75:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 136, 26, true);&#xD;Line 76:   &#xD;Line 77:   WriteLiteral(&amp;quot; class=\&amp;quot;row i-search-wrap\&amp;quot;&amp;quot;);&#xD;Line 78:   &#xD;Line 79:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 136, 26, true);&#xD;Line 80:   &#xD;Line 81:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 162, 23, true);&#xD;Line 82:   &#xD;Line 83:   WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 84:   &#xD;Line 85:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 162, 23, true);&#xD;Line 86:   &#xD;Line 87:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 185, 39, true);&#xD;Line 88:   &#xD;Line 89:   WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-1 i-col-pad i-bor-right\&amp;quot;&amp;quot;);&#xD;Line 90:   &#xD;Line 91:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 185, 39, true);&#xD;Line 92:   &#xD;Line 93:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 224, 3, true);&#xD;Line 94:   &#xD;Line 95:   WriteLiteral(&amp;quot;&amp;gt;\r\n&amp;quot;);&#xD;Line 96:   &#xD;Line 97:   EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 224, 3, true);&#xD;Line 98:   &#xD;Line 99:   BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 227, 20, true);&#xD;Line 100:  &#xD;Line 101:  WriteLiteral(&amp;quot;                    &amp;quot;);&#xD;Line 102:  &#xD;Line 103:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 227, 20, true);&#xD;Line 104:  &#xD;Line 105:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 248, 102, false);&#xD;Line 106:  &#xD;Line 107:              &#xD;Line 108:              #line 7 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\SearchPanel.cshtml&amp;quot;&#xD;Line 109:                 Write(Html.DropDownListFor(x =&amp;gt; x.SelectedcityId, Model.cityLst, &amp;quot;City a &amp;quot;, new { @class = &amp;quot;selectpicker&amp;quot; }));&#xD;Line 110:  &#xD;Line 111:              &#xD;Line 112:              #line default&#xD;Line 113:              #line hidden&#xD;Line 114:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 248, 102, false);&#xD;Line 115:  &#xD;Line 116:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 350, 46, true);&#xD;Line 117:  &#xD;Line 118:  WriteLiteral(&amp;quot;\r\n                &amp;lt;/div&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 119:  &#xD;Line 120:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 350, 46, true);&#xD;Line 121:  &#xD;Line 122:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 396, 39, true);&#xD;Line 123:  &#xD;Line 124:  WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-2 i-col-pad i-bor-right\&amp;quot;&amp;quot;);&#xD;Line 125:  &#xD;Line 126:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 396, 39, true);&#xD;Line 127:  &#xD;Line 128:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 435, 3, true);&#xD;Line 129:  &#xD;Line 130:  WriteLiteral(&amp;quot;&amp;gt;\r\n&amp;quot;);&#xD;Line 131:  &#xD;Line 132:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 435, 3, true);&#xD;Line 133:  &#xD;Line 134:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 438, 20, true);&#xD;Line 135:  &#xD;Line 136:  WriteLiteral(&amp;quot;                    &amp;quot;);&#xD;Line 137:  &#xD;Line 138:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 438, 20, true);&#xD;Line 139:  &#xD;Line 140:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 459, 93, false);&#xD;Line 141:  &#xD;Line 142:              &#xD;Line 143:              #line 10 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\SearchPanel.cshtml&amp;quot;&#xD;Line 144:                 Write(Html.TextBoxFor(x=&amp;gt;x.zipCode, new {@class = &amp;quot;form-control&amp;quot;, placeholder = &amp;quot;Enter Zip Code&amp;quot; }));&#xD;Line 145:  &#xD;Line 146:              &#xD;Line 147:              #line default&#xD;Line 148:              #line hidden&#xD;Line 149:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 459, 93, false);&#xD;Line 150:  &#xD;Line 151:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 552, 46, true);&#xD;Line 152:  &#xD;Line 153:  WriteLiteral(&amp;quot;\r\n                &amp;lt;/div&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 154:  &#xD;Line 155:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 552, 46, true);&#xD;Line 156:  &#xD;Line 157:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 598, 39, true);&#xD;Line 158:  &#xD;Line 159:  WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-4 i-col-pad i-bor-right\&amp;quot;&amp;quot;);&#xD;Line 160:  &#xD;Line 161:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 598, 39, true);&#xD;Line 162:  &#xD;Line 163:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 637, 7, true);&#xD;Line 164:  &#xD;Line 165:  WriteLiteral(&amp;quot;&amp;gt;&amp;lt;input&amp;quot;);&#xD;Line 166:  &#xD;Line 167:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 637, 7, true);&#xD;Line 168:  &#xD;Line 169:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 644, 12, true);&#xD;Line 170:  &#xD;Line 171:  WriteLiteral(&amp;quot; type=\&amp;quot;text\&amp;quot;&amp;quot;);&#xD;Line 172:  &#xD;Line 173:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 644, 12, true);&#xD;Line 174:  &#xD;Line 175:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 656, 21, true);&#xD;Line 176:  &#xD;Line 177:  WriteLiteral(&amp;quot; class=\&amp;quot;form-control\&amp;quot;&amp;quot;);&#xD;Line 178:  &#xD;Line 179:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 656, 21, true);&#xD;Line 180:  &#xD;Line 181:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 677, 10, true);&#xD;Line 182:  &#xD;Line 183:  WriteLiteral(&amp;quot; size=\&amp;quot;50\&amp;quot;&amp;quot;);&#xD;Line 184:  &#xD;Line 185:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 677, 10, true);&#xD;Line 186:  &#xD;Line 187:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 687, 33, true);&#xD;Line 188:  &#xD;Line 189:  WriteLiteral(&amp;quot; placeholder=\&amp;quot;Enter Your Keyword\&amp;quot;&amp;quot;);&#xD;Line 190:  &#xD;Line 191:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 687, 33, true);&#xD;Line 192:  &#xD;Line 193:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 720, 31, true);&#xD;Line 194:  &#xD;Line 195:  WriteLiteral(&amp;quot; /&amp;gt;&amp;lt;/div&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 196:  &#xD;Line 197:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 720, 31, true);&#xD;Line 198:  &#xD;Line 199:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 751, 39, true);&#xD;Line 200:  &#xD;Line 201:  WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-2 i-col-pad i-bor-right\&amp;quot;&amp;quot;);&#xD;Line 202:  &#xD;Line 203:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 751, 39, true);&#xD;Line 204:  &#xD;Line 205:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 790, 30, true);&#xD;Line 206:  &#xD;Line 207:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;select&amp;quot;);&#xD;Line 208:  &#xD;Line 209:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 790, 30, true);&#xD;Line 210:  &#xD;Line 211:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 820, 21, true);&#xD;Line 212:  &#xD;Line 213:  WriteLiteral(&amp;quot; class=\&amp;quot;selectpicker\&amp;quot;&amp;quot;);&#xD;Line 214:  &#xD;Line 215:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 820, 21, true);&#xD;Line 216:  &#xD;Line 217:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 841, 17, true);&#xD;Line 218:  &#xD;Line 219:  WriteLiteral(&amp;quot; title=\&amp;quot;Category\&amp;quot;&amp;quot;);&#xD;Line 220:  &#xD;Line 221:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 841, 17, true);&#xD;Line 222:  &#xD;Line 223:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 858, 34, true);&#xD;Line 224:  &#xD;Line 225:  WriteLiteral(&amp;quot;&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 226:  &#xD;Line 227:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 858, 34, true);&#xD;Line 228:  &#xD;Line 229:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 892, 9, true);&#xD;Line 230:  &#xD;Line 231:  WriteLiteral(&amp;quot; value=\&amp;quot;\&amp;quot;&amp;quot;);&#xD;Line 232:  &#xD;Line 233:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 892, 9, true);&#xD;Line 234:  &#xD;Line 235:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 901, 69, true);&#xD;Line 236:  &#xD;Line 237:  WriteLiteral(&amp;quot; selected disabled&amp;gt;Category&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 238:  &#xD;Line 239:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 901, 69, true);&#xD;Line 240:  &#xD;Line 241:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 970, 10, true);&#xD;Line 242:  &#xD;Line 243:  WriteLiteral(&amp;quot; value=\&amp;quot;1\&amp;quot;&amp;quot;);&#xD;Line 244:  &#xD;Line 245:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 970, 10, true);&#xD;Line 246:  &#xD;Line 247:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 980, 53, true);&#xD;Line 248:  &#xD;Line 249:  WriteLiteral(&amp;quot;&amp;gt;Category 1&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 250:  &#xD;Line 251:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 980, 53, true);&#xD;Line 252:  &#xD;Line 253:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1033, 10, true);&#xD;Line 254:  &#xD;Line 255:  WriteLiteral(&amp;quot; value=\&amp;quot;2\&amp;quot;&amp;quot;);&#xD;Line 256:  &#xD;Line 257:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1033, 10, true);&#xD;Line 258:  &#xD;Line 259:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1043, 53, true);&#xD;Line 260:  &#xD;Line 261:  WriteLiteral(&amp;quot;&amp;gt;Category 2&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 262:  &#xD;Line 263:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1043, 53, true);&#xD;Line 264:  &#xD;Line 265:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1096, 10, true);&#xD;Line 266:  &#xD;Line 267:  WriteLiteral(&amp;quot; value=\&amp;quot;3\&amp;quot;&amp;quot;);&#xD;Line 268:  &#xD;Line 269:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1096, 10, true);&#xD;Line 270:  &#xD;Line 271:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1106, 97, true);&#xD;Line 272:  &#xD;Line 273:  WriteLiteral(&amp;quot;&amp;gt;Category 3&amp;lt;/option&amp;gt;\r\n                    &amp;lt;/select&amp;gt;\r\n                &amp;lt;/div&amp;gt;\r\n    &amp;quot; +&#xD;Line 274:  &amp;quot;            &amp;lt;div&amp;quot;);&#xD;Line 275:  &#xD;Line 276:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1106, 97, true);&#xD;Line 277:  &#xD;Line 278:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1203, 39, true);&#xD;Line 279:  &#xD;Line 280:  WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-2 i-col-pad i-bor-right\&amp;quot;&amp;quot;);&#xD;Line 281:  &#xD;Line 282:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1203, 39, true);&#xD;Line 283:  &#xD;Line 284:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1242, 30, true);&#xD;Line 285:  &#xD;Line 286:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;select&amp;quot;);&#xD;Line 287:  &#xD;Line 288:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1242, 30, true);&#xD;Line 289:  &#xD;Line 290:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1272, 21, true);&#xD;Line 291:  &#xD;Line 292:  WriteLiteral(&amp;quot; class=\&amp;quot;selectpicker\&amp;quot;&amp;quot;);&#xD;Line 293:  &#xD;Line 294:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1272, 21, true);&#xD;Line 295:  &#xD;Line 296:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1293, 21, true);&#xD;Line 297:  &#xD;Line 298:  WriteLiteral(&amp;quot; title=\&amp;quot;Sub Category\&amp;quot;&amp;quot;);&#xD;Line 299:  &#xD;Line 300:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1293, 21, true);&#xD;Line 301:  &#xD;Line 302:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1314, 34, true);&#xD;Line 303:  &#xD;Line 304:  WriteLiteral(&amp;quot;&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 305:  &#xD;Line 306:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1314, 34, true);&#xD;Line 307:  &#xD;Line 308:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1348, 9, true);&#xD;Line 309:  &#xD;Line 310:  WriteLiteral(&amp;quot; value=\&amp;quot;\&amp;quot;&amp;quot;);&#xD;Line 311:  &#xD;Line 312:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1348, 9, true);&#xD;Line 313:  &#xD;Line 314:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1357, 73, true);&#xD;Line 315:  &#xD;Line 316:  WriteLiteral(&amp;quot; selected disabled&amp;gt;Sub Category&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 317:  &#xD;Line 318:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1357, 73, true);&#xD;Line 319:  &#xD;Line 320:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1430, 10, true);&#xD;Line 321:  &#xD;Line 322:  WriteLiteral(&amp;quot; value=\&amp;quot;1\&amp;quot;&amp;quot;);&#xD;Line 323:  &#xD;Line 324:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1430, 10, true);&#xD;Line 325:  &#xD;Line 326:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1440, 57, true);&#xD;Line 327:  &#xD;Line 328:  WriteLiteral(&amp;quot;&amp;gt;Sub Category 1&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 329:  &#xD;Line 330:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1440, 57, true);&#xD;Line 331:  &#xD;Line 332:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1497, 10, true);&#xD;Line 333:  &#xD;Line 334:  WriteLiteral(&amp;quot; value=\&amp;quot;2\&amp;quot;&amp;quot;);&#xD;Line 335:  &#xD;Line 336:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1497, 10, true);&#xD;Line 337:  &#xD;Line 338:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1507, 57, true);&#xD;Line 339:  &#xD;Line 340:  WriteLiteral(&amp;quot;&amp;gt;Sub Category 2&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 341:  &#xD;Line 342:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1507, 57, true);&#xD;Line 343:  &#xD;Line 344:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1564, 10, true);&#xD;Line 345:  &#xD;Line 346:  WriteLiteral(&amp;quot; value=\&amp;quot;3\&amp;quot;&amp;quot;);&#xD;Line 347:  &#xD;Line 348:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1564, 10, true);&#xD;Line 349:  &#xD;Line 350:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1574, 101, true);&#xD;Line 351:  &#xD;Line 352:  WriteLiteral(&amp;quot;&amp;gt;Sub Category 3&amp;lt;/option&amp;gt;\r\n                    &amp;lt;/select&amp;gt;\r\n                &amp;lt;/div&amp;gt;\r\n&amp;quot; +&#xD;Line 353:  &amp;quot;                &amp;lt;div&amp;quot;);&#xD;Line 354:  &#xD;Line 355:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1574, 101, true);&#xD;Line 356:  &#xD;Line 357:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1675, 27, true);&#xD;Line 358:  &#xD;Line 359:  WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-1 i-col-pad\&amp;quot;&amp;quot;);&#xD;Line 360:  &#xD;Line 361:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1675, 27, true);&#xD;Line 362:  &#xD;Line 363:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1702, 30, true);&#xD;Line 364:  &#xD;Line 365:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;select&amp;quot;);&#xD;Line 366:  &#xD;Line 367:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1702, 30, true);&#xD;Line 368:  &#xD;Line 369:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1732, 21, true);&#xD;Line 370:  &#xD;Line 371:  WriteLiteral(&amp;quot; class=\&amp;quot;selectpicker\&amp;quot;&amp;quot;);&#xD;Line 372:  &#xD;Line 373:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1732, 21, true);&#xD;Line 374:  &#xD;Line 375:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1753, 14, true);&#xD;Line 376:  &#xD;Line 377:  WriteLiteral(&amp;quot; title=\&amp;quot;Price\&amp;quot;&amp;quot;);&#xD;Line 378:  &#xD;Line 379:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1753, 14, true);&#xD;Line 380:  &#xD;Line 381:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1767, 34, true);&#xD;Line 382:  &#xD;Line 383:  WriteLiteral(&amp;quot;&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 384:  &#xD;Line 385:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1767, 34, true);&#xD;Line 386:  &#xD;Line 387:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1801, 9, true);&#xD;Line 388:  &#xD;Line 389:  WriteLiteral(&amp;quot; value=\&amp;quot;\&amp;quot;&amp;quot;);&#xD;Line 390:  &#xD;Line 391:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1801, 9, true);&#xD;Line 392:  &#xD;Line 393:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1810, 66, true);&#xD;Line 394:  &#xD;Line 395:  WriteLiteral(&amp;quot; selected disabled&amp;gt;Price&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 396:  &#xD;Line 397:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1810, 66, true);&#xD;Line 398:  &#xD;Line 399:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1876, 10, true);&#xD;Line 400:  &#xD;Line 401:  WriteLiteral(&amp;quot; value=\&amp;quot;1\&amp;quot;&amp;quot;);&#xD;Line 402:  &#xD;Line 403:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1876, 10, true);&#xD;Line 404:  &#xD;Line 405:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1886, 50, true);&#xD;Line 406:  &#xD;Line 407:  WriteLiteral(&amp;quot;&amp;gt;Price 1&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 408:  &#xD;Line 409:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1886, 50, true);&#xD;Line 410:  &#xD;Line 411:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1936, 10, true);&#xD;Line 412:  &#xD;Line 413:  WriteLiteral(&amp;quot; value=\&amp;quot;2\&amp;quot;&amp;quot;);&#xD;Line 414:  &#xD;Line 415:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1936, 10, true);&#xD;Line 416:  &#xD;Line 417:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1946, 50, true);&#xD;Line 418:  &#xD;Line 419:  WriteLiteral(&amp;quot;&amp;gt;Price 2&amp;lt;/option&amp;gt;\r\n                        &amp;lt;option&amp;quot;);&#xD;Line 420:  &#xD;Line 421:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1946, 50, true);&#xD;Line 422:  &#xD;Line 423:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1996, 10, true);&#xD;Line 424:  &#xD;Line 425:  WriteLiteral(&amp;quot; value=\&amp;quot;3\&amp;quot;&amp;quot;);&#xD;Line 426:  &#xD;Line 427:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 1996, 10, true);&#xD;Line 428:  &#xD;Line 429:  BeginContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 2006, 131, true);&#xD;Line 430:  &#xD;Line 431:  WriteLiteral(&amp;quot;&amp;gt;Price 3&amp;lt;/option&amp;gt;\r\n                    &amp;lt;/select&amp;gt;\r\n                &amp;lt;/div&amp;gt;\r\n       &amp;quot; +&#xD;Line 432:  &amp;quot;     &amp;lt;/div&amp;gt;\r\n        &amp;lt;/div&amp;gt;\r\n    &amp;lt;/div&amp;gt;\r\n&amp;lt;/form&amp;gt;\r\n&amp;quot;);&#xD;Line 433:  &#xD;Line 434:  EndContext(&amp;quot;~/Views/Shared/SearchPanel.cshtml&amp;quot;, 2006, 131, true);&#xD;Line 435:  &#xD;Line 436:          }&#xD;Line 437:      }&#xD;Line 438:  }&#xD;Line 439:  &lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&#xD;&#xA;    &lt;script type=&quot;text/javascript&quot;&gt;&#xD;&#xA;    function OnToggleTOCLevel1(level2ID)&#xD;&#xA;    {&#xD;&#xA;      var elemLevel2 = document.getElementById(level2ID);&#xD;&#xA;      if (elemLevel2.style.display == ''none'')&#xD;&#xA;      {&#xD;&#xA;        elemLevel2.style.display = '''';&#xD;&#xA;      }&#xD;&#xA;      else {&#xD;&#xA;        elemLevel2.style.display = ''none'';&#xD;&#xA;      }&#xD;&#xA;    }&#xD;&#xA;    &lt;/script&gt;&#xD;&#xA;                          &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;    &lt;/body&gt;&#xD;&#xA;&lt;/html&gt;&#xD;&#xA;">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="57191" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'0e8859d0-2697-44da-a228-0586274a5459', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'EntityFramework', N'The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:13:05.550' AS DateTime), 19, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted."
  source="EntityFramework"
  detail="System.InvalidOperationException: The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.PrepareToSaveChanges(SaveOptions options)&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)&#xD;&#xA;   at System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 269"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:13:05.5507572Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4378&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4378&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="62834" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="6fAfbZIxaURbB3BGtvzxR7bYUlAaLh91FPoJBB0TwR9jgJ1FdHr92ZxngFTVgTmOaoCj8FuyXIukW9tyaVsqefoLbMGYwm7f0dr7wfXPgaxBXK_tXKs2csyG4T9y-izOYITaDh4V-guYrMfv1KUxEA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="yagnesh" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="yag@asdf.com" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="8806028939" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="3" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="50" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="4" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="74" />
    </item>
    <item
      name="Selectedprices[2].Id">
      <value
        string="5" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="55" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'e9c32c5b-9e69-4e32-881b-0a7f6c068b7b', N'spa_db', N'DATAFUSION-PC', N'System.NullReferenceException', N'code', N'Object reference not set to an instance of an object.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:13:08.347' AS DateTime), 20, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.NullReferenceException"
  message="Object reference not set to an instance of an object."
  source="code"
  detail="System.NullReferenceException: Object reference not set to an instance of an object.&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.&lt;&gt;c__DisplayClass12_1.&lt;getSpaVMFromSpaBasicInfo&gt;b__1(spa_prices e) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at System.Linq.Enumerable.Any[TSource](IEnumerable`1 source, Func`2 predicate)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.&lt;&gt;c__DisplayClass12_0.&lt;getSpaVMFromSpaBasicInfo&gt;b__0(Intcheckboxmodel x) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()&#xD;&#xA;   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)&#xD;&#xA;   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.getSpaVMFromSpaBasicInfo(Int64 spaId) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 277&#xD;&#xA;   at lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;BeginInvokeSynchronousActionMethod&gt;b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3d()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;&gt;c__DisplayClass46.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3f()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;&gt;c__DisplayClass2b.&lt;BeginInvokeAction&gt;b__1c()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:13:08.3459171Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4378&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4378&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="62834" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="6fAfbZIxaURbB3BGtvzxR7bYUlAaLh91FPoJBB0TwR9jgJ1FdHr92ZxngFTVgTmOaoCj8FuyXIukW9tyaVsqefoLbMGYwm7f0dr7wfXPgaxBXK_tXKs2csyG4T9y-izOYITaDh4V-guYrMfv1KUxEA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="yagnesh" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="yag@asdf.com" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="8806028939" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="3" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="50" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="4" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="74" />
    </item>
    <item
      name="Selectedprices[2].Id">
      <value
        string="5" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="55" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'b427ca6a-2800-410f-a8b4-697be4dc52ec', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'EntityFramework', N'The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:16:22.607' AS DateTime), 21, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted."
  source="EntityFramework"
  detail="System.InvalidOperationException: The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.PrepareToSaveChanges(SaveOptions options)&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)&#xD;&#xA;   at System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 269"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:16:22.6080283Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4378&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4378&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="62849" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="6fAfbZIxaURbB3BGtvzxR7bYUlAaLh91FPoJBB0TwR9jgJ1FdHr92ZxngFTVgTmOaoCj8FuyXIukW9tyaVsqefoLbMGYwm7f0dr7wfXPgaxBXK_tXKs2csyG4T9y-izOYITaDh4V-guYrMfv1KUxEA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="yagnesh" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="yag@asdf.com" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="8806028939" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="3" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="50" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="4" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="74" />
    </item>
    <item
      name="Selectedprices[2].Id">
      <value
        string="5" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="55" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'2bcdd01b-1133-4ca7-b7c1-657a9d8e4534', N'spa_db', N'DATAFUSION-PC', N'System.NullReferenceException', N'code', N'Object reference not set to an instance of an object.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:16:27.477' AS DateTime), 22, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.NullReferenceException"
  message="Object reference not set to an instance of an object."
  source="code"
  detail="System.NullReferenceException: Object reference not set to an instance of an object.&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.&lt;&gt;c__DisplayClass12_1.&lt;getSpaVMFromSpaBasicInfo&gt;b__1(spa_prices e) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at System.Linq.Enumerable.Any[TSource](IEnumerable`1 source, Func`2 predicate)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.&lt;&gt;c__DisplayClass12_0.&lt;getSpaVMFromSpaBasicInfo&gt;b__0(Intcheckboxmodel x) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()&#xD;&#xA;   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)&#xD;&#xA;   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.getSpaVMFromSpaBasicInfo(Int64 spaId) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 277&#xD;&#xA;   at lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;BeginInvokeSynchronousActionMethod&gt;b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3d()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;&gt;c__DisplayClass46.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3f()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;&gt;c__DisplayClass2b.&lt;BeginInvokeAction&gt;b__1c()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:16:27.4773068Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4378&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4378&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="62849" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="6fAfbZIxaURbB3BGtvzxR7bYUlAaLh91FPoJBB0TwR9jgJ1FdHr92ZxngFTVgTmOaoCj8FuyXIukW9tyaVsqefoLbMGYwm7f0dr7wfXPgaxBXK_tXKs2csyG4T9y-izOYITaDh4V-guYrMfv1KUxEA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="yagnesh" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="yag@asdf.com" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="8806028939" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="3" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="50" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="4" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="74" />
    </item>
    <item
      name="Selectedprices[2].Id">
      <value
        string="5" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="55" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'7800c1cd-a624-426e-bbe9-88a3f77a1202', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'EntityFramework', N'The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:18:55.203' AS DateTime), 23, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted."
  source="EntityFramework"
  detail="System.InvalidOperationException: The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.PrepareToSaveChanges(SaveOptions options)&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)&#xD;&#xA;   at System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 269"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:18:55.2017561Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4378&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4378&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="62915" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="6fAfbZIxaURbB3BGtvzxR7bYUlAaLh91FPoJBB0TwR9jgJ1FdHr92ZxngFTVgTmOaoCj8FuyXIukW9tyaVsqefoLbMGYwm7f0dr7wfXPgaxBXK_tXKs2csyG4T9y-izOYITaDh4V-guYrMfv1KUxEA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="yagnesh" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="yag@asdf.com" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="8806028939" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="3" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="50" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="4" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="74" />
    </item>
    <item
      name="Selectedprices[2].Id">
      <value
        string="5" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="55" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'f216c277-d999-484c-bfb5-38777ee9e7ff', N'spa_db', N'DATAFUSION-PC', N'System.NullReferenceException', N'code', N'Object reference not set to an instance of an object.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:18:55.313' AS DateTime), 24, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.NullReferenceException"
  message="Object reference not set to an instance of an object."
  source="code"
  detail="System.NullReferenceException: Object reference not set to an instance of an object.&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.&lt;&gt;c__DisplayClass12_1.&lt;getSpaVMFromSpaBasicInfo&gt;b__1(spa_prices e) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at System.Linq.Enumerable.Any[TSource](IEnumerable`1 source, Func`2 predicate)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.&lt;&gt;c__DisplayClass12_0.&lt;getSpaVMFromSpaBasicInfo&gt;b__0(Intcheckboxmodel x) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()&#xD;&#xA;   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)&#xD;&#xA;   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.getSpaVMFromSpaBasicInfo(Int64 spaId) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 277&#xD;&#xA;   at lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;BeginInvokeSynchronousActionMethod&gt;b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3d()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;&gt;c__DisplayClass46.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3f()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;&gt;c__DisplayClass2b.&lt;BeginInvokeAction&gt;b__1c()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:18:55.3137625Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4378&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4378&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="62915" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="6fAfbZIxaURbB3BGtvzxR7bYUlAaLh91FPoJBB0TwR9jgJ1FdHr92ZxngFTVgTmOaoCj8FuyXIukW9tyaVsqefoLbMGYwm7f0dr7wfXPgaxBXK_tXKs2csyG4T9y-izOYITaDh4V-guYrMfv1KUxEA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="yagnesh" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="yag@asdf.com" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="8806028939" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="3" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="50" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="4" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="74" />
    </item>
    <item
      name="Selectedprices[2].Id">
      <value
        string="5" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="55" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'05fa5018-95c0-41e3-a587-a2eba976632c', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'EntityFramework', N'The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:20:36.900' AS DateTime), 25, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted."
  source="EntityFramework"
  detail="System.InvalidOperationException: The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.PrepareToSaveChanges(SaveOptions options)&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)&#xD;&#xA;   at System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 269"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:20:36.8995729Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4378&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4378&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="62937" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="6fAfbZIxaURbB3BGtvzxR7bYUlAaLh91FPoJBB0TwR9jgJ1FdHr92ZxngFTVgTmOaoCj8FuyXIukW9tyaVsqefoLbMGYwm7f0dr7wfXPgaxBXK_tXKs2csyG4T9y-izOYITaDh4V-guYrMfv1KUxEA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="yagnesh" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="yag@asdf.com" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="8806028939" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="3" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="50" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="4" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="74" />
    </item>
    <item
      name="Selectedprices[2].Id">
      <value
        string="5" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="55" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'a0ba1392-583e-4fd3-a2cc-77828c4799b4', N'spa_db', N'DATAFUSION-PC', N'System.NullReferenceException', N'code', N'Object reference not set to an instance of an object.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:20:37.177' AS DateTime), 26, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.NullReferenceException"
  message="Object reference not set to an instance of an object."
  source="code"
  detail="System.NullReferenceException: Object reference not set to an instance of an object.&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.&lt;&gt;c__DisplayClass12_1.&lt;getSpaVMFromSpaBasicInfo&gt;b__1(spa_prices e) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at System.Linq.Enumerable.Any[TSource](IEnumerable`1 source, Func`2 predicate)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.&lt;&gt;c__DisplayClass12_0.&lt;getSpaVMFromSpaBasicInfo&gt;b__0(Intcheckboxmodel x) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()&#xD;&#xA;   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)&#xD;&#xA;   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.getSpaVMFromSpaBasicInfo(Int64 spaId) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 314&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 277&#xD;&#xA;   at lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;BeginInvokeSynchronousActionMethod&gt;b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3d()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;&gt;c__DisplayClass46.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3f()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;&gt;c__DisplayClass2b.&lt;BeginInvokeAction&gt;b__1c()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:20:37.1765887Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4378&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4378&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="62937" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4378" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary9hGTRLqA3P4u7WLO" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="6fAfbZIxaURbB3BGtvzxR7bYUlAaLh91FPoJBB0TwR9jgJ1FdHr92ZxngFTVgTmOaoCj8FuyXIukW9tyaVsqefoLbMGYwm7f0dr7wfXPgaxBXK_tXKs2csyG4T9y-izOYITaDh4V-guYrMfv1KUxEA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="yagnesh" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="yag@asdf.com" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="8806028939" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="3" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="50" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="4" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="74" />
    </item>
    <item
      name="Selectedprices[2].Id">
      <value
        string="5" />
    </item>
    <item
      name="Selectedprices[2].prices">
      <value
        string="55" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'd48e207a-e4fc-4ce3-8aee-4d6b20d839e5', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'EntityFramework', N'The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:23:08.413' AS DateTime), 27, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted."
  source="EntityFramework"
  detail="System.InvalidOperationException: The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.PrepareToSaveChanges(SaveOptions options)&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)&#xD;&#xA;   at System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 269"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:23:08.4142390Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4129&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundary75bDQXy4Bq0R38ET&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4129&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundary75bDQXy4Bq0R38ET&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4129" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary75bDQXy4Bq0R38ET" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="63107" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4129" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundary75bDQXy4Bq0R38ET" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="zZ18RTaH3hmb72Eemm2Cp1B2vfP7sfLgSmaGWx_PGMY5JZAlABqLiltWv9li7GVwEhtVSQUcla80vt9hM0JK5PniXRerLq11J5NTu2rW1mD9E71GGigJFUuQAS4v46yuSZRELck4xVXGhBtpAAiTFg2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="9" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="62" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="10" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="88" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'00779d2b-76c9-4067-b0dc-ef0627261501', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'EntityFramework', N'The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:23:14.957' AS DateTime), 28, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted."
  source="EntityFramework"
  detail="System.InvalidOperationException: The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.PrepareToSaveChanges(SaveOptions options)&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)&#xD;&#xA;   at System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 269"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:23:14.9576133Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4129&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundaryleACIyVC8c8lTZ4o&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4129&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryleACIyVC8c8lTZ4o&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4129" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundaryleACIyVC8c8lTZ4o" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="63112" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4129" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundaryleACIyVC8c8lTZ4o" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="zWN9nHtqSD29aB48UaOJr99UmsEE-3eDkKRsTbnY50DNUDfw4DVSOr4XEhfdVOzpJtdWpftAWe1Bui4r1apD0UllZZzQ1msjc4AZQYJqguBmcp0QuBhGZVyhDxR2Z7aVcm8UjyRh2FwQGnu24IT-cg2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="9" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="62" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="10" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="88" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'caac738f-2774-470e-9c82-360579f1c7e6', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'EntityFramework', N'The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:26:34.357' AS DateTime), 29, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted."
  source="EntityFramework"
  detail="System.InvalidOperationException: The operation failed: The relationship could not be changed because one or more of the foreign-key properties is non-nullable. When a change is made to a relationship, the related foreign-key property is set to a null value. If the foreign-key does not support null values, a new relationship must be defined, the foreign-key property must be assigned another non-null value, or the unrelated object must be deleted.&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.PrepareToSaveChanges(SaveOptions options)&#xD;&#xA;   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)&#xD;&#xA;   at System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   at code.Areas.Admin.Controllers.spaController.Edit(spa_VM model) in D:\Yagnesh\Deepen\Deepen_SPA\code\Areas\Admin\Controllers\spaController.cs:line 269"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:26:34.3580184Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4129&#xD;&#xA;HTTP_CONTENT_TYPE:multipart/form-data; boundary=----WebKitFormBoundaryv0b1vAZabAoU14wA&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Content-Length: 4129&#xD;&#xA;Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryv0b1vAZabAoU14wA&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa/Edit/3&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4129" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundaryv0b1vAZabAoU14wA" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Edit\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="63123" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4129" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="multipart/form-data; boundary=----WebKitFormBoundaryv0b1vAZabAoU14wA" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa/Edit/3" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <form>
    <item
      name="__RequestVerificationToken">
      <value
        string="Hpu71z27AA0G_hFoZ1CbXxrwGkz8mjZfPMxbNkAIxIIj9lHOENTeYcihOeh1YhVJvMTf9EkOZeYk8SlHeI1SKaSjCwh6RB1NGzP2nAntU6Fe5n23TMH2z8oqRFqqSQU0NO-BOq24BSDJeYRNUh5JjA2" />
    </item>
    <item
      name="basic_info.name">
      <value
        string="spa abc" />
    </item>
    <item
      name="basic_info.cityId">
      <value
        string="2" />
    </item>
    <item
      name="basic_info.info_about">
      <value
        string="ASFD ASDFASDF" />
    </item>
    <item
      name="basic_info.contact_name">
      <value
        string="" />
    </item>
    <item
      name="basic_info.contact_email">
      <value
        string="" />
    </item>
    <item
      name="basic_info.contact_no">
      <value
        string="" />
    </item>
    <item
      name="categoryLst[0].Id">
      <value
        string="1" />
    </item>
    <item
      name="categoryLst[0].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[1].Id">
      <value
        string="2" />
    </item>
    <item
      name="categoryLst[1].isChecked">
      <value
        string="true" />
      <value
        string="false" />
    </item>
    <item
      name="categoryLst[2].Id">
      <value
        string="3" />
    </item>
    <item
      name="categoryLst[2].isChecked">
      <value
        string="false" />
    </item>
    <item
      name="Selectedprices[0].Id">
      <value
        string="9" />
    </item>
    <item
      name="Selectedprices[0].prices">
      <value
        string="62" />
    </item>
    <item
      name="Selectedprices[1].Id">
      <value
        string="10" />
    </item>
    <item
      name="Selectedprices[1].prices">
      <value
        string="88" />
    </item>
    <item
      name="timings[0].week_day">
      <value
        string="Sunday" />
    </item>
    <item
      name="timings[0].frm_to_times">
      <value
        string="Closed" />
    </item>
    <item
      name="timings[1].week_day">
      <value
        string="Monday" />
    </item>
    <item
      name="timings[1].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[2].week_day">
      <value
        string="Tuesday" />
    </item>
    <item
      name="timings[2].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[3].week_day">
      <value
        string="Wednesday" />
    </item>
    <item
      name="timings[3].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[4].week_day">
      <value
        string="Thursday" />
    </item>
    <item
      name="timings[4].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[5].week_day">
      <value
        string="Friday" />
    </item>
    <item
      name="timings[5].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="timings[6].week_day">
      <value
        string="Saturday" />
    </item>
    <item
      name="timings[6].frm_to_times">
      <value
        string="10.00 am to 9.00 pm" />
    </item>
    <item
      name="basic_info.id">
      <value
        string="3" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="DO3AXctF8WeObMpgbo8SFVmQ_7nHhFocPfksoNAK_rEYgZeZ7KG54t1H3fmqYXYo_rQ3ieZgbXhedzWcnIZHHEXJIIp4cJ_pkKKFrufcZFKF_mgNcHSAUq1duHZRPO7ALX8DZKII_0GZJ2MPcHxs-vPViKahuNxesXreq2x6rHbvc9qHId4z4pxUcZt2bC4HSDs0IhPT2c4WX-JC4mbUTMOsnlv982b7WGZs73UCKj6HvY53CYQhyGDL4AjgpxewTaD7nANrbqgHFXOsrEwgvDPlqPjfGOXBhuN6PaJD4HvMz8Y8xr6gWprv_Di4SYAH2msN-pdI7nRQQtovwiePq3UHewVfljW4DG8ZgeT-8Cpgz59oB7YtNodF7LiwGCwM7B8VSNmA-76nDQP94HiwjLS0XTONPR9pjjIFjf-QRWQwn-wI-6UpdG5Q0-bdVR7pcUEnvkOJab4dAm55v9k9Z963PjkksZX-NWbwPjt82LacQlBInULJ_nWNuzI1uxflOPs4PrAawtfltcd98gxUWw" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'3c8d5f8d-d830-490a-9a24-7e2ad58c6315', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'System.Web.Mvc', N'The view ''Details'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Areas/Admin/Views/spa/Details.aspx
~/Areas/Admin/Views/spa/Details.ascx
~/Areas/Admin/Views/Shared/Details.aspx
~/Areas/Admin/Views/Shared/Details.ascx
~/Views/spa/Details.aspx
~/Views/spa/Details.ascx
~/Views/Shared/Details.aspx
~/Views/Shared/Details.ascx
~/Areas/Admin/Views/spa/Details.cshtml
~/Areas/Admin/Views/spa/Details.vbhtml
~/Areas/Admin/', N'yagneshdxt@gmail.com', 0, CAST(N'2017-07-29 21:42:59.937' AS DateTime), 32, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The view ''Details'' or its master was not found or no view engine supports the searched locations. The following locations were searched:&#xD;&#xA;~/Areas/Admin/Views/spa/Details.aspx&#xD;&#xA;~/Areas/Admin/Views/spa/Details.ascx&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.aspx&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.ascx&#xD;&#xA;~/Views/spa/Details.aspx&#xD;&#xA;~/Views/spa/Details.ascx&#xD;&#xA;~/Views/Shared/Details.aspx&#xD;&#xA;~/Views/Shared/Details.ascx&#xD;&#xA;~/Areas/Admin/Views/spa/Details.cshtml&#xD;&#xA;~/Areas/Admin/Views/spa/Details.vbhtml&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.cshtml&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.vbhtml&#xD;&#xA;~/Views/spa/Details.cshtml&#xD;&#xA;~/Views/spa/Details.vbhtml&#xD;&#xA;~/Views/Shared/Details.cshtml&#xD;&#xA;~/Views/Shared/Details.vbhtml"
  source="System.Web.Mvc"
  detail="System.InvalidOperationException: The view ''Details'' or its master was not found or no view engine supports the searched locations. The following locations were searched:&#xD;&#xA;~/Areas/Admin/Views/spa/Details.aspx&#xD;&#xA;~/Areas/Admin/Views/spa/Details.ascx&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.aspx&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.ascx&#xD;&#xA;~/Views/spa/Details.aspx&#xD;&#xA;~/Views/spa/Details.ascx&#xD;&#xA;~/Views/Shared/Details.aspx&#xD;&#xA;~/Views/Shared/Details.ascx&#xD;&#xA;~/Areas/Admin/Views/spa/Details.cshtml&#xD;&#xA;~/Areas/Admin/Views/spa/Details.vbhtml&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.cshtml&#xD;&#xA;~/Areas/Admin/Views/Shared/Details.vbhtml&#xD;&#xA;~/Views/spa/Details.cshtml&#xD;&#xA;~/Views/spa/Details.vbhtml&#xD;&#xA;~/Views/Shared/Details.cshtml&#xD;&#xA;~/Views/Shared/Details.vbhtml&#xD;&#xA;   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  user="yagneshdxt@gmail.com"
  time="2017-07-29T21:42:59.9363902Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=WsZrWVnZypT24j5uCixIXNVAdNdiylYL41YN8tkANuRuporp77Hh-HFhwSG2f7g2_WFCJMYPE8VD1Le_OZiTsc_M5x_bWZ9uUyeD_H1jRyyKbraOC2RxOR2VxYmAP1-6w2ZCs-h_zuFLJsGRRtbeq9p2sTC1IRgsqD630FFRAQ0mTbMut_LScuWqVWVqQiBCo7ulr9bIZB8vh8JV7UncX2NqseTgbr6d7RGB_YdKiMQKaoEDHRdDaxBocJoazHgiKYW7XiGGubzCIe8gPZGZbnIX7tot9PIEJrGB5QUN38hatHO_dUUqfaW5ldb2Jf2ze4UrIwXkDMb0e2UcGuIXlWLo0oXG7Z8SHOQO8GRlTyW0LAqAxPnxCiV5_8OjnELnq2vyssal8LvgR-J8ZRxdEXikuj9usNESRGoDsrg_u-Xa26gKfvaDP_Z9yTFx9_agBpOkgVJP6gq6MPCoXdKWKFOCWZbmO51xEf0lc1My0q_y50xSwqapsKFwq8n7Fmh1WEw91HgpXqpLqZo0CODlLA&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/Admin/spa&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=WsZrWVnZypT24j5uCixIXNVAdNdiylYL41YN8tkANuRuporp77Hh-HFhwSG2f7g2_WFCJMYPE8VD1Le_OZiTsc_M5x_bWZ9uUyeD_H1jRyyKbraOC2RxOR2VxYmAP1-6w2ZCs-h_zuFLJsGRRtbeq9p2sTC1IRgsqD630FFRAQ0mTbMut_LScuWqVWVqQiBCo7ulr9bIZB8vh8JV7UncX2NqseTgbr6d7RGB_YdKiMQKaoEDHRdDaxBocJoazHgiKYW7XiGGubzCIe8gPZGZbnIX7tot9PIEJrGB5QUN38hatHO_dUUqfaW5ldb2Jf2ze4UrIwXkDMb0e2UcGuIXlWLo0oXG7Z8SHOQO8GRlTyW0LAqAxPnxCiV5_8OjnELnq2vyssal8LvgR-J8ZRxdEXikuj9usNESRGoDsrg_u-Xa26gKfvaDP_Z9yTFx9_agBpOkgVJP6gq6MPCoXdKWKFOCWZbmO51xEf0lc1My0q_y50xSwqapsKFwq8n7Fmh1WEw91HgpXqpLqZo0CODlLA&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/Admin/spa&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="ApplicationCookie" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="yagneshdxt@gmail.com" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Admin/spa/Details/3" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Admin\spa\Details\3" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="63463" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Admin/spa/Details/3" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Admin/spa/Details/3" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41; .AspNet.ApplicationCookie=WsZrWVnZypT24j5uCixIXNVAdNdiylYL41YN8tkANuRuporp77Hh-HFhwSG2f7g2_WFCJMYPE8VD1Le_OZiTsc_M5x_bWZ9uUyeD_H1jRyyKbraOC2RxOR2VxYmAP1-6w2ZCs-h_zuFLJsGRRtbeq9p2sTC1IRgsqD630FFRAQ0mTbMut_LScuWqVWVqQiBCo7ulr9bIZB8vh8JV7UncX2NqseTgbr6d7RGB_YdKiMQKaoEDHRdDaxBocJoazHgiKYW7XiGGubzCIe8gPZGZbnIX7tot9PIEJrGB5QUN38hatHO_dUUqfaW5ldb2Jf2ze4UrIwXkDMb0e2UcGuIXlWLo0oXG7Z8SHOQO8GRlTyW0LAqAxPnxCiV5_8OjnELnq2vyssal8LvgR-J8ZRxdEXikuj9usNESRGoDsrg_u-Xa26gKfvaDP_Z9yTFx9_agBpOkgVJP6gq6MPCoXdKWKFOCWZbmO51xEf0lc1My0q_y50xSwqapsKFwq8n7Fmh1WEw91HgpXqpLqZo0CODlLA" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/Admin/spa" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="adQzvS6cA5OoJTXkCNmotzjHc_i_nQMSWopdGPX87sZMN94-b-PiFDd48BG-yUAsz5gBNi3mc3I7Nq4x8wCjwXnI01YUMQXd3M5dD0aW9k41" />
    </item>
    <item
      name=".AspNet.ApplicationCookie">
      <value
        string="WsZrWVnZypT24j5uCixIXNVAdNdiylYL41YN8tkANuRuporp77Hh-HFhwSG2f7g2_WFCJMYPE8VD1Le_OZiTsc_M5x_bWZ9uUyeD_H1jRyyKbraOC2RxOR2VxYmAP1-6w2ZCs-h_zuFLJsGRRtbeq9p2sTC1IRgsqD630FFRAQ0mTbMut_LScuWqVWVqQiBCo7ulr9bIZB8vh8JV7UncX2NqseTgbr6d7RGB_YdKiMQKaoEDHRdDaxBocJoazHgiKYW7XiGGubzCIe8gPZGZbnIX7tot9PIEJrGB5QUN38hatHO_dUUqfaW5ldb2Jf2ze4UrIwXkDMb0e2UcGuIXlWLo0oXG7Z8SHOQO8GRlTyW0LAqAxPnxCiV5_8OjnELnq2vyssal8LvgR-J8ZRxdEXikuj9usNESRGoDsrg_u-Xa26gKfvaDP_Z9yTFx9_agBpOkgVJP6gq6MPCoXdKWKFOCWZbmO51xEf0lc1My0q_y50xSwqapsKFwq8n7Fmh1WEw91HgpXqpLqZo0CODlLA" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'f688282b-ce20-41bf-bc1b-66451e011a60', N'spa_db', N'DATAFUSION-PC', N'System.Web.HttpCompileException', N'System.Web', N'D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml(54): error CS1503: Argument 1: cannot convert from ''void'' to ''System.Web.WebPages.HelperResult''', N'', 500, CAST(N'2017-07-30 16:38:40.163' AS DateTime), 34, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.Web.HttpCompileException"
  message="D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml(54): error CS1503: Argument 1: cannot convert from ''void'' to ''System.Web.WebPages.HelperResult''"
  source="System.Web"
  detail="System.Web.HttpCompileException (0x80004005): D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml(54): error CS1503: Argument 1: cannot convert from ''void'' to ''System.Web.WebPages.HelperResult''&#xD;&#xA;   at System.Web.Compilation.AssemblyBuilder.Compile()&#xD;&#xA;   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()&#xD;&#xA;   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)&#xD;&#xA;   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)&#xD;&#xA;   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)&#xD;&#xA;   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)&#xD;&#xA;   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.&lt;&gt;c__DisplayClass3.&lt;RenderPageCore&gt;b__2(TextWriter writer)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.Write(HelperResult result)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)&#xD;&#xA;   at System.Web.WebPages.WebPageBase.PopContext()&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2017-07-30T16:38:40.1623183Z"
  statusCode="500"
  webHostHtmlMessage="&lt;!DOCTYPE html&gt;&#xD;&#xA;&lt;html&gt;&#xD;&#xA;    &lt;head&gt;&#xD;&#xA;        &lt;title&gt;Compilation Error&lt;/title&gt;&#xD;&#xA;        &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width&quot; /&gt;&#xD;&#xA;        &lt;style&gt;&#xD;&#xA;         body {font-family:&quot;Verdana&quot;;font-weight:normal;font-size: .7em;color:black;} &#xD;&#xA;         p {font-family:&quot;Verdana&quot;;font-weight:normal;color:black;margin-top: -5px}&#xD;&#xA;         b {font-family:&quot;Verdana&quot;;font-weight:bold;color:black;margin-top: -5px}&#xD;&#xA;         H1 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:18pt;color:red }&#xD;&#xA;         H2 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:14pt;color:maroon }&#xD;&#xA;         pre {font-family:&quot;Consolas&quot;,&quot;Lucida Console&quot;,Monospace;font-size:11pt;margin:0;padding:0.5em;line-height:14pt}&#xD;&#xA;         .marker {font-weight: bold; color: black;text-decoration: none;}&#xD;&#xA;         .version {color: gray;}&#xD;&#xA;         .error {margin-bottom: 10px;}&#xD;&#xA;         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }&#xD;&#xA;         @media screen and (max-width: 639px) {&#xD;&#xA;          pre { width: 440px; overflow: auto; white-space: pre-wrap; word-wrap: break-word; }&#xD;&#xA;         }&#xD;&#xA;         @media screen and (max-width: 479px) {&#xD;&#xA;          pre { width: 280px; }&#xD;&#xA;         }&#xD;&#xA;        &lt;/style&gt;&#xD;&#xA;    &lt;/head&gt;&#xD;&#xA;&#xD;&#xA;    &lt;body bgcolor=&quot;white&quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;span&gt;&lt;H1&gt;Server Error in ''/'' Application.&lt;hr width=100% size=1 color=silver&gt;&lt;/H1&gt;&#xD;&#xA;&#xD;&#xA;            &lt;h2&gt; &lt;i&gt;Compilation Error&lt;/i&gt; &lt;/h2&gt;&lt;/span&gt;&#xD;&#xA;&#xD;&#xA;            &lt;font face=&quot;Arial, Helvetica, Geneva, SunSans-Regular, sans-serif &quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; Description: &lt;/b&gt;An error occurred during the compilation of a resource required to service this request. Please review the following specific error details and modify your source code appropriately.&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; Compiler Error Message: &lt;/b&gt;CS1503: Argument 1: cannot convert from &amp;#39;void&amp;#39; to &amp;#39;System.Web.WebPages.HelperResult&amp;#39;&lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;b&gt;Source Error:&lt;/b&gt;&lt;br&gt;&lt;br&gt;&#xD;&#xA;            &lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&lt;td&gt;&#xD;&#xA;                              &lt;/td&gt;&lt;/tr&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;Line 52:                 &amp;lt;div class=&amp;quot;i-slogan&amp;quot;&amp;gt;Find the best prices near you&amp;lt;/div&amp;gt;&#xD;&#xA;Line 53:             &amp;lt;/div&amp;gt;&#xD;&#xA;&lt;font color=red&gt;Line 54:             @Html.RenderAction(&amp;quot;SearchPanel&amp;quot;, &amp;quot;Home&amp;quot;)&#xD;&#xA;&lt;/font&gt;Line 55:             &amp;lt;h1 class=&amp;quot;i-home-tlt&amp;quot;&amp;gt;Take care of yourself&amp;lt;/h1&amp;gt;&#xD;&#xA;Line 56:         &amp;lt;/div&amp;gt;&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt;Source File:&lt;/b&gt; D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&#xD;&#xA;            &amp;nbsp;&amp;nbsp; &lt;b&gt;Line:&lt;/b&gt;  54&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''compilerOutputDiv'')&quot;&gt;Show Detailed Compiler Output:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;compilerOutputDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;c:\windows\system32\inetsrv&amp;gt;D:\Yagnesh\Deepen\Deepen_SPA\code\bin\roslyn\csc.exe /t:library /utf8output /nostdlib+ /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\mscorlib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Runtime\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_64\System.Data\v4.0_4.0.0.0__b77a5c561934e089\System.Data.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Data.DataSetExtensions\v4.0_4.0.0.0__b77a5c561934e089\System.Data.DataSetExtensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\ec8f7895\00457b1b_813ad001\System.Web.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml.Linq\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.Linq.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\3d8e0692\00df286a_813ad001\System.Web.WebPages.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\333a3526\0097992d_58c5d201\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\2ed99b54\007e822a_d5add201\Microsoft.Owin.Host.SystemWeb.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.DynamicData\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.DynamicData.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_64\System.EnterpriseServices\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.EnterpriseServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\4f4f4b20\00abb32b_d5add201\Microsoft.Owin.Security.Cookies.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Web\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\e994ec33\00df08f7_1418cf01\WebGrease.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Drawing\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Drawing.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c6ab0581\005ef620_71cccd01\Owin.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\e6bed9fc\00df286a_813ad001\System.Web.Helpers.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\26389304\00f599b1_9d54d001\EntityFramework.SqlServer.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activation\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activation.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Runtime.Serialization\v4.0_4.0.0.0__b77a5c561934e089\System.Runtime.Serialization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\7b95bab4\0032472f_d5add201\Microsoft.Owin.Security.Twitter.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ComponentModel.DataAnnotations\v4.0_4.0.0.0__31bf3856ad364e35\System.ComponentModel.DataAnnotations.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\79b01fc2\004ab69c_aa10ce01\Antlr3.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\b5fdb4ff\00d8e42c_d5add201\Microsoft.Owin.Security.Google.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\3f329b8e\0005162e_d5add201\Microsoft.Owin.Security.OAuth.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c98fac55\00df286a_813ad001\System.Web.WebPages.Deployment.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_64\System.Web\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\625e249f\00d2e379_0f27cf01\System.Web.Optimization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.WorkflowServices\v4.0_4.0.0.0__31bf3856ad364e35\System.WorkflowServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.CSharp\v4.0_4.0.0.0__b03f5f7f11d50a3a\Microsoft.CSharp.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel\v4.0_4.0.0.0__b77a5c561934e089\System.ServiceModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c62df296\0005818c_026ed001\Microsoft.AspNet.Identity.Core.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\mscorlib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\eb3d10b6\0005818c_026ed001\Microsoft.AspNet.Identity.Owin.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\9e89153c\0080d323_813ad001\System.Web.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\f16c2952\1c315a3a_5009d301\code.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.ApplicationServices\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.ApplicationServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\b6800707\007f9000_3721cd01\Microsoft.Web.Infrastructure.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Services\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.Services.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\3f01b36c\63546105_8208d301\DataAccess.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Core\v4.0_4.0.0.0__b77a5c561934e089\System.Core.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.IdentityModel\v4.0_4.0.0.0__b77a5c561934e089\System.IdentityModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\5c3ae4ba\0005818c_026ed001\Microsoft.AspNet.Identity.EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\6b116fe4\0043c8ad_0ce8d201\Newtonsoft.Json.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Configuration\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Configuration.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\16b42220\00d8e42c_d5add201\Microsoft.Owin.Security.Facebook.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_global.asax.jtone_xh.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\d8dd2d67\00df286a_813ad001\System.Web.WebPages.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\7337447a\00d8ec18_b318cd01\Elmah.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.VisualStudio.Web.PageInspector.Loader\v4.0_1.0.0.0__b03f5f7f11d50a3a\Microsoft.VisualStudio.Web.PageInspector.Loader.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Extensions\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.Extensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\99ca1996\0005162e_d5add201\Microsoft.Owin.Security.MicrosoftAccount.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System\v4.0_4.0.0.0__b77a5c561934e089\System.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\c2168d5c\00242028_d5add201\Microsoft.Owin.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\e2996681\00abb32b_d5add201\Microsoft.Owin.Security.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\assembly\dl3\78ae0968\00f599b1_9d54d001\EntityFramework.dll&amp;quot; /out:&amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web__layout.cshtml.639c3968.t2zk6epf.dll&amp;quot; /D:DEBUG /debug+ /optimize- /warnaserror- /w:4 /nowarn:1659;1699;1701;612;618 /langversion:6 /nowarn:1659;1699;1701  &amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web__layout.cshtml.639c3968.t2zk6epf.0.cs&amp;quot; &amp;quot;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\root\85894a4c\573a0ead\App_Web__layout.cshtml.639c3968.t2zk6epf.1.cs&amp;quot;&#xD;&#xA;&#xD;&#xA;&#xD;&#xA;Microsoft (R) Visual C# Compiler version 2.3.0.61908 (281ac90b)&#xD;&#xA;Copyright (C) Microsoft Corporation. All rights reserved.&#xD;&#xA;&#xD;&#xA;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml(54,14): error CS1503: Argument 1: cannot convert from &amp;#39;void&amp;#39; to &amp;#39;System.Web.WebPages.HelperResult&amp;#39;&#xD;&#xA;&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''dynamicCodeDiv'')&quot;&gt;Show Complete Compilation Source:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;dynamicCodeDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;Line 1:    #pragma checksum &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot; &amp;quot;{ff1816ec-aa5e-4d10-87f7-6f4963833460}&amp;quot; &amp;quot;B510414ED68B79D5598A7B2518F3E71701C5E111&amp;quot;&#xD;Line 2:    //------------------------------------------------------------------------------&#xD;Line 3:    // &amp;lt;auto-generated&amp;gt;&#xD;Line 4:    //     This code was generated by a tool.&#xD;Line 5:    //     Runtime Version:4.0.30319.42000&#xD;Line 6:    //&#xD;Line 7:    //     Changes to this file may cause incorrect behavior and will be lost if&#xD;Line 8:    //     the code is regenerated.&#xD;Line 9:    // &amp;lt;/auto-generated&amp;gt;&#xD;Line 10:   //------------------------------------------------------------------------------&#xD;Line 11:   &#xD;Line 12:   namespace ASP {&#xD;Line 13:       using System;&#xD;Line 14:       using System.Collections.Generic;&#xD;Line 15:       using System.IO;&#xD;Line 16:       using System.Linq;&#xD;Line 17:       using System.Net;&#xD;Line 18:       using System.Web;&#xD;Line 19:       using System.Web.Helpers;&#xD;Line 20:       using System.Web.Security;&#xD;Line 21:       using System.Web.UI;&#xD;Line 22:       using System.Web.WebPages;&#xD;Line 23:       using System.Web.Mvc;&#xD;Line 24:       using System.Web.Mvc.Ajax;&#xD;Line 25:       using System.Web.Mvc.Html;&#xD;Line 26:       using System.Web.Optimization;&#xD;Line 27:       using System.Web.Routing;&#xD;Line 28:       using code;&#xD;Line 29:       &#xD;Line 30:       &#xD;Line 31:       public class _Page_Views_Shared__Layout_cshtml : System.Web.Mvc.WebViewPage&amp;lt;dynamic&amp;gt; {&#xD;Line 32:           &#xD;Line 33:   #line hidden&#xD;Line 34:           &#xD;Line 35:           public _Page_Views_Shared__Layout_cshtml() {&#xD;Line 36:           }&#xD;Line 37:           &#xD;Line 38:           protected ASP.global_asax ApplicationInstance {&#xD;Line 39:               get {&#xD;Line 40:                   return ((ASP.global_asax)(Context.ApplicationInstance));&#xD;Line 41:               }&#xD;Line 42:           }&#xD;Line 43:           &#xD;Line 44:           public override void Execute() {&#xD;Line 45:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 0, 102, true);&#xD;Line 46:   &#xD;Line 47:   WriteLiteral(&amp;quot;&amp;lt;!DOCTYPE html&amp;gt;\r\n&amp;lt;html&amp;gt;\r\n&amp;lt;head&amp;gt;\r\n    &amp;lt;title&amp;gt;Inkarn :: Find the best prices near y&amp;quot; +&#xD;Line 48:   &amp;quot;ou&amp;lt;/title&amp;gt;\r\n    &amp;lt;meta&amp;quot;);&#xD;Line 49:   &#xD;Line 50:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 0, 102, true);&#xD;Line 51:   &#xD;Line 52:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 102, 16, true);&#xD;Line 53:   &#xD;Line 54:   WriteLiteral(&amp;quot; charset=\&amp;quot;utf-8\&amp;quot;&amp;quot;);&#xD;Line 55:   &#xD;Line 56:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 102, 16, true);&#xD;Line 57:   &#xD;Line 58:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 118, 12, true);&#xD;Line 59:   &#xD;Line 60:   WriteLiteral(&amp;quot;&amp;gt;\r\n    &amp;lt;meta&amp;quot;);&#xD;Line 61:   &#xD;Line 62:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 118, 12, true);&#xD;Line 63:   &#xD;Line 64:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 130, 29, true);&#xD;Line 65:   &#xD;Line 66:   WriteLiteral(&amp;quot; http-equiv=\&amp;quot;X-UA-Compatible\&amp;quot;&amp;quot;);&#xD;Line 67:   &#xD;Line 68:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 130, 29, true);&#xD;Line 69:   &#xD;Line 70:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 159, 18, true);&#xD;Line 71:   &#xD;Line 72:   WriteLiteral(&amp;quot; content=\&amp;quot;IE=edge\&amp;quot;&amp;quot;);&#xD;Line 73:   &#xD;Line 74:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 159, 18, true);&#xD;Line 75:   &#xD;Line 76:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 177, 12, true);&#xD;Line 77:   &#xD;Line 78:   WriteLiteral(&amp;quot;&amp;gt;\r\n    &amp;lt;meta&amp;quot;);&#xD;Line 79:   &#xD;Line 80:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 177, 12, true);&#xD;Line 81:   &#xD;Line 82:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 189, 16, true);&#xD;Line 83:   &#xD;Line 84:   WriteLiteral(&amp;quot; name=\&amp;quot;viewport\&amp;quot;&amp;quot;);&#xD;Line 85:   &#xD;Line 86:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 189, 16, true);&#xD;Line 87:   &#xD;Line 88:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 205, 86, true);&#xD;Line 89:   &#xD;Line 90:   WriteLiteral(&amp;quot; content=\&amp;quot;width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale&amp;quot; +&#xD;Line 91:   &amp;quot;=1.0\&amp;quot;&amp;quot;);&#xD;Line 92:   &#xD;Line 93:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 205, 86, true);&#xD;Line 94:   &#xD;Line 95:   BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 291, 14, true);&#xD;Line 96:   &#xD;Line 97:   WriteLiteral(&amp;quot; /&amp;gt;\r\n    &amp;lt;meta&amp;quot;);&#xD;Line 98:   &#xD;Line 99:   EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 291, 14, true);&#xD;Line 100:  &#xD;Line 101:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 305, 36, true);&#xD;Line 102:  &#xD;Line 103:  WriteLiteral(&amp;quot; name=\&amp;quot;apple-mobile-web-app-capable\&amp;quot;&amp;quot;);&#xD;Line 104:  &#xD;Line 105:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 305, 36, true);&#xD;Line 106:  &#xD;Line 107:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 341, 14, true);&#xD;Line 108:  &#xD;Line 109:  WriteLiteral(&amp;quot; content=\&amp;quot;yes\&amp;quot;&amp;quot;);&#xD;Line 110:  &#xD;Line 111:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 341, 14, true);&#xD;Line 112:  &#xD;Line 113:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 355, 14, true);&#xD;Line 114:  &#xD;Line 115:  WriteLiteral(&amp;quot; /&amp;gt;\r\n    &amp;lt;meta&amp;quot;);&#xD;Line 116:  &#xD;Line 117:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 355, 14, true);&#xD;Line 118:  &#xD;Line 119:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 369, 24, true);&#xD;Line 120:  &#xD;Line 121:  WriteLiteral(&amp;quot; name=\&amp;quot;format-detection\&amp;quot;&amp;quot;);&#xD;Line 122:  &#xD;Line 123:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 369, 24, true);&#xD;Line 124:  &#xD;Line 125:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 393, 23, true);&#xD;Line 126:  &#xD;Line 127:  WriteLiteral(&amp;quot; content=\&amp;quot;telephone=no\&amp;quot;&amp;quot;);&#xD;Line 128:  &#xD;Line 129:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 393, 23, true);&#xD;Line 130:  &#xD;Line 131:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 416, 14, true);&#xD;Line 132:  &#xD;Line 133:  WriteLiteral(&amp;quot; /&amp;gt;\r\n    &amp;lt;link&amp;quot;);&#xD;Line 134:  &#xD;Line 135:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 416, 14, true);&#xD;Line 136:  &#xD;Line 137:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 430, 20, true);&#xD;Line 138:  &#xD;Line 139:  WriteLiteral(&amp;quot; rel=\&amp;quot;shortcut icon\&amp;quot;&amp;quot;);&#xD;Line 140:  &#xD;Line 141:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 430, 20, true);&#xD;Line 142:  &#xD;Line 143:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 450, 33, true);&#xD;Line 144:  &#xD;Line 145:  WriteLiteral(&amp;quot; href=\&amp;quot;images/favicon-inkarn.ico\&amp;quot;&amp;quot;);&#xD;Line 146:  &#xD;Line 147:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 450, 33, true);&#xD;Line 148:  &#xD;Line 149:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 483, 20, true);&#xD;Line 150:  &#xD;Line 151:  WriteLiteral(&amp;quot; type=\&amp;quot;image/x-icon\&amp;quot;&amp;quot;);&#xD;Line 152:  &#xD;Line 153:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 483, 20, true);&#xD;Line 154:  &#xD;Line 155:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 503, 5, true);&#xD;Line 156:  &#xD;Line 157:  WriteLiteral(&amp;quot; /&amp;gt;\r\n&amp;quot;);&#xD;Line 158:  &#xD;Line 159:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 503, 5, true);&#xD;Line 160:  &#xD;Line 161:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 508, 4, true);&#xD;Line 162:  &#xD;Line 163:  WriteLiteral(&amp;quot;    &amp;quot;);&#xD;Line 164:  &#xD;Line 165:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 508, 4, true);&#xD;Line 166:  &#xD;Line 167:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 513, 38, false);&#xD;Line 168:  &#xD;Line 169:              &#xD;Line 170:              #line 11 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot;&#xD;Line 171:  Write(Styles.Render(&amp;quot;~/Content/TheamOnecss&amp;quot;));&#xD;Line 172:  &#xD;Line 173:              &#xD;Line 174:              #line default&#xD;Line 175:              #line hidden&#xD;Line 176:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 513, 38, false);&#xD;Line 177:  &#xD;Line 178:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 551, 18, true);&#xD;Line 179:  &#xD;Line 180:  WriteLiteral(&amp;quot;\r\n\r\n&amp;lt;/head&amp;gt;\r\n&amp;lt;body&amp;quot;);&#xD;Line 181:  &#xD;Line 182:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 551, 18, true);&#xD;Line 183:  &#xD;Line 184:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 569, 12, true);&#xD;Line 185:  &#xD;Line 186:  WriteLiteral(&amp;quot; id=\&amp;quot;myPage\&amp;quot;&amp;quot;);&#xD;Line 187:  &#xD;Line 188:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 569, 12, true);&#xD;Line 189:  &#xD;Line 190:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 581, 18, true);&#xD;Line 191:  &#xD;Line 192:  WriteLiteral(&amp;quot; data-spy=\&amp;quot;scroll\&amp;quot;&amp;quot;);&#xD;Line 193:  &#xD;Line 194:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 581, 18, true);&#xD;Line 195:  &#xD;Line 196:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 599, 22, true);&#xD;Line 197:  &#xD;Line 198:  WriteLiteral(&amp;quot; data-target=\&amp;quot;.navbar\&amp;quot;&amp;quot;);&#xD;Line 199:  &#xD;Line 200:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 599, 22, true);&#xD;Line 201:  &#xD;Line 202:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 621, 17, true);&#xD;Line 203:  &#xD;Line 204:  WriteLiteral(&amp;quot; data-offset=\&amp;quot;60\&amp;quot;&amp;quot;);&#xD;Line 205:  &#xD;Line 206:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 621, 17, true);&#xD;Line 207:  &#xD;Line 208:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 638, 13, true);&#xD;Line 209:  &#xD;Line 210:  WriteLiteral(&amp;quot;&amp;gt;\r\n\r\n    &amp;lt;nav&amp;quot;);&#xD;Line 211:  &#xD;Line 212:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 638, 13, true);&#xD;Line 213:  &#xD;Line 214:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 651, 47, true);&#xD;Line 215:  &#xD;Line 216:  WriteLiteral(&amp;quot; class=\&amp;quot;navbar navbar-default navbar-fixed-top\&amp;quot;&amp;quot;);&#xD;Line 217:  &#xD;Line 218:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 651, 47, true);&#xD;Line 219:  &#xD;Line 220:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 698, 15, true);&#xD;Line 221:  &#xD;Line 222:  WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;div&amp;quot;);&#xD;Line 223:  &#xD;Line 224:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 698, 15, true);&#xD;Line 225:  &#xD;Line 226:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 713, 18, true);&#xD;Line 227:  &#xD;Line 228:  WriteLiteral(&amp;quot; class=\&amp;quot;container\&amp;quot;&amp;quot;);&#xD;Line 229:  &#xD;Line 230:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 713, 18, true);&#xD;Line 231:  &#xD;Line 232:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 731, 19, true);&#xD;Line 233:  &#xD;Line 234:  WriteLiteral(&amp;quot;&amp;gt;\r\n            &amp;lt;div&amp;quot;);&#xD;Line 235:  &#xD;Line 236:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 731, 19, true);&#xD;Line 237:  &#xD;Line 238:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 750, 22, true);&#xD;Line 239:  &#xD;Line 240:  WriteLiteral(&amp;quot; class=\&amp;quot;navbar-header\&amp;quot;&amp;quot;);&#xD;Line 241:  &#xD;Line 242:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 750, 22, true);&#xD;Line 243:  &#xD;Line 244:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 772, 26, true);&#xD;Line 245:  &#xD;Line 246:  WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;lt;button&amp;quot;);&#xD;Line 247:  &#xD;Line 248:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 772, 26, true);&#xD;Line 249:  &#xD;Line 250:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 798, 14, true);&#xD;Line 251:  &#xD;Line 252:  WriteLiteral(&amp;quot; type=\&amp;quot;button\&amp;quot;&amp;quot;);&#xD;Line 253:  &#xD;Line 254:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 798, 14, true);&#xD;Line 255:  &#xD;Line 256:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 812, 22, true);&#xD;Line 257:  &#xD;Line 258:  WriteLiteral(&amp;quot; class=\&amp;quot;navbar-toggle\&amp;quot;&amp;quot;);&#xD;Line 259:  &#xD;Line 260:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 812, 22, true);&#xD;Line 261:  &#xD;Line 262:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 834, 23, true);&#xD;Line 263:  &#xD;Line 264:  WriteLiteral(&amp;quot; data-toggle=\&amp;quot;collapse\&amp;quot;&amp;quot;);&#xD;Line 265:  &#xD;Line 266:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 834, 23, true);&#xD;Line 267:  &#xD;Line 268:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 857, 24, true);&#xD;Line 269:  &#xD;Line 270:  WriteLiteral(&amp;quot; data-target=\&amp;quot;#myNavbar\&amp;quot;&amp;quot;);&#xD;Line 271:  &#xD;Line 272:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 857, 24, true);&#xD;Line 273:  &#xD;Line 274:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 881, 28, true);&#xD;Line 275:  &#xD;Line 276:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;span&amp;quot;);&#xD;Line 277:  &#xD;Line 278:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 881, 28, true);&#xD;Line 279:  &#xD;Line 280:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 909, 17, true);&#xD;Line 281:  &#xD;Line 282:  WriteLiteral(&amp;quot; class=\&amp;quot;icon-bar\&amp;quot;&amp;quot;);&#xD;Line 283:  &#xD;Line 284:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 909, 17, true);&#xD;Line 285:  &#xD;Line 286:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 926, 35, true);&#xD;Line 287:  &#xD;Line 288:  WriteLiteral(&amp;quot;&amp;gt;&amp;lt;/span&amp;gt;\r\n                    &amp;lt;span&amp;quot;);&#xD;Line 289:  &#xD;Line 290:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 926, 35, true);&#xD;Line 291:  &#xD;Line 292:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 961, 17, true);&#xD;Line 293:  &#xD;Line 294:  WriteLiteral(&amp;quot; class=\&amp;quot;icon-bar\&amp;quot;&amp;quot;);&#xD;Line 295:  &#xD;Line 296:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 961, 17, true);&#xD;Line 297:  &#xD;Line 298:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 978, 35, true);&#xD;Line 299:  &#xD;Line 300:  WriteLiteral(&amp;quot;&amp;gt;&amp;lt;/span&amp;gt;\r\n                    &amp;lt;span&amp;quot;);&#xD;Line 301:  &#xD;Line 302:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 978, 35, true);&#xD;Line 303:  &#xD;Line 304:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1013, 17, true);&#xD;Line 305:  &#xD;Line 306:  WriteLiteral(&amp;quot; class=\&amp;quot;icon-bar\&amp;quot;&amp;quot;);&#xD;Line 307:  &#xD;Line 308:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1013, 17, true);&#xD;Line 309:  &#xD;Line 310:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1030, 55, true);&#xD;Line 311:  &#xD;Line 312:  WriteLiteral(&amp;quot;&amp;gt;&amp;lt;/span&amp;gt;\r\n                &amp;lt;/button&amp;gt;\r\n                &amp;lt;a&amp;quot;);&#xD;Line 313:  &#xD;Line 314:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1030, 55, true);&#xD;Line 315:  &#xD;Line 316:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1085, 21, true);&#xD;Line 317:  &#xD;Line 318:  WriteLiteral(&amp;quot; class=\&amp;quot;navbar-brand\&amp;quot;&amp;quot;);&#xD;Line 319:  &#xD;Line 320:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1085, 21, true);&#xD;Line 321:  &#xD;Line 322:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1106, 15, true);&#xD;Line 323:  &#xD;Line 324:  WriteLiteral(&amp;quot; href=\&amp;quot;#myPage\&amp;quot;&amp;quot;);&#xD;Line 325:  &#xD;Line 326:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1106, 15, true);&#xD;Line 327:  &#xD;Line 328:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1121, 27, true);&#xD;Line 329:  &#xD;Line 330:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;div&amp;quot;);&#xD;Line 331:  &#xD;Line 332:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1121, 27, true);&#xD;Line 333:  &#xD;Line 334:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1148, 25, true);&#xD;Line 335:  &#xD;Line 336:  WriteLiteral(&amp;quot; class=\&amp;quot;i-desk-logo-wrap\&amp;quot;&amp;quot;);&#xD;Line 337:  &#xD;Line 338:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1148, 25, true);&#xD;Line 339:  &#xD;Line 340:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1173, 31, true);&#xD;Line 341:  &#xD;Line 342:  WriteLiteral(&amp;quot;&amp;gt;\r\n                        &amp;lt;div&amp;quot;);&#xD;Line 343:  &#xD;Line 344:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1173, 31, true);&#xD;Line 345:  &#xD;Line 346:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1204, 20, true);&#xD;Line 347:  &#xD;Line 348:  WriteLiteral(&amp;quot; class=\&amp;quot;i-desk-logo\&amp;quot;&amp;quot;);&#xD;Line 349:  &#xD;Line 350:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1204, 20, true);&#xD;Line 351:  &#xD;Line 352:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1224, 36, true);&#xD;Line 353:  &#xD;Line 354:  WriteLiteral(&amp;quot;&amp;gt;\r\n                            &amp;lt;span&amp;quot;);&#xD;Line 355:  &#xD;Line 356:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1224, 36, true);&#xD;Line 357:  &#xD;Line 358:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1260, 19, true);&#xD;Line 359:  &#xD;Line 360:  WriteLiteral(&amp;quot; class=\&amp;quot;i-logo-txt\&amp;quot;&amp;quot;);&#xD;Line 361:  &#xD;Line 362:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1260, 19, true);&#xD;Line 363:  &#xD;Line 364:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1279, 49, true);&#xD;Line 365:  &#xD;Line 366:  WriteLiteral(&amp;quot;&amp;gt;Inkarn&amp;lt;/span&amp;gt;\r\n                            &amp;lt;span&amp;quot;);&#xD;Line 367:  &#xD;Line 368:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1279, 49, true);&#xD;Line 369:  &#xD;Line 370:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1328, 17, true);&#xD;Line 371:  &#xD;Line 372:  WriteLiteral(&amp;quot; class=\&amp;quot;i-slogan\&amp;quot;&amp;quot;);&#xD;Line 373:  &#xD;Line 374:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1328, 17, true);&#xD;Line 375:  &#xD;Line 376:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1345, 159, true);&#xD;Line 377:  &#xD;Line 378:  WriteLiteral(&amp;quot;&amp;gt;Find the best prices near you&amp;lt;/span&amp;gt;\r\n                        &amp;lt;/div&amp;gt;\r\n\r\n        &amp;quot; +&#xD;Line 379:  &amp;quot;            &amp;lt;/div&amp;gt;\r\n                &amp;lt;/a&amp;gt;\r\n            &amp;lt;/div&amp;gt;\r\n            &amp;lt;div&amp;quot;);&#xD;Line 380:  &#xD;Line 381:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1345, 159, true);&#xD;Line 382:  &#xD;Line 383:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1504, 33, true);&#xD;Line 384:  &#xD;Line 385:  WriteLiteral(&amp;quot; class=\&amp;quot;collapse navbar-collapse\&amp;quot;&amp;quot;);&#xD;Line 386:  &#xD;Line 387:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1504, 33, true);&#xD;Line 388:  &#xD;Line 389:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1537, 14, true);&#xD;Line 390:  &#xD;Line 391:  WriteLiteral(&amp;quot; id=\&amp;quot;myNavbar\&amp;quot;&amp;quot;);&#xD;Line 392:  &#xD;Line 393:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1537, 14, true);&#xD;Line 394:  &#xD;Line 395:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1551, 22, true);&#xD;Line 396:  &#xD;Line 397:  WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;lt;ul&amp;quot;);&#xD;Line 398:  &#xD;Line 399:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1551, 22, true);&#xD;Line 400:  &#xD;Line 401:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1573, 36, true);&#xD;Line 402:  &#xD;Line 403:  WriteLiteral(&amp;quot; class=\&amp;quot;nav navbar-nav navbar-right\&amp;quot;&amp;quot;);&#xD;Line 404:  &#xD;Line 405:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1573, 36, true);&#xD;Line 406:  &#xD;Line 407:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1609, 55, true);&#xD;Line 408:  &#xD;Line 409:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;li&amp;gt;\r\n                        &amp;lt;a&amp;quot;);&#xD;Line 410:  &#xD;Line 411:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1609, 55, true);&#xD;Line 412:  &#xD;Line 413:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1664, 13, true);&#xD;Line 414:  &#xD;Line 415:  WriteLiteral(&amp;quot; href=\&amp;quot;#home\&amp;quot;&amp;quot;);&#xD;Line 416:  &#xD;Line 417:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1664, 13, true);&#xD;Line 418:  &#xD;Line 419:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1677, 11, true);&#xD;Line 420:  &#xD;Line 421:  WriteLiteral(&amp;quot;&amp;gt;Home&amp;lt;/a&amp;gt;\r\n&amp;quot;);&#xD;Line 422:  &#xD;Line 423:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1677, 11, true);&#xD;Line 424:  &#xD;Line 425:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1688, 24, true);&#xD;Line 426:  &#xD;Line 427:  WriteLiteral(&amp;quot;                        &amp;quot;);&#xD;Line 428:  &#xD;Line 429:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1688, 24, true);&#xD;Line 430:  &#xD;Line 431:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1713, 65, false);&#xD;Line 432:  &#xD;Line 433:              &#xD;Line 434:              #line 38 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot;&#xD;Line 435:                     Write(Html.ActionLink(&amp;quot;Home&amp;quot;, &amp;quot;Index&amp;quot;, &amp;quot;Home&amp;quot;, new { area = &amp;quot;&amp;quot; }, null));&#xD;Line 436:  &#xD;Line 437:              &#xD;Line 438:              #line default&#xD;Line 439:              #line hidden&#xD;Line 440:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1713, 65, false);&#xD;Line 441:  &#xD;Line 442:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1778, 55, true);&#xD;Line 443:  &#xD;Line 444:  WriteLiteral(&amp;quot;\r\n                    &amp;lt;/li&amp;gt;\r\n                    &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 445:  &#xD;Line 446:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1778, 55, true);&#xD;Line 447:  &#xD;Line 448:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1833, 16, true);&#xD;Line 449:  &#xD;Line 450:  WriteLiteral(&amp;quot; href=\&amp;quot;#aboutus\&amp;quot;&amp;quot;);&#xD;Line 451:  &#xD;Line 452:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1833, 16, true);&#xD;Line 453:  &#xD;Line 454:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1849, 46, true);&#xD;Line 455:  &#xD;Line 456:  WriteLiteral(&amp;quot;&amp;gt;About Us&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                    &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 457:  &#xD;Line 458:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1849, 46, true);&#xD;Line 459:  &#xD;Line 460:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1895, 18, true);&#xD;Line 461:  &#xD;Line 462:  WriteLiteral(&amp;quot; href=\&amp;quot;#contactus\&amp;quot;&amp;quot;);&#xD;Line 463:  &#xD;Line 464:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1895, 18, true);&#xD;Line 465:  &#xD;Line 466:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1913, 45, true);&#xD;Line 467:  &#xD;Line 468:  WriteLiteral(&amp;quot;&amp;gt;Contact Us&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                &amp;lt;/ul&amp;gt;\r\n&amp;quot;);&#xD;Line 469:  &#xD;Line 470:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1913, 45, true);&#xD;Line 471:  &#xD;Line 472:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1958, 16, true);&#xD;Line 473:  &#xD;Line 474:  WriteLiteral(&amp;quot;                &amp;quot;);&#xD;Line 475:  &#xD;Line 476:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1958, 16, true);&#xD;Line 477:  &#xD;Line 478:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1975, 29, false);&#xD;Line 479:  &#xD;Line 480:              &#xD;Line 481:              #line 43 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot;&#xD;Line 482:             Write(Html.Partial(&amp;quot;_LoginPartial&amp;quot;));&#xD;Line 483:  &#xD;Line 484:              &#xD;Line 485:              #line default&#xD;Line 486:              #line hidden&#xD;Line 487:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 1975, 29, false);&#xD;Line 488:  &#xD;Line 489:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2004, 60, true);&#xD;Line 490:  &#xD;Line 491:  WriteLiteral(&amp;quot;\r\n            &amp;lt;/div&amp;gt;\r\n        &amp;lt;/div&amp;gt;\r\n    &amp;lt;/nav&amp;gt;\r\n\r\n    &amp;lt;div&amp;quot;);&#xD;Line 492:  &#xD;Line 493:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2004, 60, true);&#xD;Line 494:  &#xD;Line 495:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2064, 44, true);&#xD;Line 496:  &#xD;Line 497:  WriteLiteral(&amp;quot; class=\&amp;quot;jumbotron i-home-banner text-center\&amp;quot;&amp;quot;);&#xD;Line 498:  &#xD;Line 499:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2064, 44, true);&#xD;Line 500:  &#xD;Line 501:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2108, 15, true);&#xD;Line 502:  &#xD;Line 503:  WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;div&amp;quot;);&#xD;Line 504:  &#xD;Line 505:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2108, 15, true);&#xD;Line 506:  &#xD;Line 507:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2123, 22, true);&#xD;Line 508:  &#xD;Line 509:  WriteLiteral(&amp;quot; class=\&amp;quot;i-banner-form\&amp;quot;&amp;quot;);&#xD;Line 510:  &#xD;Line 511:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2123, 22, true);&#xD;Line 512:  &#xD;Line 513:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2145, 19, true);&#xD;Line 514:  &#xD;Line 515:  WriteLiteral(&amp;quot;&amp;gt;\r\n            &amp;lt;div&amp;quot;);&#xD;Line 516:  &#xD;Line 517:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2145, 19, true);&#xD;Line 518:  &#xD;Line 519:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2164, 25, true);&#xD;Line 520:  &#xD;Line 521:  WriteLiteral(&amp;quot; class=\&amp;quot;i-desk-logo-wrap\&amp;quot;&amp;quot;);&#xD;Line 522:  &#xD;Line 523:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2164, 25, true);&#xD;Line 524:  &#xD;Line 525:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2189, 23, true);&#xD;Line 526:  &#xD;Line 527:  WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 528:  &#xD;Line 529:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2189, 23, true);&#xD;Line 530:  &#xD;Line 531:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2212, 20, true);&#xD;Line 532:  &#xD;Line 533:  WriteLiteral(&amp;quot; class=\&amp;quot;i-desk-logo\&amp;quot;&amp;quot;);&#xD;Line 534:  &#xD;Line 535:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2212, 20, true);&#xD;Line 536:  &#xD;Line 537:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2232, 34, true);&#xD;Line 538:  &#xD;Line 539:  WriteLiteral(&amp;quot;&amp;gt;nkarn&amp;lt;/div&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 540:  &#xD;Line 541:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2232, 34, true);&#xD;Line 542:  &#xD;Line 543:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2266, 17, true);&#xD;Line 544:  &#xD;Line 545:  WriteLiteral(&amp;quot; class=\&amp;quot;i-slogan\&amp;quot;&amp;quot;);&#xD;Line 546:  &#xD;Line 547:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2266, 17, true);&#xD;Line 548:  &#xD;Line 549:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2283, 58, true);&#xD;Line 550:  &#xD;Line 551:  WriteLiteral(&amp;quot;&amp;gt;Find the best prices near you&amp;lt;/div&amp;gt;\r\n            &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;Line 552:  &#xD;Line 553:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2283, 58, true);&#xD;Line 554:  &#xD;Line 555:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2341, 12, true);&#xD;Line 556:  &#xD;Line 557:  WriteLiteral(&amp;quot;            &amp;quot;);&#xD;Line 558:  &#xD;Line 559:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2341, 12, true);&#xD;Line 560:  &#xD;Line 561:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2354, 40, false);&#xD;Line 562:  &#xD;Line 563:              &#xD;Line 564:              #line 54 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot;&#xD;Line 565:         Write(Html.RenderAction(&amp;quot;SearchPanel&amp;quot;, &amp;quot;Home&amp;quot;));&#xD;Line 566:  &#xD;Line 567:              &#xD;Line 568:              #line default&#xD;Line 569:              #line hidden&#xD;Line 570:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2354, 40, false);&#xD;Line 571:  &#xD;Line 572:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2394, 17, true);&#xD;Line 573:  &#xD;Line 574:  WriteLiteral(&amp;quot;\r\n            &amp;lt;h1&amp;quot;);&#xD;Line 575:  &#xD;Line 576:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2394, 17, true);&#xD;Line 577:  &#xD;Line 578:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2411, 19, true);&#xD;Line 579:  &#xD;Line 580:  WriteLiteral(&amp;quot; class=\&amp;quot;i-home-tlt\&amp;quot;&amp;quot;);&#xD;Line 581:  &#xD;Line 582:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2411, 19, true);&#xD;Line 583:  &#xD;Line 584:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2430, 65, true);&#xD;Line 585:  &#xD;Line 586:  WriteLiteral(&amp;quot;&amp;gt;Take care of yourself&amp;lt;/h1&amp;gt;\r\n        &amp;lt;/div&amp;gt;\r\n    &amp;lt;/div&amp;gt;\r\n    &amp;lt;div&amp;quot;);&#xD;Line 587:  &#xD;Line 588:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2430, 65, true);&#xD;Line 589:  &#xD;Line 590:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2495, 35, true);&#xD;Line 591:  &#xD;Line 592:  WriteLiteral(&amp;quot; class=\&amp;quot;container-fluid i-bor-top6\&amp;quot;&amp;quot;);&#xD;Line 593:  &#xD;Line 594:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2495, 35, true);&#xD;Line 595:  &#xD;Line 596:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2530, 37, true);&#xD;Line 597:  &#xD;Line 598:  WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;footer&amp;gt;\r\n            &amp;lt;div&amp;quot;);&#xD;Line 599:  &#xD;Line 600:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2530, 37, true);&#xD;Line 601:  &#xD;Line 602:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2567, 22, true);&#xD;Line 603:  &#xD;Line 604:  WriteLiteral(&amp;quot; class=\&amp;quot;row slideanim\&amp;quot;&amp;quot;);&#xD;Line 605:  &#xD;Line 606:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2567, 22, true);&#xD;Line 607:  &#xD;Line 608:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2589, 23, true);&#xD;Line 609:  &#xD;Line 610:  WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 611:  &#xD;Line 612:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2589, 23, true);&#xD;Line 613:  &#xD;Line 614:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2612, 31, true);&#xD;Line 615:  &#xD;Line 616:  WriteLiteral(&amp;quot; class=\&amp;quot;col-md-6 col-md-push-6\&amp;quot;&amp;quot;);&#xD;Line 617:  &#xD;Line 618:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2612, 31, true);&#xD;Line 619:  &#xD;Line 620:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2643, 76, true);&#xD;Line 621:  &#xD;Line 622:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;!-- Contact Form START --&amp;gt;\r\n                    &amp;lt;div&amp;quot;);&#xD;Line 623:  &#xD;Line 624:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2643, 76, true);&#xD;Line 625:  &#xD;Line 626:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2719, 13, true);&#xD;Line 627:  &#xD;Line 628:  WriteLiteral(&amp;quot; id=\&amp;quot;contact\&amp;quot;&amp;quot;);&#xD;Line 629:  &#xD;Line 630:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2719, 13, true);&#xD;Line 631:  &#xD;Line 632:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2732, 23, true);&#xD;Line 633:  &#xD;Line 634:  WriteLiteral(&amp;quot; class=\&amp;quot;i-contact-form\&amp;quot;&amp;quot;);&#xD;Line 635:  &#xD;Line 636:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2732, 23, true);&#xD;Line 637:  &#xD;Line 638:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2755, 81, true);&#xD;Line 639:  &#xD;Line 640:  WriteLiteral(&amp;quot;&amp;gt;\r\n                        &amp;lt;h4&amp;gt;Give A Feedback&amp;lt;/h4&amp;gt;\r\n                        &amp;lt;div&amp;quot; +&#xD;Line 641:  &amp;quot;&amp;quot;);&#xD;Line 642:  &#xD;Line 643:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2755, 81, true);&#xD;Line 644:  &#xD;Line 645:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2836, 12, true);&#xD;Line 646:  &#xD;Line 647:  WriteLiteral(&amp;quot; class=\&amp;quot;row\&amp;quot;&amp;quot;);&#xD;Line 648:  &#xD;Line 649:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2836, 12, true);&#xD;Line 650:  &#xD;Line 651:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2848, 35, true);&#xD;Line 652:  &#xD;Line 653:  WriteLiteral(&amp;quot;&amp;gt;\r\n                            &amp;lt;div&amp;quot;);&#xD;Line 654:  &#xD;Line 655:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2848, 35, true);&#xD;Line 656:  &#xD;Line 657:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2883, 29, true);&#xD;Line 658:  &#xD;Line 659:  WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-12 form-group\&amp;quot;&amp;quot;);&#xD;Line 660:  &#xD;Line 661:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2883, 29, true);&#xD;Line 662:  &#xD;Line 663:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2912, 44, true);&#xD;Line 664:  &#xD;Line 665:  WriteLiteral(&amp;quot;&amp;gt;\r\n                                &amp;lt;textarea&amp;quot;);&#xD;Line 666:  &#xD;Line 667:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2912, 44, true);&#xD;Line 668:  &#xD;Line 669:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2956, 21, true);&#xD;Line 670:  &#xD;Line 671:  WriteLiteral(&amp;quot; class=\&amp;quot;form-control\&amp;quot;&amp;quot;);&#xD;Line 672:  &#xD;Line 673:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2956, 21, true);&#xD;Line 674:  &#xD;Line 675:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2977, 14, true);&#xD;Line 676:  &#xD;Line 677:  WriteLiteral(&amp;quot; id=\&amp;quot;comments\&amp;quot;&amp;quot;);&#xD;Line 678:  &#xD;Line 679:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2977, 14, true);&#xD;Line 680:  &#xD;Line 681:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2991, 16, true);&#xD;Line 682:  &#xD;Line 683:  WriteLiteral(&amp;quot; name=\&amp;quot;comments\&amp;quot;&amp;quot;);&#xD;Line 684:  &#xD;Line 685:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 2991, 16, true);&#xD;Line 686:  &#xD;Line 687:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3007, 42, true);&#xD;Line 688:  &#xD;Line 689:  WriteLiteral(&amp;quot; placeholder=\&amp;quot;Write Your Comment Here ...\&amp;quot;&amp;quot;);&#xD;Line 690:  &#xD;Line 691:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3007, 42, true);&#xD;Line 692:  &#xD;Line 693:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3049, 9, true);&#xD;Line 694:  &#xD;Line 695:  WriteLiteral(&amp;quot; rows=\&amp;quot;5\&amp;quot;&amp;quot;);&#xD;Line 696:  &#xD;Line 697:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3049, 9, true);&#xD;Line 698:  &#xD;Line 699:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3058, 82, true);&#xD;Line 700:  &#xD;Line 701:  WriteLiteral(&amp;quot;&amp;gt;&amp;lt;/textarea&amp;gt;\r\n                            &amp;lt;/div&amp;gt;\r\n                            &amp;lt;di&amp;quot; +&#xD;Line 702:  &amp;quot;v&amp;quot;);&#xD;Line 703:  &#xD;Line 704:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3058, 82, true);&#xD;Line 705:  &#xD;Line 706:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3140, 29, true);&#xD;Line 707:  &#xD;Line 708:  WriteLiteral(&amp;quot; class=\&amp;quot;col-sm-12 form-group\&amp;quot;&amp;quot;);&#xD;Line 709:  &#xD;Line 710:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3140, 29, true);&#xD;Line 711:  &#xD;Line 712:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3169, 42, true);&#xD;Line 713:  &#xD;Line 714:  WriteLiteral(&amp;quot;&amp;gt;\r\n                                &amp;lt;button&amp;quot;);&#xD;Line 715:  &#xD;Line 716:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3169, 42, true);&#xD;Line 717:  &#xD;Line 718:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3211, 34, true);&#xD;Line 719:  &#xD;Line 720:  WriteLiteral(&amp;quot; class=\&amp;quot;btn btn-warning pull-left\&amp;quot;&amp;quot;);&#xD;Line 721:  &#xD;Line 722:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3211, 34, true);&#xD;Line 723:  &#xD;Line 724:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3245, 14, true);&#xD;Line 725:  &#xD;Line 726:  WriteLiteral(&amp;quot; type=\&amp;quot;submit\&amp;quot;&amp;quot;);&#xD;Line 727:  &#xD;Line 728:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3245, 14, true);&#xD;Line 729:  &#xD;Line 730:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3259, 205, true);&#xD;Line 731:  &#xD;Line 732:  WriteLiteral(&amp;quot;&amp;gt;Submit&amp;lt;/button&amp;gt;\r\n                            &amp;lt;/div&amp;gt;\r\n                        &amp;lt;/d&amp;quot; +&#xD;Line 733:  &amp;quot;iv&amp;gt;\r\n                    &amp;lt;/div&amp;gt;\r\n                    &amp;lt;!-- Contact Form END --&amp;gt;\r\n&amp;quot; +&#xD;Line 734:  &amp;quot;                &amp;lt;/div&amp;gt;\r\n                &amp;lt;div&amp;quot;);&#xD;Line 735:  &#xD;Line 736:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3259, 205, true);&#xD;Line 737:  &#xD;Line 738:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3464, 45, true);&#xD;Line 739:  &#xD;Line 740:  WriteLiteral(&amp;quot; class=\&amp;quot;col-md-6 col-md-pull-6 i-footer-link\&amp;quot;&amp;quot;);&#xD;Line 741:  &#xD;Line 742:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3464, 45, true);&#xD;Line 743:  &#xD;Line 744:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3509, 27, true);&#xD;Line 745:  &#xD;Line 746:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;div&amp;quot;);&#xD;Line 747:  &#xD;Line 748:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3509, 27, true);&#xD;Line 749:  &#xD;Line 750:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3536, 12, true);&#xD;Line 751:  &#xD;Line 752:  WriteLiteral(&amp;quot; class=\&amp;quot;row\&amp;quot;&amp;quot;);&#xD;Line 753:  &#xD;Line 754:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3536, 12, true);&#xD;Line 755:  &#xD;Line 756:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3548, 31, true);&#xD;Line 757:  &#xD;Line 758:  WriteLiteral(&amp;quot;&amp;gt;\r\n                        &amp;lt;div&amp;quot;);&#xD;Line 759:  &#xD;Line 760:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3548, 31, true);&#xD;Line 761:  &#xD;Line 762:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3579, 26, true);&#xD;Line 763:  &#xD;Line 764:  WriteLiteral(&amp;quot; class=\&amp;quot;col-xs-6 col-md-6\&amp;quot;&amp;quot;);&#xD;Line 765:  &#xD;Line 766:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3579, 26, true);&#xD;Line 767:  &#xD;Line 768:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3605, 123, true);&#xD;Line 769:  &#xD;Line 770:  WriteLiteral(&amp;quot;&amp;gt;\r\n                            &amp;lt;h4&amp;gt;Corporate&amp;lt;/h4&amp;gt;\r\n                            &amp;lt;u&amp;quot; +&#xD;Line 771:  &amp;quot;l&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 772:  &#xD;Line 773:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3605, 123, true);&#xD;Line 774:  &#xD;Line 775:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3728, 26, true);&#xD;Line 776:  &#xD;Line 777:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 778:  &#xD;Line 779:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3728, 26, true);&#xD;Line 780:  &#xD;Line 781:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3754, 17, true);&#xD;Line 782:  &#xD;Line 783:  WriteLiteral(&amp;quot; title=\&amp;quot;About us\&amp;quot;&amp;quot;);&#xD;Line 784:  &#xD;Line 785:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3754, 17, true);&#xD;Line 786:  &#xD;Line 787:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3771, 58, true);&#xD;Line 788:  &#xD;Line 789:  WriteLiteral(&amp;quot;&amp;gt;About us&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 790:  &#xD;Line 791:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3771, 58, true);&#xD;Line 792:  &#xD;Line 793:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3829, 26, true);&#xD;Line 794:  &#xD;Line 795:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 796:  &#xD;Line 797:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3829, 26, true);&#xD;Line 798:  &#xD;Line 799:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3855, 19, true);&#xD;Line 800:  &#xD;Line 801:  WriteLiteral(&amp;quot; title=\&amp;quot;Contact us\&amp;quot;&amp;quot;);&#xD;Line 802:  &#xD;Line 803:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3855, 19, true);&#xD;Line 804:  &#xD;Line 805:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3874, 60, true);&#xD;Line 806:  &#xD;Line 807:  WriteLiteral(&amp;quot;&amp;gt;Contact us&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 808:  &#xD;Line 809:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3874, 60, true);&#xD;Line 810:  &#xD;Line 811:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3934, 26, true);&#xD;Line 812:  &#xD;Line 813:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 814:  &#xD;Line 815:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3934, 26, true);&#xD;Line 816:  &#xD;Line 817:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3960, 27, true);&#xD;Line 818:  &#xD;Line 819:  WriteLiteral(&amp;quot; title=\&amp;quot;Terms &amp;amp; Conditions\&amp;quot;&amp;quot;);&#xD;Line 820:  &#xD;Line 821:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3960, 27, true);&#xD;Line 822:  &#xD;Line 823:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3987, 68, true);&#xD;Line 824:  &#xD;Line 825:  WriteLiteral(&amp;quot;&amp;gt;Terms &amp;amp; Conditions&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 826:  &#xD;Line 827:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 3987, 68, true);&#xD;Line 828:  &#xD;Line 829:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4055, 26, true);&#xD;Line 830:  &#xD;Line 831:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 832:  &#xD;Line 833:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4055, 26, true);&#xD;Line 834:  &#xD;Line 835:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4081, 23, true);&#xD;Line 836:  &#xD;Line 837:  WriteLiteral(&amp;quot; title=\&amp;quot;Privacy policy\&amp;quot;&amp;quot;);&#xD;Line 838:  &#xD;Line 839:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4081, 23, true);&#xD;Line 840:  &#xD;Line 841:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4104, 64, true);&#xD;Line 842:  &#xD;Line 843:  WriteLiteral(&amp;quot;&amp;gt;Privacy policy&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 844:  &#xD;Line 845:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4104, 64, true);&#xD;Line 846:  &#xD;Line 847:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4168, 26, true);&#xD;Line 848:  &#xD;Line 849:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 850:  &#xD;Line 851:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4168, 26, true);&#xD;Line 852:  &#xD;Line 853:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4194, 25, true);&#xD;Line 854:  &#xD;Line 855:  WriteLiteral(&amp;quot; title=\&amp;quot;Copyright policy\&amp;quot;&amp;quot;);&#xD;Line 856:  &#xD;Line 857:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4194, 25, true);&#xD;Line 858:  &#xD;Line 859:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4219, 123, true);&#xD;Line 860:  &#xD;Line 861:  WriteLiteral(&amp;quot;&amp;gt;Copyright policy&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                            &amp;lt;/ul&amp;gt;\r\n                  &amp;quot; +&#xD;Line 862:  &amp;quot;      &amp;lt;/div&amp;gt;\r\n                        &amp;lt;div&amp;quot;);&#xD;Line 863:  &#xD;Line 864:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4219, 123, true);&#xD;Line 865:  &#xD;Line 866:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4342, 17, true);&#xD;Line 867:  &#xD;Line 868:  WriteLiteral(&amp;quot; class=\&amp;quot;col-xs-6\&amp;quot;&amp;quot;);&#xD;Line 869:  &#xD;Line 870:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4342, 17, true);&#xD;Line 871:  &#xD;Line 872:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4359, 124, true);&#xD;Line 873:  &#xD;Line 874:  WriteLiteral(&amp;quot;&amp;gt;\r\n                            &amp;lt;h4&amp;gt;Top Cities&amp;lt;/h4&amp;gt;\r\n                            &amp;lt;&amp;quot; +&#xD;Line 875:  &amp;quot;ul&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 876:  &#xD;Line 877:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4359, 124, true);&#xD;Line 878:  &#xD;Line 879:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4483, 26, true);&#xD;Line 880:  &#xD;Line 881:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 882:  &#xD;Line 883:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4483, 26, true);&#xD;Line 884:  &#xD;Line 885:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4509, 16, true);&#xD;Line 886:  &#xD;Line 887:  WriteLiteral(&amp;quot; title=\&amp;quot;Chicago\&amp;quot;&amp;quot;);&#xD;Line 888:  &#xD;Line 889:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4509, 16, true);&#xD;Line 890:  &#xD;Line 891:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4525, 57, true);&#xD;Line 892:  &#xD;Line 893:  WriteLiteral(&amp;quot;&amp;gt;Chicago&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 894:  &#xD;Line 895:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4525, 57, true);&#xD;Line 896:  &#xD;Line 897:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4582, 26, true);&#xD;Line 898:  &#xD;Line 899:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 900:  &#xD;Line 901:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4582, 26, true);&#xD;Line 902:  &#xD;Line 903:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4608, 20, true);&#xD;Line 904:  &#xD;Line 905:  WriteLiteral(&amp;quot; title=\&amp;quot;Atlanta, GA\&amp;quot;&amp;quot;);&#xD;Line 906:  &#xD;Line 907:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4608, 20, true);&#xD;Line 908:  &#xD;Line 909:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4628, 61, true);&#xD;Line 910:  &#xD;Line 911:  WriteLiteral(&amp;quot;&amp;gt;Atlanta, GA&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 912:  &#xD;Line 913:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4628, 61, true);&#xD;Line 914:  &#xD;Line 915:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4689, 26, true);&#xD;Line 916:  &#xD;Line 917:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 918:  &#xD;Line 919:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4689, 26, true);&#xD;Line 920:  &#xD;Line 921:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4715, 20, true);&#xD;Line 922:  &#xD;Line 923:  WriteLiteral(&amp;quot; title=\&amp;quot;Detroit, MI\&amp;quot;&amp;quot;);&#xD;Line 924:  &#xD;Line 925:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4715, 20, true);&#xD;Line 926:  &#xD;Line 927:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4735, 61, true);&#xD;Line 928:  &#xD;Line 929:  WriteLiteral(&amp;quot;&amp;gt;Detroit, MI&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 930:  &#xD;Line 931:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4735, 61, true);&#xD;Line 932:  &#xD;Line 933:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4796, 26, true);&#xD;Line 934:  &#xD;Line 935:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 936:  &#xD;Line 937:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4796, 26, true);&#xD;Line 938:  &#xD;Line 939:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4822, 21, true);&#xD;Line 940:  &#xD;Line 941:  WriteLiteral(&amp;quot; title=\&amp;quot;New York, NY\&amp;quot;&amp;quot;);&#xD;Line 942:  &#xD;Line 943:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4822, 21, true);&#xD;Line 944:  &#xD;Line 945:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4843, 62, true);&#xD;Line 946:  &#xD;Line 947:  WriteLiteral(&amp;quot;&amp;gt;New York, NY&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n                                &amp;lt;li&amp;gt;&amp;lt;a&amp;quot;);&#xD;Line 948:  &#xD;Line 949:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4843, 62, true);&#xD;Line 950:  &#xD;Line 951:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4905, 26, true);&#xD;Line 952:  &#xD;Line 953:  WriteLiteral(&amp;quot; href=\&amp;quot;javascript:void();\&amp;quot;&amp;quot;);&#xD;Line 954:  &#xD;Line 955:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4905, 26, true);&#xD;Line 956:  &#xD;Line 957:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4931, 19, true);&#xD;Line 958:  &#xD;Line 959:  WriteLiteral(&amp;quot; title=\&amp;quot;Newark, NJ\&amp;quot;&amp;quot;);&#xD;Line 960:  &#xD;Line 961:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4931, 19, true);&#xD;Line 962:  &#xD;Line 963:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4950, 326, true);&#xD;Line 964:  &#xD;Line 965:  WriteLiteral(@&amp;quot;&amp;gt;Newark, NJ&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;&#xD;Line 966:                              &amp;lt;/ul&amp;gt;&#xD;Line 967:                          &amp;lt;/div&amp;gt;&#xD;Line 968:                      &amp;lt;/div&amp;gt;&#xD;Line 969:                  &amp;lt;/div&amp;gt;&#xD;Line 970:              &amp;lt;/div&amp;gt;&#xD;Line 971:  &#xD;Line 972:              &amp;lt;!--  &amp;lt;a href=&amp;quot;&amp;quot;#myPage&amp;quot;&amp;quot; title=&amp;quot;&amp;quot;To Top&amp;quot;&amp;quot;&amp;gt;&#xD;Line 973:                 &amp;lt;span class=&amp;quot;&amp;quot;glyphicon glyphicon-chevron-up&amp;quot;&amp;quot;&amp;gt;&amp;lt;/span&amp;gt;&#xD;Line 974:               &amp;lt;/a&amp;gt; --&amp;gt;&#xD;Line 975:  &#xD;Line 976:              &amp;lt;div&amp;quot;);&#xD;Line 977:  &#xD;Line 978:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 4950, 326, true);&#xD;Line 979:  &#xD;Line 980:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5276, 36, true);&#xD;Line 981:  &#xD;Line 982:  WriteLiteral(&amp;quot; class=\&amp;quot;i-copyright-txt text-center\&amp;quot;&amp;quot;);&#xD;Line 983:  &#xD;Line 984:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5276, 36, true);&#xD;Line 985:  &#xD;Line 986:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5312, 60, true);&#xD;Line 987:  &#xD;Line 988:  WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;amp;copy; Copyright\r\n                &amp;lt;script&amp;quot;);&#xD;Line 989:  &#xD;Line 990:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5312, 60, true);&#xD;Line 991:  &#xD;Line 992:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5372, 22, true);&#xD;Line 993:  &#xD;Line 994:  WriteLiteral(&amp;quot; language=\&amp;#39;javascript\&amp;#39;&amp;quot;);&#xD;Line 995:  &#xD;Line 996:  EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5372, 22, true);&#xD;Line 997:  &#xD;Line 998:  BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5394, 194, true);&#xD;Line 999:  &#xD;Line 1000: WriteLiteral(&amp;quot;&amp;gt;var yy = (new Date()).getYear(); var year = (yy &amp;lt; 1000) ? yy + 1900 : yy; docume&amp;quot; +&#xD;Line 1001: &amp;quot;nt.write(\&amp;quot;\&amp;quot; + year);&amp;lt;/script&amp;gt; By Inkan. All Rights Reserved.\r\n            &amp;lt;/div&amp;gt;&amp;quot; +&#xD;Line 1002: &amp;quot;\r\n        &amp;lt;/footer&amp;gt;\r\n    &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;Line 1003: &#xD;Line 1004: EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5394, 194, true);&#xD;Line 1005: &#xD;Line 1006: BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5588, 4, true);&#xD;Line 1007: &#xD;Line 1008: WriteLiteral(&amp;quot;    &amp;quot;);&#xD;Line 1009: &#xD;Line 1010: EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5588, 4, true);&#xD;Line 1011: &#xD;Line 1012: BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5593, 30, false);&#xD;Line 1013: &#xD;Line 1014:             &#xD;Line 1015:             #line 112 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot;&#xD;Line 1016: Write(Scripts.Render(&amp;quot;~/TheamOneJs&amp;quot;));&#xD;Line 1017: &#xD;Line 1018:             &#xD;Line 1019:             #line default&#xD;Line 1020:             #line hidden&#xD;Line 1021: EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5593, 30, false);&#xD;Line 1022: &#xD;Line 1023: BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5623, 2, true);&#xD;Line 1024: &#xD;Line 1025: WriteLiteral(&amp;quot;\r\n&amp;quot;);&#xD;Line 1026: &#xD;Line 1027: EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5623, 2, true);&#xD;Line 1028: &#xD;Line 1029: BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5625, 4, true);&#xD;Line 1030: &#xD;Line 1031: WriteLiteral(&amp;quot;    &amp;quot;);&#xD;Line 1032: &#xD;Line 1033: EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5625, 4, true);&#xD;Line 1034: &#xD;Line 1035: BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5630, 41, false);&#xD;Line 1036: &#xD;Line 1037:             &#xD;Line 1038:             #line 113 &amp;quot;D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\_Layout.cshtml&amp;quot;&#xD;Line 1039: Write(RenderSection(&amp;quot;scripts&amp;quot;, required: false));&#xD;Line 1040: &#xD;Line 1041:             &#xD;Line 1042:             #line default&#xD;Line 1043:             #line hidden&#xD;Line 1044: EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5630, 41, false);&#xD;Line 1045: &#xD;Line 1046: BeginContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5671, 1659, true);&#xD;Line 1047: &#xD;Line 1048: WriteLiteral(&amp;quot;\r\n    &amp;lt;script&amp;gt;\r\n        $(document).ready(function () {\r\n            // Add smoot&amp;quot; +&#xD;Line 1049: &amp;quot;h scrolling to all links in navbar + footer link\r\n            $(\&amp;quot;.navbar a, foot&amp;quot; +&#xD;Line 1050: &amp;quot;er a[href=\&amp;#39;#myPage\&amp;#39;]\&amp;quot;).on(\&amp;#39;click\&amp;#39;, function (event) {\r\n                // Make s&amp;quot; +&#xD;Line 1051: &amp;quot;ure this.hash has a value before overriding default behavior\r\n                if&amp;quot; +&#xD;Line 1052: &amp;quot; (this.hash !== \&amp;quot;\&amp;quot;) {\r\n                    // Prevent default anchor click behav&amp;quot; +&#xD;Line 1053: &amp;quot;ior\r\n                    event.preventDefault();\r\n\r\n                    // Store&amp;quot; +&#xD;Line 1054: &amp;quot; hash\r\n                    var hash = this.hash;\r\n\r\n                    // Using&amp;quot; +&#xD;Line 1055: &amp;quot; jQuery\&amp;#39;s animate() method to add smooth page scroll\r\n                    // The&amp;quot; +&#xD;Line 1056: &amp;quot; optional number (900) specifies the number of milliseconds it takes to scroll t&amp;quot; +&#xD;Line 1057: &amp;quot;o the specified area\r\n                    $(\&amp;#39;html, body\&amp;#39;).animate({\r\n           &amp;quot; +&#xD;Line 1058: &amp;quot;             scrollTop: $(hash).offset().top\r\n                    }, 900, functi&amp;quot; +&#xD;Line 1059: &amp;quot;on () {\r\n\r\n                        // Add hash (#) to URL when done scrolling (d&amp;quot; +&#xD;Line 1060: &amp;quot;efault click behavior)\r\n                        window.location.hash = hash;\r\n  &amp;quot; +&#xD;Line 1061: &amp;quot;                  });\r\n                } // End if\r\n            });\r\n\r\n         &amp;quot; +&#xD;Line 1062: &amp;quot;   $(window).scroll(function () {\r\n                $(\&amp;quot;.slideanim\&amp;quot;).each(function&amp;quot; +&#xD;Line 1063: &amp;quot; () {\r\n                    var pos = $(this).offset().top;\r\n\r\n                  &amp;quot; +&#xD;Line 1064: &amp;quot;  var winTop = $(window).scrollTop();\r\n                    if (pos &amp;lt; winTop + 60&amp;quot; +&#xD;Line 1065: &amp;quot;0) {\r\n                        $(this).addClass(\&amp;quot;fademein\&amp;quot;);\r\n                   &amp;quot; +&#xD;Line 1066: &amp;quot; }\r\n                });\r\n            });\r\n            $(\&amp;#39;.selectpicker\&amp;#39;).selectp&amp;quot; +&#xD;Line 1067: &amp;quot;icker({\r\n                style: \&amp;#39;btn-info\&amp;#39;,\r\n                size: 4\r\n          &amp;quot; +&#xD;Line 1068: &amp;quot;  });\r\n\r\n\r\n        })\r\n    &amp;lt;/script&amp;gt;\r\n\r\n&amp;lt;/body&amp;gt;\r\n&amp;lt;/html&amp;gt;\r\n&amp;quot;);&#xD;Line 1069: &#xD;Line 1070: EndContext(&amp;quot;~/Views/Shared/_Layout.cshtml&amp;quot;, 5671, 1659, true);&#xD;Line 1071: &#xD;Line 1072:         }&#xD;Line 1073:     }&#xD;Line 1074: }&#xD;Line 1075: &lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&#xD;&#xA;    &lt;script type=&quot;text/javascript&quot;&gt;&#xD;&#xA;    function OnToggleTOCLevel1(level2ID)&#xD;&#xA;    {&#xD;&#xA;      var elemLevel2 = document.getElementById(level2ID);&#xD;&#xA;      if (elemLevel2.style.display == ''none'')&#xD;&#xA;      {&#xD;&#xA;        elemLevel2.style.display = '''';&#xD;&#xA;      }&#xD;&#xA;      else {&#xD;&#xA;        elemLevel2.style.display = ''none'';&#xD;&#xA;      }&#xD;&#xA;    }&#xD;&#xA;    &lt;/script&gt;&#xD;&#xA;                          &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;    &lt;/body&gt;&#xD;&#xA;&lt;/html&gt;&#xD;&#xA;">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;Host: localhost:82&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="52987" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'9d101fca-b2ea-4a29-9ba2-43af9de2f40a', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'System.Web.Mvc', N'The ViewData item that has the key ''SelectedSubCatId'' is of type ''System.Int64'' but must be of type ''IEnumerable<SelectListItem>''.', N'', 500, CAST(N'2017-07-30 18:15:24.140' AS DateTime), 40, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The ViewData item that has the key ''SelectedSubCatId'' is of type ''System.Int64'' but must be of type ''IEnumerable&lt;SelectListItem&gt;''."
  source="System.Web.Mvc"
  detail="System.Web.HttpException (0x80004005): Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''. ---&gt; System.InvalidOperationException: The ViewData item that has the key ''SelectedSubCatId'' is of type ''System.Int64'' but must be of type ''IEnumerable&lt;SelectListItem&gt;''.&#xD;&#xA;   at System.Web.Mvc.Html.SelectExtensions.GetSelectData(HtmlHelper htmlHelper, String name)&#xD;&#xA;   at System.Web.Mvc.Html.SelectExtensions.SelectInternal(HtmlHelper htmlHelper, ModelMetadata metadata, String optionLabel, String name, IEnumerable`1 selectList, Boolean allowMultiple, IDictionary`2 htmlAttributes)&#xD;&#xA;   at System.Web.Mvc.Html.SelectExtensions.DropDownListFor[TModel,TProperty](HtmlHelper`1 htmlHelper, Expression`1 expression, IEnumerable`1 selectList, String optionLabel, IDictionary`2 htmlAttributes)&#xD;&#xA;   at ASP._Page_Views_Shared_SearchPanel_cshtml.Execute() in D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\SearchPanel.cshtml:line 19&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.HttpHandlerUtil.ServerExecuteHttpHandlerWrapper.&lt;&gt;c__DisplayClass4.&lt;Wrap&gt;b__3()&#xD;&#xA;   at System.Web.Mvc.HttpHandlerUtil.ServerExecuteHttpHandlerWrapper.Wrap[TResult](Func`1 func)&#xD;&#xA;   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)&#xD;&#xA;   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)&#xD;&#xA;   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)&#xD;&#xA;   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)&#xD;&#xA;   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)&#xD;&#xA;   at System.Web.Mvc.Html.ChildActionExtensions.RenderAction(HtmlHelper htmlHelper, String actionName, String controllerName)&#xD;&#xA;   at ASP._Page_Views_Home_Index_cshtml.Execute() in D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Home\Index.cshtml:line 11&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.StartPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2017-07-30T18:15:24.1399883Z"
  statusCode="500">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="57246" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'83471530-aa55-4826-b432-4103fce5e013', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'System.Web.Mvc', N'The ViewData item that has the key ''SelectedSubCatId'' is of type ''System.Int64'' but must be of type ''IEnumerable<SelectListItem>''.', N'', 500, CAST(N'2017-07-30 18:16:25.837' AS DateTime), 41, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The ViewData item that has the key ''SelectedSubCatId'' is of type ''System.Int64'' but must be of type ''IEnumerable&lt;SelectListItem&gt;''."
  source="System.Web.Mvc"
  detail="System.Web.HttpException (0x80004005): Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''. ---&gt; System.InvalidOperationException: The ViewData item that has the key ''SelectedSubCatId'' is of type ''System.Int64'' but must be of type ''IEnumerable&lt;SelectListItem&gt;''.&#xD;&#xA;   at System.Web.Mvc.Html.SelectExtensions.GetSelectData(HtmlHelper htmlHelper, String name)&#xD;&#xA;   at System.Web.Mvc.Html.SelectExtensions.SelectInternal(HtmlHelper htmlHelper, ModelMetadata metadata, String optionLabel, String name, IEnumerable`1 selectList, Boolean allowMultiple, IDictionary`2 htmlAttributes)&#xD;&#xA;   at System.Web.Mvc.Html.SelectExtensions.DropDownListFor[TModel,TProperty](HtmlHelper`1 htmlHelper, Expression`1 expression, IEnumerable`1 selectList, String optionLabel, IDictionary`2 htmlAttributes)&#xD;&#xA;   at ASP._Page_Views_Shared_SearchPanel_cshtml.Execute() in D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\SearchPanel.cshtml:line 19&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.HttpHandlerUtil.ServerExecuteHttpHandlerWrapper.&lt;&gt;c__DisplayClass4.&lt;Wrap&gt;b__3()&#xD;&#xA;   at System.Web.Mvc.HttpHandlerUtil.ServerExecuteHttpHandlerWrapper.Wrap[TResult](Func`1 func)&#xD;&#xA;   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)&#xD;&#xA;   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)&#xD;&#xA;   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)&#xD;&#xA;   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)&#xD;&#xA;   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)&#xD;&#xA;   at System.Web.Mvc.Html.ChildActionExtensions.RenderAction(HtmlHelper htmlHelper, String actionName, String controllerName)&#xD;&#xA;   at ASP._Page_Views_Home_Index_cshtml.Execute() in D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Home\Index.cshtml:line 11&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.StartPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2017-07-30T18:16:25.8368910Z"
  statusCode="500">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="57246" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'32b11555-210c-4a8d-b16f-02746dbab867', N'spa_db', N'DATAFUSION-PC', N'System.InvalidOperationException', N'System.Web.Mvc', N'The ViewData item that has the key ''SelectedPriceId'' is of type ''System.Int64'' but must be of type ''IEnumerable<SelectListItem>''.', N'', 500, CAST(N'2017-07-30 18:17:37.330' AS DateTime), 42, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.InvalidOperationException"
  message="The ViewData item that has the key ''SelectedPriceId'' is of type ''System.Int64'' but must be of type ''IEnumerable&lt;SelectListItem&gt;''."
  source="System.Web.Mvc"
  detail="System.Web.HttpException (0x80004005): Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''. ---&gt; System.InvalidOperationException: The ViewData item that has the key ''SelectedPriceId'' is of type ''System.Int64'' but must be of type ''IEnumerable&lt;SelectListItem&gt;''.&#xD;&#xA;   at System.Web.Mvc.Html.SelectExtensions.GetSelectData(HtmlHelper htmlHelper, String name)&#xD;&#xA;   at System.Web.Mvc.Html.SelectExtensions.SelectInternal(HtmlHelper htmlHelper, ModelMetadata metadata, String optionLabel, String name, IEnumerable`1 selectList, Boolean allowMultiple, IDictionary`2 htmlAttributes)&#xD;&#xA;   at System.Web.Mvc.Html.SelectExtensions.DropDownListFor[TModel,TProperty](HtmlHelper`1 htmlHelper, Expression`1 expression, IEnumerable`1 selectList, String optionLabel, IDictionary`2 htmlAttributes)&#xD;&#xA;   at ASP._Page_Views_Shared_SearchPanel_cshtml.Execute() in D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Shared\SearchPanel.cshtml:line 22&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.HttpHandlerUtil.ServerExecuteHttpHandlerWrapper.&lt;&gt;c__DisplayClass4.&lt;Wrap&gt;b__3()&#xD;&#xA;   at System.Web.Mvc.HttpHandlerUtil.ServerExecuteHttpHandlerWrapper.Wrap[TResult](Func`1 func)&#xD;&#xA;   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)&#xD;&#xA;   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)&#xD;&#xA;   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)&#xD;&#xA;   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)&#xD;&#xA;   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)&#xD;&#xA;   at System.Web.Mvc.Html.ChildActionExtensions.RenderAction(HtmlHelper htmlHelper, String actionName, String controllerName)&#xD;&#xA;   at ASP._Page_Views_Home_Index_cshtml.Execute() in D:\Yagnesh\Deepen\Deepen_SPA\code\Views\Home\Index.cshtml:line 11&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.StartPage.ExecutePageHierarchy()&#xD;&#xA;   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2017-07-30T18:17:37.3294089Z"
  statusCode="500">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="57246" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'68bfd9d6-b2b2-4780-80dd-da5be9a74bf0', N'spa_db', N'DATAFUSION-PC', N'System.ArgumentException', N'System.Web.Mvc', N'The parameters dictionary contains a null entry for parameter ''cat_id'' of non-nullable type ''System.Int64'' for method ''System.Web.Mvc.JsonResult GetSubCategoryDrDw(Int64)'' in ''code.Controllers.HomeController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'', 0, CAST(N'2017-07-30 18:45:10.847' AS DateTime), 43, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.ArgumentException"
  message="The parameters dictionary contains a null entry for parameter ''cat_id'' of non-nullable type ''System.Int64'' for method ''System.Web.Mvc.JsonResult GetSubCategoryDrDw(Int64)'' in ''code.Controllers.HomeController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.&#xD;&#xA;Parameter name: parameters"
  source="System.Web.Mvc"
  detail="System.ArgumentException: The parameters dictionary contains a null entry for parameter ''cat_id'' of non-nullable type ''System.Int64'' for method ''System.Web.Mvc.JsonResult GetSubCategoryDrDw(Int64)'' in ''code.Controllers.HomeController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.&#xD;&#xA;Parameter name: parameters&#xD;&#xA;   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)&#xD;&#xA;   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;BeginInvokeSynchronousActionMethod&gt;b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3d()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;&gt;c__DisplayClass46.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3f()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;&gt;c__DisplayClass2b.&lt;BeginInvokeAction&gt;b__1c()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2017-07-30T18:45:10.8479394Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:4&#xD;&#xA;HTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;HTTP_ACCEPT:*/*&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_REFERER:http://localhost:82/&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_ORIGIN:http://localhost:82&#xD;&#xA;HTTP_X_REQUESTED_WITH:XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Content-Length: 4&#xD;&#xA;Content-Type: application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;Accept: */*&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;Host: localhost:82&#xD;&#xA;Referer: http://localhost:82/&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Origin: http://localhost:82&#xD;&#xA;X-Requested-With: XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="4" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Home/GetSubCategoryDrDw" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Home\GetSubCategoryDrDw" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="57533" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Home/GetSubCategoryDrDw" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Home/GetSubCategoryDrDw" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="4" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="*/*" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://localhost:82/" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://localhost:82" />
    </item>
    <item
      name="HTTP_X_REQUESTED_WITH">
      <value
        string="XMLHttpRequest" />
    </item>
  </serverVariables>
  <form>
    <item
      name="id">
      <value
        string="1" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'f3de4c22-2240-475f-9d37-fcce56dbd9fb', N'spa_db', N'DATAFUSION-PC', N'System.ArgumentException', N'System.Web.Mvc', N'The parameters dictionary contains a null entry for parameter ''cat_id'' of non-nullable type ''System.Int64'' for method ''System.Web.Mvc.JsonResult GetSubCategoryDrDw(Int64)'' in ''code.Controllers.HomeController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'', 0, CAST(N'2017-07-30 18:45:28.133' AS DateTime), 44, N'<error
  application="spa_db"
  host="DATAFUSION-PC"
  type="System.ArgumentException"
  message="The parameters dictionary contains a null entry for parameter ''cat_id'' of non-nullable type ''System.Int64'' for method ''System.Web.Mvc.JsonResult GetSubCategoryDrDw(Int64)'' in ''code.Controllers.HomeController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.&#xD;&#xA;Parameter name: parameters"
  source="System.Web.Mvc"
  detail="System.ArgumentException: The parameters dictionary contains a null entry for parameter ''cat_id'' of non-nullable type ''System.Int64'' for method ''System.Web.Mvc.JsonResult GetSubCategoryDrDw(Int64)'' in ''code.Controllers.HomeController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.&#xD;&#xA;Parameter name: parameters&#xD;&#xA;   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)&#xD;&#xA;   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;BeginInvokeSynchronousActionMethod&gt;b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3d()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.&lt;&gt;c__DisplayClass46.&lt;InvokeActionMethodFilterAsynchronouslyRecursive&gt;b__3f()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;&gt;c__DisplayClass2b.&lt;BeginInvokeAction&gt;b__1c()&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass21.&lt;BeginInvokeAction&gt;b__1e(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.&lt;BeginExecuteCore&gt;b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.&lt;BeginProcessRequest&gt;b__5(IAsyncResult asyncResult, ProcessRequestState innerState)&#xD;&#xA;   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2017-07-30T18:45:28.1339281Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip, deflate, br&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;HTTP_HOST:localhost:82&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;HTTP_UPGRADE_INSECURE_REQUESTS:1&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&#xD;&#xA;Accept-Encoding: gzip, deflate, br&#xD;&#xA;Accept-Language: en-GB,en-US;q=0.8,en;q=0.6&#xD;&#xA;Cookie: __RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1&#xD;&#xA;Host: localhost:82&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36&#xD;&#xA;Upgrade-Insecure-Requests: 1&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Home/GetSubCategoryDrDw" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\Yagnesh\Deepen\Deepen_SPA\code\Home\GetSubCategoryDrDw" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="::1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="57555" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Home/GetSubCategoryDrDw" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="localhost" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="82" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Home/GetSubCategoryDrDw" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip, deflate, br" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="en-GB,en-US;q=0.8,en;q=0.6" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="localhost:82" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" />
    </item>
    <item
      name="HTTP_UPGRADE_INSECURE_REQUESTS">
      <value
        string="1" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="JQd6zhocB7ej0y5aXBxQ84__62DlOPA4AezQ6igJIT-5lzQKqwIGKbacB3W93SLuVB_ychLiv5SEDwW_4Y5jXZxDAMwMRG-NcTkGP4xlA3Q1" />
    </item>
  </cookies>
</error>')
SET IDENTITY_INSERT [dbo].[ELMAH_Error] OFF
SET IDENTITY_INSERT [dbo].[price_range] ON 

INSERT [dbo].[price_range] ([id], [price_range_name], [min_price], [max_price], [description], [isActive], [created_at], [update_at]) VALUES (1, N'100 to 250', CAST(100 AS Numeric(18, 0)), CAST(250 AS Numeric(18, 0)), NULL, 1, CAST(N'2017-07-30 23:52:37.517' AS DateTime), CAST(N'2017-07-30 23:52:37.517' AS DateTime))
INSERT [dbo].[price_range] ([id], [price_range_name], [min_price], [max_price], [description], [isActive], [created_at], [update_at]) VALUES (2, N'250 to 400', CAST(250 AS Numeric(18, 0)), CAST(400 AS Numeric(18, 0)), NULL, 1, CAST(N'2017-07-30 23:56:02.610' AS DateTime), CAST(N'2017-07-30 23:56:02.610' AS DateTime))
INSERT [dbo].[price_range] ([id], [price_range_name], [min_price], [max_price], [description], [isActive], [created_at], [update_at]) VALUES (3, N'400 to 550', CAST(400 AS Numeric(18, 0)), CAST(650 AS Numeric(18, 0)), NULL, 1, CAST(N'2017-07-30 23:57:03.807' AS DateTime), CAST(N'2017-07-30 23:57:03.807' AS DateTime))
SET IDENTITY_INSERT [dbo].[price_range] OFF
SET IDENTITY_INSERT [dbo].[spa_basic_info] ON 

INSERT [dbo].[spa_basic_info] ([id], [name], [cityId], [info_about], [website_url], [address], [contact_name], [contact_email], [contact_no], [is_active], [created_at], [updated_at]) VALUES (3, N'spa abc', 3, N'ASFD ASDFASDF', NULL, NULL, N'yagnesh', N'yag@dsf.ds', N'8989898989', 1, CAST(N'2017-07-29 20:46:18.160' AS DateTime), CAST(N'2017-07-30 03:11:16.690' AS DateTime))
SET IDENTITY_INSERT [dbo].[spa_basic_info] OFF
SET IDENTITY_INSERT [dbo].[spa_prices] ON 

INSERT [dbo].[spa_prices] ([id], [spa_id], [cat_id], [price], [created_at], [updated_at]) VALUES (6, 3, 9, N'62', CAST(N'2017-07-30 02:52:51.123' AS DateTime), CAST(N'2017-07-30 02:52:51.123' AS DateTime))
INSERT [dbo].[spa_prices] ([id], [spa_id], [cat_id], [price], [created_at], [updated_at]) VALUES (7, 3, 10, N'88', CAST(N'2017-07-30 02:52:51.123' AS DateTime), CAST(N'2017-07-30 02:52:51.123' AS DateTime))
INSERT [dbo].[spa_prices] ([id], [spa_id], [cat_id], [price], [created_at], [updated_at]) VALUES (8, 3, 6, N'50', CAST(N'2017-07-30 03:05:25.043' AS DateTime), CAST(N'2017-07-30 03:05:25.043' AS DateTime))
INSERT [dbo].[spa_prices] ([id], [spa_id], [cat_id], [price], [created_at], [updated_at]) VALUES (9, 3, 7, N'14', CAST(N'2017-07-30 03:05:25.043' AS DateTime), CAST(N'2017-07-30 03:05:25.043' AS DateTime))
INSERT [dbo].[spa_prices] ([id], [spa_id], [cat_id], [price], [created_at], [updated_at]) VALUES (10, 3, 8, N'12', CAST(N'2017-07-30 03:05:25.043' AS DateTime), CAST(N'2017-07-30 03:05:25.043' AS DateTime))
SET IDENTITY_INSERT [dbo].[spa_prices] OFF
SET IDENTITY_INSERT [dbo].[spa_time] ON 

INSERT [dbo].[spa_time] ([id], [spa_id], [week_day], [start_time], [end_time], [frm_to_times], [isclosed], [created_at], [updated_at]) VALUES (1, 3, N'Sunday', NULL, NULL, N'10.00 am to 9.00 pm', 0, CAST(N'2017-07-29 20:46:18.160' AS DateTime), CAST(N'2017-07-29 20:46:18.160' AS DateTime))
INSERT [dbo].[spa_time] ([id], [spa_id], [week_day], [start_time], [end_time], [frm_to_times], [isclosed], [created_at], [updated_at]) VALUES (2, 3, N'Monday', NULL, NULL, N'10.00 am to 9.00 pm', 0, CAST(N'2017-07-29 20:46:18.160' AS DateTime), CAST(N'2017-07-29 20:46:18.160' AS DateTime))
INSERT [dbo].[spa_time] ([id], [spa_id], [week_day], [start_time], [end_time], [frm_to_times], [isclosed], [created_at], [updated_at]) VALUES (3, 3, N'Tuesday', NULL, NULL, N'10.00 am to 9.00 pm', 0, CAST(N'2017-07-29 20:46:18.160' AS DateTime), CAST(N'2017-07-29 20:46:18.160' AS DateTime))
INSERT [dbo].[spa_time] ([id], [spa_id], [week_day], [start_time], [end_time], [frm_to_times], [isclosed], [created_at], [updated_at]) VALUES (4, 3, N'Wednesday', NULL, NULL, N'10.00 am to 9.00 pm', 0, CAST(N'2017-07-29 20:46:18.160' AS DateTime), CAST(N'2017-07-29 20:46:18.160' AS DateTime))
INSERT [dbo].[spa_time] ([id], [spa_id], [week_day], [start_time], [end_time], [frm_to_times], [isclosed], [created_at], [updated_at]) VALUES (5, 3, N'Thursday', NULL, NULL, N'10.00 am to 9.00 pm', 0, CAST(N'2017-07-29 20:46:18.160' AS DateTime), CAST(N'2017-07-29 20:46:18.160' AS DateTime))
INSERT [dbo].[spa_time] ([id], [spa_id], [week_day], [start_time], [end_time], [frm_to_times], [isclosed], [created_at], [updated_at]) VALUES (6, 3, N'Friday', NULL, NULL, N'10.00 am to 9.00 pm', 0, CAST(N'2017-07-29 20:46:18.160' AS DateTime), CAST(N'2017-07-29 20:46:18.160' AS DateTime))
INSERT [dbo].[spa_time] ([id], [spa_id], [week_day], [start_time], [end_time], [frm_to_times], [isclosed], [created_at], [updated_at]) VALUES (7, 3, N'Saturday', NULL, NULL, N'10.00 am to 9.00 pm', 0, CAST(N'2017-07-29 20:46:18.160' AS DateTime), CAST(N'2017-07-29 20:46:18.160' AS DateTime))
SET IDENTITY_INSERT [dbo].[spa_time] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 31-07-2017 AM 12:47:37 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND name = N'RoleNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 31-07-2017 AM 12:47:37 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 31-07-2017 AM 12:47:37 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 31-07-2017 AM 12:47:37 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_RoleId')
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 31-07-2017 AM 12:47:37 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 31-07-2017 AM 12:47:37 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND name = N'UserNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ELMAH_Error]    Script Date: 31-07-2017 AM 12:47:37 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND name = N'PK_ELMAH_Error')
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [PK_ELMAH_Error] PRIMARY KEY NONCLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ELMAH_Error_App_Time_Seq]    Script Date: 31-07-2017 AM 12:47:37 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND name = N'IX_ELMAH_Error_App_Time_Seq')
CREATE NONCLUSTERED INDEX [IX_ELMAH_Error_App_Time_Seq] ON [dbo].[ELMAH_Error]
(
	[Application] ASC,
	[TimeUtc] DESC,
	[Sequence] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_spa_images_is_default]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[spa_images] ADD  CONSTRAINT [DF_spa_images_is_default]  DEFAULT ((0)) FOR [is_default]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_spa_images_created_at]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[spa_images] ADD  CONSTRAINT [DF_spa_images_created_at]  DEFAULT (getdate()) FOR [created_at]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_spa_images_updated_at]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[spa_images] ADD  CONSTRAINT [DF_spa_images_updated_at]  DEFAULT (getdate()) FOR [updated_at]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_basic_info_citys]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_basic_info]'))
ALTER TABLE [dbo].[spa_basic_info]  WITH CHECK ADD  CONSTRAINT [FK_spa_basic_info_citys] FOREIGN KEY([cityId])
REFERENCES [dbo].[citys] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_basic_info_citys]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_basic_info]'))
ALTER TABLE [dbo].[spa_basic_info] CHECK CONSTRAINT [FK_spa_basic_info_citys]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_images_spa_images]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_images]'))
ALTER TABLE [dbo].[spa_images]  WITH CHECK ADD  CONSTRAINT [FK_spa_images_spa_images] FOREIGN KEY([spa_id])
REFERENCES [dbo].[spa_basic_info] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_images_spa_images]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_images]'))
ALTER TABLE [dbo].[spa_images] CHECK CONSTRAINT [FK_spa_images_spa_images]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_prices_CategeogySubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_prices]'))
ALTER TABLE [dbo].[spa_prices]  WITH CHECK ADD  CONSTRAINT [FK_spa_prices_CategeogySubCategory] FOREIGN KEY([cat_id])
REFERENCES [dbo].[CategeogySubCategory] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_prices_CategeogySubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_prices]'))
ALTER TABLE [dbo].[spa_prices] CHECK CONSTRAINT [FK_spa_prices_CategeogySubCategory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_prices_spa_basic_info]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_prices]'))
ALTER TABLE [dbo].[spa_prices]  WITH CHECK ADD  CONSTRAINT [FK_spa_prices_spa_basic_info] FOREIGN KEY([spa_id])
REFERENCES [dbo].[spa_basic_info] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_prices_spa_basic_info]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_prices]'))
ALTER TABLE [dbo].[spa_prices] CHECK CONSTRAINT [FK_spa_prices_spa_basic_info]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_time_spa_basic_info]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_time]'))
ALTER TABLE [dbo].[spa_time]  WITH CHECK ADD  CONSTRAINT [FK_spa_time_spa_basic_info] FOREIGN KEY([spa_id])
REFERENCES [dbo].[spa_basic_info] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spa_time_spa_basic_info]') AND parent_object_id = OBJECT_ID(N'[dbo].[spa_time]'))
ALTER TABLE [dbo].[spa_time] CHECK CONSTRAINT [FK_spa_time_spa_basic_info]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_GetErrorsXml]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ELMAH_GetErrorsXml] AS' 
END
GO

ALTER PROCEDURE [dbo].[ELMAH_GetErrorsXml]
(
    @Application NVARCHAR(60),
    @PageIndex INT = 0,
    @PageSize INT = 15,
    @TotalCount INT OUTPUT
)
AS 

    SET NOCOUNT ON

    DECLARE @FirstTimeUTC DATETIME
    DECLARE @FirstSequence INT
    DECLARE @StartRow INT
    DECLARE @StartRowIndex INT

    SELECT 
        @TotalCount = COUNT(1) 
    FROM 
        [ELMAH_Error]
    WHERE 
        [Application] = @Application

    -- Get the ID of the first error for the requested page

    SET @StartRowIndex = @PageIndex * @PageSize + 1

    IF @StartRowIndex <= @TotalCount
    BEGIN

        SET ROWCOUNT @StartRowIndex

        SELECT  
            @FirstTimeUTC = [TimeUtc],
            @FirstSequence = [Sequence]
        FROM 
            [ELMAH_Error]
        WHERE   
            [Application] = @Application
        ORDER BY 
            [TimeUtc] DESC, 
            [Sequence] DESC

    END
    ELSE
    BEGIN

        SET @PageSize = 0

    END

    -- Now set the row count to the requested page size and get
    -- all records below it for the pertaining application.

    SET ROWCOUNT @PageSize

    SELECT 
        errorId     = [ErrorId], 
        application = [Application],
        host        = [Host], 
        type        = [Type],
        source      = [Source],
        message     = [Message],
        [user]      = [User],
        statusCode  = [StatusCode], 
        time        = CONVERT(VARCHAR(50), [TimeUtc], 126) + 'Z'
    FROM 
        [ELMAH_Error] error
    WHERE
        [Application] = @Application
    AND
        [TimeUtc] <= @FirstTimeUTC
    AND 
        [Sequence] <= @FirstSequence
    ORDER BY
        [TimeUtc] DESC, 
        [Sequence] DESC
    FOR
        XML AUTO


GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_GetErrorXml]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ELMAH_GetErrorXml] AS' 
END
GO

ALTER PROCEDURE [dbo].[ELMAH_GetErrorXml]
(
    @Application NVARCHAR(60),
    @ErrorId UNIQUEIDENTIFIER
)
AS

    SET NOCOUNT ON

    SELECT 
        [AllXml]
    FROM 
        [ELMAH_Error]
    WHERE
        [ErrorId] = @ErrorId
    AND
        [Application] = @Application


GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 31-07-2017 AM 12:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_LogError]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ELMAH_LogError] AS' 
END
GO

ALTER PROCEDURE [dbo].[ELMAH_LogError]
(
    @ErrorId UNIQUEIDENTIFIER,
    @Application NVARCHAR(60),
    @Host NVARCHAR(30),
    @Type NVARCHAR(100),
    @Source NVARCHAR(60),
    @Message NVARCHAR(500),
    @User NVARCHAR(50),
    @AllXml NTEXT,
    @StatusCode INT,
    @TimeUtc DATETIME
)
AS

    SET NOCOUNT ON

    INSERT
    INTO
        [ELMAH_Error]
        (
            [ErrorId],
            [Application],
            [Host],
            [Type],
            [Source],
            [Message],
            [User],
            [AllXml],
            [StatusCode],
            [TimeUtc]
        )
    VALUES
        (
            @ErrorId,
            @Application,
            @Host,
            @Type,
            @Source,
            @Message,
            @User,
            @AllXml,
            @StatusCode,
            @TimeUtc
        )


GO
USE [master]
GO
ALTER DATABASE [spa_db] SET  READ_WRITE 
GO
