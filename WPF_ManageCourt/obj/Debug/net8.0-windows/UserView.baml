   M S B A M L   `   `   `  ����J  FWPF_ManageCourt, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullC&clr-namespace:WPF_ManageCourt.ControlsWPF_ManageCourt.Controls  5   	   =#clr-namespace:WPF_ManageCourt.UtilsWPF_ManageCourt.Utils  5   	       WPF_ManageCourt.UserView   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   _ [MaterialDesignThemes.Wpf, Version=5.1.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   8local&clr-namespace:WPF_ManageCourt.Controls     5   	   6helper#clr-namespace:WPF_ManageCourt.Utils     5   	     � Title$  OmniLogin App��5   	   $	��600��6   $	��800��6,      BackgroundMainContent#��[  68    � 	Resources 5      1   +WPF_ManageCourt.Utils.BoolToStatusConverter  BoolToStatusConverter5   /WPF_ManageCourt.Utils.BoolToVisibilityConverter  BoolToVisibilityConverter*   $WPF_ManageCourt.Utils.IndexConverter  IndexNoConverter<   6WPF_ManageCourt.Utils.InverseBoolToVisibilityConverter $  InverseBoolToVisibilityConverter��%t   &	       &	      &	 &     &	 9       5	   
   6'     5
   
   6+     5   
   6      5   
   62   5      .��5      �  � RowDefinitions 5   
   �� 5      $��50 �6   �� 5      $��* �6   �� 5      $��30 �6    � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5      $��* �6   .+�5   
   %   WPF_ManageCourt.Controls.Header  $��0��6   $��0��6$   $��2��64   $
��auto��6H   $	��Top=�6V   -   'WPF_ManageCourt.Controls.SidebarControl  5   
   $��1��6   $��0��6,   $
��auto��6<   $��Stretch=�6J   � 5    
   $��1��6   $��1��6   $��10q�6,    5!      �� 5"      $
��Auto �6    �� 5#      $��* �6    .+�5%      � $��0��6   $��Right=�6     5&      �� 5'      $
��Auto �6$   �� 5(      $
��Auto �6$   .+�5+      � $��0��6   $��Right=�6$    5,      �� 5-      $��* �6+   �� 5.      $
��Auto �6+   .+�51      �� -   5         ��Name$ 	txtSearch��55      $��0��51      $��-486,0,10,0q�52      $	��5,2q�53      $��35��56      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Search users...��57      ��54      �� *SearchQuery+ �� UpdateSourceTrigger$ PropertyChanged=�57      �� 58      $��1��6   $��Search��59        MaterialDesignFlatButton#��[ 5:        
ButtonInfo#��[ 5;      $��35��5<      $��0,0,10,0q�6   ��5=      �� *SearchCommand+5?      � 5A      $��1��6   $��Right=�6$    5B      �� 5C      $
��Auto �6+   �� 5D      $
��Auto �6+   .+�5G      �� -   5        $��0��5G      $��Import��5H      #��[ 5I        ButtonPrimary#��[ 5J      $��35��5K      $��-56,10,57,-10q�5L   (    � ContextMenu 5M      �� 5N      .@�5O   "   m� $��Import JSON��6+    m� CommandParameter$
 json��6b   	 m� Command	 6@   �� *ImportCommand+6b   m� 5P   "   $��Import Excel��6+   $ excel��6c   	 6A   �� *ImportCommand+6c   5Q      5S      �� 5U      -   5        $��Export��5V      #��[ 5W      #��[ 5X      $��35��5Y      $��2��5Z      $��66,10,10,-10q�5[       5]      �� 5^      .@�5_   "   m� $��Export JSON��6+   $
 json��5a      	 5`      �� *ExportCommand+5a      m� 5c   "   $��Export Excel��6+   $ excel��5e      	 5d      �� *ExportCommand+5e      5g      5i      5k      5l      �� 5n      $��1��6   $��0��6"   $��5q�62   ._�5o      �� $��1��6   $��0��6*   $��5q�6:   .+�5p      �� $��Danh sách người dùng��6    $��16(�6<   
�������$��0,0,0,10q�6]   �� 5q      $��No users found.��6    $��16(�67   
���  ��y�6V   �� *IsUsersEmpty+
 �� 	Converter#
 [ �� 5r      $
��Auto=�6#   $
��Auto=�6F   .��5s      &   System.Windows.Controls.DataGrid  -   5          BackgroundMainTable#��[ 5s   #      AutoGenerateColumns$ False��5v         
IsReadOnly$
 True��5w      $��0,10,0,0q�5x       	 PrimaryHueMidBrush#��� 	 5y      $��1q�5z       
 MaterialDesignDataGrid#��[
 5}      ��5t      �� *Users+ �� SelectedItem 5u      �� *SelectedUser+y�5|      �� *IsUsersEmpty+#
 [    Columns 5~      4	  .System.Windows.Controls.DataGridTemplateColumn	  5   "   ,
  &System.Windows.Controls.DataGridColumn 
  Header$	 .No��69    
  Width5  /System.Windows.Controls.DataGridLengthConverter$ 50 6F    	  CellTemplate 5�   &   �� 5�   *   .R�5�   .   �� ��68   ��  �� RelativeSource ��  �� AncestorType)  #System.Windows.Controls.DataGridRow"  #
 [ 5�   +   5�   #   0  *System.Windows.Controls.DataGridTextColumn  5�   "   $ 	Full Name��65   $	 200 6e   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6H   �� *
FullName+6e     5�   "   $ Username��65   $	 200 6d    6G   �� *
Username+6d     5�   "   $ Email��65   $	 200 6^    6D   �� *Email+6^     5�   "   $ Phone��65   $	 150 6^    6D   �� *Phone+6^     5�   "   $
 Role��65   $	 150 6\    6C   �� *Role+6\     5�   "   $ Active��65   $	 150 6c    6E   �� *	IsEnabled+6c   5�      5�      5�      5�      5�      %   WPF_ManageCourt.Controls.Footer  5�   
   $��2��6   $��0��6$   $��2��64   $
��auto��6H   $	��Top=�6V   )  #MaterialDesignThemes.Wpf.DialogHost  5�   
   -   5          Name$ AddUserDialog��5�   c      CloseOnClickAway$
 True��6K      IsOpen 6$   �� *IsAddUserDialogOpen+   DialogContent 5�      � 5�      $��Center=�6   $��Center=�64   .+�5�      �� $��20q�6!   $	��300��6-   .+�5�      �� $��Add New User��6$   $
��Bold"�68   $��20(�6J   $��0,0,0,20q�6X   �� 5�      $
��0,10q�5�      $ Fullname��5�      ��5�      �� *SelectedUser.FullName+$ PropertyChanged=��� 5�      $
��0,10q�5�      $ Username��5�      ��5�      �� *SelectedUser.Username+$ PropertyChanged=��� 5�      $
��0,10q�5�      $ Email Address��5�      ��5�      �� *SelectedUser.Email+$ PropertyChanged=��� 5�      $
��0,10q�5�      $ Phone Number��5�      ��5�      �� *SelectedUser.Phone+$ PropertyChanged=��� 5�      $
��0,10q�5�      $ Select Role��5�      ��5�      �� *	UserRoles+ 5�      �� *SelectedUser.Role+$ PropertyChanged=�G� 5�      -   5         G�Name$ PasswordBoxControl��5�      $
��0,10q�5�      $ Password��5�      5�      �� 5�      $
��0,10q�5�      $ Select Status��5�      ��5�      �� *StatusOptions+ 5�      �� *SelectedUser.IsEnabled+#
 [ $ PropertyChanged=�5�      �� 5�       �� Orientation$ 
Horizontal=�6%   $��Right=�6>   $��0,20,0,0q�6Z   .+�5�      �� $��Cancel��5�      #��[ 5�      $��0,0,10,0q�5�      $2��,materialDesign:DialogHost.CloseDialogCommand��5�        ButtonDanger#��[ 5�      �� 5�      $	��Add��5�      #��[ 5�        ButtonSuccess#��[ 5�      ��5�      �� *AddUserCommand+5�      5�      5�      5�      5�        5�   
   -   5        $ UpdateUserDialog��5�   f   $
 True��6N    6$   �� *IsUpdateUserDialogOpen+ 5�      � 5�      $��Center=�6   $��Center=�64   .+�5�      �� $��20q�6!   $	��300��6-   .+�5�      �� $��Update User��6$   $
��Bold"�67   $��20(�6I   $��0,0,0,20q�6W   �� 5�      $
��0,10q�5�      ${�false��5�      $ ID��5�      ��5�      �� *SelectedUser.UserId+$ PropertyChanged=��� 5�      $
��0,10q�5�      $ Fullname��5�      ��5�      �� *SelectedUser.FullName+$ PropertyChanged=��� 5�      $
��0,10q�5�      $ Username��5�      ��5�      �� *SelectedUser.Username+$ PropertyChanged=��� 5�      $
��0,10q�5�      $ Email Address��5�      ��5�      �� *SelectedUser.Email+$ PropertyChanged=��� 5�      $
��0,10q�5�      $ Phone Number��5�      ��5      �� *SelectedUser.Phone+$ PropertyChanged=��� 5     $
��0,10q�5     $ Select Role��5     ��5     �� *	UserRoles+ 5     �� *SelectedUser.Role+$ PropertyChanged=��� 5	     -   5        $
��0,10q�5
     $ Select Status��5     ��5     �� *StatusOptions+ 5     �� *SelectedUser.IsEnabled+#
 [ $ PropertyChanged=�5     �� 5     $ 
Horizontal=�6%   $��Right=�6>   $��0,20,0,0q�6Z   .+�5     �� $��Cancel��5     #��[ 5     $��0,0,10,0q�5     $2��,materialDesign:DialogHost.CloseDialogCommand��5     #��[ 5     �� 5     $��Update��5     #��[ 5     #��[ 5     ��5     �� *EditCommand+5     �� 5!     $��Delete��5"     #��[ 5#     #��[ 5%     ��5$     �� *DeleteCommand+5%     5&     5'     5(     5*       5+  
   -	   5        $ AlertDialogHost��5+  $    6=   �� *IsShowMessageDialog+ 5,     �� 5-     .+�5.     �� $��16(�69   $
��Bold"�6G   $��	0,10,0,10q�6Y   ��6    �� *	Message+6Y   �� 5/     $��OK��6   $2��,materialDesign:DialogHost.CloseDialogCommand��6+   50     52     53     54     