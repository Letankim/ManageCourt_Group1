-- Thêm dữ liệu vào bảng Accessories
INSERT INTO [dbo].[Accessories] (Name, Price) VALUES 
('Grip Tape', 5.00),
('Shuttlecock', 10.00),
('Water Bottle', 1.50),
('Towel', 3.00),
('Wristband', 2.00);

-- Thêm dữ liệu vào bảng Users
INSERT INTO [dbo].[Users] (Username, Password, Role, FullName, Email, Phone, IsEnabled) VALUES 
('user1', 'pass123', 'User', 'Alice Johnson', 'alice@example.com', '123456789', 1),
('owner1', 'pass456', 'CourtOwner', 'Bob Smith', 'bob@example.com', '987654321', 1),
('admin', 'adminpass', 'Admin', 'Charlie Admin', 'charlie@example.com', '1122334455', 1),
('user2', 'pass789', 'User', 'Daisy Moore', 'daisy@example.com', '5566778899', 1),
('owner2', 'pass000', 'CourtOwner', 'Evan Wright', 'evan@example.com', '4433221100', 1);

-- Thêm dữ liệu vào bảng BadmintonCourts
INSERT INTO [dbo].[BadmintonCourts] (OwnerId, CourtName, Location, Description, MapsLink, PricePerHour, StartTime, EndTime, IsEnabled) VALUES 
(3, 'Court A', '123 Main St', 'Indoor court with air conditioning', 'https://maps.example.com/courtA', 25.00, '08:00', '22:00', 1),
(65, 'Court B', '456 Elm St', 'Outdoor court with natural lighting', 'https://maps.example.com/courtB', 20.00, '07:00', '21:00', 1),
(65, 'Court C', '789 Oak St', 'Indoor court with hardwood flooring', 'https://maps.example.com/courtC', 30.00, '09:00', '23:00', 1),
(65, 'Court D', '101 Pine St', 'Outdoor court with artificial grass', 'https://maps.example.com/courtD', 15.00, '06:00', '20:00', 1),
(3, 'Court E', '202 Maple St', 'Indoor court with lounge area', 'https://maps.example.com/courtE', 35.00, '10:00', '22:00', 1);

-- Thêm dữ liệu vào bảng Bookings
INSERT INTO [dbo].[Bookings] (UserId, CourtId, BookingDate, TimeSlot, TotalPrice, Note, ContactName, ContactEmail, ContactPhone, PaymentMethod, PaymentStatus, BookingStatus) VALUES 
(65, 6, '2024-10-27', '10:00-11:00', 25.00, 'First-time booking', 'Alice Johnson', 'alice@example.com', '123456789', 'Online', 'Pending', 'Confirmed'),
(68, 7, '2024-10-28', '09:00-10:00', 20.00, 'Preferred morning slot', 'Daisy Moore', 'daisy@example.com', '5566778899', 'AfterPlay', 'Pending', 'Confirmed'),
(65, 3, '2024-10-29', '11:00-12:00', 30.00, NULL, 'Alice Johnson', 'alice@example.com', '123456789', 'Online', 'Completed', 'Confirmed'),
(68, 4, '2024-10-30', '08:00-09:00', 15.00, 'With extra shuttlecock', 'Daisy Moore', 'daisy@example.com', '5566778899', 'AfterPlay', 'Pending', 'NoShow'),
(65, 5, '2024-10-31', '12:00-13:00', 35.00, 'Lunchtime game', 'Alice Johnson', 'alice@example.com', '123456789', 'Online', 'Completed', 'Cancelled');

-- Thêm dữ liệu vào bảng BookingAccessories
INSERT INTO [dbo].[BookingAccessories] (BookingId, AccessoryId, Quantity) VALUES 
(6, 1, 2),
(7, 2, 1),
(3, 3, 5),
(4, 4, 1),
(5, 5, 3);

-- Thêm dữ liệu vào bảng CourtImages
INSERT INTO [dbo].[CourtImages] (CourtId, ImageUrl) VALUES 
(6, 'https://example.com/images/courtA1.jpg'),
(6, 'https://example.com/images/courtA2.jpg'),
(7, 'https://example.com/images/courtB1.jpg'),
(3, 'https://example.com/images/courtC1.jpg'),
(4, 'https://example.com/images/courtD1.jpg');

-- Thêm dữ liệu vào bảng CourtSchedule
INSERT INTO [dbo].[CourtSchedule] (CourtId, Date, TimeSlot, IsAvailable) VALUES 
(6, '2024-10-27', '10:00-11:00', 0),
(7, '2024-10-28', '09:00-10:00', 0),
(3, '2024-10-29', '11:00-12:00', 1),
(4, '2024-10-30', '08:00-09:00', 0),
(5, '2024-10-31', '12:00-13:00', 1);

-- Thêm dữ liệu vào bảng EnableLog
INSERT INTO [dbo].[EnableLog] (EntityType, EntityId, IsEnabled, ChangedDate) VALUES 
('Court', 1, 1, GETDATE()),
('Court', 2, 1, GETDATE()),
('Court', 3, 0, GETDATE()),
('User', 1, 1, GETDATE()),
('User', 3, 0, GETDATE());
