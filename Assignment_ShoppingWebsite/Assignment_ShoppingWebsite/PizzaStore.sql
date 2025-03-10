USE [master]
GO
/****** Object:  Database [PizzaStore]    Script Date: 3/12/2024 6:19:33 PM ******/
CREATE DATABASE [PizzaStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PizzaStore', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PizzaStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PizzaStore_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PizzaStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PizzaStore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PizzaStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PizzaStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PizzaStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PizzaStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PizzaStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PizzaStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [PizzaStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PizzaStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PizzaStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PizzaStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PizzaStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PizzaStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PizzaStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PizzaStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PizzaStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PizzaStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PizzaStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PizzaStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PizzaStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PizzaStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PizzaStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PizzaStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PizzaStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PizzaStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PizzaStore] SET  MULTI_USER 
GO
ALTER DATABASE [PizzaStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PizzaStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PizzaStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PizzaStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PizzaStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PizzaStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PizzaStore] SET QUERY_STORE = OFF
GO
USE [PizzaStore]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/12/2024 6:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [varchar](10) NOT NULL,
	[UserName] [varchar](20) NULL,
	[Password] [varchar](20) NULL,
	[FullName] [varchar](20) NULL,
	[Type] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/12/2024 6:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [varchar](10) NOT NULL,
	[CategoryName] [varchar](20) NULL,
	[Description] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/12/2024 6:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [varchar](10) NOT NULL,
	[Password] [varchar](20) NULL,
	[ContactName] [varchar](50) NULL,
	[Address] [varchar](250) NULL,
	[Phone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/12/2024 6:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderId] [varchar](10) NOT NULL,
	[ProductId] [varchar](10) NOT NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/12/2024 6:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [varchar](10) NOT NULL,
	[CustomerID] [varchar](10) NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[Freight] [decimal](10, 2) NULL,
	[ShipAddress] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/12/2024 6:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [varchar](10) NOT NULL,
	[ProductName] [varchar](20) NULL,
	[SupplierID] [varchar](10) NULL,
	[CategoryID] [varchar](10) NULL,
	[QuantityPerUnit] [int] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[ProductImage] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 3/12/2024 6:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [varchar](10) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[Address] [varchar](250) NULL,
	[Phone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [FullName], [Type]) VALUES (N'C003', N'Vu', N'345', N'Tran Vu', 0)
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [FullName], [Type]) VALUES (N'U001', N'khiem', N'123', N'Khiem Ngueyn', 1)
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [FullName], [Type]) VALUES (N'U002', N'huy', N'234', N'Truong Tan Huy', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (N'CAT001', N'Category: Vegetarian', N'Pizza from Farm')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (N'CAT002', N'Category: Beaf', N'A Pizza with Beaf')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (N'CAT003', N'Category: Seafood', N'A Pizza with fish and some fresh')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (N'CAT004', N'Category: Chicken', N'A Pizza with good meat')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (N'CAT005', N'Category: Pork', N'A Pizza good for muscle')
GO
INSERT [dbo].[Customers] ([CustomerID], [Password], [ContactName], [Address], [Phone]) VALUES (N'C001', N'123', N'Ha', N'134 Tran Hung Dao', N'0909432787')
INSERT [dbo].[Customers] ([CustomerID], [Password], [ContactName], [Address], [Phone]) VALUES (N'C003', N'345', N'Khiem', N'93a/2 Pham Dinh Ho', N'0898443761')
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (N'O001', N'P002', CAST(10.99 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress]) VALUES (N'O001', N'C003', CAST(N'2024-03-12T18:04:55.950' AS DateTime), CAST(N'2024-03-12T18:34:55.950' AS DateTime), CAST(N'2024-03-12T18:44:55.950' AS DateTime), CAST(5.00 AS Decimal(10, 2)), N'93a/2 Pham Dinh Ho')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [ProductImage]) VALUES (N'P001', N'Pizza Ocean', N'S001', N'CAT001', 1, CAST(12.98 AS Decimal(10, 2)), N'image/OCEAN_MANIA.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [ProductImage]) VALUES (N'P002', N'Pizza Vegetarian', N'S001', N'CAT001', 1, CAST(10.99 AS Decimal(10, 2)), N'image/PIZZAMIN_SEA.jpg')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [Phone]) VALUES (N'S001', N'Domino''s Pizza', N'2001 4th Ave, Seattle, WA 98121', N'0898441721')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [Phone]) VALUES (N'S002', N'PIzza Hut', N'2001 4th Ave, Seattle, WA 98121', N'0937611142')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [Phone]) VALUES (N'S003', N'Papa John''s Pizza', N'2001 4th Ave, Seattle, WA 98121', N'0909323458')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [Phone]) VALUES (N'S004', N'Little Caesars', N'2001 4th Ave, Seattle, WA 98121', N'0707432878')
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
USE [master]
GO
ALTER DATABASE [PizzaStore] SET  READ_WRITE 
GO
