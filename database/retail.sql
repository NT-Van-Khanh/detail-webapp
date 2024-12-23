USE [master]
GO
/****** Object:  Database [Retail]    Script Date: 08/12/2024 11:35:59 CH ******/
CREATE DATABASE [Retail]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sale', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Sale.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sale_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Sale_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
USE [Retail]
GO
/****** Object:  Sequence [dbo].[EmployeeSequence]    Script Date: 08/12/2024 11:35:59 CH ******/
CREATE SEQUENCE [dbo].[EmployeeSequence] 
 AS [bigint]
 START WITH 2
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [Retail]
GO
/****** Object:  Sequence [dbo].[OrderProductSequence]    Script Date: 08/12/2024 11:35:59 CH ******/
CREATE SEQUENCE [dbo].[OrderProductSequence] 
 AS [bigint]
 START WITH 6
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [Retail]
GO
/****** Object:  Sequence [dbo].[ProductSequence]    Script Date: 08/12/2024 11:35:59 CH ******/
CREATE SEQUENCE [dbo].[ProductSequence] 
 AS [bigint]
 START WITH 34
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[auth_group]    Script Date: 08/12/2024 11:35:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_permission]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetimeoffset](7) NULL,
	[is_superuser] [bit] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[first_name] [nvarchar](150) NOT NULL,
	[last_name] [nvarchar](150) NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[is_staff] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[date_joined] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_groups]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_user_permissions]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_user_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 08/12/2024 11:36:00 CH ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 08/12/2024 11:36:00 CH ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 08/12/2024 11:36:00 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_admin_log]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_admin_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetimeoffset](7) NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [smallint] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_content_type]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_migrations]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_migrations](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_session]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 08/12/2024 11:36:00 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nutrient]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nutrient](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[detail] [text] NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_Nutrient] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_item]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_item](
	[id] [int] IDENTITY(1,1000) NOT NULL,
	[order_id] [nvarchar](10) NOT NULL,
	[product_id] [nvarchar](10) NOT NULL,
	[quantity] [smallint] NOT NULL,
	[price] [money] NOT NULL,
	[total_cost] [money] NULL,
	[created_at] [datetime] NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_Oder_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_product]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_product](
	[id] [nvarchar](10) NOT NULL,
	[customer_id] [int] NOT NULL,
	[total_cost] [money] NOT NULL,
	[pay_status] [nchar](2) NOT NULL,
	[ship_status] [nchar](2) NOT NULL,
	[address] [nvarchar](150) NULL,
	[last_update] [datetime] NOT NULL,
	[employee_id] [nvarchar](5) NULL,
	[created_at] [datetime] NOT NULL,
	[flag] [bit] NOT NULL,
	[note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Oder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[detail] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[Product_nutrient]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_nutrient](
	[id] [nchar](10) NOT NULL,
	[product_id] [nvarchar](10) NOT NULL,
	[nutrient_id] [nchar](10) NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_Product_nutrient] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[search_product]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[search_product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[health_benefits] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 08/12/2024 11:36:00 CH ******/
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
SET IDENTITY_INSERT [dbo].[auth_permission] ON 

INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (1, N'Can add log entry', 1, N'add_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (2, N'Can change log entry', 1, N'change_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (3, N'Can delete log entry', 1, N'delete_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (4, N'Can view log entry', 1, N'view_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (5, N'Can add permission', 2, N'add_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (6, N'Can change permission', 2, N'change_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (7, N'Can delete permission', 2, N'delete_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (8, N'Can view permission', 2, N'view_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (9, N'Can add group', 3, N'add_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (10, N'Can change group', 3, N'change_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (11, N'Can delete group', 3, N'delete_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (12, N'Can view group', 3, N'view_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (13, N'Can add user', 4, N'add_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (14, N'Can change user', 4, N'change_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (15, N'Can delete user', 4, N'delete_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (16, N'Can view user', 4, N'view_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (17, N'Can add content type', 5, N'add_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (18, N'Can change content type', 5, N'change_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (19, N'Can delete content type', 5, N'delete_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (20, N'Can view content type', 5, N'view_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (21, N'Can add session', 6, N'add_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (22, N'Can change session', 6, N'change_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (23, N'Can delete session', 6, N'delete_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (24, N'Can view session', 6, N'view_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (25, N'Can add product', 7, N'add_product')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (26, N'Can change product', 7, N'change_product')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (27, N'Can delete product', 7, N'delete_product')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (28, N'Can view product', 7, N'view_product')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (29, N'Can add brand', 8, N'add_brand')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (30, N'Can change brand', 8, N'change_brand')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (31, N'Can delete brand', 8, N'delete_brand')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (32, N'Can view brand', 8, N'view_brand')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (33, N'Can add category', 9, N'add_category')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (34, N'Can change category', 9, N'change_category')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (35, N'Can delete category', 9, N'delete_category')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (36, N'Can view category', 9, N'view_category')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (37, N'Can add unit', 10, N'add_unit')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (38, N'Can change unit', 10, N'change_unit')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (39, N'Can delete unit', 10, N'delete_unit')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (40, N'Can view unit', 10, N'view_unit')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (41, N'Can add nutrient', 11, N'add_nutrient')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (42, N'Can change nutrient', 11, N'change_nutrient')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (43, N'Can delete nutrient', 11, N'delete_nutrient')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (44, N'Can view nutrient', 11, N'view_nutrient')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (45, N'Can add product nutrient', 12, N'add_productnutrient')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (46, N'Can change product nutrient', 12, N'change_productnutrient')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (47, N'Can delete product nutrient', 12, N'delete_productnutrient')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (48, N'Can view product nutrient', 12, N'view_productnutrient')
SET IDENTITY_INSERT [dbo].[auth_permission] OFF
GO
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'CTCPNSND       ', N'Công Ty Cổ Phần Nông Sản Nam Đô', CAST(N'2024-10-22T18:14:06.670' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'CTCPTTDH', N'Công Ty Cổ Phần Phát Triển Dũng Hà', CAST(N'2024-11-11T15:10:13.663' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'CTCPVNSV       ', N'Công ty Cổ phần Vilaconic – Nông sản Vilaconic', CAST(N'2024-10-22T18:14:06.670' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'CTTNHHCBTMAV   ', N'Công Ty TNHH Chế Biến & Thương Mại A.V', CAST(N'2024-10-22T18:14:06.670' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'CTTNHHCCTCV    ', N'Công Ty TNHH Cung Cấp Trái Cây Việt', CAST(N'2024-10-22T18:14:06.670' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'CTTNHHTML', N' Công Ty TNHH Thương Mại Laria', CAST(N'2024-11-11T15:14:55.667' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'HTXF', N'Hợp tác xã SX TM DV sạch Gap Rasa foods', CAST(N'2024-11-11T14:46:25.160' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'NSABC          ', N'Nhà cung cấp nông sản ABC Việt Nam', CAST(N'2024-10-22T18:14:06.670' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'TCTLTMNV       ', N'Tổng Công ty Lương thực miền Nam – Vinafood II', CAST(N'2024-10-22T18:14:06.670' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'TGC', N'Cửa hàng Thế giới cây', CAST(N'2024-11-11T14:23:19.667' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'VINMART', N'Cửa hàng VinMart ', CAST(N'2024-11-11T11:47:37.193' AS DateTime), 0)
GO
INSERT [dbo].[Category] ([id], [name], [flag], [created_at]) VALUES (N'NN', N'Nước ngoài', 0, CAST(N'2024-10-12T15:52:57.220' AS DateTime))
INSERT [dbo].[Category] ([id], [name], [flag], [created_at]) VALUES (N'TN', N'Trong nước', 0, CAST(N'2024-10-11T14:09:56.757' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([id], [last_name], [first_name], [phone], [email], [birthday], [gender], [address], [password], [created_at], [flag]) VALUES (3, N'Nguyễn Trần Quốc', N'Bằng', N'0443222111', N'test@gmail.com', CAST(N'2003-07-08' AS Date), 0, N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', N'$2a$10$RwaNDubTblNV8pe5n3kd8.z8KiSV4l2Fjrec.DoW91boBy3UvZi8S', CAST(N'2024-04-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Customer] ([id], [last_name], [first_name], [phone], [email], [birthday], [gender], [address], [password], [created_at], [flag]) VALUES (4, N'Nguyễn Quang ', N'Huy', N'0333222111', N't@gmail.com', CAST(N'2002-02-02' AS Date), 0, N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', N'$2a$10$RwaNDubTblNV8pe5n3kd8.z8KiSV4l2Fjrec.DoW91boBy3UvZi8S', CAST(N'2024-09-04T22:26:10.207' AS DateTime), 0)
INSERT [dbo].[Customer] ([id], [last_name], [first_name], [phone], [email], [birthday], [gender], [address], [password], [created_at], [flag]) VALUES (5, N'Nguyễn Thị Vân', N'Khánh', N'0343935903', N'ntvk137@gmail.com', CAST(N'2000-01-01' AS Date), 1, N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', N'$2a$10$RwaNDubTblNV8pe5n3kd8.z8KiSV4l2Fjrec.DoW91boBy3UvZi8S', CAST(N'2024-10-12T15:59:42.853' AS DateTime), 0)
INSERT [dbo].[Customer] ([id], [last_name], [first_name], [phone], [email], [birthday], [gender], [address], [password], [created_at], [flag]) VALUES (7, N'Hoàng Linh', N'Điệp', N'0555566778', N'hld123@gmail.com', CAST(N'2000-01-01' AS Date), 1, N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', N'$2a$10$RwaNDubTblNV8pe5n3kd8.z8KiSV4l2Fjrec.DoW91boBy3UvZi8S', CAST(N'2024-10-20T16:42:28.870' AS DateTime), 0)
INSERT [dbo].[Customer] ([id], [last_name], [first_name], [phone], [email], [birthday], [gender], [address], [password], [created_at], [flag]) VALUES (6007, N'Nguyễn', N'Tùng', N'0346959259', N'n21dccn092@student.ptithcm.edu.vn', NULL, NULL, N'447 LÊ VĂN VIỆT', N'$2a$10$0CT9klXNFcjCH2uijqS/kOP4wUzXtHARDw6xrfhgChBAw/.5XFUGa', CAST(N'2024-11-15T11:47:37.247' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[django_content_type] ON 

INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (1, N'admin', N'logentry')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (3, N'auth', N'group')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (2, N'auth', N'permission')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (4, N'auth', N'user')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (5, N'contenttypes', N'contenttype')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (8, N'search', N'brand')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (9, N'search', N'category')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (11, N'search', N'nutrient')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (7, N'search', N'product')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (12, N'search', N'productnutrient')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (10, N'search', N'unit')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (6, N'sessions', N'session')
SET IDENTITY_INSERT [dbo].[django_content_type] OFF
GO
SET IDENTITY_INSERT [dbo].[django_migrations] ON 

INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (1, N'contenttypes', N'0001_initial', CAST(N'2024-11-09T16:40:09.2074090+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (2, N'auth', N'0001_initial', CAST(N'2024-11-09T16:40:09.2999080+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (3, N'admin', N'0001_initial', CAST(N'2024-11-09T16:40:09.3174690+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (4, N'admin', N'0002_logentry_remove_auto_add', CAST(N'2024-11-09T16:40:09.3233780+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (5, N'admin', N'0003_logentry_add_action_flag_choices', CAST(N'2024-11-09T16:40:09.3326420+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (6, N'contenttypes', N'0002_remove_content_type_name', CAST(N'2024-11-09T16:40:10.0517390+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (7, N'auth', N'0002_alter_permission_name_max_length', CAST(N'2024-11-09T16:40:10.0612680+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (8, N'auth', N'0003_alter_user_email_max_length', CAST(N'2024-11-09T16:40:10.0697120+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (9, N'auth', N'0004_alter_user_username_opts', CAST(N'2024-11-09T16:40:10.0760700+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (10, N'auth', N'0005_alter_user_last_login_null', CAST(N'2024-11-09T16:40:10.7898350+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (11, N'auth', N'0006_require_contenttypes_0002', CAST(N'2024-11-09T16:40:10.7978320+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (12, N'auth', N'0007_alter_validators_add_error_messages', CAST(N'2024-11-09T16:40:10.8058120+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (13, N'auth', N'0008_alter_user_username_max_length', CAST(N'2024-11-09T16:40:10.8598790+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (14, N'auth', N'0009_alter_user_last_name_max_length', CAST(N'2024-11-09T16:40:10.8688650+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (15, N'auth', N'0010_alter_group_name_max_length', CAST(N'2024-11-09T16:40:11.5314130+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (16, N'auth', N'0011_update_proxy_permissions', CAST(N'2024-11-09T16:40:11.5392630+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (17, N'auth', N'0012_alter_user_first_name_max_length', CAST(N'2024-11-09T16:40:11.5479700+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (18, N'search', N'0001_initial', CAST(N'2024-11-09T16:40:11.5526900+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (19, N'sessions', N'0001_initial', CAST(N'2024-11-09T16:40:11.5627760+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[django_migrations] OFF
GO
INSERT [dbo].[Employee] ([id], [last_name], [first_name], [phone], [email], [gender], [birthday], [password], [created_at], [flag]) VALUES (N'NV001', N'Nguyễn Thị Vân', N'Khánh', N'0343935903', N'ntvk137@gmail.com                                                                                                                                                                                                                                                                                                               ', 1, CAST(N'2001-01-01' AS Date), N'$2a$10$RwaNDubTblNV8pe5n3kd8.z8KiSV4l2Fjrec.DoW91boBy3UvZi8S', CAST(N'2024-10-22T17:48:26.173' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Order_item] ON 

INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [price], [total_cost], [created_at], [flag]) VALUES (1, N'HD00001', N'SP000001', 3, 50000.0000, 150000.0000, CAST(N'2024-10-20T17:39:48.020' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [price], [total_cost], [created_at], [flag]) VALUES (2001, N'HD00002', N'SP000002', 2, 14000.0000, 28000.0000, CAST(N'2024-10-20T22:39:12.630' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [price], [total_cost], [created_at], [flag]) VALUES (3001, N'HD00002', N'SP000003', 1, 28000.0000, 28000.0000, CAST(N'2024-10-20T22:51:42.850' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [price], [total_cost], [created_at], [flag]) VALUES (4001, N'HD00003', N'SP000001', 2, 50000.0000, 100000.0000, CAST(N'2024-10-20T22:52:13.430' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [price], [total_cost], [created_at], [flag]) VALUES (5001, N'HD00003', N'SP000004 ', 1, 32000.0000, 32000.0000, CAST(N'2024-10-20T22:52:52.417' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [price], [total_cost], [created_at], [flag]) VALUES (6001, N'HD00004', N'SP000002', 1, 14000.0000, 14000.0000, CAST(N'2024-10-20T22:54:41.420' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [price], [total_cost], [created_at], [flag]) VALUES (7001, N'HD00005', N'SP000005', 2, 35000.0000, 70000.0000, CAST(N'2024-10-20T22:55:18.447' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [price], [total_cost], [created_at], [flag]) VALUES (9001, N'HD00006', N'SP000006', 1, 55000.0000, 55000.0000, CAST(N'2024-10-20T22:56:10.813' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [price], [total_cost], [created_at], [flag]) VALUES (10001, N'HD00007', N'SP000007', 2, 43000.0000, 86000.0000, CAST(N'2024-10-20T22:56:48.957' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [price], [total_cost], [created_at], [flag]) VALUES (11001, N'HD00007', N'SP000005', 1, 35000.0000, 35000.0000, CAST(N'2024-10-20T22:57:53.660' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [price], [total_cost], [created_at], [flag]) VALUES (12001, N'HD00008', N'SP000002', 1, 28000.0000, 28000.0000, CAST(N'2024-10-20T23:03:42.073' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [price], [total_cost], [created_at], [flag]) VALUES (13001, N'HD00011', N'SP000003', 1, 40000.0000, NULL, CAST(N'2024-12-08T23:12:24.603' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [price], [total_cost], [created_at], [flag]) VALUES (14001, N'HD00011', N'SP000017', 2, 109000.0000, NULL, CAST(N'2024-12-08T23:12:24.617' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Order_item] OFF
GO
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag], [note]) VALUES (N'HD00001', 3, 150000.0000, N'HT', N'HT', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-12-01T13:38:44.100' AS DateTime), N'NV001', CAST(N'2024-10-20T17:21:57.680' AS DateTime), 0, NULL)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag], [note]) VALUES (N'HD00002', 4, 56000.0000, N'HT', N'DG', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-12-01T13:38:06.697' AS DateTime), N'NV001', CAST(N'2024-10-20T22:03:25.153' AS DateTime), 0, NULL)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag], [note]) VALUES (N'HD00003', 3, 132000.0000, N'HT', N'HT', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-11-06T09:10:45.473' AS DateTime), N'NV001', CAST(N'2024-10-20T22:03:56.180' AS DateTime), 0, NULL)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag], [note]) VALUES (N'HD00004', 3, 14000.0000, N'HT', N'HT', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-10-20T22:04:39.120' AS DateTime), N'NV001', CAST(N'2024-10-20T22:04:39.120' AS DateTime), 0, NULL)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag], [note]) VALUES (N'HD00005', 3, 70000.0000, N'HT', N'HT', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-11-17T11:06:38.397' AS DateTime), N'NV001', CAST(N'2024-10-20T22:05:04.767' AS DateTime), 0, NULL)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag], [note]) VALUES (N'HD00006', 4, 55000.0000, N'HT', N'DG', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-11-06T09:02:42.967' AS DateTime), N'NV001', CAST(N'2024-10-20T22:35:54.907' AS DateTime), 0, NULL)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag], [note]) VALUES (N'HD00007', 5, 121000.0000, N'HT', N'HT', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-12-08T23:16:52.820' AS DateTime), NULL, CAST(N'2024-10-20T22:38:26.187' AS DateTime), 0, NULL)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag], [note]) VALUES (N'HD00008', 5, 28000.0000, N'HT', N'CB', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-12-08T23:17:01.570' AS DateTime), NULL, CAST(N'2024-10-20T23:02:52.193' AS DateTime), 0, NULL)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag], [note]) VALUES (N'HD00011', 5, 258000.0000, N'CH', N'CB', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-12-08T23:12:24.573' AS DateTime), NULL, CAST(N'2024-12-08T23:12:24.573' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000001', N'Dâu Tây Đà Lạt ', N'Dâu tây Đà Lạt nổi bật với vị ngọt thanh, chua nhẹ và hương thơm đặc trưng, mang đến sự cân bằng hài hòa trong hương vị. Quả dâu tây mềm mại, mọng nước và tươi mát, rất thích hợp để thưởng thức trong ngày hè. Màu đỏ tươi hấp dẫn của dâu tây Đà Lạt không chỉ bắt mắt mà còn thể hiện chất lượng và độ chín hoàn hảo của quả.
Dâu tây là loại quả giàu Vitamin C, axit ellagic và chất chống oxy hóa, giúp tăng cường hệ miễn dịch, làm đẹp da, bảo vệ tim mạch, hỗ trợ giảm cân, ổn định đường huyết và ngăn ngừa ung thư. Ngoài ra, dâu tây còn giúp trắng răng tự nhiên, kích thích mọc tóc và hạn chế rụng tóc. Với lượng calo thấp và nhiều dưỡng chất, dâu tây mang lại nhiều lợi ích cho sức khỏe và sắc đẹp.
Dâu tây có nhiều lợi ích cho sức khỏe, nhưng cần ăn với lượng hợp lý, khoảng 5-8 quả mỗi ngày. Ăn quá nhiều dâu tây có thể gây đau dạ dày do hàm lượng axit kích ứng niêm mạc, đặc biệt khi ăn lúc đói. Ngoài ra, dâu tây có thể gây dị ứng, nhất là với người có tiền sử dị ứng, dẫn đến mẩn đỏ và ngứa da. Vì vậy, cần cân nhắc liều lượng khi sử dụng để đảm bảo an toàn cho sức khỏe.
', 30, 50000.0000, N'TN', N'1KG     ', N'NSABC          ', CAST(N'2024-12-08T10:10:58.490' AS DateTime), N'NV001', CAST(N'2024-10-11T14:11:06.290' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000002', N'Thơm', N'Trái thơm, còn gọi là dứa không gai hoặc thơm mật, có kích thước lớn (1.5 - 3kg) với hoa màu hồng hơi đỏ. Phần thịt màu vàng ngà, mọng nước, vị ngọt thanh xen lẫn chua nhẹ và mùi thơm đặc trưng. 
Trái thơm giàu nước và vitamin, thích hợp ăn trực tiếp, ép nước hoặc chế biến món ăn. Với hương vị ngọt thanh, mọng nước và giàu dinh dưỡng, thơm là loại quả lý tưởng để bổ sung vào chế độ ăn hàng ngày.
Nhờ chứa chất chống oxy hóa mạnh như flavonoid và phenolic acid, thơm giúp chống ứng kích oxy hóa, giảm viêm mãn tính và bảo vệ cơ thể khỏi bệnh tật. Enzyme bromelain có trong thơm hỗ trợ tiêu hóa, giúp cơ thể hấp thu protein tốt hơn và có tiềm năng giảm nguy cơ ung thư nhờ khả năng ức chế sự phát triển của tế bào ung thư. Thơm cũng giúp tăng cường hệ miễn dịch, giảm viêm và có thể làm giảm triệu chứng viêm khớp. ', 53, 14000.0000, N'TN', N'1TRAI', N'TCTLTMNV       ', CAST(N'2024-12-08T10:27:15.780' AS DateTime), N'NV001', CAST(N'2024-10-12T15:51:18.363' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000003', N'Quýt Thái', N'Quýt Thái có vỏ màu cam, vị chua ngọt hoặc ngọt lịm tùy từng lô hàng, với cành lá xanh tươi nên thường được dùng để chưng cúng, thắp hương trong các dịp lễ. 
Quả quýt giàu vitamin C, kali, canxi, magie và chất xơ, giúp tăng cường miễn dịch, chống oxy hóa, cải thiện tiêu hóa và ngăn ngừa sỏi thận.Ngoài ra, nhờ chứa vitamin A và beta Carotin, quýt còn bảo vệ mắt và da khỏi các tia bức xạ từ máy tính. Các acid hữu cơ và Vitamin trong quýt còn giúp cân bằng chức năng trao đổi chất, đồng thời hỗ trợ chống lại sự phá vỡ acid uric trong máu, rất tốt cho người già mắc bệnh tim. Nhờ giàu Vitamin và dưỡng chất, quýt không chỉ tăng cường hệ miễn dịch mà còn giúp cơ thể khỏe mạnh, tiêu hóa tốt và giảm nguy cơ mắc các bệnh mãn tính.
Quýt Thái, quýt đường Thái, quýt đường, quýt đường không hạt, quýt Thái không hạt đều là tên một giống quýt ngọt mới được đem trồng ở nước ta. Trái quýt Thái sẽ có hình cầu dẹp ở hai đầu, đỉnh và đáy lõm ít, thông thường sẽ có từ 6 -10 múi, mỗi múi có từ 0 – 4 hạt, có khi không có.', 100, 40000.0000, N'NN', N'1KG     ', N'CTCPNSND       ', CAST(N'2024-12-08T10:41:29.033' AS DateTime), N'NV001', CAST(N'2024-10-12T15:52:23.230' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000004', N'Mận Hà Nội', N'Mận Bắc (hay mận hậu) là loại quả đặc sản của vùng Tây Bắc như Sơn La, Mộc Châu. Khi còn non, mận hậu có vỏ xanh, căng bóng, phủ lớp phấn trắng tự nhiên, và khi chín sẽ chuyển sang màu đỏ rực bắt mắt. Loại quả này có hương vị đặc trưng, kết hợp giữa vị chua, ngọt mát và chút chát nhẹ, chứa nhiều nước, rất thích hợp để giải nhiệt. 
Mận hậu không chỉ thơm ngon mà còn mang lại nhiều lợi ích cho sức khỏe. Chất chống oxy hóa trong mận giúp cải thiện trí nhớ, phục hồi tế bào não và hỗ trợ hệ thần kinh. Với chỉ số đường huyết thấp (GI = 24), mận phù hợp cho người tiểu đường. Chất xơ, isatin và sorbitol hỗ trợ tiêu hóa, giảm táo bón. Kali trong mận giúp cân bằng điện giải, kiểm soát huyết áp, bảo vệ tim mạch, trong khi vitamin A cải thiện thị lực. Đặc biệt, anthocyanin trong mận giúp phòng ngừa ung thư, và nhờ ít calo, nhiều chất xơ, mận là lựa chọn lý tưởng để giảm cân.
Mận hậu mang lại nhiều lợi ích sức khỏe, nhưng cần sử dụng một cách hợp lý để tránh tác dụng phụ. Nếu bạn mắc các bệnh về thận, có vấn đề dạ dày hoặc đang mang thai, nên ăn mận hậu ở mức độ vừa phải để tận dụng lợi ích mà không gây ảnh hưởng đến sức khỏe. Mận có thể làm giảm hiệu quả của một số loại thuốc, do đó không nên ăn mận khi đang điều trị bệnh hoặc trước phẫu thuật.', 23, 32000.0000, N'TN', N'1KG     ', N'CTCPVNSV       ', CAST(N'2024-12-08T11:10:31.483' AS DateTime), N'NV001', CAST(N'2024-10-12T15:57:28.153' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000005', N'Vải thiều Lục Ngạn - Bắc Giang', N'Vải Thiều Lục Ngạn nổi tiếng với quả to, màu đỏ tươi, mọng nước, vị ngọt đậm đà
Vải thiều tươi, hay còn được biết đến với cái tên quốc tế là Lychee, chính là một trong những tinh hoa ẩm thực mùa hè ở Việt Nam. Hương vị ngọt ngào khó cưỡng, cùi mọng nước, và lớp vỏ đỏ rực hấp dẫn khiến vải thiều không chỉ chinh phục người trong nước mà còn ghi dấu trên bản đồ trái cây nhiệt đới thế giới. Bài viết này sẽ đưa bạn vào thế giới của vải thiều tươi, khám phá từ nguồn gốc, dinh dưỡng, cách thưởng thức, đến những công thức độc đáo để tận dụng tối đa hương vị đặc sắc của loại trái cây này.
Loại quả này là nguồn cung cấp tuyệt vời các vitamin, khoáng chất và chất chống oxy hóa. Vải thiều chứa nhiều vitamin C, giúp tăng cường hệ miễn dịch, thúc đẩy sản sinh collagen và làm da sáng khỏe. Kali trong vải thiều giúp điều hòa huyết áp và tốt cho tim mạch. Chất xơ hỗ trợ tiêu hóa, ngăn ngừa táo bón. Các chất chống oxy hóa trong vải thiều giúp giảm viêm, phòng ngừa bệnh tật và thúc đẩy quá trình chống lão hóa. Với những thành phần dinh dưỡng này, vải thiều tươi mang lại nhiều lợi ích cho sức khỏe như tăng cường miễn dịch, hỗ trợ sức khỏe tim mạch, cải thiện tiêu hóa và chống lão hóa.', 32, 50000.0000, N'TN', N'1KG     ', N'CTCPVNSV       ', CAST(N'2024-11-11T14:59:09.717' AS DateTime), N'NV001', CAST(N'2024-10-12T15:58:07.547' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000006', N'Dâu tây giống New Zealand Đà Lạt', N'Dâu tây Đà Lạt giống New Zealand là một trong những giống dâu tây cao cấp được trồng thủy canh tại Đà Lạt, với màu sắc bắt mắt, thịt giòn và ngọt, đặc biệt có hương thơm đặc trưng không kém gì dâu tây nhập khẩu. Đây là loại trái cây rất tốt cho sức khỏe, chứa nhiều chất chống oxy hóa gấp 10 lần cà chua và có giá trị dinh dưỡng cao hơn cả quả kiwi và hoa lơ xanh.
Dâu tây chứa các chất chống oxy hóa giúp bảo vệ tim mạch, giảm cholesterol xấu, ổn định huyết áp và ngăn ngừa ung thư, đặc biệt là ung thư phổi và thực quản. Với chỉ số đường huyết thấp, dâu tây là lựa chọn an toàn cho bệnh nhân tiểu đường. Chất xơ trong dâu hỗ trợ tiêu hóa, giảm táo bón và tăng cường miễn dịch, trong khi kali giúp giảm cảm giác đầy hơi. Dâu tây còn cải thiện chức năng não và duy trì hệ thần kinh khỏe mạnh nhờ flavonoid và vitamin C. 
Theo nghiên cứu của Tạp chí Các nhân tố sinh học của Hà Lan, dâu tây có tác dụng bổ phổi, điều hòa tiêu hóa, giải độc và bồi bổ cơ thể. Trong Đông y, dâu tây được dùng để chữa ho do phổi nóng, cổ họng sưng đau, chán ăn, tiểu ngắn, thiếu máu, ung nhọt và say rượu.', 43, 55000.0000, N'TN', N'1KG     ', N'VINMART', CAST(N'2024-12-08T12:41:45.000' AS DateTime), N'NV001', CAST(N'2024-10-12T15:58:47.583' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000007', N'Măng cụt', N'Măng cụt là loại trái cây quen thuộc, khi chín có vỏ ngoài khá dày, màu đỏ tím đậm, ruột màu trắng ngà chia thành các tép nhỏ,  số núm ở đầu quả bằng với số tép của quả. 
Măng cụt có vị chua ngọt thanh và mùi thơm dễ chịu, ăn rất ngon. Măng cụt thường được ăn tươi, khía một đường quanh quả rồi bẻ đôi theo đường khía để lấy múi trắng, bỏ hạt trong, với vị ngọt và mọng nước. Nó cung cấp một lượng calo đáng kể cho cơ thể.
Măng cụt, được mệnh danh là nữ hoàng của trái cây, chứa hàm lượng cao chất kháng thể Xanthones giúp ngăn ngừa lão hóa, hạ cholesterol xấu và ngăn sự hình thành các tế bào sợi nguy hại. Nó cung cấp vitamin A, C, E, giúp chống lão hóa, giữ da mịn màng và tươi trẻ. Hoạt chất Proanthocyanidin và acid tannic trong măng cụt hỗ trợ ổn định đường huyết, đặc biệt cho bệnh nhân tiểu đường type 2. 
Măng cụt còn bảo vệ tim mạch, ngăn ngừa ung thư và hỗ trợ giảm cân nhờ hàm lượng calo thấp. Gel từ măng cụt giúp giảm viêm nha chu hiệu quả hơn phương pháp truyền thống.', 23, 43000.0000, N'TN', N'1KG     ', N'CTCPNSND       ', CAST(N'2024-12-08T13:06:55.697' AS DateTime), N'NV001', CAST(N'2024-10-15T00:13:19.850' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000008', N'Sầu riêng Musang King Malaysia', N'Sầu riêng Musang King Malaysia là loại sầu riêng thuộc hàng ngon nhất, múi to còn hạt thì cực lép, nổi bật với vị ngọt béo đậm đà, hương thơm nồng nàn đặc trưng và cơm vàng ươm. Được mệnh danh là "vua" của các loại sầu riêng, Musang King có nguồn gốc từ bang Sabah, Malaysia, và luôn là lựa chọn hàng đầu khi nhắc đến trái cây của quốc gia này. 
Loại trái cây này rất bổ dưỡng, chứa nhiều vitamin, chất xơ và hợp chất thực vật có lợi cho sức khỏe. Một khẩu phần 243 gram sầu riêng cung cấp đến 80% nhu cầu vitamin C hằng ngày, giúp tăng sức đề kháng, làm sáng da và ngăn ngừa lão hóa. Ngoài ra, sầu riêng còn giàu chất xơ và vitamin B6, hỗ trợ hệ tiêu hóa, ngăn ngừa lão hóa, bệnh tim, và cải thiện tâm trạng. Kali trong sầu riêng giúp kiểm soát huyết áp và điều hòa nhịp tim, trong khi axit folic có lợi cho phụ nữ mang thai, giảm nguy cơ dị tật ống thần kinh cho thai nhi.', 10, 459000.0000, N'NN', N'1KG     ', N'CTTNHHTML', CAST(N'2024-12-08T13:13:08.937' AS DateTime), N'NV001', CAST(N'2024-10-20T22:58:35.583' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000009', N'Cam vàng Úc', N'Cam Úc là một nguồn cung cấp Vitamin C dồi dào, có tác dụng hồi phục sức khỏe nhanh chóng, cải thiện làn da, chống lão hóa và hỗ trợ giảm cholesterol. Loại trái cây này đặc biệt có lợi cho người ốm, khi cơ thể cần lượng Vitamin C cao hơn bình thường. Với vị chua vừa phải và hương thơm nhẹ, cam Úc là lựa chọn phổ biến cho gia đình hoặc làm quà tặng khi thăm người bệnh. 
Thường xuyên ăn cam có thể giúp bảo vệ cơ thể khỏi các bệnh truyền nhiễm do virus, đồng thời giảm nguy cơ mắc bệnh sỏi thận. Để tránh lượng calo dư thừa, việc bổ sung cam Úc vào chế độ dinh dưỡng hàng ngày là một lựa chọn hợp lý. Sản phẩm cam Úc được bảo quản và kiểm tra chất lượng nghiêm ngặt, đảm bảo an toàn cho người tiêu dùng.', 12, 36000.0000, N'NN', N'1KG     ', N'NSABC          ', CAST(N'2024-12-08T14:26:34.070' AS DateTime), N'NV001', CAST(N'2024-10-20T22:59:41.610' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000010', N'Xoài cát chu', N'Xoài xanh ngọt với bề ngoài màu xanh mướt bên trong vàng ươm, thịt dày, mùi thơm ngon và vị ngọt bùi.
Phần thịt xoài khi chín màu cam đậm gần như không có xơ, mềm nhưng hơi dai, vị ngọt sâu và đậm hương thơm phù hợp sử dụng trực tiếp hoặc chế biến sinh tố hay làm bánh hoặc một số các món ăn khác.
Sản phẩm rất thích hợp để làm món quà biếu tặng, dâng cúng những dịp lễ tết hay trưng bày rất sang trọng cũng như là trái cây bổ dưỡng tẩm bổ cho người ốm, người già hay trẻ con.
Xoài được gọi là vua của tất cả các loại trái cây, không chỉ thơm ngon, ngọt, xoài giàu protein, chất xơ, vitamin C, A, axit folic..., mang lại nhiều lợi ích cho sức khỏe. Nhiều nghiên cứu đã chứng minh xoài có khả năng làm giảm nguy cơ béo phì, bệnh tim, tăng cường năng lượng, cải thiện trí nhớ...', 10, 59000.0000, N'TN', N'1KG     ', N'VINMART', CAST(N'2024-11-29T08:07:01.620' AS DateTime), N'NV001', CAST(N'2024-11-11T12:00:54.537' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000011', N'Xoài tứ quý', N'Xoài tứ quý là một loại quả giàu dinh dưỡng rất được người tiêu dùng Việt Nam ưa chuộng. Các nhà khoa học cho thấy xoài tứ quý chứa chất béo, chất xơ, đường, protein, vitamin A, canxi và một số dinh dưỡng khác nữa. Ăn xoài tứ quý có tác dụng bảo vệ tim mạch, hỗ trợ tiêu hóa, cải thiện trí nhớ, phòng chống ung thư, hỗ trợ giảm cân và đẹp da.
Để mang đến cho người tiêu dùng những sản phẩm chất lượng nhất, từng quả xoài tứ quý được tuyển chọn nghiêm ngặt dựa trên rất nhiều tiêu chí, vậy nên người dùng hoàn toàn có thể yên tâm sử dụng.', 10, 49000.0000, N'TN', N'1KG     ', N'VINMART', CAST(N'2024-12-08T14:49:59.300' AS DateTime), N'NV001', CAST(N'2024-11-11T12:32:43.093' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000012', N'Thanh long ruột đỏ', N'Thanh long ruột đỏ là một trong những loại trái cây tươi có thành phần dinh dưỡng phù hợp nhất cho việc giữ gìn dáng vóc và sắc đẹp, đặc biệt là với phụ nữ. Thanh long ruột đỏ có đặc tính hoàn toàn khác so với loại thanh long trắng.Thành phần dinh dưỡng của thanh long ruột đỏ được đánh giá là gấp đôi thanh long ruột trắng.

Thanh long ruột đỏ có hàm lượng nước cao giúp giữ ẩm cho làn da, giúp da mịn màng hơn, giảm bớt hiện tượng da khô nứt, sừng hóa và lão hóa, giữ cho làn da có vẻ đẹp trẻ trung tươi mát.

Bên cạnh đó, Thanh long ruột đỏ có chứa thành phần chất xơ cũng rất cao so với các loại trái cây khác, bao gồm cả 2 loại chất xơ không hòa tan (cellulose) và chất xơ hòa tan (pectin) giúp điều hòa hoạt động của hệ tiêu hóa, làm giảm các chất nguy hiểm đối với cơ thể như: các chất béo, cholesterol, các độc chất... làm giảm nguy cơ bị mụn, nhọt trên da.

Thanh long ruột đỏ có thành phần hoàn toàn không chứa chất béo, cùng với mức năng lượng thấp và giàu chất xơ giúp giữ gìn cơ thể tránh khỏi hiện tượng béo phì. Đồng thời, đây cũng là một loại quả tốt cho tim mạch, người mắc chứng tiểu đường nhờ lượng chất xơ cao, giúp làm giảm lượng cholesterol xấu và tăng mức cholesterol tốt trong cơ thể. Hơn nữa, Thanh long là một nguồn tuyệt vời chất béo không bão hòa đơn, giúp cho trái tim bạn nghỉ ngơi trong tình trạng thái tốt.', 10, 35900.0000, N'TN', N'1KG     ', N'VINMART', CAST(N'2024-11-11T12:37:33.413' AS DateTime), N'NV001', CAST(N'2024-11-11T12:37:33.413' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000013', N'Kiwi xanh Newzealand', N'Quả Kiwi có hình bầu dục, vỏ phía ngoài có nhiều lông. Kích thước tương đương 1 quả trứng gà lớn (chiều dài: 5 cm và đường kính: 4,5 – 5,5 cm). Trọng lượng trung bình của một quả Kiwi New Zealand là từ 100g đến 130g. Loại quả khi chín có vị ngọt và hơi chua khi xanh với hương vị tuyệt vời cùng giá trị dinh dưỡng rất lớn đối với người thưởng thức
Một số nghiên cứu quả kiwi có hàm lượng Vitamin C, K 92,7mg và là nguồn cung cấp chất xơ và Vitamin E rất tốt cho cơ thể với hàm lượng 1,46 mg/100g rất tốt khi sử dụng
Kiwi xanh New Zealand được đóng hộp đẹp mắt rất chắc chắn với số lượng 4 trái có thể là món quà biếu sang trọng trong những dịp lễ tết hay thăm hỏi sức khỏe cho người ốm, người già. Loại quả thường được sử dụng trực tiếp', 20, 89000.0000, N'NN', N'HOP     ', N'VINMART', CAST(N'2024-11-14T15:50:30.860' AS DateTime), N'NV001', CAST(N'2024-11-11T12:39:26.310' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000014', N'Kiwi vàng Newzealand', N'Kiwi Vàng Hộp 2 Trái Xuất Xứ New Zealand chứa nhiều hàm lượng Vitamin C cũng như Vitamin B9 giúp phòng ngừa bệnh tim, kích thích sự hình thành Neural Tube ( tiền thân của não bộ và cột sống) tốt cho sự phát triển của bào thai. Chất xơ trong Kiwi Vàng Hộp 2 Trái Xuất Xứ New Zealand giúp kiểm soát lượng đường trong máu, giảm cholesterol xấu trong máu', 10, 89000.0000, N'NN', N'HOP     ', N'VINMART', CAST(N'2024-11-11T12:42:27.090' AS DateTime), N'NV001', CAST(N'2024-11-11T12:42:27.090' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000015', N'Dưa hấu không hạt', N'Dưa hấu không hạt là giống quả mới lạ và độc đáo. Quả dưa tròn, da xanh nhạt có gân xanh đậm, vỏ mỏng, nhiều nước, không có hạt và vị ngọt đậm đà. Đây là loại trái cây giải khát tuyệt vời, ngoài việc sử dụng trực tiếp còn dùng để làm các loại nước ép sinh tố rất bổ dưỡng. Chỉ với một ly nước ép hoặc sinh tố buổi sáng là bạn đã bổ sung năng lượng cho mọi hoạt động hàng ngày. Không những thế, dưa hấu còn rất giàu chất dinh dưỡng thiết yếu như vitamin A, B1, B6, C, axit pantothenic, biotin, kali và ma-giê... giúp tăng cường sức đề kháng cho cơ thể hiệu quả.



Sản phẩm Dưa hấu không hạt do VinMart cung cấp luôn đạt độ tươi ngon, hợp vệ sinh và đảm bảo an toàn sức khỏe. Mỗi sản phẩm được lựa chọn tỉ mỉ trước khi đến tay người tiêu dùng. Sản phẩm đảm bảo giữ được độ tươi ngon và ngọt mát sẽ làm hài lòng khẩu vị của bạn và cả gia đình.
Gợi ý một số món ngon chế biến từ dưa hấu:
Dưa hấu là loại quả giải nhiệt rất thích hợp dùng trong mùa hè hoặc những ngày oi bức. Ngoài cách sử dụng trực tiếp, bạn có thể kết hợp dưa hấu với các loại hoa quả khác để chế biến những cốc sinh tố, nước ép ngon miệng, bổ dưỡng.', 10, 64000.0000, N'TN', N'2KG     ', N'VINMART', CAST(N'2024-11-11T12:46:44.790' AS DateTime), N'NV001', CAST(N'2024-11-11T12:46:44.790' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000016', N'Dưa lưới Đế Vương Queen size ruột cam', N'Trong quả dưa lưới chứa nhiều loại vitamin A, C, E và axit folic, độ ngọt cao, đem lại nhiều tác dụng cho cơ thể.
Tăng cường hệ miễn dịch và phòng chống ung thư. Chứa nhiều chất xơ, phòng chống táo bó hiệu quả. Cải thiện hô hấp, giảm mệt mỏi, chứa mất ngủ. Chứa hàm lượng axit folic cao, tốt cho thai nhi và phụ nữ mang thai. Phòng ngừa loãng xương, ổn định huyết áp...', 30, 55200.0000, N'TN', N'1TRAI', N'CTCPNSND       ', CAST(N'2024-11-11T12:50:47.473' AS DateTime), N'NV001', CAST(N'2024-11-11T12:50:47.473' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000017', N'Táo đỏ Mỹ', N'Táo có nhiều công dụng đối với sức khỏe con người, cả về giá trị dinh dưỡng lẫn công dụng phòng, trị bệnh. Táo có thành phần dinh dưỡng rất phong phú, đặc biệt là các loại vi chất, sinh tố và axit hoa quả. 
Trong táo chứa nhiều chất pectin, một chất xơ hòa tan làm giảm cholesterol và chất chống oxy hóa, ngăn ngừa bệnh tim cùng các loại vitamin A, C, E. Ngoài ra, lượng kali và các chất chống oxy hóa cũng rất phong phú nên táo còn được biết đến như một loại thực phẩm có lợi cho sắc đẹp và có tác dụng giảm cân hiệu quả. Lượng canxi trong táo cũng cao hơn trong các loại hoa quả khác, giúp trung hòa lượng muối dư thừa trong cơ thể.
Nhiều loại trái cây bị coi là "thủ phạm" làm tăng nguy cơ phát triển bệnh tiểu đường nhưng táo không nằm trong số đó. Tiêu thụ táo ở mức độ vừa phải còn có lợi ở chỗ giữ cho lượng đường trong máu của bạn luôn ở mức kiểm soát, tránh tăng cao dẫn đến bệnh tiểu đường. Các dưỡng chất thực vật và chất chống oxy hóa trong táo như polyphenol sẽ làm giảm hấp thu glucose và ổn định lượng đường trong máu.
Táo đỏ Mỹ​​ là loại táo có vỏ màu đỏ rượu vang đẹp mắt, hương thơm đặc trưng hấp dẫn, khi thưởng thức bạn sẽ cảm nhận được vị ngọt tự nhiên. Sản phẩm Táo đỏ Mỹ​​​ do VinMart phân phối được nhập khẩu trực tiếp từ Mỹ, táo được trồng tại các nông trại với quy trình trồng và chăm sóc hiện đại, đảm bảo không chứa các dư chất bảo vệ thực vật độc hại ảnh hưởng tới sức khỏe của người tiêu dùng. Sản phẩm được nhập khẩu và bảo quản cẩn thận nên vẫn giữ được độ tươi ngon và giá trị dinh dưỡng cao khi đến tay người tiêu dùng.', 50, 109000.0000, N'NN', N'1KG     ', N'VINMART', CAST(N'2024-11-11T12:58:38.643' AS DateTime), N'NV001', CAST(N'2024-11-11T12:58:11.687' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000018', N'Xoài Cát Chu Chú Chín', N'Xoài cát chu hình thon dài, do dùng kỹ thuật bao trái, nên cho ra màu vàng tươi bắt mắt. Đến khi chín vỏ chuyển màu cam đậm, mùi thơm tự nhiên. 100% xoài Chú Chín không sử dụng đất đèn hoặc chất ủ chín. Thịt xoài gần như không có xơ, mềm nhưng hơi dai, vị ngọt sâu và đậm hương thơm. Xoài cát chu chuẩn khi ăn thường tan trong miệng và vị ngọt vẫn còn đọng mãi trên đầu lưỡi.', 10, 63000.0000, N'NN', N'1KG     ', N'CTCPNSND       ', CAST(N'2024-11-11T13:02:24.650' AS DateTime), N'NV001', CAST(N'2024-11-11T13:02:24.647' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000019', N'Mận An Phước', N'Mận (roi) An Phước hình thuôn, màu đỏ sẫm, một số giống có màu trắng hay hồng. Thịt quả màu trắng bao quanh một hạt lớn. Sản phẩm tươi ngon, không chứa chất bảo quản đảm bảo an toàn sức khỏe cho người tiêu dùng. Đây là loại quả có năng lượng rất thấp, hàm lượng nước cao và đặc biệt, hàm lượng chất xơ trong roi rất cao. Vì vậy, quả roi được xếp vào nhóm có tác dụng giảm béo rất tốt. Hàm lượng chất xơ cao có tác dụng quét các chất béo và đường dư thừa ra khỏi đường tiêu hóa qua bài tiết.
Mận An Phước còn là trái cây có tác dụng làm giảm nhiệt mùa hè và giúp bạn giảm cơn khát ngày nóng nực nên nó có lợi cho phụ nữ mang thai. Phụ nữ mang thai cũng có thể sử dụng loại quả này để ép nước uống hàng ngày do cây ít sử dụng thuốc trừ sâu, an toàn cho sức khỏe.
Theo nghiên cứu của các nhà khoa học thuộc Trường đại học Annamalai (Ấn Độ), chiết xuất từ quả roi (quả mận) có nhiều công dụng chữa bệnh hiệu quả. Quả roi chứa vitamin A, C và các chất chống ôxy hóa, giúp ngăn ngừa ung thư. Đặc biệt, quả roi còn có lợi cho phụ nữ mang thai nhờ khả năng giảm nhiệt và giảm cơn khát trong mùa hè. Ngoài ra, với hàm lượng dinh dưỡng và chất xơ dồi dào, quả roi giúp giảm cholesterol và ngăn ngừa các bệnh tim mạch. Hơn nữa, quả roi có năng lượng thấp và hàm lượng nước cao, là lựa chọn tốt cho việc giảm cân.', 20, 52000.0000, N'TN', N'1KG     ', N'CTCPNSND       ', CAST(N'2024-11-11T13:05:24.443' AS DateTime), N'NV001', CAST(N'2024-11-11T13:05:24.443' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000020', N'Việt quất', N'Việt quất tươi nhập khẩu từ Mỹ, một trong những loại trái cây được yêu chuộng nhất hiện nay.
Quả việt quất được biết đến với đặc tính chống oxy hóa và chống viêm. Đặc biệt, chúng chứa nhiều anthocyanin, một sắc tố thực vật và flavonoid giúp cho quả việt quất có màu xanh tím đặc trưng; hợp chất này giúp chống lại các gốc tự do gây hại tế bào có thể dẫn đến bệnh tật.
Nhiều nghiên cứu đã chỉ ra những lợi ích sức khỏe của chế độ ăn giàu anthocyanin, chẳng hạn như giảm nguy cơ mắc bệnh tiểu đường loại 2, bệnh tim, thừa cân, béo phì, huyết áp cao, một số loại ung thư và suy giảm nhận thức.', 20, 110000.0000, N'NN', N'HOP     ', N'CTTNHHCCTCV    ', CAST(N'2024-12-08T14:53:26.257' AS DateTime), N'NV001', CAST(N'2024-11-11T13:31:41.113' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000021', N'Bơ sáp', N'Bơ sáp là một loại cây trồng phổ biến và được nhiều người ưa chuộng. Lý do chính để loại bơ này phát triển mạnh tại Việt Nam là nhờ khí hậu và thổ nhưỡng phù hợp. Đặc biệt, các vùng núi Tây Nguyên với đất đỏ bazan và khí hậu thuận lợi là điều kiện lý tưởng để cho ra những trái bơ sáp chất lượng.
Hương vị của bơ sáp thường không quá ngọt khi ăn vào thời điểm chín tới, có cảm giác mềm và trơn trong khoang họng. Ở Việt Nam, người ta thường ưa chuộng ăn bơ sáp kèm theo sữa đặc hoặc làm thành sinh tố.', 10, 48000.0000, N'NN', N'1TRAI', N'CTCPNSND       ', CAST(N'2024-11-11T13:37:06.470' AS DateTime), N'NV001', CAST(N'2024-11-11T13:37:06.470' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000022', N'Vú sữa Lò rèn', N'Vú sữa Lò rèn có vị ngọt đậm đà dễ chịu, thơm béo tựa như vị sữa.
Trong vú sữa có một lượng canxi không nhỏ, cứ 100 gram thịt vú sữa thì có đến 18mg canxi. Mỗi quả vú sữa đáp ứng đến 10% nhu cầu canxi của mỗi người/ngày. Chúng có tác dụng tốt cho xương, giúp xương luôn chắc khỏe.
 Đối với trẻ nhỏ, thường xuyên ăn vú sữa sẽ giúp cho xương phát triển tốt, phòng bệnh còi xương. Phụ nữ mang thai nên ăn vú sữa sẽ nhận được thêm một lượng canxi, bổ sung cho thai nhi. Bên cạnh đó, bà bầu thường xuyên ăn vú sữa còn giúp cho chính cơ thể của mình không bị thiếu hụt canxi, phòng chống bệnh loãng xương.
Ngoài ra, Vú sữa còn là một sản phẩm đặc biệt dành cho các khánh hàng mang về khu vực miền Bắc làm quà tặng  ', 15, 120000.0000, N'NN', N'1KG     ', N'CTCPNSND       ', CAST(N'2024-11-11T13:49:52.600' AS DateTime), N'NV001', CAST(N'2024-11-11T13:49:52.600' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000023', N'Mít tố nữ Long Khánh', N'Mít là loại trái cây có nguồn vitamin C tuyệt vời. Vitamin C là loại chất giúp cơ thể chống hiện tượng nhiễm virus và nhiễm khuẩn. Vitamin C giúp tăng cường chức năng hệ thống miễn dịch bằng cách hỗ trợ chức năng của các tế bào máu trắng. Một chén nước ép từ mít có thể cung cấp cho cơ thể một số lượng lớn chất oxy hóa giúp bảo vệ cơ thể.
- Mít cũng chứa các chất có thuộc tính chống loét và rối loạn tiêu hóa. Bên cạnh đó, mít cũng chứa rất nhiều chất xơ, vì vậy chúng giúp ngăn ngừa táo bón và đi tiêu dễ dàng hơn. Loại chất xơ này cũng có tác dụng loại bỏ các màng nhầy bám ở ruột, từ đó giúp bạn giảm nguy cơ mắc bệnh ung thư ruột già (đại tràng).', 15, 80000.0000, N'TN', N'1KG     ', N'CTCPVNSV       ', CAST(N'2024-11-11T13:54:45.937' AS DateTime), N'NV001', CAST(N'2024-11-11T13:54:45.937' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000024', N'Mít Thái tách múi sẵn', N'Mít Thái có múi to dày ngọt cùng vị thơm phảng phất khi ăn, nếu muốn thưởng thức độ giòn nhiều thì khách có thể bảo quản và dùng lạnh.
Mít là loại trái cây có nguồn vitamin C tuyệt vời. Vitamin C là loại chất giúp cơ thể chống hiện tượng nhiễm virus và nhiễm khuẩn. Vitamin C giúp tăng cường chức năng hệ thống miễn dịch bằng cách hỗ trợ chức năng của các tế bào máu trắng. Một chén nước ép từ mít có thể cung cấp cho cơ thể một số lượng lớn chất oxy hóa giúp bảo vệ cơ thể.
- Mít cũng chứa các chất có thuộc tính chống loét và rối loạn tiêu hóa. Bên cạnh đó, mít cũng chứa rất nhiều chất xơ, vì vậy chúng giúp ngăn ngừa táo bón và đi tiêu dễ dàng hơn. Loại chất xơ này cũng có tác dụng loại bỏ các màng nhầy bám ở ruột, từ đó giúp bạn giảm nguy cơ mắc bệnh ung thư ruột già (đại tràng)', 20, 80000.0000, N'TN', N'1KG     ', N'NSABC          ', CAST(N'2024-11-11T13:58:22.023' AS DateTime), N'NV001', CAST(N'2024-11-11T13:58:22.023' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000025', N'Mít ruột đỏ Mã Lai (lột múi sẵn)', N'Lạ miệng ngọt thơm mùi vị không " đụng hàng " đó là những gì khách hàng nói về Mít ruột đỏ Malaysia khi đã dùng qua. Vài năm trở lại đây khi nhu cầu du nhập cây giống từ nước ngoài càng ngày càng phổ biến thì nhiều nông dân ở khắp các tỉnh thành đồng bằng Sông Cửu Long đã mạnh dạn đầu tư', 30, 140000.0000, N'NN', N'500G', N'CTCPNSND       ', CAST(N'2024-11-11T14:02:47.477' AS DateTime), N'NV001', CAST(N'2024-11-11T14:02:47.477' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000026', N'Sầu riêng Ri 6( nguyên trái)', N'Sầu riêng được xem là một đặc sản của Việt nam và đã được xuất khẩu đi khắp thế giới với nhiều cái tên như Ri6 - Sáu hủ - Chín hoá - Moongthong (giống của Thái trồng tại Việt Nạm).
Sầu riêng Ri6 có cơm vàng, hạt lép, múi to (tiêu chuẩn 4 đường múi trở lên) kèm vị ngọt bùi bùi hoặc đắng nhẹ tạo thêm sự kích thích (tuỳ vùng trồng) khi ăn, size trái dao động từ 2.5-3.5kg/ quả.', 15, 57000.0000, N'TN', N'100G    ', N'CTCPNSND       ', CAST(N'2024-11-11T14:06:44.280' AS DateTime), N'NV001', CAST(N'2024-11-11T14:06:44.280' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000027', N'Bưởi da xanh Bến tre loại 1', N' Bưởi có vị ngọt đậm hơn bưởi thường, múi màu hồng, mọng nước. Đặc biệt, vỏ bưởi có màu xanh đẹp mắt, chứa nhiều tinh dầu. Trái bưởi có thể sử dụng cả múi, cùi lẫn vỏ, cho nhiều công dụng khác nhau.
Bưởi da xanh chứa nhiều vitamin C, vitamin , kali, magiê và chất xơ, cung cấp các chất dinh dưỡng cần thiết cho cơ thể. Với hàm lượng chất xơ cao, bưởi rất tốt cho tiêu hóa, giúp khắc phục các vấn đề như táo bón. Bưởi cũng giúp điều hòa huyết áp nhờ lượng kali cao, giúp thư giãn mạch máu và thúc đẩy lưu thông máu, giảm nguy cơ đau tim và đột quỵ. Kali trong bưởi còn giúp củng cố xương cốt, ngăn ngừa loãng xương. Ngoài ra, hàm lượng vitamin C cao trong bưởi là một chất chống oxy hóa mạnh, giúp tiêu diệt các gốc tự do và làm trẻ hóa làn da. Vitamin P trong bưởi tăng cường chức năng của các lỗ chân lông, giúp mau lành vết thương và làm đẹp da, rất phù hợp cho chị em trong mùa thu đông. Ngoài ra bưởi còn giúp kiểm soát sự thèm ăn, hỗ trợ giảm cân, cải thiện sức khỏe tim mạch và ngăn người kháng insulin và bệnh tiểu đường.', 20, 57000.0000, N'TN', N'1KG     ', N'CTTNHHCCTCV    ', CAST(N'2024-11-11T14:18:57.527' AS DateTime), N'NV001', CAST(N'2024-11-11T14:18:57.527' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000028', N'Nhãn xuồng vàng Vũng tàu', N'Nhãn xuồng vàng một trong những đặc sản trứ danh của xứ biển Bà Rịa - Vũng Tàu. Nhãn xuồng nổi tiếng với trái to, cơm dày, thịt dai, hạt nhỏ, ngọt thanh và mang hương thơm đặc trưng. Loại nhãn này giàu vitamin C, B, sắt, chất xơ, protein và nhiều dưỡng chất thiết yếu khác cho cơ thể. Điểm đặc biệt của nhãn xuồng là phần cơm giòn, sần sật, tạo nên sự khác biệt so với các loại nhãn khác. Với dưỡng chất dồi dào, nhãn xuồng giúp ngăn ngừa cảm cúm, cảm lạnh, bổ sung sắt để ngăn ngừa thiếu máu, cải thiện tuần hoàn máu, tiêu diệt vi trùng lao, tăng cường trí nhớ và tăng tuổi thọ.
', 21, 120000.0000, N'TN', N'1KG     ', N'TGC', CAST(N'2024-11-11T14:31:13.293' AS DateTime), N'NV001', CAST(N'2024-11-11T14:31:13.293' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000029', N'Mãng cầu (Na)', N'Quả Mãng cầu (quả Na) là một nguồn tuyệt vời của vitamin C. Một quả trung bình có thể cung cấp 1/5 lượng vitamin C mà cơ thể cần hàng ngày. Chính nhờ giàu vitamin C mà loại quả này được coi là rất hữu ích trong việc tăng cường hệ miễn dịch của con người.
Một quả na trung bình mà không có hạt và vỏ nặng khoảng 312g thì lượng carbohydrate chiếm khoảng 55g, 5g protein, 2g chất béo… Thành phần còn lại là nước và các chất dinh dưỡng khác.
Một quả mãng cầu ngon và lành mạnh sẽ chứa nhiều chất xơ và chất xơ đã được chứng minh là rất có lợi cho việc tiêu hóa và bài tiết thức ăn trong cơ thể. Chính vì vậy mà quả này cũng có tác dụng làm giảm táo bón hiệu quả.
Trong quả na có khá nhiều lượng vitamin B6. Loại vitamin này rất có lợi cho hoạt động của não bộ vì nó kiểm soát mức độ hóa học thần kinh GABA. Mức độ hóa học thần kinh GABA có tác dụng loại bỏ sự căng thẳng, làm dịu thần kinh dễ bị kích thích và thậm chí điều trị trầm cảm. Chính vì vậy, nếu muốn tốt cho não bộ, hãy ăn na nhiều hơn. Ngoài ra, vitamin B6 thậm chí còn được coi là để giảm bớt nguy cơ mắc bệnh parkinson, do đó, quả na còn có thêm tác dụng phòng bệnh parkinson.
Ngoài ra, quả còn chứa lượng lớn magie, kali và các khoáng chất có lợi. Khi đi vào cơ thể, những dưỡng chất này có khả năng bảo vệ tim mạch, thư giãn cơ bắp và kiểm soát huyết áp.', 15, 45000.0000, N'TN', N'1KG     ', N'TGC', CAST(N'2024-12-08T14:49:17.693' AS DateTime), N'NV001', CAST(N'2024-11-11T14:41:27.383' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000030', N'Xoài keo', N'Xoài keo có nguồn gốc từ Campuchia, quả có vị ngon ngọt, bùi thơm. Khi ăn xanh, xoài keo có vị ngậy, còn khi chín thì rất thơm. Loại xoài này có nhiều đặc tính phù hợp với khí hậu Việt Nam. Xoài keo xanh có giá trị dinh dưỡng cao, chứa nhiều vitamin B, C. Một miếng xoài trung bình cung cấp 100 calo, 1 gram protein, 0,5 gram chất béo, 25 gram carbohydrate, 23 gram đường và 3 gram chất xơ. Khẩu phần này đáp ứng đủ nhu cầu hàng ngày về vitamin C, 35% vitamin A, 20% folate, 10% vitamin B6, 8% vitamin K và kali. Xoài keo có nhiều lợi ích sức khỏe như chống ung thư, kiểm soát mức cholesterol, làm sạch da, giúp kiềm hóa cơ thể, giảm cân, điều chỉnh bệnh tiểu đường, kích thích vị giác và tốt cho mắt.', 15, 35000.0000, N'TN', N'1KG     ', N'HTXF', CAST(N'2024-11-11T14:49:13.500' AS DateTime), N'NV001', CAST(N'2024-11-11T14:48:55.173' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000031', N'Dừa xiêm xanh', N'Dừa xiêm Bến Tre mang lại nhiều lợi ích sức khỏe nhờ nước dừa tươi, một loại nước uống tự nhiên rất tốt cho cơ thể. 
Nước dừa ít calo và chất béo, giàu vitamin, khoáng chất và các dưỡng chất như axit lauric, kali, magiê, clorua, sắt, canxi, natri và phốt pho. Với 46 calo mỗi ly, nước dừa cung cấp carbohydrate, chất xơ, protein, vitamin C, magiê, mangan, kali, natri và canxi. Nước dừa giúp làm đẹp da nhờ cytokinin, tăng cường năng lượng, cải thiện tim mạch, chống mất nước, trị bệnh tiêu hóa, giảm cân, tăng cường miễn dịch và ngăn ngừa sỏi thận. 
Các dưỡng chất trong nước dừa giúp điều hòa tăng trưởng và phân chia tế bào, giảm lão hóa da, cân bằng pH, và giữ cho mô liên kết bền vững. Uống nước dừa thường xuyên giúp điều hòa huyết áp, bổ sung năng lượng sau khi tập luyện, và hỗ trợ tiêu hóa, ngăn ngừa táo bón và các vấn đề về đường ruột. 
Nước dừa cũng giúp tăng cường trao đổi chất, giảm cân, và kìm hãm sự phát triển của nấm, đồng thời ngăn ngừa sự kết tụ của các tinh thể trong thận.', 15, 15600.0000, N'TN', N'1TRAI', N'NSABC          ', CAST(N'2024-11-11T15:07:06.593' AS DateTime), N'NV001', CAST(N'2024-11-11T15:07:06.593' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000032', N'Ổi nữ hoàng', N'Ổi nữ hoàng là loại ổi được ưa chuộng bậc nhất từ khi bắt đầu du nhập vào Việt Nam bởi hương vị thơm ngon cùng giá trị dinh dưỡng cao. Quả của loại ổi này rất to và tròn, và bên cạnh đó thịt cũng rất dày, ruột nhỏ và không có nhiều hạt - một điểm cộng lớn cho loại ổi này.
Thanh mát và dịu ngọt là hai từ dùng để diễn tả hương vị của loại ổi này. Ngoài ra, hương thơm dịu nhẹ cùng độ giòn của thịt cũng chính là thứ khiến nhiều người yêu thích ổi nữ hoàng.
Ổi Nữ Hoàng mang lại nhiều lợi ích sức khỏe nhờ hàm lượng dinh dưỡng phong phú. Loại quả này giàu vitamin C, giúp tăng cường hệ miễn dịch và chống lại các bệnh cảm cúm, ho. Với hàm lượng chất xơ cao, ổi Nữ Hoàng hỗ trợ hệ tiêu hóa và ngăn ngừa táo bón. Kali trong ổi giúp điều hòa huyết áp và giảm nguy cơ mắc các bệnh tim mạch. Ngoài ra, ổi Nữ Hoàng chứa nhiều vitamin A, bảo vệ mắt và ngăn ngừa các bệnh về mắt như đục thủy tinh thể và thoái hóa điểm vàng. Chất xơ trong ổi cũng giúp tạo cảm giác no lâu, hỗ trợ giảm cân hiệu quả. Vitamin C và các chất chống oxy hóa trong ổi Nữ Hoàng bảo vệ da khỏi tác hại của ánh nắng mặt trời, giảm nếp nhăn và tăng độ đàn hồi cho da.', 20, 31000.0000, N'TN', N'1KG     ', N'CTCPTTDH', CAST(N'2024-11-11T15:13:44.720' AS DateTime), N'NV001', CAST(N'2024-11-11T15:13:44.720' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000033', N'Ổi Đài Loan', N'Ổi Đài Loan là loại quả tuy có xuất xứ từ Đài Loan nhưng loại ổi này được trồng khá phổ biến ở Việt Nam nên được rất nhiều người ưa chuộng.
Loại quả này chứa nhiều hợp chất chống oxy hóa giúp ngăn ngừa sự phát triển của các khối u ác tính. Ổi giàu vitamin C, giúp tăng cường hệ miễn dịch và chống lại các bệnh cảm cúm, ho. Ngoài ra, ổi chứa nhiều vitamin A và C, cùng với các chất chống oxy hóa như carotene và lycopene, giúp bảo vệ làn da khỏi các tác nhân gây lão hóa. Ổi cũng hỗ trợ điều trị các bệnh về răng miệng như viêm nướu, viêm lợi hay loét miệng nhờ giàu vitamin C và các chất kháng khuẩn tự nhiên. Đặc biệt, ổi có đặc tính chống bệnh tiểu đường, giúp giảm lượng đường trong máu và điều hòa lượng đường trong máu. Chất xơ trong ổi giúp kích thích hoạt động của ruột và làm sạch đường tiêu hóa, cải thiện sức khỏe tim mạch bằng cách giảm mức cholesterol xấu và chất béo trung tính trong máu. Ổi cũng chứa vitamin B3 và B6, niacin và pyridoxine, có khả năng cải thiện hoạt động của hệ thần kinh và não bộ.
Mặc dù ổi có nhiều lợi ích, nhưng có một số người nên hạn chế ăn ổi. Người bị đau dạ dày nên tránh ăn ổi khi đói hoặc ăn không kỹ vì ổi là loại quả cứng, giàu tính axit, có thể gây đau dạ dày. Người bệnh tiểu đường cũng nên hạn chế ăn ổi hoặc uống nước ép ổi hàng ngày vì ổi có chỉ số đường huyết cao, có thể làm tăng đường huyết và gây ra các biến chứng nguy hiểm. Phụ nữ có thai và cho con bú nên ngừng ăn ổi khi bị táo bón vì ổi chứa nhiều chất xơ, đặc biệt là ổi xanh, có thể làm tình trạng táo bón thêm trầm trọng. Người bị suy nhược cũng nên tránh ăn ổi vì ổi khó tiêu cho những người có hệ tiêu hóa kém; nếu vẫn muốn ăn, nên uống nước ép hoặc xay nhuyễn.', 32, 23000.0000, N'TN', N'1KG     ', N'CTCPNSND       ', CAST(N'2024-11-11T15:22:31.487' AS DateTime), N'NV001', CAST(N'2024-11-11T15:22:31.487' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000034', N'Dâu tây Mỹ đá Đà Lạt', N'Dâu tây đá (hay Dâu tây Mỹ đá) là một giống dâu tây du nhập từ Hoa Kỳ, có quả tròn, kích thước lớn (khoảng 3-4cm), màu đỏ tươi, vỏ mỏng và thịt quả dày, mọng nước.
Với vị chua ngọt thanh mát và mùi thơm đặc trưng, dâu tây này thích hợp ăn tươi, xay sinh tố, ép nước, hoặc dùng làm trang trí cho các món ăn và thức uống.
Dâu tây đá giàu vitamin C, vitamin A, chất xơ và kali, có tác dụng tăng cường hệ miễn dịch, chống oxy hóa, bảo vệ tim mạch và ngăn ngừa ung thư. Chỉ với một lượng nhỏ dâu tây, bạn đã có đủ nhu cầu vitamin C hàng ngày, giúp tăng cường miễn dịch và chống oxy hóa hiệu quả.', 23, 144000.0000, N'TN', N'1KG     ', N'CTCPNSND       ', CAST(N'2024-12-08T12:54:33.513' AS DateTime), N'NV001', CAST(N'2024-12-08T12:54:33.513' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000035', N'Quýt đường', N'Quýt đường, hay còn gọi là quýt da xanh, có đặc điểm vỏ mỏng, trơn láng, khi quả còn non có màu xanh đậm, sau đó chuyển dần sang vàng khi chín. Quả quýt mọng nước, có vị ngọt thanh và mùi thơm đặc trưng, để lại hậu vị chua nhẹ sau khi ăn. Khi bóc vỏ, mùi thơm từ tinh dầu quýt càng làm tăng thêm sự hấp dẫn, kích thích cả khứu giác và vị giác.
Quýt đường mang lại nhiều lợi ích cho sức khỏe như cung cấp vitamin C giúp tăng cường miễn dịch, chống oxy hóa bảo vệ tế bào và giảm nguy cơ mắc bệnh mãn tính. Quýt hỗ trợ tiêu hóa, giảm táo bón nhờ chất xơ, và giúp giảm huyết áp, bảo vệ tim mạch nhờ kali. Vitamin C và chất chống oxy hóa cũng giúp duy trì làn da khỏe mạnh. Ngoài ra, quýt đường cung cấp vitamin A, canxi và magiê cho sức khỏe xương, răng và cơ bắp.
Quýt đường là một đặc sản nổi bật của miền Tây, được trồng nhiều ở Cái Bè (Tiền Giang), Lai Vung (Đồng Tháp) và Long Trị (Hậu Giang). Quýt đường ra trái quanh năm, nhưng ngon nhất vào dịp Tết Nguyên Đán và tháng 3 - 4, là lựa chọn lý tưởng để thưởng thức và biếu tặng trong những dịp đặc biệt.', 25, 34000.0000, N'TN', N'1KG     ', N'HTXF', CAST(N'2024-12-08T14:47:29.410' AS DateTime), N'NV001', CAST(N'2024-12-08T14:47:29.410' AS DateTime), 0)
GO
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'100G    ', N'100g', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'1KG     ', N'1kg', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'1TRAI', N'1 trái', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'200G    ', N'200g', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'2KG     ', N'2kg', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'2TRAI', N'2 trái', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'500G', N'500g', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'HOP     ', N'hộp', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'THUNG   ', N'thùng', 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_group_name_a6ea08ec_uniq]    Script Date: 08/12/2024 11:36:00 CH ******/
ALTER TABLE [dbo].[auth_group] ADD  CONSTRAINT [auth_group_name_a6ea08ec_uniq] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_b120cbf9]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_group_id_b120cbf9] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_permission_id_0cd325b0_uniq]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC,
	[permission_id] ASC
)
WHERE ([group_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_permission_id_84c5c92e]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_permission_id_84c5c92e] ON [dbo].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_permission_content_type_id_2f476e4b]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE NONCLUSTERED INDEX [auth_permission_content_type_id_2f476e4b] ON [dbo].[auth_permission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_permission_content_type_id_codename_01ab375a_uniq]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_permission_content_type_id_codename_01ab375a_uniq] ON [dbo].[auth_permission]
(
	[content_type_id] ASC,
	[codename] ASC
)
WHERE ([content_type_id] IS NOT NULL AND [codename] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_user_username_6821ab7c_uniq]    Script Date: 08/12/2024 11:36:00 CH ******/
ALTER TABLE [dbo].[auth_user] ADD  CONSTRAINT [auth_user_username_6821ab7c_uniq] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_group_id_97559544]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_group_id_97559544] ON [dbo].[auth_user_groups]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_6a12ed8b]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_user_id_6a12ed8b] ON [dbo].[auth_user_groups]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_group_id_94350c0c_uniq]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_groups_user_id_group_id_94350c0c_uniq] ON [dbo].[auth_user_groups]
(
	[user_id] ASC,
	[group_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [group_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_permission_id_1fbb5f2c]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_permission_id_1fbb5f2c] ON [dbo].[auth_user_user_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_a95ead1b]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_a95ead1b] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC,
	[permission_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_EmailCustomer]    Script Date: 08/12/2024 11:36:00 CH ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UK_EmailCustomer] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_PhoneCustomer]    Script Date: 08/12/2024 11:36:00 CH ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UK_PhoneCustomer] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_content_type_id_c4bce8eb]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb] ON [dbo].[django_admin_log]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_user_id_c564eba6]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6] ON [dbo].[django_admin_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [django_content_type_app_label_model_76bd3d3b_uniq]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [django_content_type_app_label_model_76bd3d3b_uniq] ON [dbo].[django_content_type]
(
	[app_label] ASC,
	[model] ASC
)
WHERE ([app_label] IS NOT NULL AND [model] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_session_expire_date_a5c62663]    Script Date: 08/12/2024 11:36:00 CH ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [dbo].[django_session]
(
	[expire_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_EmailEmployee]    Script Date: 08/12/2024 11:36:00 CH ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [UK_EmailEmployee] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_PhoneEmployee]    Script Date: 08/12/2024 11:36:00 CH ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [UK_PhoneEmployee] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_OderProduct]    Script Date: 08/12/2024 11:36:00 CH ******/
ALTER TABLE [dbo].[Order_item] ADD  CONSTRAINT [UK_OderProduct] UNIQUE NONCLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[Order_item] ADD  CONSTRAINT [DF_Oder_item_create_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Order_item] ADD  CONSTRAINT [DF_Oder_item_flag]  DEFAULT ((0)) FOR [flag]
GO
ALTER TABLE [dbo].[Order_product] ADD  CONSTRAINT [DF_Order_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[Order_product] ADD  CONSTRAINT [DF_Oder_create_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Order_product] ADD  CONSTRAINT [DF_Oder_flag]  DEFAULT ((0)) FOR [flag]
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
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_permission]  WITH CHECK ADD  CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id]
GO
ALTER TABLE [dbo].[Order_item]  WITH CHECK ADD  CONSTRAINT [FK_Oder_item_Oder] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order_product] ([id])
GO
ALTER TABLE [dbo].[Order_item] CHECK CONSTRAINT [FK_Oder_item_Oder]
GO
ALTER TABLE [dbo].[Order_item]  WITH CHECK ADD  CONSTRAINT [FK_Oder_item_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Order_item] CHECK CONSTRAINT [FK_Oder_item_Product]
GO
ALTER TABLE [dbo].[Order_product]  WITH CHECK ADD  CONSTRAINT [FK_Oder_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Order_product] CHECK CONSTRAINT [FK_Oder_Customer]
GO
ALTER TABLE [dbo].[Order_product]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Order_product] CHECK CONSTRAINT [FK_Order_Employee]
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
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_action_flag_a8637d59_check] CHECK  (([action_flag]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_a8637d59_check]
GO
/****** Object:  StoredProcedure [dbo].[getNextEmployeeSequence]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getNextEmployeeSequence]
AS
BEGIN
    SELECT NEXT VALUE FOR EmployeeSequence AS next_seq;
END;
GO
/****** Object:  StoredProcedure [dbo].[getNextOrderProductSequence]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getNextOrderProductSequence]
AS
BEGIN
    SELECT NEXT VALUE FOR OrderProductSequence AS next_seq;
END;
GO
/****** Object:  StoredProcedure [dbo].[getNextProductSequence]    Script Date: 08/12/2024 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getNextProductSequence]
AS
BEGIN
    SELECT NEXT VALUE FOR ProductSequence AS next_seq;
END;
GO
USE [master]
GO
ALTER DATABASE [Retail] SET  READ_WRITE 
GO
