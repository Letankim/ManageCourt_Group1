USE [ManageCourt]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 10/26/2024 8:07:50 PM ******/
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
/****** Object:  Table [dbo].[BadmintonCourts]    Script Date: 10/26/2024 8:07:50 PM ******/
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
/****** Object:  Table [dbo].[BookingAccessories]    Script Date: 10/26/2024 8:07:50 PM ******/
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
/****** Object:  Table [dbo].[Bookings]    Script Date: 10/26/2024 8:07:50 PM ******/
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
/****** Object:  Table [dbo].[CourtImages]    Script Date: 10/26/2024 8:07:50 PM ******/
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
/****** Object:  Table [dbo].[CourtSchedule]    Script Date: 10/26/2024 8:07:50 PM ******/
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
/****** Object:  Table [dbo].[EnableLog]    Script Date: 10/26/2024 8:07:50 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 10/26/2024 8:07:50 PM ******/
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
SET IDENTITY_INSERT [dbo].[Accessories] ON 

INSERT [dbo].[Accessories] ([AccessoryId], [Name], [Price]) VALUES (1, N'Grip Tape', CAST(5.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoryId], [Name], [Price]) VALUES (2, N'Shuttlecock', CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoryId], [Name], [Price]) VALUES (3, N'Water Bottle', CAST(1.50 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoryId], [Name], [Price]) VALUES (4, N'Towel', CAST(3.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoryId], [Name], [Price]) VALUES (5, N'Wristband', CAST(2.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoryId], [Name], [Price]) VALUES (6, N'Grip Tape', CAST(5.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoryId], [Name], [Price]) VALUES (7, N'Shuttlecock', CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoryId], [Name], [Price]) VALUES (8, N'Water Bottle', CAST(1.50 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoryId], [Name], [Price]) VALUES (9, N'Towel', CAST(3.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessories] ([AccessoryId], [Name], [Price]) VALUES (10, N'Wristband', CAST(2.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Accessories] OFF
GO
SET IDENTITY_INSERT [dbo].[BadmintonCourts] ON 

INSERT [dbo].[BadmintonCourts] ([CourtId], [OwnerId], [CourtName], [Location], [Description], [MapsLink], [PricePerHour], [StartTime], [EndTime], [IsEnabled]) VALUES (3, 3, N'Court A', N'123 Main St', N'Indoor court with air conditioning', N'https://maps.example.com/courtA', CAST(25.00 AS Decimal(10, 2)), CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), 1)
INSERT [dbo].[BadmintonCourts] ([CourtId], [OwnerId], [CourtName], [Location], [Description], [MapsLink], [PricePerHour], [StartTime], [EndTime], [IsEnabled]) VALUES (4, 65, N'Court B', N'456 Elm St', N'Outdoor court with natural lighting', N'https://maps.example.com/courtB', CAST(20.00 AS Decimal(10, 2)), CAST(N'07:00:00' AS Time), CAST(N'21:00:00' AS Time), 1)
INSERT [dbo].[BadmintonCourts] ([CourtId], [OwnerId], [CourtName], [Location], [Description], [MapsLink], [PricePerHour], [StartTime], [EndTime], [IsEnabled]) VALUES (5, 65, N'Court C', N'789 Oak St', N'Indoor court with hardwood flooring', N'https://maps.example.com/courtC', CAST(30.00 AS Decimal(10, 2)), CAST(N'09:00:00' AS Time), CAST(N'23:00:00' AS Time), 1)
INSERT [dbo].[BadmintonCourts] ([CourtId], [OwnerId], [CourtName], [Location], [Description], [MapsLink], [PricePerHour], [StartTime], [EndTime], [IsEnabled]) VALUES (6, 65, N'Court D', N'101 Pine St', N'Outdoor court with artificial grass', N'https://maps.example.com/courtD', CAST(15.00 AS Decimal(10, 2)), CAST(N'06:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[BadmintonCourts] ([CourtId], [OwnerId], [CourtName], [Location], [Description], [MapsLink], [PricePerHour], [StartTime], [EndTime], [IsEnabled]) VALUES (7, 3, N'Court E', N'202 Maple St', N'Indoor court with lounge area', N'https://maps.example.com/courtE', CAST(35.00 AS Decimal(10, 2)), CAST(N'10:00:00' AS Time), CAST(N'22:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[BadmintonCourts] OFF
GO
SET IDENTITY_INSERT [dbo].[BookingAccessories] ON 

INSERT [dbo].[BookingAccessories] ([BookingAccessoryId], [BookingId], [AccessoryId], [Quantity]) VALUES (3, 6, 1, 2)
INSERT [dbo].[BookingAccessories] ([BookingAccessoryId], [BookingId], [AccessoryId], [Quantity]) VALUES (4, 7, 2, 1)
INSERT [dbo].[BookingAccessories] ([BookingAccessoryId], [BookingId], [AccessoryId], [Quantity]) VALUES (5, 3, 3, 5)
INSERT [dbo].[BookingAccessories] ([BookingAccessoryId], [BookingId], [AccessoryId], [Quantity]) VALUES (6, 4, 4, 1)
INSERT [dbo].[BookingAccessories] ([BookingAccessoryId], [BookingId], [AccessoryId], [Quantity]) VALUES (7, 5, 5, 3)
SET IDENTITY_INSERT [dbo].[BookingAccessories] OFF
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([BookingId], [UserId], [CourtId], [BookingDate], [TimeSlot], [TotalPrice], [Note], [ContactName], [ContactEmail], [ContactPhone], [PaymentMethod], [PaymentStatus], [BookingStatus]) VALUES (3, 65, 6, CAST(N'2024-10-27' AS Date), N'10:00-11:00', CAST(25.00 AS Decimal(10, 2)), N'First-time booking', N'Alice Johnson', N'alice@example.com', N'123456789', N'Online', N'Pending', N'Confirmed')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [CourtId], [BookingDate], [TimeSlot], [TotalPrice], [Note], [ContactName], [ContactEmail], [ContactPhone], [PaymentMethod], [PaymentStatus], [BookingStatus]) VALUES (4, 68, 7, CAST(N'2024-10-28' AS Date), N'09:00-10:00', CAST(20.00 AS Decimal(10, 2)), N'Preferred morning slot', N'Daisy Moore', N'daisy@example.com', N'5566778899', N'AfterPlay', N'Pending', N'Confirmed')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [CourtId], [BookingDate], [TimeSlot], [TotalPrice], [Note], [ContactName], [ContactEmail], [ContactPhone], [PaymentMethod], [PaymentStatus], [BookingStatus]) VALUES (5, 65, 3, CAST(N'2024-10-29' AS Date), N'11:00-12:00', CAST(30.00 AS Decimal(10, 2)), NULL, N'Alice Johnson', N'alice@example.com', N'123456789', N'Online', N'Completed', N'Confirmed')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [CourtId], [BookingDate], [TimeSlot], [TotalPrice], [Note], [ContactName], [ContactEmail], [ContactPhone], [PaymentMethod], [PaymentStatus], [BookingStatus]) VALUES (6, 68, 4, CAST(N'2024-10-30' AS Date), N'08:00-09:00', CAST(15.00 AS Decimal(10, 2)), N'With extra shuttlecock', N'Daisy Moore', N'daisy@example.com', N'5566778899', N'AfterPlay', N'Pending', N'NoShow')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [CourtId], [BookingDate], [TimeSlot], [TotalPrice], [Note], [ContactName], [ContactEmail], [ContactPhone], [PaymentMethod], [PaymentStatus], [BookingStatus]) VALUES (7, 65, 5, CAST(N'2024-10-31' AS Date), N'12:00-13:00', CAST(35.00 AS Decimal(10, 2)), N'Lunchtime game', N'Alice Johnson', N'alice@example.com', N'123456789', N'Online', N'Completed', N'Cancelled')
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[CourtImages] ON 

