using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Microsoft.Extensions.DependencyInjection;
using Model;

namespace WPF_ManageCourt
{
    /// <summary>
    /// Interaction logic for Accessory.xaml
    /// </summary>
    public partial class AccessoryView : Window
    {
        public AccessoryView()
        {
            InitializeComponent();
            var serviceProvider = App.ServiceProvider;
            DataContext = serviceProvider.GetService<AccessoryViewModel>();
        }
        private void DataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var dataGrid = sender as DataGrid;
            if (dataGrid.SelectedItem != null)
            {
                var accessory = dataGrid.SelectedItem as Model.Accessory;
                var viewModel = DataContext as AccessoryViewModel;
                viewModel.SelectedAccessory = accessory;
               
                viewModel.IsUpdateAccessoryDialogOpen = true;
            }
        }
    }
}
