USE [ManageCourt]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 10/26/2024 7:56:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessories](
	[AccessoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccessoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BadmintonCourts]    Script Date: 10/26/2024 7:56:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BadmintonCourts](
	[CourtId] [int] IDENTITY(1,1) NOT NULL,
	[OwnerId] [int] NULL,
	[CourtName] [nvarchar](100) NOT NULL,
	[Location] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[MapsLink] [nvarchar](255) NULL,
	[PricePerHour] [decimal](10, 2) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[IsEnabled] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingAccessories]    Script Date: 10/26/2024 7:56:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingAccessories](
	[BookingAccessoryId] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NULL,
	[AccessoryId] [int] NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingAccessoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 10/26/2024 7:56:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CourtId] [int] NULL,
	[BookingDate] [date] NOT NULL,
	[TimeSlot] [nvarchar](20) NOT NULL,
	[TotalPrice] [decimal](10, 2) NOT NULL,
	[Note] [nvarchar](500) NULL,
	[ContactName] [nvarchar](100) NULL,
	[ContactEmail] [nvarchar](100) NULL,
	[ContactPhone] [nvarchar](20) NULL,
	[PaymentMethod] [nvarchar](20) NOT NULL,
	[PaymentStatus] [nvarchar](20) NULL,
	[BookingStatus] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourtImages]    Script Date: 10/26/2024 7:56:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourtImages](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[CourtId] [int] NULL,
	[ImageUrl] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourtSchedule]    Script Date: 10/26/2024 7:56:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourtSchedule](
	[ScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[CourtId] [int] NULL,
	[Date] [date] NOT NULL,
	[TimeSlot] [nvarchar](20) NOT NULL,
	[IsAvailable] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnableLog]    Script Date: 10/26/2024 7:56:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnableLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[EntityType] [nvarchar](20) NULL,
	[EntityId] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[ChangedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/26/2024 7:56:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[IsEnabled] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BadmintonCourts] ADD  DEFAULT ((1)) FOR [IsEnabled]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ('Pending') FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ('Confirmed') FOR [BookingStatus]
GO
ALTER TABLE [dbo].[CourtSchedule] ADD  DEFAULT ((1)) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[EnableLog] ADD  DEFAULT (getdate()) FOR [ChangedDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsEnabled]
GO
ALTER TABLE [dbo].[BadmintonCourts]  WITH CHECK ADD FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[BookingAccessories]  WITH CHECK ADD FOREIGN KEY([AccessoryId])
REFERENCES [dbo].[Accessories] ([AccessoryId])
GO
ALTER TABLE [dbo].[BookingAccessories]  WITH CHECK ADD FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([BookingId])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([CourtId])
REFERENCES [dbo].[BadmintonCourts] ([CourtId])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[CourtImages]  WITH CHECK ADD FOREIGN KEY([CourtId])
REFERENCES [dbo].[BadmintonCourts] ([CourtId])
GO
ALTER TABLE [dbo].[CourtSchedule]  WITH CHECK ADD FOREIGN KEY([CourtId])
REFERENCES [dbo].[BadmintonCourts] ([CourtId])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD CHECK  (([BookingStatus]='Cancelled' OR [BookingStatus]='NoShow' OR [BookingStatus]='Confirmed'))
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD CHECK  (([PaymentMethod]='AfterPlay' OR [PaymentMethod]='Online'))
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD CHECK  (([PaymentStatus]='Completed' OR [PaymentStatus]='Pending'))
GO
ALTER TABLE [dbo].[EnableLog]  WITH CHECK ADD CHECK  (([EntityType]='Court' OR [EntityType]='User'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([Role]='User' OR [Role]='CourtOwner' OR [Role]='Admin'))
GO
