   M S B A M L   `   `   `  ����  WPF_ManageCourt-    'WPF_ManageCourt.CourtManage.CourtCreate   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=5.1.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	     � Title$  	Add Court��5   	   $	��700��6   $	��800��6(   .��5	      � .+�5
   
   �� $
��Auto=�6   .��5      �� $��20q�6   .+�5      �� $��
Court Name��6   $	��0,5q�6.   $
��Bold"�6;   
���   �6M   �� 5      -   5         ��Name$ txtCourtName��5      $	��0,5q�60   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ 
Court Name��5      �� 5      $��Owner ID (Optional)��6   $	��0,5q�67   $
��Bold"�6D   
���   �6V   �� 5      -   5        $ 
txtOwnerId��5      $	��0,5q�6.   $ Owner ID (Optional)��5      �� 5      $��Location��6   $	��0,5q�6,   $
��Bold"�69   
���   �6K   �� 5      -   5        $ txtLocation��5      $	��0,5q�6/   $ Location��5      �� 5      $��Description (Optional)��6   $	��0,5q�6:   $
��Bold"�6G   
���   �6Y   �� 5      -   5        $ txtDescription��5      $	��0,5q�62   $ Description (Optional)��5      �� 5!      $��Maps Link (Optional)��6   $	��0,5q�68   $
��Bold"�6E   
���   �6W   �� 5"      -   5        $ txtMapsLink��5"      $	��0,5q�6/   $ Maps Link (Optional)��5#      �� 5&      $��Price Per Hour��6   $	��0,5q�62   $
��Bold"�6?   
���   �6Q   �� 5'      -   5        $ txtPrice��5'      $	��0,5q�6,   $ Price Per Hour��5(      �� 5+      $��
Start Time��6   $	��0,5q�6.   $
��Bold"�6;   
���   �6M   )  #MaterialDesignThemes.Wpf.TimePicker  5,      -   5          Name$ timePickerStartTime��5,   ,   $	��0,5q�6I   $ Select Start Time��5-   ,   �� 50      $��End Time��6   $	��0,5q�6,   $
��Bold"�69   
���   �6K     51      -   5        $ timePickerEndTime��51   ,   $	��0,5q�6G   $ Select End Time��52   ,   �� 55      $��Status��6   $	��0,5q�6*   $
��Bold"�67   
���   �6I   �� 56      -	   5         ��Name$ 	cmbStatus��56      $	��0,5q�6.   $ Status��57      .@�58      �� $��Active��6#   �� 59      $��Inactive��6#   5:      �� 5=      $��Image URL (Optional)��6   $	��0,5q�68   $
��Bold"�6E   
���   �6W   �� 5>      -
   5        $ txtImageUrl��5>      $	��0,5q�6/   $ Image URL (Optional)��5?      �� 5B      $��Upload Image��6   $	��0,5q�60   $
��Bold"�6=   
���   �6O   �� 5C      -   5        $��Upload Image��5C      $	��0,5q�60   $	��150��6=      ButtonPrimary#��[  5D      
�������5F      �� 5I       �� Orientation$ 
Horizontal=�6   $��Right=�66   $��0,20,0,0q�6R   .+�5J      �� -   5        $	��Add��5J      $	��100��6+   $��5q�67     ButtonSuccess#��[ 5K      
�������5M      �� 5N      -   5        $��Cancel��5N      $	��100��6.   $��5q�6:     ButtonDanger#��[ 5O      
�������5Q      5R      5S      5T      5U      5V      