USE [master]
GO
/****** Object:  Database [TradeManager]    Script Date: 18.03.2020 11:30:32 ******/
CREATE DATABASE [TradeManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TradeManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\TradeManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [MainData]  DEFAULT
( NAME = N'TradeManager_MainData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\TradeManager_MainData.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TradeManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\TradeManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TradeManager] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TradeManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TradeManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TradeManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TradeManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TradeManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TradeManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [TradeManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TradeManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TradeManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TradeManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TradeManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TradeManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TradeManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TradeManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TradeManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TradeManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TradeManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TradeManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TradeManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TradeManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TradeManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TradeManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TradeManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TradeManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TradeManager] SET  MULTI_USER 
GO
ALTER DATABASE [TradeManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TradeManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TradeManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TradeManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TradeManager] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TradeManager', N'ON'
GO
ALTER DATABASE [TradeManager] SET QUERY_STORE = OFF
GO
USE [TradeManager]
GO
/****** Object:  Schema [InternalReference]    Script Date: 18.03.2020 11:30:33 ******/
CREATE SCHEMA [InternalReference]
GO
/****** Object:  Schema [Reference]    Script Date: 18.03.2020 11:30:33 ******/
CREATE SCHEMA [Reference]
GO
/****** Object:  Table [dbo].[ContractCommdities]    Script Date: 18.03.2020 11:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractCommdities](
	[ContractCommdityID] [int] NOT NULL,
	[ContractID] [int] NULL,
	[CommodityID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Weight] [decimal](18, 2) NULL,
	[Price] [decimal](18, 2) NULL,
	[Reference] [nvarchar](250) NULL,
	[LastUpDate] [datetime2](7) NULL,
	[LastUpEmployeeID] [int] NULL,
 CONSTRAINT [PK_ContractCommdities] PRIMARY KEY CLUSTERED 
(
	[ContractCommdityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MainData]
) ON [MainData]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 18.03.2020 11:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ContractID] [int] NOT NULL,
	[ContractNumber] [int] NULL,
	[Contract] [nvarchar](50) NULL,
	[CounteragentID] [int] NULL,
	[InternalCompanyID] [int] NULL,
	[Reference] [nvarchar](250) NULL,
	[LastUpDate] [datetime2](7) NULL,
	[LastUpEmployeeID] [int] NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MainData]
) ON [MainData]
GO
/****** Object:  Table [dbo].[FrameContracts]    Script Date: 18.03.2020 11:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FrameContracts](
	[FrameContractID] [int] NOT NULL,
	[FrameContractNumber] [int] NULL,
	[FrameContract] [nvarchar](50) NULL,
	[ContractTypeID] [int] NULL,
	[Reference] [nvarchar](250) NULL,
	[LastUpDate] [datetime2](7) NULL,
	[LastUpEmployeeID] [int] NULL,
 CONSTRAINT [PK_FrameContracts] PRIMARY KEY CLUSTERED 
(
	[FrameContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MainData]
) ON [MainData]
GO
/****** Object:  Table [InternalReference].[ContractTypes]    Script Date: 18.03.2020 11:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [InternalReference].[ContractTypes](
	[ContractTypeID] [int] NOT NULL,
	[ContractType] [nvarchar](50) NULL,
 CONSTRAINT [PK_ContractTypes] PRIMARY KEY CLUSTERED 
(
	[ContractTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MainData]
) ON [MainData]
GO
/****** Object:  Table [Reference].[Commodities]    Script Date: 18.03.2020 11:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reference].[Commodities](
	[CommodityID] [int] NOT NULL,
	[Commodity] [nvarchar](50) NULL,
	[CommodityFullName] [nvarchar](100) NULL,
	[Reference] [nvarchar](250) NULL,
	[LastUpDate] [datetime2](7) NULL,
	[LastUpEmployeeID] [int] NULL,
 CONSTRAINT [PK_Commodities] PRIMARY KEY CLUSTERED 
(
	[CommodityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MainData]
) ON [MainData]
GO
/****** Object:  Table [Reference].[Counteragents]    Script Date: 18.03.2020 11:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reference].[Counteragents](
	[CounteragentID] [int] NOT NULL,
	[Counteragent] [nvarchar](50) NULL,
	[CounteragentFullName] [nvarchar](250) NULL,
	[Reference] [nvarchar](250) NULL,
	[LastUpDate] [datetime2](7) NULL,
	[LastUpEmployeeID] [int] NULL,
 CONSTRAINT [PK_Counteragents] PRIMARY KEY CLUSTERED 
(
	[CounteragentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MainData]
) ON [MainData]
GO
/****** Object:  Table [Reference].[Employees]    Script Date: 18.03.2020 11:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reference].[Employees](
	[EmployeeID] [int] NOT NULL,
	[Employee] [nvarchar](250) NULL,
	[SecondName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastUpDate] [datetime2](7) NULL,
	[LastUpEmployeeID] [int] NULL,
	[CDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MainData]
) ON [MainData]
GO
/****** Object:  Table [Reference].[InternalCompanies]    Script Date: 18.03.2020 11:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reference].[InternalCompanies](
	[InternalCompanyID] [int] NOT NULL,
	[InternalCompany] [nvarchar](50) NULL,
	[InternalCompanyFullName] [nvarchar](250) NULL,
	[Reference] [nvarchar](250) NULL,
	[LastUpDate] [datetime2](7) NULL,
	[LastUpEmployeeID] [int] NULL,
 CONSTRAINT [PK_InternalCompanies] PRIMARY KEY CLUSTERED 
(
	[InternalCompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MainData]
) ON [MainData]
GO
/****** Object:  Index [FK_ContractCommdities_CommodityID]    Script Date: 18.03.2020 11:30:33 ******/
CREATE NONCLUSTERED INDEX [FK_ContractCommdities_CommodityID] ON [dbo].[ContractCommdities]
(
	[CommodityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MainData]
GO
/****** Object:  Index [FK_ContractCommdities_ContractID]    Script Date: 18.03.2020 11:30:33 ******/
CREATE NONCLUSTERED INDEX [FK_ContractCommdities_ContractID] ON [dbo].[ContractCommdities]
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MainData]
GO
/****** Object:  Index [FK_Contracts_CounteragentID]    Script Date: 18.03.2020 11:30:33 ******/
CREATE NONCLUSTERED INDEX [FK_Contracts_CounteragentID] ON [dbo].[Contracts]
(
	[CounteragentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MainData]
GO
ALTER TABLE [dbo].[ContractCommdities] ADD  CONSTRAINT [DF_ContractCommdities_LastUpDate]  DEFAULT (sysdatetime()) FOR [LastUpDate]
GO
ALTER TABLE [dbo].[Contracts] ADD  CONSTRAINT [DF_Contracts_LastUpDate]  DEFAULT (sysdatetime()) FOR [LastUpDate]
GO
ALTER TABLE [dbo].[FrameContracts] ADD  CONSTRAINT [DF_FrameContracts_LastUpDate]  DEFAULT (sysdatetime()) FOR [LastUpDate]
GO
ALTER TABLE [Reference].[Commodities] ADD  CONSTRAINT [DF_Commodities_LastUpDate]  DEFAULT (sysdatetime()) FOR [LastUpDate]
GO
ALTER TABLE [Reference].[Counteragents] ADD  CONSTRAINT [DF_Counteragents_LastUpDate]  DEFAULT (sysdatetime()) FOR [LastUpDate]
GO
ALTER TABLE [Reference].[Employees] ADD  CONSTRAINT [DF_Employees_LastUpDate]  DEFAULT (sysdatetime()) FOR [LastUpDate]
GO
ALTER TABLE [Reference].[InternalCompanies] ADD  CONSTRAINT [DF_InternalCompanies_LastUpDate]  DEFAULT (sysdatetime()) FOR [LastUpDate]
GO
ALTER TABLE [dbo].[ContractCommdities]  WITH CHECK ADD  CONSTRAINT [FK_ContractCommdities_Commodities] FOREIGN KEY([CommodityID])
REFERENCES [Reference].[Commodities] ([CommodityID])
GO
ALTER TABLE [dbo].[ContractCommdities] CHECK CONSTRAINT [FK_ContractCommdities_Commodities]
GO
ALTER TABLE [dbo].[ContractCommdities]  WITH CHECK ADD  CONSTRAINT [FK_ContractCommdities_Contracts] FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contracts] ([ContractID])
GO
ALTER TABLE [dbo].[ContractCommdities] CHECK CONSTRAINT [FK_ContractCommdities_Contracts]
GO
ALTER TABLE [dbo].[ContractCommdities]  WITH CHECK ADD  CONSTRAINT [FK_ContractCommdities_Employees] FOREIGN KEY([LastUpEmployeeID])
REFERENCES [Reference].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[ContractCommdities] CHECK CONSTRAINT [FK_ContractCommdities_Employees]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Counteragents] FOREIGN KEY([CounteragentID])
REFERENCES [Reference].[Counteragents] ([CounteragentID])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Counteragents]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_InternalCompanies] FOREIGN KEY([InternalCompanyID])
REFERENCES [Reference].[InternalCompanies] ([InternalCompanyID])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_InternalCompanies]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_LastUpEmployees] FOREIGN KEY([LastUpEmployeeID])
REFERENCES [Reference].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_LastUpEmployees]
GO
ALTER TABLE [dbo].[FrameContracts]  WITH CHECK ADD  CONSTRAINT [FK_FrameContracts_ContractTypes] FOREIGN KEY([ContractTypeID])
REFERENCES [InternalReference].[ContractTypes] ([ContractTypeID])
GO
ALTER TABLE [dbo].[FrameContracts] CHECK CONSTRAINT [FK_FrameContracts_ContractTypes]
GO
ALTER TABLE [dbo].[FrameContracts]  WITH CHECK ADD  CONSTRAINT [FK_FrameContracts_Employees] FOREIGN KEY([LastUpEmployeeID])
REFERENCES [Reference].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[FrameContracts] CHECK CONSTRAINT [FK_FrameContracts_Employees]
GO
ALTER TABLE [Reference].[Commodities]  WITH CHECK ADD  CONSTRAINT [FK_Commodities_Employees] FOREIGN KEY([LastUpEmployeeID])
REFERENCES [Reference].[Employees] ([EmployeeID])
GO
ALTER TABLE [Reference].[Commodities] CHECK CONSTRAINT [FK_Commodities_Employees]
GO
ALTER TABLE [Reference].[Counteragents]  WITH CHECK ADD  CONSTRAINT [FK_Counteragents_Counteragents] FOREIGN KEY([CounteragentID])
REFERENCES [Reference].[Counteragents] ([CounteragentID])
GO
ALTER TABLE [Reference].[Counteragents] CHECK CONSTRAINT [FK_Counteragents_Counteragents]
GO
ALTER TABLE [Reference].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [Reference].[Employees] ([EmployeeID])
GO
ALTER TABLE [Reference].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [Reference].[InternalCompanies]  WITH CHECK ADD  CONSTRAINT [FK_InternalCompanies_Employees] FOREIGN KEY([LastUpEmployeeID])
REFERENCES [Reference].[Employees] ([EmployeeID])
GO
ALTER TABLE [Reference].[InternalCompanies] CHECK CONSTRAINT [FK_InternalCompanies_Employees]
GO
USE [master]
GO
ALTER DATABASE [TradeManager] SET  READ_WRITE 
GO