INSERT [dbo].[CourtImages] ([ImageId], [CourtId], [ImageUrl]) VALUES (3, 6, N'https://example.com/images/courtA1.jpg')
INSERT [dbo].[CourtImages] ([ImageId], [CourtId], [ImageUrl]) VALUES (4, 6, N'https://example.com/images/courtA2.jpg')
INSERT [dbo].[CourtImages] ([ImageId], [CourtId], [ImageUrl]) VALUES (5, 7, N'https://example.com/images/courtB1.jpg')
INSERT [dbo].[CourtImages] ([ImageId], [CourtId], [ImageUrl]) VALUES (6, 3, N'https://example.com/images/courtC1.jpg')
INSERT [dbo].[CourtImages] ([ImageId], [CourtId], [ImageUrl]) VALUES (7, 4, N'https://example.com/images/courtD1.jpg')
SET IDENTITY_INSERT [dbo].[CourtImages] OFF
GO
SET IDENTITY_INSERT [dbo].[CourtSchedule] ON 

INSERT [dbo].[CourtSchedule] ([ScheduleId], [CourtId], [Date], [TimeSlot], [IsAvailable]) VALUES (2, 6, CAST(N'2024-10-27' AS Date), N'10:00-11:00', 0)
INSERT [dbo].[CourtSchedule] ([ScheduleId], [CourtId], [Date], [TimeSlot], [IsAvailable]) VALUES (3, 7, CAST(N'2024-10-28' AS Date), N'09:00-10:00', 0)
INSERT [dbo].[CourtSchedule] ([ScheduleId], [CourtId], [Date], [TimeSlot], [IsAvailable]) VALUES (4, 3, CAST(N'2024-10-29' AS Date), N'11:00-12:00', 1)
INSERT [dbo].[CourtSchedule] ([ScheduleId], [CourtId], [Date], [TimeSlot], [IsAvailable]) VALUES (5, 4, CAST(N'2024-10-30' AS Date), N'08:00-09:00', 0)
INSERT [dbo].[CourtSchedule] ([ScheduleId], [CourtId], [Date], [TimeSlot], [IsAvailable]) VALUES (6, 5, CAST(N'2024-10-31' AS Date), N'12:00-13:00', 1)
SET IDENTITY_INSERT [dbo].[CourtSchedule] OFF
GO
SET IDENTITY_INSERT [dbo].[EnableLog] ON 

