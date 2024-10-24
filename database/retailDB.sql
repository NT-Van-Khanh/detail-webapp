USE [master]
GO
/****** Object:  Database [Retail]    Script Date: 24/10/2024 10:11:53 SA ******/
CREATE DATABASE [Retail]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sale', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Sale.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sale_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Sale_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Retail] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Retail].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Retail] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Retail] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Retail] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Retail] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Retail] SET ARITHABORT OFF 
GO
ALTER DATABASE [Retail] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Retail] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Retail] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Retail] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Retail] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Retail] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Retail] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Retail] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Retail] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Retail] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Retail] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Retail] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Retail] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Retail] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Retail] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Retail] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Retail] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Retail] SET RECOVERY FULL 
GO
ALTER DATABASE [Retail] SET  MULTI_USER 
GO
ALTER DATABASE [Retail] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Retail] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Retail] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Retail] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Retail] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Retail] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Retail', N'ON'
GO
ALTER DATABASE [Retail] SET QUERY_STORE = ON
GO
ALTER DATABASE [Retail] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Retail]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 24/10/2024 10:11:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [nvarchar](15) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 24/10/2024 10:11:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [nvarchar](15) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[flag] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 24/10/2024 10:11:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1000) NOT NULL,
	[last_name] [nvarchar](35) NULL,
	[first_name] [nvarchar](10) NOT NULL,
	[phone] [nchar](10) NOT NULL,
	[email] [nvarchar](320) NOT NULL,
	[birthday] [date] NULL,
	[gender] [bit] NULL,
	[address] [nvarchar](150) NULL,
	[password] [nvarchar](100) NULL,
	[created_at] [datetime] NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_EmailCustomer] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_PhoneCustomer] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 24/10/2024 10:11:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [nvarchar](5) NOT NULL,
	[last_name] [nvarchar](35) NULL,
	[first_name] [nvarchar](10) NOT NULL,
	[phone] [nchar](10) NOT NULL,
	[email] [nchar](320) NOT NULL,
	[gender] [bit] NULL,
	[birthday] [date] NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_EmailEmployee] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_PhoneEmployee] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nutrient]    Script Date: 24/10/2024 10:11:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nutrient](
	[id] [nchar](10) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[detail] [text] NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_Nutrient] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 24/10/2024 10:11:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [nvarchar](10) NOT NULL,
	[customer_id] [int] NOT NULL,
	[total_cost] [money] NOT NULL,
	[pay_status] [nchar](2) NOT NULL,
	[ship_status] [nchar](2) NOT NULL,
	[address] [nvarchar](150) NULL,
	[last_update] [datetime] NOT NULL,
	[employee_id] [nvarchar](5) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_Oder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_item]    Script Date: 24/10/2024 10:11:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_item](
	[id] [int] IDENTITY(1,1000) NOT NULL,
	[order_id] [nvarchar](10) NOT NULL,
	[product_id] [nchar](10) NOT NULL,
	[quantity] [smallint] NOT NULL,
	[total_cost] [money] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_Oder_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_OderProduct] UNIQUE NONCLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 24/10/2024 10:11:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [nchar](10) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[detail] [text] NULL,
	[quantity] [smallint] NOT NULL,
	[price] [money] NOT NULL,
	[category_id] [nvarchar](15) NOT NULL,
	[unit_id] [nvarchar](10) NULL,
	[brand_id] [nvarchar](15) NULL,
	[last_update] [datetime] NOT NULL,
	[employee_id] [nvarchar](5) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_nutrient]    Script Date: 24/10/2024 10:11:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_nutrient](
	[id] [nchar](10) NOT NULL,
	[product_id] [nchar](10) NOT NULL,
	[nutrient_id] [nchar](10) NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_Product_nutrient] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 24/10/2024 10:11:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_create_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_flag]  DEFAULT ((0)) FOR [flag]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_flag]  DEFAULT ((0)) FOR [flag]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_create_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_createAt]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_flag]  DEFAULT ((0)) FOR [flag]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_createdAt]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employ_flag]  DEFAULT ((0)) FOR [flag]
GO
ALTER TABLE [dbo].[Nutrient] ADD  CONSTRAINT [DF_Nutrient_flag]  DEFAULT ((0)) FOR [flag]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Oder_create_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Oder_flag]  DEFAULT ((0)) FOR [flag]
GO
ALTER TABLE [dbo].[Order_item] ADD  CONSTRAINT [DF_Oder_item_create_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Order_item] ADD  CONSTRAINT [DF_Oder_item_flag]  DEFAULT ((0)) FOR [flag]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_quantity]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_create_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_flag]  DEFAULT ((0)) FOR [flag]
GO
ALTER TABLE [dbo].[Product_nutrient] ADD  CONSTRAINT [DF_Product_nutrient_flag]  DEFAULT ((0)) FOR [flag]
GO
ALTER TABLE [dbo].[Unit] ADD  CONSTRAINT [DF_Unit_flag]  DEFAULT ((0)) FOR [flag]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Oder_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Oder_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee]
GO
ALTER TABLE [dbo].[Order_item]  WITH CHECK ADD  CONSTRAINT [FK_Oder_item_Oder] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[Order_item] CHECK CONSTRAINT [FK_Oder_item_Oder]
GO
ALTER TABLE [dbo].[Order_item]  WITH CHECK ADD  CONSTRAINT [FK_Oder_item_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Order_item] CHECK CONSTRAINT [FK_Oder_item_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Employee]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Unit] FOREIGN KEY([unit_id])
REFERENCES [dbo].[Unit] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Unit]
GO
ALTER TABLE [dbo].[Product_nutrient]  WITH CHECK ADD  CONSTRAINT [FK_Product_nutrient_Nutrient] FOREIGN KEY([product_id])
REFERENCES [dbo].[Nutrient] ([id])
GO
ALTER TABLE [dbo].[Product_nutrient] CHECK CONSTRAINT [FK_Product_nutrient_Nutrient]
GO
ALTER TABLE [dbo].[Product_nutrient]  WITH CHECK ADD  CONSTRAINT [FK_Product_nutrient_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Product_nutrient] CHECK CONSTRAINT [FK_Product_nutrient_Product]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [CK_PasswordCustomer] CHECK  ((len([password])>=(8)))
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [CK_PasswordCustomer]
GO
USE [master]
GO
ALTER DATABASE [Retail] SET  READ_WRITE 
GO
