USE [master]
GO
/****** Object:  Database [Retail]    Script Date: 11/11/2024 12:21:31 CH ******/
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
/****** Object:  Table [dbo].[auth_group]    Script Date: 11/11/2024 12:21:31 CH ******/
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
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[auth_permission]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[auth_user]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[auth_user_groups]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[auth_user_user_permissions]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[django_admin_log]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[django_content_type]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[django_migrations]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[django_session]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[Nutrient]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[Order_item]    Script Date: 11/11/2024 12:21:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_item](
	[id] [int] IDENTITY(1,1000) NOT NULL,
	[order_id] [nvarchar](10) NOT NULL,
	[product_id] [nvarchar](10) NOT NULL,
	[quantity] [smallint] NOT NULL,
	[total_cost] [money] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_Oder_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_product]    Script Date: 11/11/2024 12:21:32 CH ******/
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
	[address] [nvarchar](150) NOT NULL,
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
/****** Object:  Table [dbo].[Product]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[Product_nutrient]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[search_product]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Table [dbo].[Unit]    Script Date: 11/11/2024 12:21:32 CH ******/
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
SET IDENTITY_INSERT [dbo].[auth_permission] OFF
GO
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'CTCPNSND       ', N'Công Ty Cổ Phần Nông Sản Nam Đô', CAST(N'2024-10-22T18:14:06.670' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'CTCPVNSV       ', N'Công ty Cổ phần Vilaconic – Nông sản Vilaconic', CAST(N'2024-10-22T18:14:06.670' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'CTTNHHCBTMAV   ', N'Công Ty TNHH Chế Biến & Thương Mại A.V', CAST(N'2024-10-22T18:14:06.670' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'CTTNHHCCTCV    ', N'Công Ty TNHH Cung Cấp Trái Cây Việt', CAST(N'2024-10-22T18:14:06.670' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'NSABC          ', N'Nhà cung cấp nông sản ABC Việt Nam', CAST(N'2024-10-22T18:14:06.670' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'TCTLTMNV       ', N'Tổng Công ty Lương thực miền Nam – Vinafood II', CAST(N'2024-10-22T18:14:06.670' AS DateTime), 0)
INSERT [dbo].[Brand] ([id], [name], [created_at], [flag]) VALUES (N'VINMART', N'Cửa hàng VinMart ', CAST(N'2024-11-11T11:47:37.193' AS DateTime), 0)
GO
INSERT [dbo].[Category] ([id], [name], [flag], [created_at]) VALUES (N'NN', N'Nước ngoài', 0, CAST(N'2024-10-12T15:52:57.220' AS DateTime))
INSERT [dbo].[Category] ([id], [name], [flag], [created_at]) VALUES (N'TN', N'Trong nước', 0, CAST(N'2024-10-11T14:09:56.757' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([id], [last_name], [first_name], [phone], [email], [birthday], [gender], [address], [password], [created_at], [flag]) VALUES (3, N'Nguyễn Trần Quốc', N'Bằng', N'0443222111', N'test@gmail.com', CAST(N'2003-07-08' AS Date), 0, N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', N'$2a$10$RwaNDubTblNV8pe5n3kd8.z8KiSV4l2Fjrec.DoW91boBy3UvZi8S', CAST(N'2024-04-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Customer] ([id], [last_name], [first_name], [phone], [email], [birthday], [gender], [address], [password], [created_at], [flag]) VALUES (4, N'Nguyễn Quang ', N'Huy', N'0333222111', N't@gmail.com', CAST(N'2002-02-02' AS Date), 0, N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', N'$2a$10$RwaNDubTblNV8pe5n3kd8.z8KiSV4l2Fjrec.DoW91boBy3UvZi8S', CAST(N'2024-09-04T22:26:10.207' AS DateTime), 0)
INSERT [dbo].[Customer] ([id], [last_name], [first_name], [phone], [email], [birthday], [gender], [address], [password], [created_at], [flag]) VALUES (5, N'Nguyễn Thị Vân', N'Khánh', N'0343935903', N'ntvk137@gmail.com', CAST(N'2000-01-01' AS Date), 1, N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', N'$2a$10$RwaNDubTblNV8pe5n3kd8.z8KiSV4l2Fjrec.DoW91boBy3UvZi8S', CAST(N'2024-10-12T15:59:42.853' AS DateTime), 0)
INSERT [dbo].[Customer] ([id], [last_name], [first_name], [phone], [email], [birthday], [gender], [address], [password], [created_at], [flag]) VALUES (6, N'Nguyễn Thanh ', N'Tùng', N'0332928888', N'ntt@gmail.com', CAST(N'2000-01-01' AS Date), 0, N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', N'$2a$10$RwaNDubTblNV8pe5n3kd8.z8KiSV4l2Fjrec.DoW91boBy3UvZi8S', CAST(N'2024-10-12T16:00:21.177' AS DateTime), 0)
INSERT [dbo].[Customer] ([id], [last_name], [first_name], [phone], [email], [birthday], [gender], [address], [password], [created_at], [flag]) VALUES (7, N'Hoàng Linh', N'Điệp', N'0555566778', N'hld123@gmail.com', CAST(N'2000-01-01' AS Date), 1, N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', N'$2a$10$RwaNDubTblNV8pe5n3kd8.z8KiSV4l2Fjrec.DoW91boBy3UvZi8S', CAST(N'2024-10-20T16:42:28.870' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[django_content_type] ON 

INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (1, N'admin', N'logentry')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (3, N'auth', N'group')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (2, N'auth', N'permission')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (4, N'auth', N'user')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (5, N'contenttypes', N'contenttype')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (7, N'search', N'product')
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
INSERT [dbo].[Employee] ([id], [last_name], [first_name], [phone], [email], [gender], [birthday], [password], [created_at], [flag]) VALUES (N'NV001', N'Nguyễn Thị Vân Khánh', N'Khánh', N'0343935903', N'ntvk137@gmail.com                                                                                                                                                                                                                                                                                                               ', 1, CAST(N'2001-01-01' AS Date), N'$2a$10$RwaNDubTblNV8pe5n3kd8.z8KiSV4l2Fjrec.DoW91boBy3UvZi8S', CAST(N'2024-10-22T17:48:26.173' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Order_item] ON 

INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [total_cost], [created_at], [flag]) VALUES (1, N'HD00001', N'SP000001  ', 3, 150000.0000, CAST(N'2024-10-20T17:39:48.020' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [total_cost], [created_at], [flag]) VALUES (2001, N'HD00002', N'SP000002  ', 2, 28000.0000, CAST(N'2024-10-20T22:39:12.630' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [total_cost], [created_at], [flag]) VALUES (3001, N'HD00002', N'SP000003  ', 1, 28000.0000, CAST(N'2024-10-20T22:51:42.850' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [total_cost], [created_at], [flag]) VALUES (4001, N'HD00003', N'SP000001  ', 2, 100000.0000, CAST(N'2024-10-20T22:52:13.430' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [total_cost], [created_at], [flag]) VALUES (5001, N'HD00003', N'SP000004  ', 1, 32000.0000, CAST(N'2024-10-20T22:52:52.417' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [total_cost], [created_at], [flag]) VALUES (6001, N'HD00004', N'SP000002  ', 1, 14000.0000, CAST(N'2024-10-20T22:54:41.420' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [total_cost], [created_at], [flag]) VALUES (7001, N'HD00005', N'SP000005  ', 2, 70000.0000, CAST(N'2024-10-20T22:55:18.447' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [total_cost], [created_at], [flag]) VALUES (9001, N'HD00006', N'SP000006  ', 1, 55000.0000, CAST(N'2024-10-20T22:56:10.813' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [total_cost], [created_at], [flag]) VALUES (10001, N'HD00007', N'SP000007  ', 2, 86000.0000, CAST(N'2024-10-20T22:56:48.957' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [total_cost], [created_at], [flag]) VALUES (11001, N'HD00007', N'SP000005  ', 1, 35000.0000, CAST(N'2024-10-20T22:57:53.660' AS DateTime), 0)
INSERT [dbo].[Order_item] ([id], [order_id], [product_id], [quantity], [total_cost], [created_at], [flag]) VALUES (12001, N'HD00008', N'SP000007  ', 2, 86000.0000, CAST(N'2024-10-20T23:03:42.073' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Order_item] OFF
GO
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag]) VALUES (N'HD00001', 3, 150000.0000, N'HT', N'HT', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-11-06T09:10:29.180' AS DateTime), N'NV001', CAST(N'2024-10-20T17:21:57.680' AS DateTime), 0)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag]) VALUES (N'HD00002', 4, 56000.0000, N'HT', N'HT', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-11-06T09:10:41.520' AS DateTime), N'NV001', CAST(N'2024-10-20T22:03:25.153' AS DateTime), 0)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag]) VALUES (N'HD00003', 3, 132000.0000, N'HT', N'HT', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-11-06T09:10:45.473' AS DateTime), N'NV001', CAST(N'2024-10-20T22:03:56.180' AS DateTime), 0)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag]) VALUES (N'HD00004', 3, 14000.0000, N'HT', N'HT', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-10-20T22:04:39.120' AS DateTime), N'NV001', CAST(N'2024-10-20T22:04:39.120' AS DateTime), 0)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag]) VALUES (N'HD00005', 3, 70000.0000, N'HT', N'HT', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-10-20T22:05:04.767' AS DateTime), N'NV001', CAST(N'2024-10-20T22:05:04.767' AS DateTime), 0)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag]) VALUES (N'HD00006', 4, 55000.0000, N'HT', N'DG', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-11-06T09:02:42.967' AS DateTime), N'NV001', CAST(N'2024-10-20T22:35:54.907' AS DateTime), 0)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag]) VALUES (N'HD00007', 3, 121000.0000, N'CH', N'DG', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-10-20T22:38:26.187' AS DateTime), N'NV001', CAST(N'2024-10-20T22:38:26.187' AS DateTime), 0)
INSERT [dbo].[Order_product] ([id], [customer_id], [total_cost], [pay_status], [ship_status], [address], [last_update], [employee_id], [created_at], [flag]) VALUES (N'HD00008', 5, 86000.0000, N'HT', N'HT', N'97 Đ. Man Thiện, Hiệp Phú, Quận 9, Hồ Chí Minh', CAST(N'2024-10-20T23:02:52.193' AS DateTime), N'NV001', CAST(N'2024-10-20T23:02:52.193' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000001', N'Dâu Tây', N'', 30, 50000.0000, N'TN', N'1KG     ', N'NSABC          ', CAST(N'2024-10-22T19:02:27.963' AS DateTime), N'NV001', CAST(N'2024-10-11T14:11:06.290' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000002', N'Thơm', NULL, 53, 14000.0000, N'TN        ', N'1TRAI', N'TCTLTMNV       ', CAST(N'2024-10-20T22:59:41.610' AS DateTime), N'NV001', CAST(N'2024-10-12T15:51:18.363' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000003', N'Quýt', NULL, 100, 28000.0000, N'TN        ', N'1KG     ', N'CTCPNSND       ', CAST(N'2024-10-20T22:59:41.610' AS DateTime), N'NV001', CAST(N'2024-10-12T15:52:23.230' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000004', N'Mận Hà Nội', NULL, 23, 32000.0000, N'TN        ', N'1KG     ', N'CTCPVNSV       ', CAST(N'2024-10-20T22:59:41.610' AS DateTime), N'NV001', CAST(N'2024-10-12T15:57:28.153' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000005', N'Vải Bắc Giang', NULL, 32, 35000.0000, N'TN        ', N'1KG     ', N'CTCPVNSV       ', CAST(N'2024-10-20T22:59:41.610' AS DateTime), N'NV001', CAST(N'2024-10-12T15:58:07.547' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000006', N'Dâu Tây', NULL, 43, 55000.0000, N'TN        ', N'1KG     ', N'TCTLTMNV       ', CAST(N'2024-10-20T22:59:41.610' AS DateTime), N'NV001', CAST(N'2024-10-12T15:58:47.583' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000007', N'Măng cụt', NULL, 23, 43000.0000, N'TN        ', N'1KG     ', N'CTCPNSND       ', CAST(N'2024-10-20T22:59:41.610' AS DateTime), N'NV001', CAST(N'2024-10-15T00:13:19.850' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000008', N'Sầu riêng Malaysia', NULL, 10, 56000.0000, N'NN', N'1KG', N'TCTLTMNV       ', CAST(N'2024-10-20T22:59:41.610' AS DateTime), N'NV001', CAST(N'2024-10-20T22:58:35.583' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000009', N'Cam', NULL, 12, 36000.0000, N'TN', N'1KG', N'NSABC', CAST(N'2024-10-20T22:59:41.610' AS DateTime), N'NV001', CAST(N'2024-10-20T22:59:41.610' AS DateTime), 0)
INSERT [dbo].[Product] ([id], [name], [detail], [quantity], [price], [category_id], [unit_id], [brand_id], [last_update], [employee_id], [created_at], [flag]) VALUES (N'SP000010', N'Xoài cát chu', N'Xoài xanh ngọt với bề ngoài màu xanh mướt bên trong vàng ươm, thịt dày, mùi thơm ngon và vị ngọt bùi.
Phần thịt xoài khi chín màu cam đậm gần như không có xơ, mềm nhưng hơi dai, vị ngọt sâu và đậm hương thơm phù hợp sử dụng trực tiếp hoặc chế biến sinh tố hay làm bánh hoặc một số các món ăn khác.
Sản phẩm rất thích hợp để làm món quà biếu tặng, dâng cúng những dịp lễ tết hay trưng bày rất sang trọng cũng như là trái cây bổ dưỡng tẩm bổ cho người ốm, người già hay trẻ con.
Xoài được gọi là vua của tất cả các loại trái cây, không chỉ thơm ngon, ngọt, xoài giàu protein, chất xơ, vitamin C, A, axit folic..., mang lại nhiều lợi ích cho sức khỏe. Nhiều nghiên cứu đã chứng minh xoài có khả năng làm giảm nguy cơ béo phì, bệnh tim, tăng cường năng lượng, cải thiện trí nhớ...', 10, 59000.0000, N'TN', N'1KG     ', N'VINMART', CAST(N'2024-11-11T12:01:25.970' AS DateTime), N'NV001', CAST(N'2024-11-11T12:00:54.537' AS DateTime), 0)
GO
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'100G    ', N'100g', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'1KG     ', N'1kg', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'1TRAI', N'1 trái', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'200G    ', N'200g', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'2KG     ', N'2kg', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'2TRAI', N'2 trái', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'HOP     ', N'hộp', 0)
INSERT [dbo].[Unit] ([id], [name], [flag]) VALUES (N'THUNG   ', N'thùng', 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_group_name_a6ea08ec_uniq]    Script Date: 11/11/2024 12:21:32 CH ******/
ALTER TABLE [dbo].[auth_group] ADD  CONSTRAINT [auth_group_name_a6ea08ec_uniq] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_b120cbf9]    Script Date: 11/11/2024 12:21:32 CH ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_group_id_b120cbf9] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_permission_id_0cd325b0_uniq]    Script Date: 11/11/2024 12:21:32 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC,
	[permission_id] ASC
)
WHERE ([group_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_permission_id_84c5c92e]    Script Date: 11/11/2024 12:21:32 CH ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_permission_id_84c5c92e] ON [dbo].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_permission_content_type_id_2f476e4b]    Script Date: 11/11/2024 12:21:32 CH ******/
CREATE NONCLUSTERED INDEX [auth_permission_content_type_id_2f476e4b] ON [dbo].[auth_permission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_permission_content_type_id_codename_01ab375a_uniq]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Index [auth_user_username_6821ab7c_uniq]    Script Date: 11/11/2024 12:21:32 CH ******/
ALTER TABLE [dbo].[auth_user] ADD  CONSTRAINT [auth_user_username_6821ab7c_uniq] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_group_id_97559544]    Script Date: 11/11/2024 12:21:32 CH ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_group_id_97559544] ON [dbo].[auth_user_groups]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_6a12ed8b]    Script Date: 11/11/2024 12:21:32 CH ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_user_id_6a12ed8b] ON [dbo].[auth_user_groups]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_group_id_94350c0c_uniq]    Script Date: 11/11/2024 12:21:32 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_groups_user_id_group_id_94350c0c_uniq] ON [dbo].[auth_user_groups]
(
	[user_id] ASC,
	[group_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [group_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_permission_id_1fbb5f2c]    Script Date: 11/11/2024 12:21:32 CH ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_permission_id_1fbb5f2c] ON [dbo].[auth_user_user_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_a95ead1b]    Script Date: 11/11/2024 12:21:32 CH ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_a95ead1b] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq]    Script Date: 11/11/2024 12:21:32 CH ******/
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
/****** Object:  Index [UK_EmailCustomer]    Script Date: 11/11/2024 12:21:32 CH ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UK_EmailCustomer] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_PhoneCustomer]    Script Date: 11/11/2024 12:21:32 CH ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UK_PhoneCustomer] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_content_type_id_c4bce8eb]    Script Date: 11/11/2024 12:21:32 CH ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb] ON [dbo].[django_admin_log]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_user_id_c564eba6]    Script Date: 11/11/2024 12:21:32 CH ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6] ON [dbo].[django_admin_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [django_content_type_app_label_model_76bd3d3b_uniq]    Script Date: 11/11/2024 12:21:32 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [django_content_type_app_label_model_76bd3d3b_uniq] ON [dbo].[django_content_type]
(
	[app_label] ASC,
	[model] ASC
)
WHERE ([app_label] IS NOT NULL AND [model] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_session_expire_date_a5c62663]    Script Date: 11/11/2024 12:21:32 CH ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [dbo].[django_session]
(
	[expire_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_EmailEmployee]    Script Date: 11/11/2024 12:21:32 CH ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [UK_EmailEmployee] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_PhoneEmployee]    Script Date: 11/11/2024 12:21:32 CH ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [UK_PhoneEmployee] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_OderProduct]    Script Date: 11/11/2024 12:21:32 CH ******/
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
USE [master]
GO
ALTER DATABASE [Retail] SET  READ_WRITE 
GO