INSERT [dbo].[EnableLog] ([LogId], [EntityType], [EntityId], [IsEnabled], [ChangedDate]) VALUES (1, N'Court', 1, 1, CAST(N'2024-10-26T19:57:42.293' AS DateTime))
INSERT [dbo].[EnableLog] ([LogId], [EntityType], [EntityId], [IsEnabled], [ChangedDate]) VALUES (2, N'Court', 2, 1, CAST(N'2024-10-26T19:57:42.293' AS DateTime))
INSERT [dbo].[EnableLog] ([LogId], [EntityType], [EntityId], [IsEnabled], [ChangedDate]) VALUES (3, N'Court', 3, 0, CAST(N'2024-10-26T19:57:42.293' AS DateTime))
INSERT [dbo].[EnableLog] ([LogId], [EntityType], [EntityId], [IsEnabled], [ChangedDate]) VALUES (4, N'User', 1, 1, CAST(N'2024-10-26T19:57:42.293' AS DateTime))
INSERT [dbo].[EnableLog] ([LogId], [EntityType], [EntityId], [IsEnabled], [ChangedDate]) VALUES (5, N'User', 3, 0, CAST(N'2024-10-26T19:57:42.293' AS DateTime))
INSERT [dbo].[EnableLog] ([LogId], [EntityType], [EntityId], [IsEnabled], [ChangedDate]) VALUES (6, N'Court', 1, 1, CAST(N'2024-10-26T20:04:23.027' AS DateTime))
INSERT [dbo].[EnableLog] ([LogId], [EntityType], [EntityId], [IsEnabled], [ChangedDate]) VALUES (7, N'Court', 2, 1, CAST(N'2024-10-26T20:04:23.027' AS DateTime))
INSERT [dbo].[EnableLog] ([LogId], [EntityType], [EntityId], [IsEnabled], [ChangedDate]) VALUES (8, N'Court', 3, 0, CAST(N'2024-10-26T20:04:23.027' AS DateTime))
INSERT [dbo].[EnableLog] ([LogId], [EntityType], [EntityId], [IsEnabled], [ChangedDate]) VALUES (9, N'User', 1, 1, CAST(N'2024-10-26T20:04:23.027' AS DateTime))
INSERT [dbo].[EnableLog] ([LogId], [EntityType], [EntityId], [IsEnabled], [ChangedDate]) VALUES (10, N'User', 3, 0, CAST(N'2024-10-26T20:04:23.027' AS DateTime))
SET IDENTITY_INSERT [dbo].[EnableLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (3, N'letankim', N'', N'admin', N'Lê Tấn Kim', N'kimltce170469@fpt.edu.vn', N'0865341745', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (4, N'anlo', N'1', N'Admin', N'Đặng Phước  Ân 1', N'andpce170469@fpt.edu.vn', N'0123456789', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (8, N'demo1', N'4', N'User', N'Demo', N'demoe170469@fpt.edu.vn', N'1', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (34, N'john_doe', N'securepassword123', N'User', N'John Doe', N'john.doe@example.com', N'123-456-789', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (58, N'sa', N'sa', N'User', N'sa', N'sa', N'12', 0)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (60, N'chicuongbui', N'sa', N'User', N'Bùi Chí Cường', N'chicuongbui@gmail.com', N'123456789', 0)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (62, N'sa', N'ăâ', N'Admin', N'sa', N'sa', N'ăâ', 0)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (65, N'Testaa', N'1', N'admin', N'Lê Tấn Kim', N'kimltce170469@fpt.edu.vn', N'0865341745', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (66, N'user1', N'pass123', N'User', N'Alice Johnson', N'alice@example.com', N'123456789', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (67, N'owner1', N'pass456', N'CourtOwner', N'Bob Smith', N'bob@example.com', N'987654321', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (68, N'admin', N'adminpass', N'Admin', N'Charlie Admin', N'charlie@example.com', N'1122334455', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (69, N'user2', N'pass789', N'User', N'Daisy Moore', N'daisy@example.com', N'5566778899', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (70, N'owner2', N'pass000', N'CourtOwner', N'Evan Wright', N'evan@example.com', N'4433221100', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (71, N'user1', N'pass123', N'User', N'Alice Johnson', N'alice@example.com', N'123456789', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (72, N'owner1', N'pass456', N'CourtOwner', N'Bob Smith', N'bob@example.com', N'987654321', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (73, N'admin', N'adminpass', N'Admin', N'Charlie Admin', N'charlie@example.com', N'1122334455', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (74, N'user2', N'pass789', N'User', N'Daisy Moore', N'daisy@example.com', N'5566778899', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role], [FullName], [Email], [Phone], [IsEnabled]) VALUES (75, N'owner2', N'pass000', N'CourtOwner', N'Evan Wright', N'evan@example.com', N'4433221100', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
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
