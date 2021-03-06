
/****** Object:  Database [Cargo_Automation]    Script Date: 1.07.2022 16:11:49 ******/
CREATE DATABASE [Cargo_Automation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cargo_Automation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Cargo_Automation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cargo_Automation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Cargo_Automation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Cargo_Automation] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cargo_Automation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cargo_Automation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cargo_Automation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cargo_Automation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cargo_Automation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cargo_Automation] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cargo_Automation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cargo_Automation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cargo_Automation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cargo_Automation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cargo_Automation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cargo_Automation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cargo_Automation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cargo_Automation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cargo_Automation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cargo_Automation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cargo_Automation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cargo_Automation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cargo_Automation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cargo_Automation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cargo_Automation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cargo_Automation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cargo_Automation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cargo_Automation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cargo_Automation] SET  MULTI_USER 
GO
ALTER DATABASE [Cargo_Automation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cargo_Automation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cargo_Automation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cargo_Automation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cargo_Automation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cargo_Automation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Cargo_Automation] SET QUERY_STORE = OFF
GO
USE [Cargo_Automation]
GO
/****** Object:  Table [dbo].[Cargoes]    Script Date: 1.07.2022 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargoes](
	[CargoId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[CargoDescription] [nvarchar](200) NULL,
	[CourierId] [int] NULL,
	[ShippedDate] [date] NULL,
	[DeliveryDate] [date] NULL,
	[Price] [decimal](14, 2) NULL,
	[Freight] [decimal](14, 2) NULL,
	[TransportId] [int] NULL,
 CONSTRAINT [PK_Cargoes] PRIMARY KEY CLUSTERED 
(
	[CargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Couriers]    Script Date: 1.07.2022 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Couriers](
	[CourierId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
 CONSTRAINT [PK_Couriers] PRIMARY KEY CLUSTERED 
(
	[CourierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 1.07.2022 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[EMail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierCargoDetails]    Script Date: 1.07.2022 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierCargoDetails](
	[SupplierId] [int] NOT NULL,
	[CargoId] [int] NOT NULL,
	[SupplyDate] [date] NULL,
	[SupplyDescription] [nvarchar](200) NULL,
 CONSTRAINT [PK_SupplierCargoDetails] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC,
	[CargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 1.07.2022 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[ContactName] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transports]    Script Date: 1.07.2022 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transports](
	[TransportId] [int] IDENTITY(1,1) NOT NULL,
	[TransportType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Transports] PRIMARY KEY CLUSTERED 
(
	[TransportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cargoes]  WITH CHECK ADD  CONSTRAINT [FK_Cargoes_Couriers] FOREIGN KEY([CourierId])
REFERENCES [dbo].[Couriers] ([CourierId])
GO
ALTER TABLE [dbo].[Cargoes] CHECK CONSTRAINT [FK_Cargoes_Couriers]
GO
ALTER TABLE [dbo].[Cargoes]  WITH CHECK ADD  CONSTRAINT [FK_Cargoes_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Cargoes] CHECK CONSTRAINT [FK_Cargoes_Customers]
GO
ALTER TABLE [dbo].[Cargoes]  WITH CHECK ADD  CONSTRAINT [FK_Cargoes_Transports] FOREIGN KEY([TransportId])
REFERENCES [dbo].[Transports] ([TransportId])
GO
ALTER TABLE [dbo].[Cargoes] CHECK CONSTRAINT [FK_Cargoes_Transports]
GO
ALTER TABLE [dbo].[SupplierCargoDetails]  WITH CHECK ADD  CONSTRAINT [FK_SupplierCargoDetails_Cargoes] FOREIGN KEY([CargoId])
REFERENCES [dbo].[Cargoes] ([CargoId])
GO
ALTER TABLE [dbo].[SupplierCargoDetails] CHECK CONSTRAINT [FK_SupplierCargoDetails_Cargoes]
GO
ALTER TABLE [dbo].[SupplierCargoDetails]  WITH CHECK ADD  CONSTRAINT [FK_SupplierCargoDetails_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[SupplierCargoDetails] CHECK CONSTRAINT [FK_SupplierCargoDetails_Suppliers]
GO
USE [master]
GO
ALTER DATABASE [Cargo_Automation] SET  READ_WRITE 
GO
