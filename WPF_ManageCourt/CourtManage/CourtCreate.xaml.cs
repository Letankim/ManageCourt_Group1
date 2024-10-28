using System;
using System.IO;
using System.Windows;
using Microsoft.Win32;
using Model;
using BusinessLogic.Interface;
using System.Windows.Controls;

namespace WPF_ManageCourt.CourtManage
{
    public partial class CourtCreate : Window
    {
        private readonly IBadmintonCourtService _courtService;
        private string _imageFilePath;

        public CourtCreate(IBadmintonCourtService courtService)
        {
            InitializeComponent();
            _courtService = courtService ?? throw new ArgumentNullException(nameof(courtService));
        }

        private async void AddButton_Click(object sender, RoutedEventArgs e)
        {
            // Validate and collect data from input fields
            if (!ValidateInput(out decimal pricePerHour, out TimeOnly startTime, out TimeOnly endTime, out int? ownerId))
            {
                // Exit if validation fails
                return;
            }

            // Determine the status from the ComboBox (Active/Inactive)
            bool isEnabled = cmbStatus.SelectedItem is ComboBoxItem selectedStatus &&
                             selectedStatus.Content.ToString() == "Active";

            // Create a new BadmintonCourt object
            var newCourt = new BadmintonCourt
            {
                CourtName = txtCourtName.Text.Trim(),
                OwnerId = ownerId,
                Location = txtLocation.Text.Trim(),
                Description = string.IsNullOrWhiteSpace(txtDescription.Text) ? null : txtDescription.Text.Trim(),
                MapsLink = string.IsNullOrWhiteSpace(txtMapsLink.Text) ? null : txtMapsLink.Text.Trim(),
                PricePerHour = pricePerHour,
                StartTime = startTime,
                EndTime = endTime,
                IsEnabled = isEnabled
            };

            // Handle image input
            if (!string.IsNullOrWhiteSpace(txtImageUrl.Text))
            {
                // If an image URL is provided, add it to the court images
                newCourt.CourtImages.Add(new CourtImage { ImageUrl = txtImageUrl.Text.Trim() });
            }
            else if (!string.IsNullOrWhiteSpace(_imageFilePath))
            {
                // If an image file is uploaded, save it and add to the court images
                string fileName = Path.GetFileName(_imageFilePath);
                string imageUrl = SaveImageFile(_imageFilePath, fileName); // Implement the actual image saving logic
                newCourt.CourtImages.Add(new CourtImage { ImageUrl = imageUrl });
            }

            try
            {
                // Call the service to add the court
                await _courtService.AddCourtAsync(newCourt);
                MessageBox.Show("Court added successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                this.DialogResult = true; // Close the dialog with a success result
                this.Close();
            }
            catch (Exception ex)
            {
                var innerMessage = ex.InnerException != null ? ex.InnerException.Message : "No further details.";
                MessageBox.Show($"Error adding court: {ex.Message}\nDetails: {innerMessage}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }


        private bool ValidateInput(out decimal pricePerHour, out TimeOnly startTime, out TimeOnly endTime, out int? ownerId)
        {
            pricePerHour = 0;
            startTime = default;
            endTime = default;
            ownerId = null;

            // Check required fields for empty values
            if (string.IsNullOrWhiteSpace(txtCourtName.Text) ||
                string.IsNullOrWhiteSpace(txtLocation.Text) ||
                string.IsNullOrWhiteSpace(txtPrice.Text) ||
                !timePickerStartTime.SelectedTime.HasValue ||
                !timePickerEndTime.SelectedTime.HasValue)
            {
                MessageBox.Show("Please fill in all required fields.", "Validation Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            }

            // Validate price
            if (!decimal.TryParse(txtPrice.Text, out pricePerHour) || pricePerHour <= 0)
            {
                MessageBox.Show("Please enter a valid positive price.", "Validation Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            }

            // Validate start and end times
            startTime = TimeOnly.FromDateTime(timePickerStartTime.SelectedTime.Value);
            endTime = TimeOnly.FromDateTime(timePickerEndTime.SelectedTime.Value);

            if (startTime >= endTime)
            {
                MessageBox.Show("The start time must be earlier than the end time.", "Validation Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            }

            // Validate Owner ID if provided
            if (!string.IsNullOrWhiteSpace(txtOwnerId.Text))
            {
                if (!int.TryParse(txtOwnerId.Text, out int parsedOwnerId))
                {
                    MessageBox.Show("Please enter a valid numeric Owner ID.", "Validation Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return false;
                }
                ownerId = parsedOwnerId; // Assign the parsed value directly
            }

            return true;
        }

        private void UploadImageButton_Click(object sender, RoutedEventArgs e)
        {
            // Open file dialog to select an image
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

        private string SaveImageFile(string filePath, string fileName)
        {
            // Implement logic to save the image file to a desired location and return the new URL or path
            // For now, just return the original file path as a placeholder
            return filePath;
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            // Close the window without making any changes
            this.Close();
        }
    }
}
