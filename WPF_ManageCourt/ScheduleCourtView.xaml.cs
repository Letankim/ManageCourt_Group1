using DataAccess;
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

namespace WPF_ManageCourt
{
    /// <summary>
    /// Interaction logic for ScheduleCourtView.xaml
    /// </summary>
    public partial class ScheduleCourtView : Window
    {
        private ManageCourtContext _context; // Đảm bảo khởi tạo DbContext của bạn

        public ScheduleCourtView()
        {
            InitializeComponent();
            _context = new ManageCourtContext();
            DatePicker.SelectedDateChanged += DatePicker_SelectedDateChanged;
        }

        private void DatePicker_SelectedDateChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            // Khi ngày thay đổi, tải lại danh sách các sân trống
            DateTime selectedDate = DatePicker.SelectedDate ?? DateTime.Today;
            LoadAvailableCourts(selectedDate);
        }

        private void LoadAvailableCourts(DateTime selectedDate)
        {
            // Lấy danh sách sân còn trống cho ngày đã chọn
            var availableCourts = _context.CourtSchedules
                .Where(s => s.Date == DateOnly.FromDateTime(selectedDate))
                .Distinct()
                .ToList();

            // Nếu không có sân trống
            if (availableCourts.Count == 0)
            {
                CourtComboBox.ItemsSource = null;
                CourtComboBox.IsEnabled = false;
            }
            else
            {
                CourtComboBox.Items.Clear();
                CourtComboBox.IsEnabled = true;
                CourtComboBox.ItemsSource = availableCourts;
            }
        }

        private void BookCourt_Click(object sender, RoutedEventArgs e)
        {
            if (CourtComboBox.SelectedItem == null || DatePicker.SelectedDate == null)
            {
                MessageBox.Show("Please select a date and an available court.");
                return;
            }

            // Lấy sân và ngày đã chọn
            string selectedCourt = CourtComboBox.SelectedItem.ToString();
            DateTime selectedDate = DatePicker.SelectedDate.Value;

            // Cập nhật sân đã được đặt và đặt IsAvailable thành false
            var courtSchedule = _context.CourtSchedules
                .FirstOrDefault(s => s.Date.Equals(selectedDate.Date) && s.Court.CourtName == selectedCourt);

            if (courtSchedule != null)
            {
                courtSchedule.IsAvailable = false;
                _context.SaveChanges();
                ConfirmationText.Text = $"Successfully booked {selectedCourt} on {selectedDate.ToShortDateString()}!";
                LoadAvailableCourts(selectedDate); // Cập nhật lại danh sách sân trống
            }
        }
    }
}
