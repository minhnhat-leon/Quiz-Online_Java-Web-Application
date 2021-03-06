USE [master]
GO
/****** Object:  Database [DreamTravelLAB2]    Script Date: 6/22/2020 1:08:17 PM ******/
CREATE DATABASE [DreamTravelLAB2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookingTourLinhNd', FILENAME = N'F:\Phan mem\IT IDE\MSSQL14.SQLEXPRESS\MSSQL\DATA\BookingTourLinhNd.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookingTourLinhNd_log', FILENAME = N'F:\Phan mem\IT IDE\MSSQL14.SQLEXPRESS\MSSQL\DATA\BookingTourLinhNd_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DreamTravelLAB2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DreamTravelLAB2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DreamTravelLAB2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET ARITHABORT OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DreamTravelLAB2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DreamTravelLAB2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DreamTravelLAB2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DreamTravelLAB2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET RECOVERY FULL 
GO
ALTER DATABASE [DreamTravelLAB2] SET  MULTI_USER 
GO
ALTER DATABASE [DreamTravelLAB2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DreamTravelLAB2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DreamTravelLAB2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DreamTravelLAB2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DreamTravelLAB2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DreamTravelLAB2] SET QUERY_STORE = OFF
GO
USE [DreamTravelLAB2]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 6/22/2020 1:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[BookingDate] [date] NOT NULL,
	[TotalMoney] [float] NOT NULL,
	[StatusId] [varchar](50) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[DiscountId] [varchar](50) NULL,
 CONSTRAINT [PK__Booking__73951AED8E38533B] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingDetail]    Script Date: 6/22/2020 1:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetail](
	[BookingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[TourID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[BookingId] [int] NOT NULL,
 CONSTRAINT [PK__BookingD__8136D45A54107293] PRIMARY KEY CLUSTERED 
(
	[BookingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountCode]    Script Date: 6/22/2020 1:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountCode](
	[DiscountId] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PercentDiscount] [int] NOT NULL,
	[ExpiryDate] [date] NOT NULL,
 CONSTRAINT [PK__Discount__E43F6D967384DB40] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/22/2020 1:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/22/2020 1:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tours]    Script Date: 6/22/2020 1:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tours](
	[TourID] [int] IDENTITY(1,1) NOT NULL,
	[TourName] [nvarchar](250) NOT NULL,
	[FromDate] [date] NOT NULL,
	[ToDate] [date] NOT NULL,
	[DateImport] [date] NOT NULL,
	[Price] [float] NOT NULL,
	[Place] [varchar](50) NOT NULL,
	[Quota] [int] NOT NULL,
	[ImageLink] [varchar](250) NOT NULL,
	[StatusId] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Tours__604CEA10935F4F21] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserHaveDiscount]    Script Date: 6/22/2020 1:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserHaveDiscount](
	[DiscountAcceptID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[DiscountId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserHaveDiscount] PRIMARY KEY CLUSTERED 
(
	[DiscountAcceptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/22/2020 1:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FacebookLink] [varchar](300) NULL,
	[StatusId] [varchar](50) NOT NULL,
	[RoleId] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Users__1788CCAC6D20BC5B] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([BookingId], [BookingDate], [TotalMoney], [StatusId], [UserID], [DiscountId]) VALUES (1, CAST(N'2020-06-21' AS Date), 2400, N'checkOutBooking', N'user', N'CODE111')
INSERT [dbo].[Booking] ([BookingId], [BookingDate], [TotalMoney], [StatusId], [UserID], [DiscountId]) VALUES (2, CAST(N'2020-06-21' AS Date), 1500, N'checkOutBooking', N'user', NULL)
INSERT [dbo].[Booking] ([BookingId], [BookingDate], [TotalMoney], [StatusId], [UserID], [DiscountId]) VALUES (3, CAST(N'2020-06-22' AS Date), 888, N'checkOutBooking', N'1286251521705819', N'CODE111')
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[BookingDetail] ON 

INSERT [dbo].[BookingDetail] ([BookingDetailId], [TourID], [Quantity], [BookingId]) VALUES (1, 1, 2, 1)
INSERT [dbo].[BookingDetail] ([BookingDetailId], [TourID], [Quantity], [BookingId]) VALUES (2, 2, 4, 1)
INSERT [dbo].[BookingDetail] ([BookingDetailId], [TourID], [Quantity], [BookingId]) VALUES (3, 1, 1, 2)
INSERT [dbo].[BookingDetail] ([BookingDetailId], [TourID], [Quantity], [BookingId]) VALUES (4, 2, 1, 2)
INSERT [dbo].[BookingDetail] ([BookingDetailId], [TourID], [Quantity], [BookingId]) VALUES (5, 2, 1, 3)
INSERT [dbo].[BookingDetail] ([BookingDetailId], [TourID], [Quantity], [BookingId]) VALUES (6, 5, 1, 3)
INSERT [dbo].[BookingDetail] ([BookingDetailId], [TourID], [Quantity], [BookingId]) VALUES (7, 6, 1, 3)
INSERT [dbo].[BookingDetail] ([BookingDetailId], [TourID], [Quantity], [BookingId]) VALUES (8, 7, 1, 3)
SET IDENTITY_INSERT [dbo].[BookingDetail] OFF
INSERT [dbo].[DiscountCode] ([DiscountId], [Name], [PercentDiscount], [ExpiryDate]) VALUES (N'CODE111', N'Sale 20%', 20, CAST(N'2020-11-11' AS Date))
INSERT [dbo].[DiscountCode] ([DiscountId], [Name], [PercentDiscount], [ExpiryDate]) VALUES (N'CODE123', N'Sale 10%', 10, CAST(N'2020-05-05' AS Date))
INSERT [dbo].[DiscountCode] ([DiscountId], [Name], [PercentDiscount], [ExpiryDate]) VALUES (N'CODE131', N'Sale 30%', 30, CAST(N'2020-07-07' AS Date))
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'admin', N'admin')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'user', N'user')
INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (N'activeAccount', N'Account Acctive')
INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (N'activeTour', N'Active Tour')
INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (N'checkOutBooking', N'Booking checked')
INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (N'deActiveTour', N'De Active Tour')
SET IDENTITY_INSERT [dbo].[Tours] ON 

