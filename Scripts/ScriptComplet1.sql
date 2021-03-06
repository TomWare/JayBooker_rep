USE [master]
GO
/****** Object:  Database [CroisiereEscoumins2020]    Script Date: 2020-01-30 08:43:56 ******/
CREATE DATABASE [CroisiereEscoumins2020]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CroisiereEscoumins2020', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CroisiereEscoumins2020.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CroisiereEscoumins2020_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CroisiereEscoumins2020_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CroisiereEscoumins2020] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CroisiereEscoumins2020].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CroisiereEscoumins2020] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET ARITHABORT OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET RECOVERY FULL 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET  MULTI_USER 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CroisiereEscoumins2020] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CroisiereEscoumins2020] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CroisiereEscoumins2020', N'ON'
GO
USE [CroisiereEscoumins2020]
GO
/****** Object:  Table [dbo].[AccomodationRates]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccomodationRates](
	[AccomodationRateID] [int] IDENTITY(1,1) NOT NULL,
	[AccomodationRateName] [varchar](20) NOT NULL,
	[AccomodationSingle] [decimal](18, 0) NOT NULL,
	[AccomodationDouble] [decimal](18, 0) NOT NULL,
	[AccomodationTriple] [decimal](18, 0) NOT NULL,
	[AccomodationQuad] [decimal](18, 0) NOT NULL,
	[AccomodationRateStartDate] [date] NOT NULL,
	[AccomodationRateEndDate] [date] NOT NULL,
	[AccomodationRateIsActive] [bit] NOT NULL,
 CONSTRAINT [PK_AccomodationRates] PRIMARY KEY CLUSTERED 
(
	[AccomodationRateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Accomodations]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accomodations](
	[AccomodationID] [int] IDENTITY(1,1) NOT NULL,
	[FK_AccomodationTypeID] [int] NOT NULL,
	[AccomodationName] [varchar](20) NOT NULL,
	[AccomodationDescription] [text] NULL,
	[AccomodationMaxOccupancy] [tinyint] NOT NULL,
	[AccomodationIsPublic] [bit] NOT NULL,
	[AccomodationPriority] [tinyint] NOT NULL,
	[AccomodationExtraCharge] [decimal](18, 0) NOT NULL,
	[AccomodationIsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Accomodations] PRIMARY KEY CLUSTERED 
(
	[AccomodationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccomodationTypes]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccomodationTypes](
	[AccomodationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[AccomodationTypeName] [varchar](30) NOT NULL,
	[AccomodationTypeDescription] [text] NULL,
	[AccomodationTypeIsActive] [bit] NOT NULL,
 CONSTRAINT [PK_AccomodationTypes] PRIMARY KEY CLUSTERED 
(
	[AccomodationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingHistory]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingHistory](
	[BookingHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[FK_UserID] [int] NOT NULL,
	[FK_BookingID] [int] NOT NULL,
	[BookingHistoryCreatedOn] [datetime] NOT NULL,
	[BookingHistoryAction] [varchar](12) NOT NULL,
 CONSTRAINT [PK_BookingHistory] PRIMARY KEY CLUSTERED 
(
	[BookingHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[FK_UserID] [int] NOT NULL,
	[FK_GuestID] [int] NOT NULL,
	[FK_DepartureID] [int] NULL,
	[FK_AccomodationID] [int] NULL,
	[BookingDate] [date] NOT NULL,
	[BookingCreatedOn] [datetime] NOT NULL,
	[BookingVoucher] [varchar](20) NULL,
	[BookingStatus] [varchar](20) NOT NULL,
	[BookingAdultsCount] [smallint] NOT NULL,
	[BookingFreeAdultsCount] [smallint] NOT NULL,
	[BookingChildrenCount] [smallint] NOT NULL,
	[BookingFreeChildrenCount] [smallint] NOT NULL,
	[BookingStudentsCount] [smallint] NOT NULL,
	[BookingModified] [bit] NOT NULL,
	[BookingIsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departures]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departures](
	[DepartureID] [int] IDENTITY(1,1) NOT NULL,
	[FK_SeasonID] [int] NULL,
	[FK_ShipID] [int] NULL,
	[DepartureHour] [varchar](5) NOT NULL DEFAULT ('09:00'),
	[DepartureDate] [date] NOT NULL,
	[DepartureMaxPassengers] [smallint] NOT NULL DEFAULT ((0)),
	[DepartureMaxAdults] [smallint] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Departures] PRIMARY KEY CLUSTERED 
(
	[DepartureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Emails]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Emails](
	[EmailID] [int] IDENTITY(1,1) NOT NULL,
	[FK_UserID] [int] NOT NULL,
	[FK_GuestID] [int] NULL,
	[FK_BookingID] [int] NULL,
	[FK_EmailTemplateID] [int] NOT NULL,
	[EmailText] [text] NULL,
	[EmailSubject] [varchar](78) NULL,
	[EmailSent] [bit] NOT NULL,
	[EmailSentOn] [datetime] NULL,
	[EmailTo] [text] NULL,
	[EmailFrom] [varchar](320) NULL,
 CONSTRAINT [PK_Emails] PRIMARY KEY CLUSTERED 
(
	[EmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmailTemplates]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmailTemplates](
	[EmailTemplateID] [int] IDENTITY(1,1) NOT NULL,
	[EmailTemplateName] [varchar](40) NOT NULL,
	[EmailTemplateText] [text] NULL,
	[EmailTemplateSubject] [varchar](78) NULL,
	[EmailTemplateLanguage] [varchar](3) NOT NULL,
	[EmailTemplateIsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EmailTemplates] PRIMARY KEY CLUSTERED 
(
	[EmailTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Guests]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Guests](
	[GuestID] [int] IDENTITY(1,1) NOT NULL,
	[FK_SupplierID] [int] NOT NULL,
	[GuestFirstName] [varchar](50) NOT NULL,
	[GuestLastName] [varchar](50) NOT NULL,
	[GuestPhone] [varchar](12) NULL,
	[GuestEmail] [varchar](320) NULL,
	[GuestAddress] [varchar](50) NULL,
	[GuestCity] [varchar](50) NULL,
	[GuestCountry] [varchar](20) NULL,
	[GuestPostalCode] [varchar](7) NULL,
	[GuestDescription] [text] NULL,
	[GuestUserName] [varchar](20) NULL,
	[GuestPasswordHash] [varchar](32) NULL,
	[GuestCreditCardHash] [varchar](32) NULL,
	[GuestCCExpiry] [varchar](5) NULL,
	[GuestCVVHash] [varchar](32) NULL,
	[GuestLanguage] [varchar](3) NOT NULL,
	[GuestOptIn] [bit] NOT NULL,
	[GuestCreatedOn] [datetime] NOT NULL,
	[GuestIsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Guests] PRIMARY KEY CLUSTERED 
(
	[GuestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoicedBookings]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoicedBookings](
	[FK_InvoiceID] [int] NOT NULL,
	[FK_BookingID] [int] NOT NULL,
	[InvoicedAdultPrice] [money] NULL,
	[InvoicedFreeAdultPrice] [money] NULL,
	[InvoicedChildrenPrice] [money] NULL,
	[InvoicedFreeChildrenPrice] [money] NULL,
	[InvoicedStudentPrice] [money] NULL,
	[InvoicedAccomodationPrice] [money] NULL,
 CONSTRAINT [PK_InvoicedBookings] PRIMARY KEY CLUSTERED 
(
	[FK_InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoicedProducts]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoicedProducts](
	[FK_InvoiceID] [int] NOT NULL,
	[FK_ProductID] [int] NOT NULL,
	[InvoicedQuantity] [money] NULL,
 CONSTRAINT [PK_InvoicedProducts] PRIMARY KEY CLUSTERED 
(
	[FK_InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[FK_UserID] [int] NOT NULL,
	[FK_GuestID] [int] NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[InvoiceStatus] [varchar](20) NOT NULL,
	[InvoiceDiscount] [decimal](18, 0) NOT NULL,
	[InvoiceDiscountReason] [varchar](140) NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Logbook]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Logbook](
	[FK_UserID] [int] NOT NULL,
	[FK_DepartureID] [int] NOT NULL,
	[LogBoatName] [varchar](20) NOT NULL,
	[LogAdultCount] [smallint] NOT NULL,
	[LogChildrenCount] [smallint] NOT NULL,
	[Weather] [varchar](10) NOT NULL,
	[Wind] [varchar](10) NOT NULL,
	[Waves] [varchar](10) NOT NULL,
	[Whale] [bit] NOT NULL,
	[Observations] [text] NOT NULL,
 CONSTRAINT [PK_Logbook] PRIMARY KEY CLUSTERED 
(
	[FK_UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Logbook] UNIQUE NONCLUSTERED 
(
	[FK_DepartureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[FK_InvoiceID] [int] NOT NULL,
	[PaymentMethod] [varchar](12) NOT NULL,
	[PaymentTransactionNumber] [varchar](32) NULL,
	[PaymentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](24) NOT NULL,
	[Productrice] [decimal](18, 0) NOT NULL,
	[ProductIsPublic] [bit] NOT NULL,
	[ProductPriority] [tinyint] NOT NULL,
	[ProductDescription] [text] NULL,
	[ProductIsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Seasons]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seasons](
	[SeasonID] [int] IDENTITY(1,1) NOT NULL,
	[SeasonName] [varchar](20) NOT NULL,
	[SeasonStartDate] [date] NOT NULL DEFAULT (getdate()),
	[SeasonEndDate] [date] NOT NULL DEFAULT (getdate()+(1)),
	[SeasonIsActive] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_Seasons] PRIMARY KEY CLUSTERED 
(
	[SeasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShipDesigns]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShipDesigns](
	[ShipDesignID] [int] IDENTITY(1,1) NOT NULL,
	[ShipDesignName] [varchar](20) NOT NULL,
	[ShipDesignDescription] [text] NULL,
	[ShipDesignIsActive] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_ShipDesigns] PRIMARY KEY CLUSTERED 
(
	[ShipDesignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShipRates]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShipRates](
	[ShipRateID] [int] IDENTITY(1,1) NOT NULL,
	[ShipRateName] [varchar](20) NOT NULL,
	[ShipRateAdult] [decimal](18, 0) NOT NULL,
	[ShipRateFreeAdult] [decimal](18, 0) NOT NULL,
	[ShipRateChildren] [decimal](18, 0) NOT NULL,
	[ShipRateFreeChildren] [decimal](18, 0) NOT NULL,
	[ShipRateStudent] [decimal](18, 0) NOT NULL,
	[ShipRateStartDate] [date] NOT NULL,
	[ShipRateEndDate] [date] NOT NULL,
	[ShipRateIsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ShipRates] PRIMARY KEY CLUSTERED 
(
	[ShipRateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ships]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ships](
	[ShipID] [int] IDENTITY(1,1) NOT NULL,
	[FK_ShipDesignID] [int] NOT NULL,
	[ShipName] [varchar](20) NOT NULL,
	[ShipDescription] [text] NULL,
	[ShipMaxPassengers] [tinyint] NOT NULL DEFAULT ((36)),
	[ShipIsPublic] [bit] NOT NULL DEFAULT ((0)),
	[ShipPriority] [tinyint] NOT NULL DEFAULT ((0)),
	[ShipIsActive] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_Ships] PRIMARY KEY CLUSTERED 
(
	[ShipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SupplierRates]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SupplierRates](
	[FK_SupplierID] [int] NOT NULL,
	[FK_ShipRateID] [int] NOT NULL,
	[FK_AccomodationRateID] [int] NOT NULL,
	[SupplierRateName] [varchar](30) NOT NULL,
	[SuplierRateIsActive] [bit] NOT NULL,
 CONSTRAINT [PK_SupplierRates] PRIMARY KEY CLUSTERED 
(
	[FK_SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[SupplierContactFirstName] [varchar](50) NULL,
	[SupplierContactLastName] [varchar](50) NULL,
	[SupplierContactPhone] [varchar](12) NULL,
	[SupplierSecondaryPhone] [varchar](12) NULL,
	[SupplierExtension] [varchar](6) NULL,
	[SupplierEmail] [varchar](320) NULL,
	[SupplierAddress] [varchar](50) NULL,
	[SupplierCity] [varchar](50) NULL,
	[SupplierCountry] [varchar](20) NULL,
	[SupplierPostalCode] [varchar](7) NULL,
	[SupplierDescription] [text] NULL,
	[SupplierIsActive] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2020-01-30 08:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NULL,
	[UserPasswordHash] [varchar](32) NULL,
	[UserEmail] [varchar](320) NULL,
	[UserFirstName] [varchar](50) NULL,
	[UserLastName] [varchar](50) NULL,
	[UserAddress] [varchar](50) NULL,
	[UserCity] [varchar](50) NULL,
	[UserCountry] [varchar](20) NULL,
	[UserPostalCode] [varchar](7) NULL,
	[UserPhone] [varchar](12) NULL,
	[UserDescription] [text] NULL,
	[UserRole] [varchar](12) NOT NULL,
	[UserCreatedOn] [datetime] NOT NULL,
	[UserIsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AccomodationRates] ADD  DEFAULT (getdate()) FOR [AccomodationRateStartDate]
GO
ALTER TABLE [dbo].[AccomodationRates] ADD  DEFAULT (getdate()+(1)) FOR [AccomodationRateEndDate]
GO
ALTER TABLE [dbo].[AccomodationRates] ADD  DEFAULT ((1)) FOR [AccomodationRateIsActive]
GO
ALTER TABLE [dbo].[Accomodations] ADD  DEFAULT ((1)) FOR [AccomodationMaxOccupancy]
GO
ALTER TABLE [dbo].[Accomodations] ADD  DEFAULT ((0)) FOR [AccomodationIsPublic]
GO
ALTER TABLE [dbo].[Accomodations] ADD  DEFAULT ((0)) FOR [AccomodationPriority]
GO
ALTER TABLE [dbo].[Accomodations] ADD  DEFAULT ((1)) FOR [AccomodationIsActive]
GO
ALTER TABLE [dbo].[AccomodationTypes] ADD  DEFAULT ((1)) FOR [AccomodationTypeIsActive]
GO
ALTER TABLE [dbo].[BookingHistory] ADD  DEFAULT (getdate()) FOR [BookingHistoryCreatedOn]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT (getdate()) FOR [BookingDate]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT (getdate()) FOR [BookingCreatedOn]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((1)) FOR [BookingAdultsCount]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((0)) FOR [BookingFreeAdultsCount]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((0)) FOR [BookingChildrenCount]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((0)) FOR [BookingFreeChildrenCount]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((0)) FOR [BookingStudentsCount]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((0)) FOR [BookingModified]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((1)) FOR [BookingIsActive]
GO
ALTER TABLE [dbo].[Emails] ADD  DEFAULT ((1)) FOR [FK_EmailTemplateID]
GO
ALTER TABLE [dbo].[Emails] ADD  DEFAULT ((0)) FOR [EmailSent]
GO
ALTER TABLE [dbo].[Emails] ADD  DEFAULT ('info@croisierebaleine.ca') FOR [EmailFrom]
GO
ALTER TABLE [dbo].[EmailTemplates] ADD  DEFAULT ('FRA') FOR [EmailTemplateLanguage]
GO
ALTER TABLE [dbo].[EmailTemplates] ADD  DEFAULT ((1)) FOR [EmailTemplateIsActive]
GO
ALTER TABLE [dbo].[Guests] ADD  DEFAULT ((1)) FOR [FK_SupplierID]
GO
ALTER TABLE [dbo].[Guests] ADD  DEFAULT ('FRA') FOR [GuestLanguage]
GO
ALTER TABLE [dbo].[Guests] ADD  DEFAULT ((0)) FOR [GuestOptIn]
GO
ALTER TABLE [dbo].[Guests] ADD  DEFAULT (getdate()) FOR [GuestCreatedOn]
GO
ALTER TABLE [dbo].[Guests] ADD  DEFAULT ((1)) FOR [GuestIsActive]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT (getdate()) FOR [InvoiceDate]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ('À payer') FOR [InvoiceStatus]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ((0)) FOR [InvoiceDiscount]
GO
ALTER TABLE [dbo].[Logbook] ADD  DEFAULT ((0)) FOR [Whale]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Productrice]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [ProductIsPublic]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [ProductPriority]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [ProductIsActive]
GO
ALTER TABLE [dbo].[ShipRates] ADD  DEFAULT (getdate()) FOR [ShipRateStartDate]
GO
ALTER TABLE [dbo].[ShipRates] ADD  DEFAULT (getdate()+(1)) FOR [ShipRateEndDate]
GO
ALTER TABLE [dbo].[ShipRates] ADD  DEFAULT ((1)) FOR [ShipRateIsActive]
GO
ALTER TABLE [dbo].[SupplierRates] ADD  DEFAULT ((1)) FOR [SuplierRateIsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [UserCreatedOn]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [UserIsActive]
GO
ALTER TABLE [dbo].[Accomodations]  WITH CHECK ADD  CONSTRAINT [FK_Accomodations_AccomodationTypes] FOREIGN KEY([FK_AccomodationTypeID])
REFERENCES [dbo].[AccomodationTypes] ([AccomodationTypeID])
GO
ALTER TABLE [dbo].[Accomodations] CHECK CONSTRAINT [FK_Accomodations_AccomodationTypes]
GO
ALTER TABLE [dbo].[BookingHistory]  WITH CHECK ADD  CONSTRAINT [FK_BookingHistory_Bookings] FOREIGN KEY([FK_BookingID])
REFERENCES [dbo].[Bookings] ([BookingID])
GO
ALTER TABLE [dbo].[BookingHistory] CHECK CONSTRAINT [FK_BookingHistory_Bookings]
GO
ALTER TABLE [dbo].[BookingHistory]  WITH CHECK ADD  CONSTRAINT [FK_BookingHistory_Users] FOREIGN KEY([FK_UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[BookingHistory] CHECK CONSTRAINT [FK_BookingHistory_Users]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Accomodations] FOREIGN KEY([FK_AccomodationID])
REFERENCES [dbo].[Accomodations] ([AccomodationID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Accomodations]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Departures] FOREIGN KEY([FK_GuestID])
REFERENCES [dbo].[Departures] ([DepartureID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Departures]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Guests] FOREIGN KEY([FK_GuestID])
REFERENCES [dbo].[Guests] ([GuestID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Guests]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Users] FOREIGN KEY([FK_UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Users]
GO
ALTER TABLE [dbo].[Departures]  WITH CHECK ADD  CONSTRAINT [FK_Departures_Seasons] FOREIGN KEY([FK_SeasonID])
REFERENCES [dbo].[Seasons] ([SeasonID])
GO
ALTER TABLE [dbo].[Departures] CHECK CONSTRAINT [FK_Departures_Seasons]
GO
ALTER TABLE [dbo].[Departures]  WITH CHECK ADD  CONSTRAINT [FK_Departures_Ships] FOREIGN KEY([FK_ShipID])
REFERENCES [dbo].[Ships] ([ShipID])
GO
ALTER TABLE [dbo].[Departures] CHECK CONSTRAINT [FK_Departures_Ships]
GO
ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK_Emails_Bookings] FOREIGN KEY([FK_BookingID])
REFERENCES [dbo].[Bookings] ([BookingID])
GO
ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_Emails_Bookings]
GO
ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK_Emails_Guests] FOREIGN KEY([FK_GuestID])
REFERENCES [dbo].[Guests] ([GuestID])
GO
ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_Emails_Guests]
GO
ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK_Emails_Users] FOREIGN KEY([FK_UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_Emails_Users]
GO
ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK_Emails_EmailTemplates] FOREIGN KEY([FK_EmailTemplateID])
REFERENCES [dbo].[EmailTemplates] ([EmailTemplateID])
GO
ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_Emails_EmailTemplates]
GO
ALTER TABLE [dbo].[Guests]  WITH CHECK ADD  CONSTRAINT [FK_Guests_Suppliers] FOREIGN KEY([FK_SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Guests] CHECK CONSTRAINT [FK_Guests_Suppliers]
GO
ALTER TABLE [dbo].[InvoicedBookings]  WITH CHECK ADD  CONSTRAINT [FK_InvoicedBookings_Bookings] FOREIGN KEY([FK_BookingID])
REFERENCES [dbo].[Bookings] ([BookingID])
GO
ALTER TABLE [dbo].[InvoicedBookings] CHECK CONSTRAINT [FK_InvoicedBookings_Bookings]
GO
ALTER TABLE [dbo].[InvoicedProducts]  WITH CHECK ADD  CONSTRAINT [FK_InvoicedProducts_Invoices] FOREIGN KEY([FK_InvoiceID])
REFERENCES [dbo].[Invoices] ([InvoiceID])
GO
ALTER TABLE [dbo].[InvoicedProducts] CHECK CONSTRAINT [FK_InvoicedProducts_Invoices]
GO
ALTER TABLE [dbo].[InvoicedProducts]  WITH CHECK ADD  CONSTRAINT [FK_InvoicedProducts_Products] FOREIGN KEY([FK_ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[InvoicedProducts] CHECK CONSTRAINT [FK_InvoicedProducts_Products]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Guests] FOREIGN KEY([FK_GuestID])
REFERENCES [dbo].[Guests] ([GuestID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Guests]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Users] FOREIGN KEY([FK_UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Users]
GO
ALTER TABLE [dbo].[Logbook]  WITH CHECK ADD  CONSTRAINT [FK_Logbook_Departures] FOREIGN KEY([FK_DepartureID])
REFERENCES [dbo].[Departures] ([DepartureID])
GO
ALTER TABLE [dbo].[Logbook] CHECK CONSTRAINT [FK_Logbook_Departures]
GO
ALTER TABLE [dbo].[Logbook]  WITH CHECK ADD  CONSTRAINT [FK_Logbook_Users] FOREIGN KEY([FK_UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Logbook] CHECK CONSTRAINT [FK_Logbook_Users]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Invoices] FOREIGN KEY([FK_InvoiceID])
REFERENCES [dbo].[Invoices] ([InvoiceID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Invoices]
GO
ALTER TABLE [dbo].[Ships]  WITH CHECK ADD  CONSTRAINT [FK_Ships_ShipDesigns] FOREIGN KEY([FK_ShipDesignID])
REFERENCES [dbo].[ShipDesigns] ([ShipDesignID])
GO
ALTER TABLE [dbo].[Ships] CHECK CONSTRAINT [FK_Ships_ShipDesigns]
GO
ALTER TABLE [dbo].[SupplierRates]  WITH CHECK ADD  CONSTRAINT [FK_SupplierRates_AccomodationRates] FOREIGN KEY([FK_AccomodationRateID])
REFERENCES [dbo].[AccomodationRates] ([AccomodationRateID])
GO
ALTER TABLE [dbo].[SupplierRates] CHECK CONSTRAINT [FK_SupplierRates_AccomodationRates]
GO
ALTER TABLE [dbo].[SupplierRates]  WITH CHECK ADD  CONSTRAINT [FK_SupplierRates_ShipRates] FOREIGN KEY([FK_ShipRateID])
REFERENCES [dbo].[ShipRates] ([ShipRateID])
GO
ALTER TABLE [dbo].[SupplierRates] CHECK CONSTRAINT [FK_SupplierRates_ShipRates]
GO
ALTER TABLE [dbo].[SupplierRates]  WITH CHECK ADD  CONSTRAINT [FK_SupplierRates_Suppliers] FOREIGN KEY([FK_SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[SupplierRates] CHECK CONSTRAINT [FK_SupplierRates_Suppliers]
GO
USE [master]
GO
ALTER DATABASE [CroisiereEscoumins2020] SET  READ_WRITE 
GO
