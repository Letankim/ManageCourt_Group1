using Model;
using Repositories;
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
using WPF_ManageCourt.ViewModel;

namespace WPF_ManageCourt.ScheduleCourt
{
    /// <summary>
    /// Interaction logic for ScheduleCourtManage.xaml
    /// </summary>
    public partial class ScheduleCourtManage : Window
    {
        private readonly ScheduleCourtModel _scheduleCourtModel;

        public ScheduleCourtManage(ScheduleCourtModel scheduleCourtModel)
        {
            InitializeComponent();
            _scheduleCourtModel = scheduleCourtModel;
            LoadTimeSlots();
        }

        private void LoadTimeSlots()
        {
            // Lấy danh sách khung giờ từ repository và gán vào ComboBox
            TimeSlotComboBox.ItemsSource = _scheduleCourtModel.GetTimeSlots();
        }

        private async void AddButton_Click(object sender, RoutedEventArgs e)
        {
            var newSchedule = new CourtSchedule
            {
                CourtId = int.Parse(CourtIdTextBox.Text),
                Date = DateOnly.FromDateTime(DateDatePicker.SelectedDate ?? DateTime.Now),
                TimeSlot = TimeSlotComboBox.Text.ToString(),
                IsAvailable = IsAvailableCheckBox.IsChecked ?? false
            };

            if(await _scheduleCourtModel.AddSchedule(newSchedule))
            {
                MessageBox.Show("Lịch đặt sân đã được thêm.");
                ClearForm();
            }
            else
            {
                MessageBox.Show("Thêm lịch đặt sân không thành công");
            }
        }

        private async void UpdateButton_Click(object sender, RoutedEventArgs e)
        {
            if (int.TryParse(CourtIdTextBox.Text, out int courtId))
            {
                var success = await _scheduleCourtModel.EditSchedule(
                    new CourtSchedule {
                    CourtId = courtId,
                    Date = DateOnly.FromDateTime(DateDatePicker.SelectedDate ?? DateTime.Now),
                    TimeSlot = TimeSlotComboBox.Text,
                    IsAvailable = IsAvailableCheckBox.IsChecked ?? false
                    }
                );

                if (success)
                {
                    MessageBox.Show("Lịch đặt sân đã được cập nhật.");
                    ClearForm();
                }
                else
                {
                    MessageBox.Show("Lịch đặt sân không tồn tại để cập nhật.");
                }
            }
        }

        private async void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (int.TryParse(CourtIdTextBox.Text, out int courtId))
            {
                var success = await _scheduleCourtModel.DeleteSchedule(
                    courtId
                );

                if (success)
                {
                    MessageBox.Show("Lịch đặt sân đã được xóa.");
                    ClearForm();
                }
                else
                {
                    MessageBox.Show("Không tìm thấy lịch đặt sân để xóa.");
                }
            }
        }

        private void ClearForm()
        {
            CourtIdTextBox.Clear();
            DateDatePicker.SelectedDate = null;
            TimeSlotComboBox.SelectedIndex = -1;
            IsAvailableCheckBox.IsChecked = false;
        }
    }
}
