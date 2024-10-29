using BusinessLogic.Interface;
using Model;
using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using WPF_ManageCourt.CourtManage;
using WPF_ManageCourt.ViewModel;

public class CourtViewModel : BaseViewModel
{
    private readonly IBadmintonCourtService _courtService;
    private readonly ICourtImageService _courtImageService;
    private ObservableCollection<BadmintonCourt> _courts;
    private BadmintonCourt _selectedCourt;
    private string _searchQuery;

    public CourtViewModel(IBadmintonCourtService courtService, ICourtImageService courtImageService)
    {
        _courtService = courtService;
        _courtImageService = courtImageService;
        InitializeCommands();
        LoadData();
    }

    #region Properties

    public ObservableCollection<BadmintonCourt> Courts
    {
        get => _courts;
        set
        {
            _courts = value;
            OnPropertyChanged(nameof(Courts));
        }
    }

    public BadmintonCourt SelectedCourt
    {
        get => _selectedCourt;
        set
        {
            _selectedCourt = value;
            OnPropertyChanged(nameof(SelectedCourt));
        }
    }

    public string SearchQuery
    {
        get => _searchQuery;
        set
        {
            _searchQuery = value;
            OnPropertyChanged(nameof(SearchQuery));
            SearchCourts(); // Automatically filter courts when SearchQuery changes
        }
    }

    #endregion

    #region Commands

    public ICommand SearchCommand { get; private set; }
    public ICommand AddCourtCommand { get; private set; }
    public ICommand EditCourtCommand { get; private set; }
    public ICommand DeleteCourtCommand { get; private set; }

    private void InitializeCommands()
    {
        SearchCommand = new RelayCommand<object>(_ => true, _ => SearchCourts());
        AddCourtCommand = new RelayCommand<object>(_ => true, _ => AddCourt());
        EditCourtCommand = new RelayCommand<object>(_ => SelectedCourt != null, _ => EditCourt());
        DeleteCourtCommand = new RelayCommand<object>(_ => SelectedCourt != null, _ => DeleteCourt());
    }

    #endregion

    #region Methods

    public async void LoadData()
    {
        try
        {
            var courts = await _courtService.GetListAllCourtsAsync();
            Courts = new ObservableCollection<BadmintonCourt>(courts);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Error loading courts: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }

    private void SearchCourts()
    {
        if (string.IsNullOrWhiteSpace(SearchQuery))
        {
            LoadData();
            return;
        }

        var filteredCourts = _courts.Where(c =>
            c.CourtName.Contains(SearchQuery, StringComparison.OrdinalIgnoreCase) ||
            c.Location.Contains(SearchQuery, StringComparison.OrdinalIgnoreCase)
        ).ToList();

        Courts = new ObservableCollection<BadmintonCourt>(filteredCourts);
    }

    private void AddCourt()
    {
        var courtCreateWindow = new CourtCreate(_courtService)
        {
            Owner = Application.Current.MainWindow,
            WindowStartupLocation = WindowStartupLocation.CenterOwner
        };

        if (courtCreateWindow.ShowDialog() == true)
        {
            LoadData();
        }
    }

    private void EditCourt()
    {
        if (SelectedCourt == null)
        {
            MessageBox.Show("Please select a court to update.", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
            return;
        }

        var courtUpdateWindow = new CourtUpdate(_courtService, SelectedCourt)
        {
            Owner = Application.Current.MainWindow,
            WindowStartupLocation = WindowStartupLocation.CenterOwner
        };

        if (courtUpdateWindow.ShowDialog() == true)
        {
            LoadData();
        }
    }

    private async void DeleteCourt()
    {
        if (SelectedCourt == null)
        {
            MessageBox.Show("Please select a court to delete.", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
            return;
        }

        var result = MessageBox.Show("Are you sure you want to delete this court?", "Confirm Delete", MessageBoxButton.YesNo, MessageBoxImage.Warning);
        if (result != MessageBoxResult.Yes) return;

        try
        {
            await _courtService.DeleteCourtAsync(SelectedCourt.CourtId);
            LoadData();
            MessageBox.Show("Court deleted successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Error deleting court: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }

    #endregion
}
