using Microsoft.Extensions.DependencyInjection;
using Model;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using WPF_ManageCourt.ViewModel;

namespace WPF_ManageCourt
{
    /// <summary>
    /// Interaction logic for CourtView.xaml
    /// </summary>
    public partial class CourtView : Window
    {
        public CourtView()
        {
            InitializeComponent();
            var serviceProvider = App.ServiceProvider;
            DataContext = serviceProvider.GetService<CourtViewModel>();
        }
    }
}
