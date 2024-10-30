using BusinessLogic.Interface;
using BusinessLogic.Service;
using Microsoft.Extensions.DependencyInjection;
using Repositories.Interface;
using Repositories;
using System;
using System.Windows;
using WPF_ManageCourt.ViewModel;
using DataAccess.DAO;
using WPF_ManageCourt.ScheduleCourt;

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

            /*var mainWindow = ServiceProvider.GetRequiredService<UserView>();
            mainWindow.Show();*/
            var mainWindow = ServiceProvider.GetRequiredService<ScheduleCourtManage>();
            mainWindow.Show();
        }

        private void ConfigureServices(ServiceCollection services)
        {
            // Register services
            services.AddTransient<IBadmintonCourtService, BadmintonCourtService>();
            services.AddTransient<ICourtImageService, CourtImageService>();
            services.AddTransient<ICourtScheduleService, CourtScheduleService>();
            services.AddTransient<IAccessoryService, AccessoryService>();

            services.AddTransient<BadmintonCourtDAO>();
            services.AddTransient<CourtScheduleDAO>();
            services.AddTransient<UserDAO, UserDAO>();
            // Register UserRepository and UserService
            services.AddTransient<IUserRepository, UserRepository>(); 
            services.AddTransient<IUserService, UserService>();
            services.AddTransient<IBadmintonCourtRepository, BadmintonCourtRepository>();
            services.AddTransient<ICourtScheduleRepository, CourtScheduleRepository>();

            // Register ViewModels
            services.AddTransient<UserViewModel>();
            services.AddTransient<ScheduleCourtModel>();

            // Register MainWindow
            services.AddTransient<MainWindow>();
            services.AddTransient<UserView>();
            services.AddTransient<ScheduleCourtManage>();
        }

    }
}