INSERT [dbo].[Tours] ([TourID], [TourName], [FromDate], [ToDate], [DateImport], [Price], [Place], [Quota], [ImageLink], [StatusId]) VALUES (1, N'Ha Long', CAST(N'2020-07-01' AS Date), CAST(N'2020-07-15' AS Date), CAST(N'2020-06-20' AS Date), 1000, N'Ha Long Bay', 30, N'images/TOTO_main.jpg', N'activeTour')
INSERT [dbo].[Tours] ([TourID], [TourName], [FromDate], [ToDate], [DateImport], [Price], [Place], [Quota], [ImageLink], [StatusId]) VALUES (2, N'Ha Noi', CAST(N'2020-07-05' AS Date), CAST(N'2020-07-12' AS Date), CAST(N'2020-06-20' AS Date), 500, N'Ha Noi City', 10, N'images/TOTO_main.jpg', N'activeTour')
INSERT [dbo].[Tours] ([TourID], [TourName], [FromDate], [ToDate], [DateImport], [Price], [Place], [Quota], [ImageLink], [StatusId]) VALUES (3, N'Hue City', CAST(N'2020-06-22' AS Date), CAST(N'2020-06-28' AS Date), CAST(N'2020-06-21' AS Date), 600, N'Thua Thien Hue', 20, N'images\Hussain Shafei_Horizon_a0RlQGc.jpg', N'activeTour')
INSERT [dbo].[Tours] ([TourID], [TourName], [FromDate], [ToDate], [DateImport], [Price], [Place], [Quota], [ImageLink], [StatusId]) VALUES (4, N'Phong Nha Cave', CAST(N'2020-06-24' AS Date), CAST(N'2020-06-27' AS Date), CAST(N'2020-06-22' AS Date), 200, N'Phong Nha, Quang Binh', 15, N'images\phong nha.jpg', N'activeTour')
INSERT [dbo].[Tours] ([TourID], [TourName], [FromDate], [ToDate], [DateImport], [Price], [Place], [Quota], [ImageLink], [StatusId]) VALUES (5, N'Hoi An City', CAST(N'2020-06-25' AS Date), CAST(N'2020-06-30' AS Date), CAST(N'2020-06-22' AS Date), 300, N'TP Hoi An', 30, N'images\hoi an.jpg', N'activeTour')
INSERT [dbo].[Tours] ([TourID], [TourName], [FromDate], [ToDate], [DateImport], [Price], [Place], [Quota], [ImageLink], [StatusId]) VALUES (6, N'Da Nang City', CAST(N'2020-07-01' AS Date), CAST(N'2020-07-10' AS Date), CAST(N'2020-06-22' AS Date), 150, N'TP Da Nang', 50, N'images\da nang.jpg', N'activeTour')
INSERT [dbo].[Tours] ([TourID], [TourName], [FromDate], [ToDate], [DateImport], [Price], [Place], [Quota], [ImageLink], [StatusId]) VALUES (7, N'Ho Noi City', CAST(N'2020-07-01' AS Date), CAST(N'2020-07-03' AS Date), CAST(N'2020-06-22' AS Date), 160, N'TP Ha Noi', 50, N'images\hanoi.jpg', N'activeTour')
INSERT [dbo].[Tours] ([TourID], [TourName], [FromDate], [ToDate], [DateImport], [Price], [Place], [Quota], [ImageLink], [StatusId]) VALUES (8, N'Da Lat 3 Day', CAST(N'2020-06-30' AS Date), CAST(N'2020-07-02' AS Date), CAST(N'2020-06-22' AS Date), 50, N'Da Lat City', 24, N'images\dalat.jpg', N'activeTour')
SET IDENTITY_INSERT [dbo].[Tours] OFF
INSERT [dbo].[Users] ([UserID], [Password], [Name], [FacebookLink], [StatusId], [RoleId]) VALUES (N'1286251521705819', NULL, N'Nhật Minh', N'https://www.facebook.com/app_scoped_user_id/YXNpZADpBWEc0VUVyaENqdGNhN2RhbmNPME1iNFlzX3k3bndJRHRELVF6T2ZAub2dWY1dnZAEV1VjdfVG5WNXRXaG1NS1J6a0NsZAnZACcmlwVWVpRVh4RXFMdlVHOGJQX05tMGl0Q1EtM2Y4QU1BZAXRZAUm5Xd1Vy/', N'activeAccount', N'user')
INSERT [dbo].[Users] ([UserID], [Password], [Name], [FacebookLink], [StatusId], [RoleId]) VALUES (N'admin', N'123456', N'Admin Nhat', NULL, N'activeAccount', N'admin')
INSERT [dbo].[Users] ([UserID], [Password], [Name], [FacebookLink], [StatusId], [RoleId]) VALUES (N'user', N'123456', N'User Nhat', NULL, N'activeAccount', N'user')
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK__Booking__StatusI__1CF15040] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK__Booking__StatusI__1CF15040]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK__Booking__UserID__1DE57479] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK__Booking__UserID__1DE57479]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_DiscountCode1] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[DiscountCode] ([DiscountId])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_DiscountCode1]
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK__BookingDe__Booki__20C1E124] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Booking] ([BookingId])
GO
ALTER TABLE [dbo].[BookingDetail] CHECK CONSTRAINT [FK__BookingDe__Booki__20C1E124]
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetail_Tours] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tours] ([TourID])
GO
ALTER TABLE [dbo].[BookingDetail] CHECK CONSTRAINT [FK_BookingDetail_Tours]
GO
ALTER TABLE [dbo].[Tours]  WITH CHECK ADD  CONSTRAINT [FK_Tours_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Tours] CHECK CONSTRAINT [FK_Tours_Status]
GO
ALTER TABLE [dbo].[UserHaveDiscount]  WITH CHECK ADD  CONSTRAINT [FK__Relations__Disco__24927208] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[DiscountCode] ([DiscountId])
GO
ALTER TABLE [dbo].[UserHaveDiscount] CHECK CONSTRAINT [FK__Relations__Disco__24927208]
GO
ALTER TABLE [dbo].[UserHaveDiscount]  WITH CHECK ADD  CONSTRAINT [FK__Relations__UserI__239E4DCF] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserHaveDiscount] CHECK CONSTRAINT [FK__Relations__UserI__239E4DCF]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK__Users__RoleId__173876EA] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK__Users__RoleId__173876EA]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK__Users__StatusId__164452B1] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK__Users__StatusId__164452B1]
GO
USE [master]
GO
ALTER DATABASE [DreamTravelLAB2] SET  READ_WRITE 
GO
