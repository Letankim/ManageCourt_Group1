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

            var mainWindow = ServiceProvider.GetRequiredService<AccessoryView>();
            mainWindow.Show();
        }

        private void ConfigureServices(ServiceCollection services)
        {
            // Register services
            services.AddTransient<IBadmintonCourtService, BadmintonCourtService>();
            services.AddTransient<ICourtImageService, CourtImageService>();
            services.AddTransient<ICourtScheduleService, CourtScheduleService>();
            services.AddTransient<IAccessoryService, AccessoryService>();

            services.AddTransient<UserDAO, UserDAO>();
            services.AddTransient<AccessoryDAO, AccessoryDAO>();
            // Register UserRepository and UserService
            services.AddTransient<IUserRepository, UserRepository>(); 
            services.AddTransient<IUserService, UserService>();

            // Register AccessoryRepository and AccessoryService
            services.AddTransient<IAccessoryRepository, AccessoryRepository>();
            services.AddTransient<IAccessoryService, AccessoryService>();

            // Register ViewModels
            services.AddTransient<UserViewModel>();
            services.AddTransient<AccessoryViewModel>();

            // Register MainWindow
            services.AddTransient<MainWindow>();
            services.AddTransient<UserView>();
            services.AddTransient<AccessoryView>();
        }

    }
}
