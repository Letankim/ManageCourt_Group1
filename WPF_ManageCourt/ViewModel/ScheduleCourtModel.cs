using BusinessLogic.Interface;
using Microsoft.EntityFrameworkCore;
using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace WPF_ManageCourt.ViewModel
{
    public class ScheduleCourtModel : BaseViewModel
    {
        private readonly ICourtScheduleService _scheduleService;
        private readonly IBadmintonCourtService _courtService;
        private ObservableCollection<CourtSchedule> _schedules;
        private CourtSchedule _selectedSchedule;
        private string _searchQuery;

        public ScheduleCourtModel(IBadmintonCourtService courtService, ICourtScheduleService scheduleService)
        {
            _courtService = courtService;
            _scheduleService = scheduleService;
            LoadData();
        }

        public List<string> GetTimeSlots()
        {
            return new List<string>
            {
                "0:00 - 1:00",
                "4:00 - 5:00",
                "5:00 - 6:00",
                "6:00 - 7:00",
                "7:00 - 8:00",
                "8:00 - 9:00",
                "9:00 - 10:00",
                "10:00 - 11:00",
                "11:00 - 12:00",
                "12:00 - 13:00",
                "13:00 - 14:00",
                "14:00 - 15:00",
                "15:00 - 16:00",
                "16:00 - 17:00",
                "17:00 - 18:00",
                "18:00 - 19:00",
                "19:00 - 20:00",
                "20:00 - 21:00",
                "21:00 - 22:00",
                "22:00 - 23:00",
                "23:00 - 24:00"
            };
        }

        #region Properties

        public ObservableCollection<CourtSchedule> Schedules
        {
            get => _schedules;
            set
            {
                _schedules = value;
                OnPropertyChanged(nameof(Schedules));
            }
        }

        public CourtSchedule SelectedSchedule
        {
            get => _selectedSchedule;
            set
            {
                _selectedSchedule = value;
                OnPropertyChanged(nameof(SelectedSchedule));
            }
        }

        public string SearchQuery
        {
            get => _searchQuery;
            set
            {
                _searchQuery = value;
                OnPropertyChanged(nameof(SearchQuery));
                //SearchSchedules(); // Automatically filter courts when SearchQuery changes
            }
        }

        #endregion

        #region Methods

        public async void LoadData()
        {
            try
            {
                var courts = await _courtService.GetCourtByIdAsync(3);
                var courtSchedules = await _scheduleService.GetScheduleByCourtIdAsync(courts.CourtId);
                Schedules = new ObservableCollection<CourtSchedule>(courtSchedules);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error loading schedules: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        //private void SearchSchedules()
        //{
        //    if (string.IsNullOrWhiteSpace(SearchQuery))
        //    {
        //        LoadData();
        //        return;
        //    }

        //    var filteredCourts = _schedules.Where(c =>
        //        c.Date.Contains(SearchQuery, StringComparison.OrdinalIgnoreCase)
        //    ).ToList();

        //    Courts = new ObservableCollection<BadmintonCourt>(filteredCourts);
        //}

        public async Task<bool> AddSchedule(CourtSchedule schedule)
        {
            try
            {
                await _scheduleService.AddScheduleAsync(schedule);
                LoadData();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<bool> EditSchedule(CourtSchedule schedule)
        {
            try
            {
                await _scheduleService.UpdateScheduleAsync(schedule);
                LoadData();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<bool> DeleteSchedule(int scheduleId)
        {
            try
            {
                await _scheduleService.DeleteScheduleAsync(scheduleId);
                LoadData();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
    #endregion
}
