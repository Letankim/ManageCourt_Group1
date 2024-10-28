using BusinessLogic.Interface;
using Model;
using System.Collections.Generic;
using System.Threading.Tasks;
using Repositories.Interface;
using DataAccess.DAO;

namespace BusinessLogic.Service
{
    public class BookingService : IBookingService
    {
        private readonly IBookingRepository bookingRepository;

        public BookingService(IBookingRepository bookingRepository)
        {
            this.bookingRepository = bookingRepository;
        }

        public async Task AddBookingAsync(Booking item)
        {
            await bookingRepository.AddBookingAsync(item);
        }

        public async Task DeleteBookingAsync(int id)
        {
            await bookingRepository.DeleteBookingAsync(id);
        }

        public async Task<Booking> GetBookingByIdAsync(int id)
        {
            return await bookingRepository.GetBookingByIdAsync(id);
        }

        public async Task<IEnumerable<Booking>> GetListAllBookingsAsync()
        {
            return await bookingRepository.GetAllBookingsAsync();
        }

        public async Task UpdateBookingAsync(Booking item)
        {
            await bookingRepository.UpdateBookingAsync(item);
        }
        public async Task<Dictionary<DateOnly, decimal>> StatisticsAsync(DateOnly startDay, DateOnly endDay)
        {
            return await bookingRepository.StatisticsAsync(startDay, endDay);
        }
        public async Task<Dictionary<DateOnly, (int Confirmed, int NoShow, int Cancelled)>> StatisticStatus(DateOnly startDay, DateOnly endDay)
        {
            return await bookingRepository.StatisticStatus(startDay, endDay);
        }
        public async Task<Dictionary<DateOnly, (int AfterPlay, int Online)>> StatisticPayment(DateOnly startDay, DateOnly endDay)
        {
            return await bookingRepository.StatisticPayment(startDay, endDay);

        }
    }
}
