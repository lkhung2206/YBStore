USE [master]
GO
/****** Object:  Database [bookstore]    Script Date: 10/17/2021 11:24:47 AM ******/
CREATE DATABASE [bookstore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bookstore', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\bookstore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bookstore_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\bookstore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bookstore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bookstore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bookstore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bookstore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bookstore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bookstore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bookstore] SET ARITHABORT OFF 
GO
ALTER DATABASE [bookstore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [bookstore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bookstore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bookstore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bookstore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bookstore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bookstore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bookstore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bookstore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bookstore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bookstore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bookstore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bookstore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bookstore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bookstore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bookstore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bookstore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bookstore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bookstore] SET  MULTI_USER 
GO
ALTER DATABASE [bookstore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bookstore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bookstore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bookstore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bookstore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bookstore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [bookstore] SET QUERY_STORE = OFF
GO
USE [bookstore]
GO
/****** Object:  Table [dbo].[About]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
	[Language] [varchar](2) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Tags] [nvarchar](500) NULL,
	[Language] [varchar](2) NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ContentID] [bigint] NOT NULL,
	[TagID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Content] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[ID] [varchar](2) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](10) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[IncludedVAT] [bit] NULL,
	[Quantity] [int] NOT NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Value] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SystemConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[GroupID] [varchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[ProvinceID] [int] NULL,
	[DistrictID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 10/17/2021 11:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (1, N'Tin thế giới', N'tin-the-gioi', NULL, 1, NULL, CAST(N'2015-08-15T07:49:20.183' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (2, N'Sách mới', N'sach-moi', 2, 2, NULL, CAST(N'2015-08-15T07:49:33.087' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (3, N'34234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'vi')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Content], [Status]) VALUES (1, N'<p>Công ty CP YBSTORE</p><p>Địa chỉ: TPHCM </p> <p>Điện thoại: 0384190358</p>', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Tags], [Language]) VALUES (1, N'Giày Real', N'giay-real', N'424', N'/Data/images/banoiduhoc.jpg', 1, N'<p>giày Real</p>
', 12, CAST(N'2021-04-12T15:35:34.627' AS DateTime), N'toanbn', NULL, NULL, N'313', N'13                                                                                                                                                                                                                                                        ', 1, NULL, 0, N'tin tức,thời sự', NULL)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Tags], [Language]) VALUES (2, N'Nike Air', N'nike-air', N'Sách mới Hackers Ielts: Reading', N'/Data/images/noi.jpg', 2, N'<p>Nike Air</p>
', 1, CAST(N'2021-04-12T16:53:26.327' AS DateTime), N'Linhnguyen', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Content] OFF
GO
INSERT [dbo].[ContentTag] ([ContentID], [TagID]) VALUES (1, N'thoi-su')
INSERT [dbo].[ContentTag] ([ContentID], [TagID]) VALUES (1, N'tin-tuc')
GO
INSERT [dbo].[Footer] ([ID], [Content], [Status]) VALUES (N'footer', N'<div class="wrap">	
	     <div class="section group">
				<div class="col_1_of_4 span_1_of_4">
						<h4>Thông tin</h4>
						<ul>
						<li><a href="about.html">Giới thiệu</a></li>
						<li><a href="contact.html">Phục vụ khách hàng</a></li>
						<li><a href="#">Tìm kiếm</a></li>
						<li><a href="delivery.html">Đặt & trả hàng</a></li>
						<li><a href="contact.html">Liên lạc</a></li>
						</ul>
					</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Tại sao phải mua</h4>
						<ul>
						<li><a href="about.html">Giới thiệu</a></li>
						<li><a href="contact.html">Dịch vụ</a></li>
						<li><a href="#">Bảo mật</a></li>
						<li><a href="contact.html">Map</a></li>
						<li><a href="#">Tìm kiếm</a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Cá nhân</h4>
						<ul>
							<li><a href="contact.html">Đăng nhập</a></li>
							<li><a href="index.html">Xem giỏ hàng</a></li>
							<li><a href="#">Yêu thích</a></li>
							<li><a href="#">Theo dõi hàng</a></li>
							<li><a href="contact.html">Giúp đỡ</a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Liên hệ</h4>
						<ul>
							<li><span>0384190358</span></li>
							<li><span>0384190358</span></li>
						</ul>
						<div class="social-icons">
							<h4>Theo dõi</h4>
					   		  <ul>
							      <li><a href="#" target="_blank"><img src="images/facebook.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="images/twitter.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="images/skype.png" alt="" /> </a></li>
							      <li><a href="#" target="_blank"> <img src="images/dribbble.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"> <img src="images/linkedin.png" alt="" /></a></li>
							      <div class="clear"></div>
						     </ul>
   	 					</div>
				</div>
			</div>			
        </div>
        <div class="copy_right">
				<p>Company Name © All rights Reseverd | Design by  Linh Nguyen </p>
		   </div>', 1)
GO
INSERT [dbo].[Language] ([ID], [Name], [IsDefault]) VALUES (N'en', N'Tiếng Anh', 0)
INSERT [dbo].[Language] ([ID], [Name], [IsDefault]) VALUES (N'vi', N'Tiếng Việt', 1)
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang chủ', N'/', 1, N'_blank', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Giới thiệu', N'/gioi-thieu', 2, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Tin tức', N'/tin-tuc', 3, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Sản phẩm', N'/san-pham', 4, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Liên hệ', N'/lien-he', 5, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'Đăng nhập', N'/dang-nhap', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'Đăng ký', N'/dang-ky', 2, N'_self', 1, 2)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu chính')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu top')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (20, CAST(N'2021-04-13T21:31:10.730' AS DateTime), NULL, N'Linhnguyen', N'0384190358', N'hcm', N'nguyenvulinh2802@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (21, CAST(N'2021-04-13T21:36:53.287' AS DateTime), NULL, N'Linhnguyen', N'0384190358', N'hcm', N'nguyenvulinh2802@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (22, CAST(N'2021-10-16T13:40:40.463' AS DateTime), NULL, N'Kathleen B. Padula', N'5028174206', N'5800 Cobbs Creek Parkway', N'KathleenBPadula@rhyta.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (23, CAST(N'2021-10-16T13:42:29.757' AS DateTime), NULL, N'Kathleen B. Padula', N'5028174206', N'5800 Cobbs Creek Parkway', N'KathleenBPadula@rhyta.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (24, CAST(N'2021-10-17T09:34:11.990' AS DateTime), NULL, N'Nguyễn Minh Đức Khôi', N'0938751116', N'25', N'khoimessi99@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (25, CAST(N'2021-10-17T09:39:52.363' AS DateTime), NULL, N'lkhung2206@gmail.coma', N'0938751116', N'25', N'khoitedu99@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (26, CAST(N'2021-10-17T10:29:41.960' AS DateTime), NULL, N'Nguyễn Minh Đức Khôi', N'0784457598', N'abc', N'khoitedu99@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (9, 22, 1, CAST(18000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (9, 23, 1, CAST(18000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10, 24, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (12, 22, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (12, 23, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (13, 20, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (13, 21, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (13, 26, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 21, 1, CAST(60000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 25, 1, CAST(60000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 26, 1, CAST(60000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (9, N'Conan - Thám tử lừng danh tập 96', N'A100', N'Conan--Tham-tu-lung-danh-tap-96', N'Tác giả: Gosho Aoyama', N'/Data/images/conan96.jpg', N'<Images />', CAST(18000 AS Decimal(18, 0)), CAST(16000 AS Decimal(18, 0)), 1, 1, 38, N'<p><span style="font-family:arial,helvetica,sans-serif">Kudo Shinichi l&agrave; một th&aacute;m tử sinh vi&ecirc;n trung học phổ th&ocirc;ng&nbsp;rất nổi tiếng, thường xuy&ecirc;n gi&uacute;p cảnh s&aacute;t ph&aacute; &aacute;n c&aacute;c vụ &aacute;n kh&oacute; khăn. Trong một lần khi đang theo d&otilde;i một vụ tống tiền, cậu đ&atilde; bị th&agrave;nh vi&ecirc;n của Tổ chức &Aacute;o đen ph&aacute;t hiện. Ch&uacute;ng đ&aacute;nh gục Shinichi, l&agrave;m cậu bất tỉnh v&agrave; &eacute;p cậu uống loại thuốc độc APTX 4869 m&agrave; Tổ chức vừa điều chế nhằm bịt đầu mối. Tuy vậy, thứ thuốc ấy kh&ocirc;ng giết chết cậu m&agrave; lại khiến cậu teo nhỏ th&agrave;nh một đứa trẻ.<span style="font-size:10.8333px"> </span>Sau đ&oacute;, cậu tự xưng l&agrave; Edogawa Conan v&agrave; được Mori Ran - bạn g&aacute;i của cậu khi c&ograve;n l&agrave; Kudo Shinichi - nhận nu&ocirc;i v&agrave; mang về văn ph&ograve;ng th&aacute;m tử của bố c&ocirc; l&agrave; Mori Kogoro. Xuy&ecirc;n suốt series, Conan đ&atilde; &acirc;m thầm hỗ trợ &ocirc;ng Mori ph&aacute; c&aacute;c vụ &aacute;n. Đồng thời cậu cũng phải nhập học Tiểu học, nhờ đ&oacute; m&agrave; kết th&acirc;n với nhiều người v&agrave; lập ra Đội th&aacute;m tử nh&iacute;.</span></p>
', NULL, CAST(N'2021-04-12T16:20:07.410' AS DateTime), N'Linhnguyen', NULL, NULL, N'Conan--Tham-tu-lung-danh-tap-96', N'Conan--Tham-tu-lung-danh-tap-96                                                                                                                                                                                                                           ', 1, CAST(N'2021-04-12T16:20:07.410' AS DateTime), 10)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (10, N'Hackers Ielts: Speaking', N'A101', N'Hackers-Ielts-Speaking', N'Tác giả: Alpha Books', N'/Data/images/noi.jpg', N'<Images />', CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)), 1, 20, 41, N'<p>IELTS l&agrave; c&aacute;nh cửa gi&uacute;p c&aacute;c bạn th&iacute; sinh hiện thực h&oacute;a ước mơ vươn ra thế giới. Ch&iacute;nh v&igrave; vậy, ngay từ b&acirc;y giờ, h&atilde;y nỗ lực luyện tập v&agrave; chuẩn bị cho b&agrave;i thi quan trọng n&agrave;y. Viện Ng&ocirc;n ngữ Hackers đ&atilde; bi&ecirc;n soạn bộ s&aacute;ch&nbsp;<strong>HACKERS IELTS</strong>&nbsp;gồm 4 cuốn tương đương với 4 kỹ năng nhằm giới thiệu tới c&aacute;c bạn phương ph&aacute;p luyện thi ph&ugrave; hợp nhất để c&oacute; thể đạt điểm cao trong b&agrave;i thi n&agrave;y.</p>

<p>Luyện từng dạng b&agrave;i một c&aacute;ch c&oacute; hệ thống!</p>

<p>Bộ s&aacute;ch được thiết kế nhằm gi&uacute;p người học n&acirc;ng cao kỹ năng đọc hiểu th&ocirc;ng qua qu&aacute; tr&igrave;nh luyện tập từng dạng b&agrave;i một c&aacute;ch c&oacute; hệ thống. Ngo&agrave;i ra, đối với từng dạng b&agrave;i, bạn c&ograve;n được cung cấp những chiến lược l&agrave;m b&agrave;i cụ thể.</p>
', NULL, CAST(N'2021-04-12T16:33:37.540' AS DateTime), N'Linhnguyen', NULL, NULL, N'Hackers-Ielts-Speaking', N'Hackers-Ielts-Speaking                                                                                                                                                                                                                                    ', 1, CAST(N'2021-04-12T16:33:37.540' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (11, N'Hackers Ielts: Writing', N'A102', N'Hackers-Ielts-Writing', N'Tác giả: Alpha Books', N'/Data/images/viet.jpg', N'<Images />', CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)), 1, 20, 41, N'<p>IELTS l&agrave; c&aacute;nh cửa gi&uacute;p c&aacute;c bạn th&iacute; sinh hiện thực h&oacute;a ước mơ vươn ra thế giới. Ch&iacute;nh v&igrave; vậy, ngay từ b&acirc;y giờ, h&atilde;y nỗ lực luyện tập v&agrave; chuẩn bị cho b&agrave;i thi quan trọng n&agrave;y. Viện Ng&ocirc;n ngữ Hackers đ&atilde; bi&ecirc;n soạn bộ s&aacute;ch&nbsp;<strong>HACKERS IELTS</strong>&nbsp;gồm 4 cuốn tương đương với 4 kỹ năng nhằm giới thiệu tới c&aacute;c bạn phương ph&aacute;p luyện thi ph&ugrave; hợp nhất để c&oacute; thể đạt điểm cao trong b&agrave;i thi n&agrave;y.</p>

<p>Luyện từng dạng b&agrave;i một c&aacute;ch c&oacute; hệ thống!</p>

<p>Bộ s&aacute;ch được thiết kế nhằm gi&uacute;p người học n&acirc;ng cao kỹ năng đọc hiểu th&ocirc;ng qua qu&aacute; tr&igrave;nh luyện tập từng dạng b&agrave;i một c&aacute;ch c&oacute; hệ thống. Ngo&agrave;i ra, đối với từng dạng b&agrave;i, bạn c&ograve;n được cung cấp những chiến lược l&agrave;m b&agrave;i cụ thể.</p>
', NULL, CAST(N'2021-04-12T16:35:57.130' AS DateTime), N'Linhnguyen', NULL, NULL, N'Hackers-Ielts-Writing', N'Hackers-Ielts-Writing                                                                                                                                                                                                                                     ', 1, CAST(N'2021-04-12T16:35:57.130' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (12, N'Hackers Ielts: Reading', N'A103', N'Hackers-Ielts-Reading', N'Tác giả: Alpha Books', N'/Data/images/doc.jpg', N'<Images />', CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)), 1, 20, 41, N'<p>Hackers Ielts: Reading</p>

<p>Bộ s&aacute;ch luyện thi IELTS đầu ti&ecirc;n c&oacute; k&egrave;m giải th&iacute;ch đ&aacute;p &aacute;n chi tiết v&agrave; hướng dẫn c&aacute;ch tự n&acirc;ng band điểm.</p>

<p>IELTS l&agrave; c&aacute;nh cửa gi&uacute;p c&aacute;c bạn th&iacute; sinh hiện thực h&oacute;a ước mơ vươn ra thế giới. Ch&iacute;nh v&igrave; vậy, ngay từ b&acirc;y giờ, h&atilde;y nỗ lực luyện tập v&agrave; chuẩn bị cho b&agrave;i thi quan trọng n&agrave;y. Viện Ng&ocirc;n ngữ Hackers đ&atilde; bi&ecirc;n soạn bộ s&aacute;ch&nbsp;<strong>HACKERS IELTS</strong>&nbsp;gồm 4 cuốn tương đương với 4 kỹ năng nhằm giới thiệu tới c&aacute;c bạn phương ph&aacute;p luyện thi ph&ugrave; hợp nhất để c&oacute; thể đạt điểm cao trong b&agrave;i thi n&agrave;y.</p>

<p>Luyện từng dạng b&agrave;i một c&aacute;ch c&oacute; hệ thống!</p>

<p>Bộ s&aacute;ch được thiết kế nhằm gi&uacute;p người học n&acirc;ng cao kỹ năng đọc hiểu th&ocirc;ng qua qu&aacute; tr&igrave;nh luyện tập từng dạng b&agrave;i một c&aacute;ch c&oacute; hệ thống.</p>
', NULL, CAST(N'2021-04-12T16:38:27.690' AS DateTime), N'Linhnguyen', NULL, NULL, N'Hackers-Ielts-Reading', N'Hackers-Ielts-Reading                                                                                                                                                                                                                                     ', 1, CAST(N'2021-04-12T16:38:27.690' AS DateTime), 10)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (13, N'Tuổi trẻ đáng giá bao nhiêu?', N'A104', N'Tuoi-tre-dang-gia-bao-nhieu', N'Tác giả: Nhã Nam', N'/Data/images/Tuoitre.jpg', N'<Images />', CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)), 1, 20, 27, N'<p><em>&ldquo;Bạn hối tiếc v&igrave; kh&ocirc;ng nắm bắt lấy một cơ hội n&agrave;o đ&oacute;, chẳng c&oacute; ai phải mất ngủ.</em></p>

<p><em>Bạn trải qua những ng&agrave;y th&aacute;ng nhạt nhẽo với c&ocirc;ng việc bạn căm gh&eacute;t, người ta chẳng hề bận l&ograve;ng.</em></p>

<p><em>Bạn c&oacute; chết m&ograve;n nơi x&oacute; tường với những ước mơ dang dở, đ&oacute; kh&ocirc;ng phải l&agrave; việc của họ.</em></p>

<p><em>Suy cho c&ugrave;ng, quyết định l&agrave; ở bạn. Muốn c&oacute; điều g&igrave; hay kh&ocirc;ng l&agrave; t&ugrave;y bạn.</em></p>

<p><em>N&ecirc;n h&atilde;y l&agrave;m những điều bạn th&iacute;ch. H&atilde;y đi theo tiếng n&oacute;i tr&aacute;i tim. H&atilde;y sống theo c&aacute;ch bạn cho l&agrave; m&igrave;nh n&ecirc;n sống.</em></p>

<p><em>V&igrave; sau tất cả, chẳng ai quan t&acirc;m.&rdquo;</em></p>

<p>&ldquo;T&ocirc;i đ&atilde; đọc quyển s&aacute;ch n&agrave;y một c&aacute;ch th&iacute;ch th&uacute;. C&oacute; nhiều kiến thức v&agrave; kinh nghiệm hữu &iacute;ch, những điều mới mẻ ngay cả với người gần trung ni&ecirc;n như t&ocirc;i.</p>

<p><em>Tuổi trẻ đ&aacute;ng gi&aacute; bao nhi&ecirc;u?</em>&nbsp;được t&aacute;c giả chia l&agrave;m 3 phần: HỌC, L&Agrave;M, ĐI.</p>

<p>Nhưng t&ocirc;i thấy cuốn s&aacute;ch c&ograve;n thể hiện một phần thứ tư nữa, đ&oacute; l&agrave; ĐỌC.</p>

<p>H&atilde;y đọc s&aacute;ch, nếu bạn đọc s&aacute;ch một c&aacute;ch bền bỉ, sẽ đến l&uacute;c bạn bị th&ocirc;i th&uacute;c kh&ocirc;ng ngừng bởi &yacute; muốn viết n&ecirc;n cuốn s&aacute;ch của ri&ecirc;ng m&igrave;nh.</p>

<p>Nếu t&ocirc;i c&ograve;n ở tuổi đ&ocirc;i mươi, hẳn l&agrave; t&ocirc;i sẽ đọc&nbsp;<em>Tuổi trẻ đ&aacute;ng gi&aacute; bao nhi&ecirc;u?</em>&nbsp;nhiều hơn một lần.&rdquo;</p>

<p>- Đặng Nguyễn Đ&ocirc;ng Vy,<em>&nbsp;t&aacute;c giả, nh&agrave; b&aacute;o.</em></p>
', NULL, CAST(N'2021-04-12T16:41:27.387' AS DateTime), N'Linhnguyen', NULL, NULL, N'Tuoi-tre-dang-gia-bao-nhieu', N'Tuoi-tre-dang-gia-bao-nhieu                                                                                                                                                                                                                               ', 1, CAST(N'2021-04-12T16:41:27.387' AS DateTime), 8)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (14, N'Thương người năm ấy', N'A105', N'Thuong-nguoi-nam-ay', N'Tác giả: Skybooks', N'/Data/images/bia_thuong-nguoi-nam-ay-doi-xa-nam-nay-1_2.jpg', N'<Images />', CAST(60000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), 1, 20, 18, N'<p><strong>Thương Người Năm Ấy Rời Xa Năm N&agrave;y</strong></p>

<p><em>&ldquo;Niềm vui th&igrave; kh&ocirc;ng phải l&uacute;c n&agrave;o cũng cần được chia sẻ, nhưng nỗi buồn, th&igrave; vĩnh viễn n&ecirc;n được giải tỏa c&ugrave;ng nhau.</em></p>

<p><em>Đ&aacute;ng thương nhất của mỗi người, ch&iacute;nh l&agrave; mất đi khả năng bộc lộ cảm x&uacute;c.</em></p>

<p><em>Đ&aacute;ng giận nhất của mỗi người, ch&iacute;nh l&agrave; cứ th&iacute;ch tỏ ra m&igrave;nh vẫn ổn, d&ugrave; ngực tr&aacute;i đang đau nhức từng cơn.&rdquo;</em></p>

<p>&ldquo;Ch&uacute;ng t&ocirc;i viết cho nỗi buồn của người trẻ&rdquo; - Nh&oacute;m t&aacute;c giả Hall Of Dreamers bằng những g&igrave; ch&acirc;n thật nhất sẽ đưa&nbsp;<strong>&quot;Thương người năm ấy rời xa năm n&agrave;y&quot;</strong>&nbsp;khẽ chạm v&agrave;o t&ograve;a th&agrave;nh k&yacute; ức ch&ocirc;n s&acirc;u trong l&ograve;ng mỗi người để rồi nhận ra những gi&aacute; trị của &quot;x&uacute;c cảm&quot; v&agrave; &quot;biến cố&quot;.</p>

<p>&quot;<strong>Thương người năm ấy rời xa năm n&agrave;y&rdquo;</strong>&nbsp;giống như một trạm dừng ch&acirc;n nơi nh&agrave; ga tuổi trẻ. Nơi để bạn c&ugrave;ng trải l&ograve;ng với những nỗi buồn thật đẹp v&agrave; ho&agrave;i niệm của thanh xu&acirc;n. Nơi m&agrave; bạn c&oacute; thể thoải m&aacute;i h&ograve;a m&igrave;nh c&ugrave;ng những lần trật nhịp y&ecirc;u đầy tự do v&agrave; đ&ocirc;i l&uacute;c l&agrave; dũng kh&iacute; để ngắm nh&igrave;n những kỷ niệm đ&atilde; h&eacute;o &uacute;a với người nhưng c&ograve;n sắc lẹm với ta ngay cả trong hiện tại.</p>

<p><em>&quot;Ch&uacute;ng ta cần biến cố để trưởng th&agrave;nh. Để th&ocirc;i tin tưởng v&agrave; tiếp tục những m&ugrave; qu&aacute;ng thời thanh xu&acirc;n. Chấp nhận một điều g&igrave; đ&oacute; đủ an b&igrave;nh cho tương lai tới&quot;.</em></p>

<p>Nếu bạn c&ograve;n ủ rũ v&igrave; những dang dở, v&igrave; những tan vỡ kh&ocirc;ng th&agrave;nh tiếng, v&igrave; những mơ hồ kh&ocirc;ng r&otilde; quanh m&igrave;nh. Th&aacute;ng tư n&agrave;y h&atilde;y để&nbsp;<strong>&ldquo;Thương người năm ấy rời xa năm n&agrave;y&rdquo;</strong>&nbsp;ru bạn v&agrave;o một nỗi mơ an y&ecirc;n dịu d&agrave;ng, đưa bạn về với nỗi niềm ng&agrave;y cũ nhưng kh&ocirc;ng phải để buồn hay đắm ch&igrave;m trong qu&aacute; khứ m&agrave; để bạn đối diện với n&oacute; v&agrave; mỉm cười, nhẹ nh&otilde;m tiếp tục đi tiếp con đường m&agrave; m&igrave;nh đang hướng tới với ngập tr&agrave;n hy vọng v&agrave; an l&agrave;nh.</p>

<p>Mong bạn hiểu rằng, d&ugrave; c&oacute; đớn đau hay c&ocirc; độc, năm th&aacute;ng đ&atilde; qua đều l&agrave; một m&oacute;n qu&agrave;.</p>

<p>Chỉ cần ch&uacute;ng ta bước ch&acirc;n ra khỏi &ocirc; cửa ấy, mọi thứ đ&atilde; phải ở lại với thời gian.</p>
', NULL, CAST(N'2021-04-12T16:44:04.617' AS DateTime), N'Linhnguyen', NULL, NULL, N'Thuong-nguoi-nam-ay', N'Thuong-nguoi-nam-ay                                                                                                                                                                                                                                       ', 1, CAST(N'2021-04-12T16:44:04.617' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (13, N'NIKE', N'nike', NULL, NULL, NULL, CAST(N'2021-04-12T15:41:47.750' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'van-hoc', N'van-hoc                                                                                                                                                                                                                                                   ', 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (14, N'JORDAN', N'jordan', 13, NULL, NULL, CAST(N'2021-04-12T15:42:34.550' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'tieu-thuyet', N'tieu-thuyet                                                                                                                                                                                                                                               ', 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (15, N'AIR', N'air', 13, NULL, NULL, CAST(N'2021-04-12T15:43:03.970' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'ngon-tinh', N'ngon-tinh                                                                                                                                                                                                                                                 ', 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (16, N'DURANT', N'durant', 13, NULL, NULL, CAST(N'2021-04-12T15:43:25.660' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'tho-ca', N'tho-ca                                                                                                                                                                                                                                                    ', 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (17, N'KOBE', N'kobe', 13, NULL, NULL, CAST(N'2021-04-12T15:43:57.390' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'tac-pham-kinh-dien', N'tac-pham-kinh-dien                                                                                                                                                                                                                                        ', 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (18, N'LEBRON', N'lebron', 13, NULL, NULL, CAST(N'2021-04-12T15:44:21.453' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'truyen-ngan', N'truyen-ngan                                                                                                                                                                                                                                               ', 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (19, N'ADIDAS', N'adidas', NULL, NULL, NULL, CAST(N'2021-04-12T15:45:03.560' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'kinh-te', N'kinh-te                                                                                                                                                                                                                                                   ', 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (22, N'DROSE', N'drose', 19, NULL, NULL, CAST(N'2021-04-12T15:46:29.120' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'tai-chinh', N'tai-chinh                                                                                                                                                                                                                                                 ', 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (34, N'GIÀY THIẾU NHI', N'giay-thieu-nhi', NULL, NULL, NULL, CAST(N'2021-04-12T15:53:35.077' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'sach-thieu-nhi', N'sach-thieu-nhi                                                                                                                                                                                                                                            ', 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (38, N'Bitis', N'bitis', 34, NULL, NULL, CAST(N'2021-04-12T15:55:04.923' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'truyen-tranh', N'truyen-tranh                                                                                                                                                                                                                                              ', 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (52, N'GIÀY NHẬP', N'giay-nhap', NULL, NULL, NULL, CAST(N'2021-04-12T16:06:57.837' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'sach-nuoc-ngoai', N'sach-nuoc-ngoai                                                                                                                                                                                                                                           ', 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (53, N'GIÀY LƯU NIỆM', N'giay-luu-niem', NULL, NULL, NULL, CAST(N'2021-04-12T16:08:32.830' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'bach-hoa-luu-niem', N'bach-hoa-luu-niem                                                                                                                                                                                                                                         ', 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (54, N'GIÀY VĂN PHÒNG', N'giay-van-phong', NULL, NULL, NULL, CAST(N'2021-04-12T16:08:50.757' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'van-phong-pham', N'van-phong-pham                                                                                                                                                                                                                                            ', 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (56, N'GIÀY CỔ', N'giay-co', NULL, NULL, NULL, CAST(N'2021-04-12T16:11:06.080' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'tieu-su-hoi-ky', N'tieu-su-hoi-ky                                                                                                                                                                                                                                            ', 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (57, N'Giày khác', N'giay-khac', NULL, NULL, NULL, CAST(N'2021-04-12T16:11:19.587' AS DateTime), N'Linhnguyen', NULL, N'Linhnguyen', N'the-loại-khac', N'the-loại-khac                                                                                                                                                                                                                                             ', 1, NULL)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_CONTENT', N'Thêm tin tức')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_USER', N'Thêm user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_USER', N'Xoá user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_CONTENT', N'Sửa tin tức')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_USER', N'Sửa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_USER', N'Xem danh sách user')
GO
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'/Data/images/bia-1_cauchuyenlykytucaubegiaobao.jpg', 1, N'/', NULL, CAST(N'2021-04-12T16:11:58.720' AS DateTime), NULL, CAST(N'2021-04-12T16:11:58.720' AS DateTime), NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'/Data/images/banoiduhoc.jpg', 2, N'/', NULL, CAST(N'2021-04-12T15:31:01.517' AS DateTime), NULL, CAST(N'2021-04-12T15:31:01.517' AS DateTime), NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'/Data/images/muuluockinhdoanh.jpg', 3, N'/', N' ', CAST(N'2021-04-12T16:24:47.147' AS DateTime), N'Linhnguyen', CAST(N'2021-04-12T16:24:47.147' AS DateTime), N'Linhnguyen', 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
GO
INSERT [dbo].[Tag] ([ID], [Name]) VALUES (N'thoi-su', N'thời sự')
INSERT [dbo].[Tag] ([ID], [Name]) VALUES (N'tin-tuc', N'tin tức')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (22, N'Linhnguyen', N'e10adc3949ba59abbe56e057f20f883e', N'MOD', N'Linh', N'HCM', N'nguyenvulinh2802@gmail.com', N'0384190358', NULL, NULL, CAST(N'2021-04-12T12:35:03.010' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (23, N'diem99spk@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'MEMBER', N'Kathleen B. Padula', N'5800 Cobbs Creek Parkway', N'KathleenBPadula@rhyta.com', N'5028174206', 701, 70129, CAST(N'2021-10-16T13:40:14.007' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (24, N'lkhung2206@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'MEMBER', N'Kevin M. Legg', N'203 An Dương Vương', N'khoimessi99@gmail.com', N'025165198', 701, 70117, CAST(N'2021-10-17T09:02:21.863' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MOD', N'Moderatior')
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Language] ADD  CONSTRAINT [DF_Language_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER') FOR [GroupID]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
USE [master]
GO
ALTER DATABASE [bookstore] SET  READ_WRITE 
GO
