   M S B A M L   `   `   `  ����J  FWPF_ManageCourt, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullC&clr-namespace:WPF_ManageCourt.ControlsWPF_ManageCourt.Controls  5   	   =#clr-namespace:WPF_ManageCourt.UtilsWPF_ManageCourt.Utils  5   	       WPF_ManageCourt.CourtView   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   _ [MaterialDesignThemes.Wpf, Version=5.1.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   2local&clr-namespace:WPF_ManageCourt.Controls  5   	   0helper#clr-namespace:WPF_ManageCourt.Utils  5   	     � Title$  Court Management��5   	   $	��600��6"   $
��1000��6/    � 	Resources 5	      1   +WPF_ManageCourt.Utils.BoolToStatusConverter   BoolToStatusConverter5   /WPF_ManageCourt.Utils.BoolToVisibilityConverter  BoolToVisibilityConverter��%:   &	        &	        5
   
   6'     5   
   6+   5      .��5      �  � RowDefinitions 5   
   �� 5      $��50 �6   �� 5      $��* �6   �� 5      $��30 �6    � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5      $��* �6   .+�5   
   %   WPF_ManageCourt.Controls.Header  $��0��6   $��0��6$   $��2��64   $
��auto��6H   $	��Top=�6V   -   'WPF_ManageCourt.Controls.SidebarControl  5   
   $��1��6   $��0��6,   $
��auto��6<   $��Stretch=�6J   � 5   
   $��0��6   $��1��6   $��Stretch=�6,   $��0,0,10,0q�6J    5      �� 5!      $��3* �6#   �� 5"      $
��Auto �6#   �� 5#      $
��Auto �6#   .+�5'      �� $��0��6   $��150,12,10,2q�6&   $	��5,2q�6;   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Search courts...��5)      $��35��6H   ��5(      �� *SearchQuery+ �� UpdateSourceTrigger$ PropertyChanged=�5)   H   �� 5,      $��1��6   $��Search��6%   $	��100��66   $��35��6B   $��	0,10,10,0q�6N     
ButtonInfo#��[ 5-   7   ��6   �� *SearchCommand+67   �� 50      $��2��6   $��	Add Court��6%   $	��100��69   $��35��6E   $��0,10,0,0q�6Q     ButtonPrimary#��[ 51   9   ��6   �� *AddCourtCommand+69   53      � 56   
   $��1��6   $��1��6   $��10q�6,    57      �� 58      $
��Auto �6    �� 59      $��* �6    �� 5:      $
��Auto �6    .+�5>      &   System.Windows.Controls.DataGrid  $��1��6      AutoGenerateColumns$ False��6C      
IsReadOnly$
 True��6_   $��0,10,0,0q�5?   >   ��5>   $   �� *Courts+ �� SelectedItem 5?      �� *SelectedCourt+	   Columns	 5@      0  *System.Windows.Controls.DataGridTextColumn  5A      ,  &System.Windows.Controls.DataGridColumn
   Header$
 Court ID��6)      Width5	  /System.Windows.Controls.DataGridLengthConverter$	 100	 6W   1
  +System.Windows.Controls.DataGridBoundColumn 
  Binding 6;   �� *	CourtId+6W     5B      $
 Owner ID��6)   $	 100	 6W    6;   �� *	OwnerId+6W     5C      $
 
Court Name��6)   $	 150	 6[    6=   �� *	CourtName+6[     5D      $
 Location��6)   $	 150	 6X    6;   �� *
Location+6X     5E      $
 Description��6)   $	 200	 6^    6>   �� *Description+6^     5F      $
 	Maps Link��6)   $	 200	 6Y    6<   �� *
MapsLink+6Y     5G      $
 Price Per Hour��6)   $	 100	 6b    6A   �� *PricePerHour+6b     5H      $
 
Start Time��6)   $	 100	 6[    6=   �� *	StartTime+6[     5I      $
 End Time��6)   $	 100	 6W    6;   �� *	EndTime+6W     5J      $
 Status��6)   $	 100	 6�    69   �� *	IsEnabled+ �� 	Converter# [  6�   4  .System.Windows.Controls.DataGridTemplateColumn  5M      $
 Action��6-   $	 200	 6=      CellTemplate 5N      �� 5O      .R�5P   "   ��  �� Orientation$ 
Horizontal=�6-   $��Center=�6F   .+�5R   &   �� $��Update��6-   #��[ 5U   -   
�������$��5,0,5,0q�5W   -   ��5S   -   �� *DataContext.EditCourtCommand+ �� RelativeSource ��  �� AncestorType DataGrid��5T   -   �� ��5X   -   Z� �� 5\   &   $��Delete��6-     ButtonDanger#��[ 5_   -   
�������$��5,0,5,0q�5a   -   ��5]   -   �� * DataContext.DeleteCourtCommand+ ��  DataGrid��5^   -   �� ��5b   -   Z� 5d   #   5e      5g      5j      5k      %   WPF_ManageCourt.Controls.Footer  5n   
   $��2��6   $��0��6$   $��2��64   $
��auto��6H   $	��Top=�6V   5o      5p      