using BusinessLogic.Interface;
using BusinessLogic.Service;
using Microsoft.Extensions.DependencyInjection;
using Repositories.Interface;
using Repositories;
using System;
using System.Windows;
using WPF_ManageCourt.ViewModel;
using DataAccess.DAO;

namespace WPF_ManageCourt
{
    public partial class App : Application
    {
        public static IServiceProvider ServiceProvider { get; private set; }

        protected override void OnStartup(StartupEventArgs e)
        {
            // Thiết lập Dependency Injection
            var serviceCollection = new ServiceCollection();
            ConfigureServices(serviceCollection);

            ServiceProvider = serviceCollection.BuildServiceProvider();

            var mainWindow = ServiceProvider.GetRequiredService<DashBoard>();
            mainWindow.Show();
        }

        private void ConfigureServices(ServiceCollection services)
        {
            // Register services
            services.AddTransient<IBadmintonCourtService, BadmintonCourtService>();
            services.AddTransient<ICourtImageService, CourtImageService>();
            services.AddTransient<ICourtScheduleService, CourtScheduleService>();
            services.AddTransient<IAccessoryService, AccessoryService>();
            services.AddTransient<IBookingService,BookingService>();
            services.AddTransient<ICourtScheduleService, CourtScheduleService>();
            services.AddTransient<IBookingAccessoryService, BookingAccessoryService>();
            services.AddTransient<CourtScheduleDAO, CourtScheduleDAO>();
            services.AddTransient<BookingAccessoryDAO, BookingAccessoryDAO>();
            services.AddTransient<BookingDAO, BookingDAO>();
            services.AddTransient<UserDAO, UserDAO>();
            // Register UserRepository and UserService
            services.AddTransient<IUserRepository, UserRepository>(); 
            services.AddTransient<IUserService, UserService>();
            services.AddTransient<IBookingRepository, BookingRepository>();
            services.AddTransient<ICourtScheduleRepository, CourtScheduleRepository>();
            services.AddTransient<IBookingAccessoryRepository, BookingAccessoryRepository>();
            // Register ViewModels
            services.AddTransient<UserViewModel>();
           services.AddTransient<StatisticsViewModel>();
            // Register MainWindow
            services.AddTransient<DashBoard>();
            services.AddTransient<UserView>();
        }

    }
}
