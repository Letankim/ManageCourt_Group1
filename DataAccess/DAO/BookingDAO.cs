using Microsoft.EntityFrameworkCore;
using Model;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DataAccess.DAO
{
    public class BookingDAO : SingletonBase<Booking>
    {

        public async Task<List<Booking>> GetAllBookingsAsync()
        {
            return await _context.Bookings.ToListAsync();
        }

        public async Task<Booking> GetBookingByIdAsync(int bookingId)
        {
            return await _context.Bookings.FindAsync(bookingId);
        }

        public async Task AddBookingAsync(Booking booking)
        {
            await _context.Bookings.AddAsync(booking);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateBookingAsync(Booking booking)
        {
            _context.Bookings.Update(booking);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteBookingAsync(int bookingId)
        {
            var booking = await _context.Bookings.FindAsync(bookingId);
            if (booking != null)
            {
                _context.Bookings.Remove(booking);
                await _context.SaveChangesAsync();
            }
        }

        // Thống kê doanh thu 
        public async Task<Dictionary<DateOnly, decimal>> StatisticsAsync(DateOnly startDay, DateOnly endDay)
        {
            // Lọc booking và tính toán doanh thu
            var filteredBookings = await _context.Bookings
                .Where(b => b.BookingDate >= startDay
                            && b.BookingDate <= endDay
                            && b.BookingStatus == "Confirmed"
                            && b.PaymentStatus == "Completed")
                .ToListAsync(); // Lấy danh sách booking dưới dạng List

            // Nhóm theo ngày và tính tổng doanh thu cho từng ngày
            var dailyRevenue = filteredBookings
                .GroupBy(b => b.BookingDate)
                .ToDictionary(g => g.Key, g => g.Sum(b => b.TotalPrice));

            return dailyRevenue;
        }

        public async Task<Dictionary<DateOnly, (int Confirmed, int NoShow, int Cancelled)>> StatisticStatus(DateOnly startDay, DateOnly endDay)
        {
            // Initialize a dictionary to store the statistics with each date as a key
            var statistics = new Dictionary<DateOnly, (int Confirmed, int NoShow, int Cancelled)>();

            // Retrieve the booking data with status filters
            var bookingsInRange = await _context.Bookings
                .Where(b => b.BookingDate >= startDay && b.BookingDate <= endDay &&
                            (b.BookingStatus == "Confirmed" || b.BookingStatus == "NoShow" || b.BookingStatus == "Cancelled"))
                .ToListAsync();

            // Iterate over each booking in the specified date range
            foreach (var booking in bookingsInRange)
            {
                var bookingDate = booking.BookingDate;

                // Initialize or update statistics for each date
                if (!statistics.ContainsKey(bookingDate))
                {
                    statistics[bookingDate] = (Confirmed: 0, NoShow: 0, Cancelled: 0);
                }

                // Update the count based on BookingStatus
                switch (booking.BookingStatus?.ToLower()) // Using ToLower() to avoid case-sensitivity issues
                {
                    case "confirmed":
                        statistics[bookingDate] = (statistics[bookingDate].Confirmed + 1, statistics[bookingDate].NoShow, statistics[bookingDate].Cancelled);
                        break;
                    case "noshow":
                        statistics[bookingDate] = (statistics[bookingDate].Confirmed, statistics[bookingDate].NoShow + 1, statistics[bookingDate].Cancelled);
                        break;
                    case "cancelled":
                        statistics[bookingDate] = (statistics[bookingDate].Confirmed, statistics[bookingDate].NoShow, statistics[bookingDate].Cancelled + 1);
                        break;
                }
            }

            return statistics;
        }
        public async Task<Dictionary<DateOnly, (int AfterPlay, int Online)>> StatisticPayment(DateOnly startDay, DateOnly endDay)
        {
            var statistics = new Dictionary<DateOnly, (int AfterPlay, int Online)>();

            // Retrieve the booking data with status filters
            var bookingsInRange = await _context.Bookings
                .Where(b => b.BookingDate >= startDay && b.BookingDate <= endDay &&
                            (b.PaymentMethod == "AfterPlay" || b.PaymentMethod == "Online"))
                .ToListAsync();

            // Iterate over each booking in the specified date range
            foreach (var booking in bookingsInRange)
            {
                var bookingDate = booking.BookingDate;

                // Initialize or update statistics for each date
                if (!statistics.ContainsKey(bookingDate))
                {
                    statistics[bookingDate] = (AfterPlay: 0, Online: 0);
                }

                // Update the count based on BookingStatus
                switch (booking.PaymentMethod?.ToLower()) // Using ToLower() to avoid case-sensitivity issues
                {
                    case "afterplay":
                        statistics[bookingDate] = (statistics[bookingDate].AfterPlay + 1, statistics[bookingDate].Online);
                        break;
                    case "online":
                        statistics[bookingDate] = (statistics[bookingDate].AfterPlay, statistics[bookingDate].Online + 1);
                        break;
                    
                }
            }

            return statistics;
        }
    }
}
