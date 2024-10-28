using System;
using System.Linq;
using System.Windows;
using Microsoft.Win32;
using Model;
using BusinessLogic.Interface;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace WPF_ManageCourt.CourtManage
{
    public partial class CourtUpdate : Window
    {
        private readonly IBadmintonCourtService _courtService;
        private BadmintonCourt _court;
        private string _imageFilePath;

        public CourtUpdate(IBadmintonCourtService courtService, BadmintonCourt court)
        {
            InitializeComponent();
            _courtService = courtService ?? throw new ArgumentNullException(nameof(courtService));
            _court = court ?? throw new ArgumentNullException(nameof(court));
            LoadCourtData();
        }

        private void LoadCourtData()
        {
            // Populate the fields with the existing court data
            txtCourtName.Text = _court.CourtName;
            txtOwnerId.Text = _court.OwnerId?.ToString();
            txtLocation.Text = _court.Location;
            txtDescription.Text = _court.Description;
            txtMapsLink.Text = _court.MapsLink;
            txtPrice.Text = _court.PricePerHour.ToString();
            timePickerStartTime.SelectedTime = DateTime.Today.Add(_court.StartTime.ToTimeSpan());
            timePickerEndTime.SelectedTime = DateTime.Today.Add(_court.EndTime.ToTimeSpan());
            cmbStatus.SelectedIndex = _court.IsEnabled == true ? 0 : 1;
            txtImageUrl.Text = _court.CourtImages.Count > 0 ? _court.CourtImages.First().ImageUrl : string.Empty;
        }

        private async void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            // Validate and collect data from input fields
            if (!ValidateInput(out decimal pricePerHour, out TimeOnly startTime, out TimeOnly endTime, out int? ownerId))
            {
                return;
            }

            // Determine the status from the ComboBox (Active/Inactive)
            bool isEnabled = cmbStatus.SelectedItem is ComboBoxItem selectedStatus &&
                             selectedStatus.Content.ToString() == "Active";

            // Update the court object
            _court.CourtName = txtCourtName.Text.Trim();
            _court.OwnerId = ownerId;
            _court.Location = txtLocation.Text.Trim();
            _court.Description = string.IsNullOrWhiteSpace(txtDescription.Text) ? null : txtDescription.Text.Trim();
            _court.MapsLink = string.IsNullOrWhiteSpace(txtMapsLink.Text) ? null : txtMapsLink.Text.Trim();
            _court.PricePerHour = pricePerHour;
            _court.StartTime = startTime;
            _court.EndTime = endTime;
            _court.IsEnabled = isEnabled;

            // Handle the image update logic
            if (!string.IsNullOrWhiteSpace(_imageFilePath))
            {
                string fileName = System.IO.Path.GetFileName(_imageFilePath);
                string imageUrl = SaveImageFile(_imageFilePath, fileName); // Save and get the URL

                // Check if there's an existing image in the collection
                var existingImage = _court.CourtImages.FirstOrDefault();
                if (existingImage != null)
                {
                    existingImage.ImageUrl = imageUrl; // Update the existing image
                }
                else
                {
                    // If no image exists, add a new one
                    _court.CourtImages.Add(new CourtImage { ImageUrl = imageUrl });
                }
            }

            try
            {
                await _courtService.UpdateCourtAsync(_court);
                MessageBox.Show("Court updated successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                this.DialogResult = true; // Indicate success
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error updating court: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void UploadImageButton_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "Image Files (*.png;*.jpg;*.jpeg)|*.png;*.jpg;*.jpeg",
                Title = "Select an Image"
            };

            if (openFileDialog.ShowDialog() == true)
            {
                _imageFilePath = openFileDialog.FileName;
                MessageBox.Show("Image selected successfully.", "Image Upload", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private bool ValidateInput(out decimal pricePerHour, out TimeOnly startTime, out TimeOnly endTime, out int? ownerId)
        {
            pricePerHour = 0;
            startTime = default;
            endTime = default;
            ownerId = null;
            int parsedOwnerId = 0; // Initialize parsedOwnerId

            if (string.IsNullOrWhiteSpace(txtCourtName.Text) || string.IsNullOrWhiteSpace(txtLocation.Text) ||
                string.IsNullOrWhiteSpace(txtPrice.Text) || !timePickerStartTime.SelectedTime.HasValue ||
                !timePickerEndTime.SelectedTime.HasValue)
            {
                MessageBox.Show("Please fill in all required fields.", "Validation Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            }

            if (!decimal.TryParse(txtPrice.Text, out pricePerHour) || pricePerHour <= 0)
            {
                MessageBox.Show("Please enter a valid positive price.", "Validation Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            }

            startTime = TimeOnly.FromDateTime(timePickerStartTime.SelectedTime.Value);
            endTime = TimeOnly.FromDateTime(timePickerEndTime.SelectedTime.Value);

            if (startTime >= endTime)
            {
                MessageBox.Show("The start time must be earlier than the end time.", "Validation Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            }

            if (!string.IsNullOrWhiteSpace(txtOwnerId.Text))
            {
                if (!int.TryParse(txtOwnerId.Text, out parsedOwnerId))
                {
                    MessageBox.Show("Please enter a valid numeric Owner ID.", "Validation Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return false;
                }
                ownerId = parsedOwnerId; // Assign the parsed value
            }

            return true;
        }


        private string SaveImageFile(string filePath, string fileName)
        {
            // Implement the logic to save the image file to a desired location and return the new URL or path
            // For now, this is a placeholder that returns the original file path
            return filePath;
        }
    }
}
