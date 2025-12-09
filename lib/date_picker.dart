import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

/// Date selection mode for the picker
enum DateSelectionMode {
  /// Select a single date
  single,

  /// Select a date range (start and end dates)
  range,
}

/// Styling configuration for the EnhancedDateRangePicker
///
/// This class encapsulates all visual styling options for the date picker,
/// allowing consistent customization across all display modes (modal bottom sheet,
/// dialog, and embedded widget).
///
/// Example usage:
/// ```dart
/// final customStyle = DatePickerStyle(
///   backgroundColor: Colors.grey[100]!,
///   primaryColor: Colors.purple,
///   headerStyle: DatePickerHeaderStyle(
///     titleStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
///   ),
/// );
///
/// EnhancedDateRangePicker.show(
///   context: context,
///   style: customStyle,
///   onDateSelected: (start, end) {},
/// );
/// ```
class DatePickerStyle {
  /// Background color for the picker container
  final Color backgroundColor;

  /// Primary accent color (used for selected dates, buttons, etc.)
  /// This overrides the `primaryColor` parameter if both are provided
  final Color primaryColor;

  /// Border color for the embedded widget mode
  final Color borderColor;

  /// Border radius for modal bottom sheet (top corners only)
  final double modalBorderRadius;

  /// Border radius for dialog mode
  final double dialogBorderRadius;

  /// Border radius for embedded widget mode
  final double embeddedBorderRadius;

  /// Content padding inside the picker
  final EdgeInsets contentPadding;

  /// Padding for the calendar section
  final EdgeInsets calendarPadding;

  /// Header styling configuration
  final DatePickerHeaderStyle headerStyle;

  /// Calendar styling configuration
  final DatePickerCalendarStyle calendarStyle;

  /// Day cell styling configuration
  final DatePickerDayCellStyle dayCellStyle;

  /// Action buttons styling configuration
  final DatePickerButtonStyle buttonStyle;

  /// Selected dates display styling configuration
  final DatePickerSelectedDatesStyle selectedDatesStyle;

  const DatePickerStyle({
    this.backgroundColor = Colors.white,
    this.primaryColor = const Color(0xFF2196F3),
    this.borderColor = const Color(0xFFE0E0E0),
    this.modalBorderRadius = 20.0,
    this.dialogBorderRadius = 20.0,
    this.embeddedBorderRadius = 12.0,
    this.contentPadding = const EdgeInsets.all(20),
    this.calendarPadding = const EdgeInsets.symmetric(horizontal: 20),
    this.headerStyle = const DatePickerHeaderStyle(),
    this.calendarStyle = const DatePickerCalendarStyle(),
    this.dayCellStyle = const DatePickerDayCellStyle(),
    this.buttonStyle = const DatePickerButtonStyle(),
    this.selectedDatesStyle = const DatePickerSelectedDatesStyle(),
  });

  /// Creates a copy of this style with the given fields replaced
  DatePickerStyle copyWith({
    Color? backgroundColor,
    Color? primaryColor,
    Color? borderColor,
    double? modalBorderRadius,
    double? dialogBorderRadius,
    double? embeddedBorderRadius,
    EdgeInsets? contentPadding,
    EdgeInsets? calendarPadding,
    DatePickerHeaderStyle? headerStyle,
    DatePickerCalendarStyle? calendarStyle,
    DatePickerDayCellStyle? dayCellStyle,
    DatePickerButtonStyle? buttonStyle,
    DatePickerSelectedDatesStyle? selectedDatesStyle,
  }) {
    return DatePickerStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      primaryColor: primaryColor ?? this.primaryColor,
      borderColor: borderColor ?? this.borderColor,
      modalBorderRadius: modalBorderRadius ?? this.modalBorderRadius,
      dialogBorderRadius: dialogBorderRadius ?? this.dialogBorderRadius,
      embeddedBorderRadius: embeddedBorderRadius ?? this.embeddedBorderRadius,
      contentPadding: contentPadding ?? this.contentPadding,
      calendarPadding: calendarPadding ?? this.calendarPadding,
      headerStyle: headerStyle ?? this.headerStyle,
      calendarStyle: calendarStyle ?? this.calendarStyle,
      dayCellStyle: dayCellStyle ?? this.dayCellStyle,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      selectedDatesStyle: selectedDatesStyle ?? this.selectedDatesStyle,
    );
  }
}

/// Header styling configuration for the date picker
class DatePickerHeaderStyle {
  /// Padding for the header section
  final EdgeInsets padding;

  /// Text style for the title
  final TextStyle? titleStyle;

  /// Color of the title text (used if titleStyle is null)
  final Color titleColor;

  /// Font size of the title (used if titleStyle is null)
  final double titleFontSize;

  /// Font weight of the title (used if titleStyle is null)
  final FontWeight titleFontWeight;

  /// Width of the drag handle
  final double dragHandleWidth;

  /// Height of the drag handle
  final double dragHandleHeight;

  /// Color of the drag handle
  final Color dragHandleColor;

  /// Border radius of the drag handle
  final double dragHandleBorderRadius;

  /// Spacing between drag handle and title
  final double dragHandleSpacing;

  /// Icon for the close button
  final IconData closeIcon;

  /// Color of the close button icon
  final Color? closeIconColor;

  /// Size of the close button icon
  final double? closeIconSize;

  const DatePickerHeaderStyle({
    this.padding = const EdgeInsets.all(20),
    this.titleStyle,
    this.titleColor = Colors.black87,
    this.titleFontSize = 20.0,
    this.titleFontWeight = FontWeight.bold,
    this.dragHandleWidth = 40.0,
    this.dragHandleHeight = 4.0,
    this.dragHandleColor = const Color(0xFFE0E0E0),
    this.dragHandleBorderRadius = 2.0,
    this.dragHandleSpacing = 16.0,
    this.closeIcon = Icons.close,
    this.closeIconColor,
    this.closeIconSize,
  });

  /// Get the effective title text style
  TextStyle getEffectiveTitleStyle() {
    return titleStyle ??
        TextStyle(
          fontSize: titleFontSize,
          fontWeight: titleFontWeight,
          color: titleColor,
        );
  }

  DatePickerHeaderStyle copyWith({
    EdgeInsets? padding,
    TextStyle? titleStyle,
    Color? titleColor,
    double? titleFontSize,
    FontWeight? titleFontWeight,
    double? dragHandleWidth,
    double? dragHandleHeight,
    Color? dragHandleColor,
    double? dragHandleBorderRadius,
    double? dragHandleSpacing,
    IconData? closeIcon,
    Color? closeIconColor,
    double? closeIconSize,
  }) {
    return DatePickerHeaderStyle(
      padding: padding ?? this.padding,
      titleStyle: titleStyle ?? this.titleStyle,
      titleColor: titleColor ?? this.titleColor,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
      dragHandleWidth: dragHandleWidth ?? this.dragHandleWidth,
      dragHandleHeight: dragHandleHeight ?? this.dragHandleHeight,
      dragHandleColor: dragHandleColor ?? this.dragHandleColor,
      dragHandleBorderRadius:
          dragHandleBorderRadius ?? this.dragHandleBorderRadius,
      dragHandleSpacing: dragHandleSpacing ?? this.dragHandleSpacing,
      closeIcon: closeIcon ?? this.closeIcon,
      closeIconColor: closeIconColor ?? this.closeIconColor,
      closeIconSize: closeIconSize ?? this.closeIconSize,
    );
  }
}

/// Calendar styling configuration for the date picker
class DatePickerCalendarStyle {
  /// Bottom margin for each month section
  final double monthBottomMargin;

  /// Vertical padding for month header
  final double monthHeaderVerticalPadding;

  /// Font size for month name
  final double monthNameFontSize;

  /// Font weight for month name
  final FontWeight monthNameFontWeight;

  /// Color for month name (null uses primary color)
  final Color? monthNameColor;

  /// Font size for weekday labels
  final double weekdayFontSize;

  /// Font weight for weekday labels
  final FontWeight weekdayFontWeight;

  /// Color for weekday labels
  final Color weekdayColor;

  /// Spacing between weekday header and calendar grid
  final double weekdayGridSpacing;

  /// Spacing between months in two-column layout
  final double monthColumnSpacing;

  const DatePickerCalendarStyle({
    this.monthBottomMargin = 24.0,
    this.monthHeaderVerticalPadding = 12.0,
    this.monthNameFontSize = 18.0,
    this.monthNameFontWeight = FontWeight.bold,
    this.monthNameColor,
    this.weekdayFontSize = 12.0,
    this.weekdayFontWeight = FontWeight.w600,
    this.weekdayColor = const Color(0xFF757575),
    this.weekdayGridSpacing = 8.0,
    this.monthColumnSpacing = 16.0,
  });

  DatePickerCalendarStyle copyWith({
    double? monthBottomMargin,
    double? monthHeaderVerticalPadding,
    double? monthNameFontSize,
    FontWeight? monthNameFontWeight,
    Color? monthNameColor,
    double? weekdayFontSize,
    FontWeight? weekdayFontWeight,
    Color? weekdayColor,
    double? weekdayGridSpacing,
    double? monthColumnSpacing,
  }) {
    return DatePickerCalendarStyle(
      monthBottomMargin: monthBottomMargin ?? this.monthBottomMargin,
      monthHeaderVerticalPadding:
          monthHeaderVerticalPadding ?? this.monthHeaderVerticalPadding,
      monthNameFontSize: monthNameFontSize ?? this.monthNameFontSize,
      monthNameFontWeight: monthNameFontWeight ?? this.monthNameFontWeight,
      monthNameColor: monthNameColor ?? this.monthNameColor,
      weekdayFontSize: weekdayFontSize ?? this.weekdayFontSize,
      weekdayFontWeight: weekdayFontWeight ?? this.weekdayFontWeight,
      weekdayColor: weekdayColor ?? this.weekdayColor,
      weekdayGridSpacing: weekdayGridSpacing ?? this.weekdayGridSpacing,
      monthColumnSpacing: monthColumnSpacing ?? this.monthColumnSpacing,
    );
  }
}

/// Day cell styling configuration for the date picker
class DatePickerDayCellStyle {
  /// Height of each day cell
  final double cellHeight;

  /// Margin around each day cell
  final EdgeInsets cellMargin;

  /// Font size for day numbers
  final double dayFontSize;

  /// Font weight for normal days
  final FontWeight dayFontWeight;

  /// Font weight for selected days
  final FontWeight selectedDayFontWeight;

  /// Border radius for selected start/end dates
  final double selectedBorderRadius;

  /// Border radius for dates in range
  final double inRangeBorderRadius;

  /// Border radius for hovered dates
  final double hoveredBorderRadius;

  /// Border radius for today indicator
  final double todayBorderRadius;

  /// Border radius for out of range dates
  final double outOfRangeBorderRadius;

  /// Border width for today indicator
  final double todayBorderWidth;

  /// Border width for out of range indicator
  final double outOfRangeBorderWidth;

  /// Background color for selected dates (null uses primary color)
  final Color? selectedBackgroundColor;

  /// Text color for selected dates
  final Color selectedTextColor;

  /// Background opacity for dates in range (0.0 - 1.0)
  final double inRangeBackgroundOpacity;

  /// Text color for dates in range (null uses primary color)
  final Color? inRangeTextColor;

  /// Background opacity for hovered dates (0.0 - 1.0)
  final double hoveredBackgroundOpacity;

  /// Text color for hovered dates (null uses primary color)
  final Color? hoveredTextColor;

  /// Text color for today (null uses primary color)
  final Color? todayTextColor;

  /// Text color for normal days
  final Color normalTextColor;

  /// Text color for disabled/past days
  final Color disabledTextColor;

  /// Background color for out of range dates
  final Color outOfRangeBackgroundColor;

  /// Text color for out of range dates
  final Color outOfRangeTextColor;

  /// Border color for out of range dates
  final Color outOfRangeBorderColor;

  const DatePickerDayCellStyle({
    this.cellHeight = 44.0,
    this.cellMargin = const EdgeInsets.all(2),
    this.dayFontSize = 14.0,
    this.dayFontWeight = FontWeight.normal,
    this.selectedDayFontWeight = FontWeight.bold,
    this.selectedBorderRadius = 20.0,
    this.inRangeBorderRadius = 8.0,
    this.hoveredBorderRadius = 20.0,
    this.todayBorderRadius = 20.0,
    this.outOfRangeBorderRadius = 8.0,
    this.todayBorderWidth = 2.0,
    this.outOfRangeBorderWidth = 1.0,
    this.selectedBackgroundColor,
    this.selectedTextColor = Colors.white,
    this.inRangeBackgroundOpacity = 0.2,
    this.inRangeTextColor,
    this.hoveredBackgroundOpacity = 0.1,
    this.hoveredTextColor,
    this.todayTextColor,
    this.normalTextColor = Colors.black87,
    this.disabledTextColor = const Color(0xFFBDBDBD),
    this.outOfRangeBackgroundColor = const Color(0x1AFF0000),
    this.outOfRangeTextColor = const Color(0xFFC62828),
    this.outOfRangeBorderColor = const Color(0x80FF0000),
  });

  DatePickerDayCellStyle copyWith({
    double? cellHeight,
    EdgeInsets? cellMargin,
    double? dayFontSize,
    FontWeight? dayFontWeight,
    FontWeight? selectedDayFontWeight,
    double? selectedBorderRadius,
    double? inRangeBorderRadius,
    double? hoveredBorderRadius,
    double? todayBorderRadius,
    double? outOfRangeBorderRadius,
    double? todayBorderWidth,
    double? outOfRangeBorderWidth,
    Color? selectedBackgroundColor,
    Color? selectedTextColor,
    double? inRangeBackgroundOpacity,
    Color? inRangeTextColor,
    double? hoveredBackgroundOpacity,
    Color? hoveredTextColor,
    Color? todayTextColor,
    Color? normalTextColor,
    Color? disabledTextColor,
    Color? outOfRangeBackgroundColor,
    Color? outOfRangeTextColor,
    Color? outOfRangeBorderColor,
  }) {
    return DatePickerDayCellStyle(
      cellHeight: cellHeight ?? this.cellHeight,
      cellMargin: cellMargin ?? this.cellMargin,
      dayFontSize: dayFontSize ?? this.dayFontSize,
      dayFontWeight: dayFontWeight ?? this.dayFontWeight,
      selectedDayFontWeight:
          selectedDayFontWeight ?? this.selectedDayFontWeight,
      selectedBorderRadius: selectedBorderRadius ?? this.selectedBorderRadius,
      inRangeBorderRadius: inRangeBorderRadius ?? this.inRangeBorderRadius,
      hoveredBorderRadius: hoveredBorderRadius ?? this.hoveredBorderRadius,
      todayBorderRadius: todayBorderRadius ?? this.todayBorderRadius,
      outOfRangeBorderRadius:
          outOfRangeBorderRadius ?? this.outOfRangeBorderRadius,
      todayBorderWidth: todayBorderWidth ?? this.todayBorderWidth,
      outOfRangeBorderWidth:
          outOfRangeBorderWidth ?? this.outOfRangeBorderWidth,
      selectedBackgroundColor:
          selectedBackgroundColor ?? this.selectedBackgroundColor,
      selectedTextColor: selectedTextColor ?? this.selectedTextColor,
      inRangeBackgroundOpacity:
          inRangeBackgroundOpacity ?? this.inRangeBackgroundOpacity,
      inRangeTextColor: inRangeTextColor ?? this.inRangeTextColor,
      hoveredBackgroundOpacity:
          hoveredBackgroundOpacity ?? this.hoveredBackgroundOpacity,
      hoveredTextColor: hoveredTextColor ?? this.hoveredTextColor,
      todayTextColor: todayTextColor ?? this.todayTextColor,
      normalTextColor: normalTextColor ?? this.normalTextColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      outOfRangeBackgroundColor:
          outOfRangeBackgroundColor ?? this.outOfRangeBackgroundColor,
      outOfRangeTextColor: outOfRangeTextColor ?? this.outOfRangeTextColor,
      outOfRangeBorderColor:
          outOfRangeBorderColor ?? this.outOfRangeBorderColor,
    );
  }
}

/// Button styling configuration for the date picker
class DatePickerButtonStyle {
  /// Padding for the action buttons container
  final EdgeInsets containerPadding;

  /// Background color for the action buttons container
  final Color containerBackgroundColor;

  /// Vertical padding inside buttons
  final double buttonVerticalPadding;

  /// Border radius for buttons
  final double buttonBorderRadius;

  /// Spacing between cancel and confirm buttons
  final double buttonSpacing;

  /// Border color for cancel button
  final Color cancelButtonBorderColor;

  /// Text color for cancel button
  final Color cancelButtonTextColor;

  /// Font size for button text
  final double buttonFontSize;

  /// Font weight for confirm button text
  final FontWeight confirmButtonFontWeight;

  /// Elevation for confirm button
  final double confirmButtonElevation;

  /// Show shadow on button container
  final bool showContainerShadow;

  /// Shadow color for button container
  final Color containerShadowColor;

  /// Shadow blur radius
  final double containerShadowBlurRadius;

  /// Shadow spread radius
  final double containerShadowSpreadRadius;

  /// Shadow offset
  final Offset containerShadowOffset;

  const DatePickerButtonStyle({
    this.containerPadding = const EdgeInsets.all(20),
    this.containerBackgroundColor = Colors.white,
    this.buttonVerticalPadding = 16.0,
    this.buttonBorderRadius = 12.0,
    this.buttonSpacing = 16.0,
    this.cancelButtonBorderColor = const Color(0xFFBDBDBD),
    this.cancelButtonTextColor = const Color(0xFF757575),
    this.buttonFontSize = 14.0,
    this.confirmButtonFontWeight = FontWeight.w600,
    this.confirmButtonElevation = 0.0,
    this.showContainerShadow = true,
    this.containerShadowColor = const Color(0x1A000000),
    this.containerShadowBlurRadius = 8.0,
    this.containerShadowSpreadRadius = 1.0,
    this.containerShadowOffset = const Offset(0, -2),
  });

  DatePickerButtonStyle copyWith({
    EdgeInsets? containerPadding,
    Color? containerBackgroundColor,
    double? buttonVerticalPadding,
    double? buttonBorderRadius,
    double? buttonSpacing,
    Color? cancelButtonBorderColor,
    Color? cancelButtonTextColor,
    double? buttonFontSize,
    FontWeight? confirmButtonFontWeight,
    double? confirmButtonElevation,
    bool? showContainerShadow,
    Color? containerShadowColor,
    double? containerShadowBlurRadius,
    double? containerShadowSpreadRadius,
    Offset? containerShadowOffset,
  }) {
    return DatePickerButtonStyle(
      containerPadding: containerPadding ?? this.containerPadding,
      containerBackgroundColor:
          containerBackgroundColor ?? this.containerBackgroundColor,
      buttonVerticalPadding:
          buttonVerticalPadding ?? this.buttonVerticalPadding,
      buttonBorderRadius: buttonBorderRadius ?? this.buttonBorderRadius,
      buttonSpacing: buttonSpacing ?? this.buttonSpacing,
      cancelButtonBorderColor:
          cancelButtonBorderColor ?? this.cancelButtonBorderColor,
      cancelButtonTextColor:
          cancelButtonTextColor ?? this.cancelButtonTextColor,
      buttonFontSize: buttonFontSize ?? this.buttonFontSize,
      confirmButtonFontWeight:
          confirmButtonFontWeight ?? this.confirmButtonFontWeight,
      confirmButtonElevation:
          confirmButtonElevation ?? this.confirmButtonElevation,
      showContainerShadow: showContainerShadow ?? this.showContainerShadow,
      containerShadowColor: containerShadowColor ?? this.containerShadowColor,
      containerShadowBlurRadius:
          containerShadowBlurRadius ?? this.containerShadowBlurRadius,
      containerShadowSpreadRadius:
          containerShadowSpreadRadius ?? this.containerShadowSpreadRadius,
      containerShadowOffset:
          containerShadowOffset ?? this.containerShadowOffset,
    );
  }
}

/// Selected dates display styling configuration
class DatePickerSelectedDatesStyle {
  /// Padding inside the selected date container
  final EdgeInsets containerPadding;

  /// Border radius for the selected date container
  final double containerBorderRadius;

  /// Background opacity for the selected date container (0.0 - 1.0)
  final double containerBackgroundOpacity;

  /// Top margin for the selected dates section
  final double topMargin;

  /// Spacing between start and end date containers
  final double containerSpacing;

  /// Font size for the date label (e.g., "Start Date")
  final double labelFontSize;

  /// Color for the date label
  final Color labelColor;

  /// Font size for the selected date value
  final double valueFontSize;

  /// Font weight for the selected date value
  final FontWeight valueFontWeight;

  /// Spacing between label and value
  final double labelValueSpacing;

  const DatePickerSelectedDatesStyle({
    this.containerPadding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
    this.containerBorderRadius = 8.0,
    this.containerBackgroundOpacity = 0.1,
    this.topMargin = 12.0,
    this.containerSpacing = 12.0,
    this.labelFontSize = 12.0,
    this.labelColor = const Color(0xFF757575),
    this.valueFontSize = 14.0,
    this.valueFontWeight = FontWeight.w600,
    this.labelValueSpacing = 4.0,
  });

  DatePickerSelectedDatesStyle copyWith({
    EdgeInsets? containerPadding,
    double? containerBorderRadius,
    double? containerBackgroundOpacity,
    double? topMargin,
    double? containerSpacing,
    double? labelFontSize,
    Color? labelColor,
    double? valueFontSize,
    FontWeight? valueFontWeight,
    double? labelValueSpacing,
  }) {
    return DatePickerSelectedDatesStyle(
      containerPadding: containerPadding ?? this.containerPadding,
      containerBorderRadius:
          containerBorderRadius ?? this.containerBorderRadius,
      containerBackgroundOpacity:
          containerBackgroundOpacity ?? this.containerBackgroundOpacity,
      topMargin: topMargin ?? this.topMargin,
      containerSpacing: containerSpacing ?? this.containerSpacing,
      labelFontSize: labelFontSize ?? this.labelFontSize,
      labelColor: labelColor ?? this.labelColor,
      valueFontSize: valueFontSize ?? this.valueFontSize,
      valueFontWeight: valueFontWeight ?? this.valueFontWeight,
      labelValueSpacing: labelValueSpacing ?? this.labelValueSpacing,
    );
  }
}

/// Enhanced Date Picker - A versatile date picker for any use case
/// Supports both single date selection and date range selection
/// Can be used as a standalone widget or shown as a modal bottom sheet
class EnhancedDateRangePicker extends StatefulWidget {
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  final Function(DateTime startDate, DateTime? endDate)? onDateSelected;

  /// Called whenever the user changes the current selection (start or end date)
  final Function(DateTime startDate, DateTime? endDate)? onDateChanged;
  final String title;
  final Color primaryColor;
  final Map<String, String>? translations;
  final String locale;
  final DateSelectionMode selectionMode;

  /// Whether to display as a modal bottom sheet (true) or standalone widget (false)
  final bool isModal;

  /// Height of the picker when used as a standalone widget
  /// Ignored when isModal is true
  final double? height;

  /// Width of the picker when used as a standalone widget
  /// Ignored when isModal is true
  final double? width;

  /// Maximum height of the picker when height is not specified
  /// Widget will adapt to available space but won't exceed this value
  /// Ignored when isModal is true or when height is specified
  final double? maxHeight;

  final int maxRangeDates;

  /// Earliest selectable date in the calendar (inclusive).
  /// If null, the earliest selectable date defaults to today (matching
  /// the previous behavior where past dates were disabled).
  final DateTime? minDate;

  /// Latest selectable date in the calendar (inclusive).
  /// If null, there is no upper bound on selectable dates.
  final DateTime? maxDate;

  /// Maximum width of the picker when width is not specified
  /// Widget will adapt to available space but won't exceed this value
  /// Ignored when isModal is true or when width is specified
  final double? maxWidth;

  /// Show/hide the entire header section (title and selected dates)
  final bool showHeader;

  /// Show/hide the title text within the header
  final bool showTitle;

  /// Show/hide the selected dates display in the header
  final bool showSelectedDates;

  /// Show/hide the bottom action buttons (Cancel and Confirm)
  final bool showActionButtons;

  /// Show/hide the Cancel button
  final bool showCancelButton;

  /// Show/hide the Confirm button
  final bool showConfirmButton;

  /// Automatically close the modal/widget after date selection
  /// When true (default): Closes automatically after confirming selection
  /// When false: You need to manually close using Navigator.pop(context)
  final bool autoClose;

  /// Styling configuration for the date picker
  /// If not provided, default styling will be used
  final DatePickerStyle? style;

  const EnhancedDateRangePicker({
    super.key,
    this.initialStartDate,
    this.initialEndDate,
    required this.onDateSelected,
    this.onDateChanged,
    this.title = '',
    this.primaryColor = const Color(0xFF2196F3),
    this.translations,
    this.locale = 'en',
    this.selectionMode = DateSelectionMode.range,
    this.isModal = true,
    this.height,
    this.width,
    this.maxHeight,
    this.maxWidth,
    this.showHeader = true,
    this.showTitle = true,
    this.showSelectedDates = true,
    this.showActionButtons = true,
    this.showCancelButton = true,
    this.showConfirmButton = true,
    this.autoClose = true,
    this.maxRangeDates = 10000,
    this.minDate,
    this.maxDate,
    this.style,
  });

  @override
  State<EnhancedDateRangePicker> createState() =>
      EnhancedDateRangePickerState();

  /// Show the date picker as a modal bottom sheet
  static Future<void> show({
    required BuildContext context,
    DateTime? initialStartDate,
    DateTime? initialEndDate,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(DateTime startDate, DateTime? endDate) onDateSelected,
    Function(DateTime startDate, DateTime? endDate)? onDateChanged,
    String title = '',
    Color primaryColor = const Color(0xFF2196F3),
    Map<String, String>? translations,
    String locale = 'en',
    DateSelectionMode selectionMode = DateSelectionMode.range,
    bool autoClose = true,
    int maxRangeDates = 10000,
    DatePickerStyle? style,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EnhancedDateRangePicker(
        initialStartDate: initialStartDate,
        initialEndDate: initialEndDate,
        minDate: minDate,
        maxDate: maxDate,
        onDateSelected: onDateSelected,
        onDateChanged: onDateChanged,
        title: title,
        primaryColor: primaryColor,
        translations: translations,
        locale: locale,
        selectionMode: selectionMode,
        isModal: true, // Always true for modal display
        autoClose: autoClose,
        maxRangeDates: maxRangeDates,
        style: style,
      ),
    );
  }

  /// Show the date picker as a centered dialog
  static Future<void> showAsDialog({
    required BuildContext context,
    DateTime? initialStartDate,
    DateTime? initialEndDate,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(DateTime startDate, DateTime? endDate) onDateSelected,
    Function(DateTime startDate, DateTime? endDate)? onDateChanged,
    String title = '',
    Color primaryColor = const Color(0xFF2196F3),
    Map<String, String>? translations,
    String locale = 'en',
    DateSelectionMode selectionMode = DateSelectionMode.range,
    bool autoClose = true,
    int maxRangeDates = 10000,
    double? dialogWidth,
    double? dialogHeight,
    DatePickerStyle? style,
  }) {
    final effectiveStyle = style ?? const DatePickerStyle();

    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;
        final width =
            dialogWidth ??
            (screenSize.width > 600 ? 700 : screenSize.width * 0.95);
        final height = dialogHeight ?? (screenSize.height * 0.85);

        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: effectiveStyle.backgroundColor,
              borderRadius: BorderRadius.circular(
                effectiveStyle.dialogBorderRadius,
              ),
            ),
            child: EnhancedDateRangePicker(
              initialStartDate: initialStartDate,
              initialEndDate: initialEndDate,
              minDate: minDate,
              maxDate: maxDate,
              onDateSelected: onDateSelected,
              onDateChanged: onDateChanged,
              title: title,
              primaryColor: primaryColor,
              translations: translations,
              locale: locale,
              selectionMode: selectionMode,
              isModal: true, // Use modal styling
              autoClose: autoClose,
              maxRangeDates: maxRangeDates,
              style: style,
            ),
          ),
        );
      },
    );
  }
}

/// Default translations for the date picker
class _DatePickerTranslations {
  static final Map<String, Map<String, String>> _defaultTranslations = {
    'en': {
      'datePicker.title': 'Select Date',
      'datePicker.titleRange': 'Select Date Range',
      'datePicker.startDate': 'Start Date',
      'datePicker.endDate': 'End Date',
      'datePicker.sunday': 'Sun',
      'datePicker.monday': 'Mon',
      'datePicker.tuesday': 'Tue',
      'datePicker.wednesday': 'Wed',
      'datePicker.thursday': 'Thu',
      'datePicker.friday': 'Fri',
      'datePicker.saturday': 'Sat',
      'datePicker.cancel': 'Cancel',
      'datePicker.confirm': 'Confirm',
    },
    'ar': {
      'datePicker.title': 'اختر التاريخ',
      'datePicker.titleRange': 'اختر نطاق التاريخ',
      'datePicker.startDate': 'تاريخ البداية',
      'datePicker.endDate': 'تاريخ النهاية',
      // Short Arabic abbreviations to keep header compact
      'datePicker.sunday': 'ح',
      'datePicker.monday': 'ن',
      'datePicker.tuesday': 'ث',
      'datePicker.wednesday': 'ر',
      'datePicker.thursday': 'خ',
      'datePicker.friday': 'ج',
      'datePicker.saturday': 'س',
      'datePicker.cancel': 'إلغاء',
      'datePicker.confirm': 'تأكيد',
    },
  };

  static String translate(
    String key,
    String locale,
    Map<String, String>? customTranslations,
  ) {
    // First check custom translations
    if (customTranslations != null && customTranslations.containsKey(key)) {
      return customTranslations[key]!;
    }

    // Then check default translations for the locale
    if (_defaultTranslations.containsKey(locale) &&
        _defaultTranslations[locale]!.containsKey(key)) {
      return _defaultTranslations[locale]![key]!;
    }

    // Fallback to English
    if (_defaultTranslations['en']!.containsKey(key)) {
      return _defaultTranslations['en']![key]!;
    }

    // Last resort: return the key itself
    return key;
  }
}

/// Public state class to allow access via GlobalKey when autoClose: false
class EnhancedDateRangePickerState extends State<EnhancedDateRangePicker>
    with TickerProviderStateMixin {
  DateTime? _startDate;
  DateTime? _endDate;
  DateTime _focusedDay = DateTime.now();
  bool _isSelectingEndDate = false;
  late ScrollController _scrollController;
  bool _localeInitialized = false;

  /// Keys for each day cell to support precise auto-scrolling
  final Map<String, GlobalKey> _dayCellKeys = {};

  /// Track which date is currently being hovered
  DateTime? _hoveredDate;

  /// Public getters for accessing selected dates (useful when autoClose: false)
  DateTime? get selectedStartDate => _startDate;
  DateTime? get selectedEndDate => _endDate;

  /// Helper method to translate strings
  String _translate(String key) {
    return _DatePickerTranslations.translate(
      key,
      widget.locale,
      widget.translations,
    );
  }

  /// Get the effective style (provided or default)
  DatePickerStyle get _style => widget.style ?? const DatePickerStyle();

  /// Get the effective primary color (style takes precedence over widget.primaryColor)
  Color get _primaryColor => widget.style?.primaryColor ?? widget.primaryColor;

  @override
  void initState() {
    super.initState();
    _startDate = widget.initialStartDate;
    _endDate = widget.initialEndDate;

    // Start from minDate if provided, otherwise from current month
    if (widget.minDate != null) {
      _focusedDay = DateTime(widget.minDate!.year, widget.minDate!.month, 1);
    } else {
      _focusedDay = DateTime.now();
    }
    _isSelectingEndDate = false; // Always start fresh with start date selection

    // Initialize scroll controller
    _scrollController = ScrollController();

    // Initialize locale data for DateFormat
    _initializeDateFormatting();

    // Auto-scroll to pre-selected dates after widget is built
    if (_startDate != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToSelectedDates();
      });
    }
  }

  /// Initialize date formatting for the selected locale
  Future<void> _initializeDateFormatting() async {
    try {
      await initializeDateFormatting(widget.locale, null);
      if (mounted) {
        setState(() {
          _localeInitialized = true;
        });
      }
    } catch (e) {
      // If initialization fails, we'll use English as fallback
      if (mounted) {
        setState(() {
          _localeInitialized = true;
        });
      }
    }
  }

  /// Format a stable key string for a given date (YYYY-MM-DD)
  String _formatDateKey(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisSize: widget.isModal ? MainAxisSize.max : MainAxisSize.min,
      children: [
        if (widget.showHeader) _buildHeader(),
        Expanded(child: _buildCalendar()),
        if (widget.showActionButtons) _buildActionButtons(),
      ],
    );

    if (widget.isModal) {
      // Modal bottom sheet style
      return Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          color: _style.backgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(_style.modalBorderRadius),
          ),
        ),
        child: content,
      );
    } else {
      // Standalone widget style
      Widget containerWidget = Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: _style.backgroundColor,
          borderRadius: BorderRadius.circular(_style.embeddedBorderRadius),
          border: Border.all(color: _style.borderColor),
        ),
        child: content,
      );

      // If width or height is not specified, use ConstrainedBox with maxWidth/maxHeight
      if (widget.width == null || widget.height == null) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: widget.maxWidth ?? double.infinity,
            maxHeight: widget.maxHeight ?? double.infinity,
          ),
          child: containerWidget,
        );
      }

      return containerWidget;
    }
  }

  Widget _buildHeader() {
    final headerStyle = _style.headerStyle;

    return Container(
      padding: headerStyle.padding,
      child: Column(
        children: [
          // Drag handle (only in modal mode)
          if (widget.isModal)
            Container(
              width: headerStyle.dragHandleWidth,
              height: headerStyle.dragHandleHeight,
              decoration: BoxDecoration(
                color: headerStyle.dragHandleColor,
                borderRadius: BorderRadius.circular(
                  headerStyle.dragHandleBorderRadius,
                ),
              ),
            ),
          if (widget.isModal) SizedBox(height: headerStyle.dragHandleSpacing),

          // Title
          if (widget.showTitle)
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title.isNotEmpty
                        ? widget.title
                        : _translate(
                            widget.selectionMode == DateSelectionMode.single
                                ? 'datePicker.title'
                                : 'datePicker.titleRange',
                          ),
                    style: headerStyle.getEffectiveTitleStyle(),
                  ),
                ),
                if (widget.isModal)
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      headerStyle.closeIcon,
                      color: headerStyle.closeIconColor,
                      size: headerStyle.closeIconSize,
                    ),
                  ),
              ],
            ),

          // Selected dates display
          if (widget.showSelectedDates && (_startDate != null))
            Padding(
              padding: EdgeInsets.only(
                top: _style.selectedDatesStyle.topMargin,
              ),
              child: _buildSelectedDatesDisplay(),
            ),
        ],
      ),
    );
  }

  Widget _buildSelectedDatesDisplay() {
    final selectedStyle = _style.selectedDatesStyle;

    if (widget.selectionMode == DateSelectionMode.single) {
      // Single date display
      return Container(
        padding: selectedStyle.containerPadding,
        decoration: BoxDecoration(
          color: _primaryColor.withValues(
            alpha: selectedStyle.containerBackgroundOpacity,
          ),
          borderRadius: BorderRadius.circular(
            selectedStyle.containerBorderRadius,
          ),
        ),
        child: Text(
          _startDate != null
              ? DateFormat('MMM dd, yyyy', widget.locale).format(_startDate!)
              : '',
          style: TextStyle(
            fontSize: selectedStyle.valueFontSize,
            fontWeight: selectedStyle.valueFontWeight,
            color: _primaryColor,
          ),
        ),
      );
    } else {
      // Date range display
      return Row(
        children: [
          Expanded(
            child: Container(
              padding: selectedStyle.containerPadding,
              decoration: BoxDecoration(
                color: _primaryColor.withValues(
                  alpha: selectedStyle.containerBackgroundOpacity,
                ),
                borderRadius: BorderRadius.circular(
                  selectedStyle.containerBorderRadius,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _translate('datePicker.startDate'),
                    style: TextStyle(
                      fontSize: selectedStyle.labelFontSize,
                      color: selectedStyle.labelColor,
                    ),
                  ),
                  SizedBox(height: selectedStyle.labelValueSpacing),
                  Text(
                    _startDate != null
                        ? DateFormat(
                            'MMM dd, yyyy',
                            widget.locale,
                          ).format(_startDate!)
                        : '-',
                    style: TextStyle(
                      fontSize: selectedStyle.valueFontSize,
                      fontWeight: selectedStyle.valueFontWeight,
                      color: _primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: selectedStyle.containerSpacing),
          Expanded(
            child: Container(
              padding: selectedStyle.containerPadding,
              decoration: BoxDecoration(
                color: _primaryColor.withValues(
                  alpha: selectedStyle.containerBackgroundOpacity,
                ),
                borderRadius: BorderRadius.circular(
                  selectedStyle.containerBorderRadius,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _translate('datePicker.endDate'),
                    style: TextStyle(
                      fontSize: selectedStyle.labelFontSize,
                      color: selectedStyle.labelColor,
                    ),
                  ),
                  SizedBox(height: selectedStyle.labelValueSpacing),
                  Text(
                    _endDate != null
                        ? DateFormat(
                            'MMM dd, yyyy',
                            widget.locale,
                          ).format(_endDate!)
                        : '-',
                    style: TextStyle(
                      fontSize: selectedStyle.valueFontSize,
                      fontWeight: selectedStyle.valueFontWeight,
                      color: _primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildCalendar() {
    // Determine the effective width to use for layout decisions
    final double effectiveWidth;

    if (!widget.isModal && widget.width != null) {
      // Use widget's custom width when specified in embedded mode
      effectiveWidth = widget.width!;
    } else {
      // Fall back to screen width (for modal or when width not specified)
      effectiveWidth = MediaQuery.of(context).size.width;
    }

    final isLargeScreen = effectiveWidth > 600; // Tablet/Desktop threshold

    // Calculate the number of months to display based on minDate and maxDate
    final int monthsToShow;
    if (widget.minDate != null && widget.maxDate != null) {
      // Show all months between minDate and maxDate (no limit)
      final minMonth = DateTime(widget.minDate!.year, widget.minDate!.month, 1);
      final maxMonth = DateTime(widget.maxDate!.year, widget.maxDate!.month, 1);
      final calculatedMonths =
          (maxMonth.year - minMonth.year) * 12 +
          (maxMonth.month - minMonth.month) +
          1;
      monthsToShow = calculatedMonths < 1 ? 1 : calculatedMonths;
    } else if (widget.maxDate != null) {
      // From current month to maxDate (no limit)
      final now = DateTime.now();
      final minMonth = DateTime(now.year, now.month, 1);
      final maxMonth = DateTime(widget.maxDate!.year, widget.maxDate!.month, 1);
      final calculatedMonths =
          (maxMonth.year - minMonth.year) * 12 +
          (maxMonth.month - minMonth.month) +
          1;
      monthsToShow = calculatedMonths < 1 ? 1 : calculatedMonths;
    } else if (widget.minDate != null) {
      // From minDate, show 12 months by default
      monthsToShow = 12;
    } else {
      // Default: show 6 months
      monthsToShow = 6;
    }

    final calendarStyle = _style.calendarStyle;

    return Container(
      padding: _style.calendarPadding,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: isLargeScreen
            ? (monthsToShow / 2).ceil()
            : monthsToShow, // rows of 2 months or single months
        itemBuilder: (context, index) {
          if (isLargeScreen) {
            // Show 2 months side-by-side
            final firstMonthIndex = index * 2;
            final secondMonthIndex = firstMonthIndex + 1;

            final firstMonthDate = DateTime(
              _focusedDay.year,
              _focusedDay.month + firstMonthIndex,
              1,
            );

            // Only show second month if it's within monthsToShow range
            if (secondMonthIndex < monthsToShow) {
              final secondMonthDate = DateTime(
                _focusedDay.year,
                _focusedDay.month + secondMonthIndex,
                1,
              );

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildMonthCalendar(firstMonthDate)),
                  SizedBox(width: calendarStyle.monthColumnSpacing),
                  Expanded(child: _buildMonthCalendar(secondMonthDate)),
                ],
              );
            } else {
              // Last row with only one month (odd number of months)
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildMonthCalendar(firstMonthDate)),
                  SizedBox(width: calendarStyle.monthColumnSpacing),
                  const Expanded(child: SizedBox()), // Empty placeholder
                ],
              );
            }
          } else {
            // Show 1 month per row (mobile)
            final monthDate = DateTime(
              _focusedDay.year,
              _focusedDay.month + index,
              1,
            );
            return _buildMonthCalendar(monthDate);
          }
        },
      ),
    );
  }

  Widget _buildMonthCalendar(DateTime monthDate) {
    final calendarStyle = _style.calendarStyle;

    // Format month name based on locale
    String monthName;
    if (_localeInitialized) {
      try {
        monthName = DateFormat('MMMM yyyy', widget.locale).format(monthDate);
      } catch (e) {
        // Fallback to English if locale data is not initialized
        monthName = DateFormat('MMMM yyyy', 'en').format(monthDate);
      }
    } else {
      // Use English while locale is being initialized
      monthName = DateFormat('MMMM yyyy', 'en').format(monthDate);
    }

    return Container(
      margin: EdgeInsets.only(bottom: calendarStyle.monthBottomMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Month header
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: calendarStyle.monthHeaderVerticalPadding,
            ),
            child: Text(
              monthName,
              style: TextStyle(
                fontWeight: calendarStyle.monthNameFontWeight,
                color: calendarStyle.monthNameColor ?? _primaryColor,
                fontSize: calendarStyle.monthNameFontSize,
              ),
            ),
          ),

          // Days of week header
          _buildDaysOfWeekHeader(),

          SizedBox(height: calendarStyle.weekdayGridSpacing),

          // Calendar grid
          _buildMonthGrid(monthDate),
        ],
      ),
    );
  }

  Widget _buildDaysOfWeekHeader() {
    final calendarStyle = _style.calendarStyle;

    final daysOfWeek = [
      _translate('datePicker.sunday'),
      _translate('datePicker.monday'),
      _translate('datePicker.tuesday'),
      _translate('datePicker.wednesday'),
      _translate('datePicker.thursday'),
      _translate('datePicker.friday'),
      _translate('datePicker.saturday'),
    ];
    return Row(
      children: daysOfWeek
          .map(
            (day) => Expanded(
              child: Center(
                child: Text(
                  day,
                  style: TextStyle(
                    color: calendarStyle.weekdayColor,
                    fontWeight: calendarStyle.weekdayFontWeight,
                    fontSize: calendarStyle.weekdayFontSize,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildMonthGrid(DateTime monthDate) {
    final firstDayOfMonth = DateTime(monthDate.year, monthDate.month, 1);
    final lastDayOfMonth = DateTime(monthDate.year, monthDate.month + 1, 0);

    // Calculate how many days are in this month
    final daysInMonth = lastDayOfMonth.day;

    // Calculate the starting weekday (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
    int firstWeekday = firstDayOfMonth.weekday;
    if (firstWeekday == 7) firstWeekday = 0; // Convert Sunday from 7 to 0

    final weeks = <Widget>[];
    int dayCounter = 1;

    // Calculate how many weeks we need
    final totalCells = firstWeekday + daysInMonth;
    final weeksNeeded = (totalCells / 7).ceil();

    final cellHeight = _style.dayCellStyle.cellHeight;

    for (int week = 0; week < weeksNeeded; week++) {
      final weekDays = <Widget>[];

      for (int dayOfWeek = 0; dayOfWeek < 7; dayOfWeek++) {
        if (week == 0 && dayOfWeek < firstWeekday) {
          // Empty cell before the first day of the month
          weekDays.add(Expanded(child: SizedBox(height: cellHeight)));
        } else if (dayCounter <= daysInMonth) {
          // Day cell for current month
          final currentDate = DateTime(
            monthDate.year,
            monthDate.month,
            dayCounter,
          );
          weekDays.add(_buildDayCell(currentDate, monthDate));
          dayCounter++;
        } else {
          // Empty cell after the last day of the month
          weekDays.add(Expanded(child: SizedBox(height: cellHeight)));
        }
      }

      weeks.add(Row(children: weekDays));
    }

    return Column(children: weeks);
  }

  Widget _buildDayCell(DateTime date, DateTime monthDate) {
    final dayCellStyle = _style.dayCellStyle;
    final isCurrentMonth = date.month == monthDate.month;
    final today = DateTime.now();
    final isToday = _isSameDay(date, today);

    // Compute effective selectable boundaries
    // - If minDate is not provided, default to "today" (previous behavior)
    // - If maxDate is not provided, there is no upper bound
    final DateTime effectiveMinDate = widget.minDate != null
        ? DateTime(
            widget.minDate!.year,
            widget.minDate!.month,
            widget.minDate!.day,
          )
        : DateTime(today.year, today.month, today.day);

    final DateTime? effectiveMaxDate = widget.maxDate != null
        ? DateTime(
            widget.maxDate!.year,
            widget.maxDate!.month,
            widget.maxDate!.day,
          )
        : null;

    // Normalize the date to compare (strip time component)
    final DateTime normalizedDate = DateTime(date.year, date.month, date.day);

    final bool isBeforeMinDate = normalizedDate.isBefore(effectiveMinDate);
    final bool isAfterMaxDate =
        effectiveMaxDate != null && normalizedDate.isAfter(effectiveMaxDate);
    final bool isOutOfSelectableRange = isBeforeMinDate || isAfterMaxDate;
    final isStartDate = _startDate != null && _isSameDay(date, _startDate!);
    final isEndDate = _endDate != null && _isSameDay(date, _endDate!);
    final isInRange = _isDateInRange(date);
    final isHovered = _hoveredDate != null && _isSameDay(date, _hoveredDate!);

    // Key for this specific day cell to support precise auto-scrolling
    final cellKey = _dayCellKeys.putIfAbsent(
      _formatDateKey(date),
      () => GlobalKey(),
    );

    // Check if date is beyond 30-day range when start date is selected (only for range mode)
    final isBeyondMaxRange =
        widget.selectionMode == DateSelectionMode.range &&
        _startDate != null &&
        _isSelectingEndDate &&
        date.isAfter(_startDate!) &&
        date.difference(_startDate!).inDays >= widget.maxRangeDates;

    Color? backgroundColor;
    Color? textColor;
    BorderRadius? borderRadius;
    Border? border;
    bool isSelectable = true;

    if (isOutOfSelectableRange) {
      textColor = dayCellStyle.disabledTextColor;
      isSelectable = false;
    } else if (isBeyondMaxRange) {
      // Red highlight for dates beyond max range limit
      backgroundColor = dayCellStyle.outOfRangeBackgroundColor;
      textColor = dayCellStyle.outOfRangeTextColor;
      border = Border.all(
        color: dayCellStyle.outOfRangeBorderColor,
        width: dayCellStyle.outOfRangeBorderWidth,
      );
      borderRadius = BorderRadius.circular(dayCellStyle.outOfRangeBorderRadius);
      isSelectable = false;
    } else if (isStartDate || isEndDate) {
      backgroundColor = dayCellStyle.selectedBackgroundColor ?? _primaryColor;
      textColor = dayCellStyle.selectedTextColor;
      borderRadius = BorderRadius.circular(dayCellStyle.selectedBorderRadius);
    } else if (isInRange) {
      backgroundColor = _primaryColor.withValues(
        alpha: dayCellStyle.inRangeBackgroundOpacity,
      );
      textColor = dayCellStyle.inRangeTextColor ?? _primaryColor;
      borderRadius = BorderRadius.circular(dayCellStyle.inRangeBorderRadius);
    } else if (isHovered && isSelectable) {
      // Hover effect for selectable dates
      backgroundColor = _primaryColor.withValues(
        alpha: dayCellStyle.hoveredBackgroundOpacity,
      );
      textColor = dayCellStyle.hoveredTextColor ?? _primaryColor;
      borderRadius = BorderRadius.circular(dayCellStyle.hoveredBorderRadius);
    } else if (isToday) {
      border = Border.all(
        color: dayCellStyle.todayTextColor ?? _primaryColor,
        width: dayCellStyle.todayBorderWidth,
      );
      textColor = dayCellStyle.todayTextColor ?? _primaryColor;
      borderRadius = BorderRadius.circular(dayCellStyle.todayBorderRadius);
    } else {
      textColor = isCurrentMonth
          ? dayCellStyle.normalTextColor
          : dayCellStyle.disabledTextColor;
    }

    return Expanded(
      child: MouseRegion(
        cursor: isSelectable
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        onEnter: isSelectable ? (_) => _onDayHover(date) : null,
        onExit: isSelectable ? (_) => _onDayHoverExit() : null,
        child: GestureDetector(
          key: cellKey,
          onTap: isSelectable ? () => _onDateTap(date) : null,
          child: Container(
            height: dayCellStyle.cellHeight,
            margin: dayCellStyle.cellMargin,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
              border: border,
            ),
            child: Center(
              child: Text(
                '${date.day}',
                style: TextStyle(
                  color: textColor,
                  fontWeight: (isStartDate || isEndDate)
                      ? dayCellStyle.selectedDayFontWeight
                      : dayCellStyle.dayFontWeight,
                  fontSize: dayCellStyle.dayFontSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onDayHover(DateTime date) {
    setState(() {
      _hoveredDate = date;
    });
  }

  void _onDayHoverExit() {
    setState(() {
      _hoveredDate = null;
    });
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isDateInRange(DateTime date) {
    if (_startDate == null || _endDate == null) return false;
    return date.isAfter(_startDate!) && date.isBefore(_endDate!);
  }

  void _onDateTap(DateTime date) {
    bool shouldAutoConfirm = false;

    setState(() {
      if (widget.selectionMode == DateSelectionMode.single) {
        // Single date selection mode
        _startDate = date;
        _endDate = null;
        _isSelectingEndDate = false;

        // For single selection, optionally auto-confirm based on autoClose
        if (widget.autoClose) {
          shouldAutoConfirm = true;
        }
      } else {
        // Date range selection mode
        if (_startDate == null || _isSelectingEndDate == false) {
          // Selecting start date - set time to 00:00:00
          _startDate = DateTime(date.year, date.month, date.day, 0, 0, 0);
          _endDate = null;
          _isSelectingEndDate = true;
        } else {
          // Selecting end date
          // Allow same day selection or any date after start date
          if (date.isAfter(_startDate!) || _isSameDay(date, _startDate!)) {
            // Check if the range is within the allowed maxRangeDates
            final daysDifference = date.difference(_startDate!).inDays;
            if (daysDifference < widget.maxRangeDates) {
              // Set end date with time 23:59:59
              _endDate = DateTime(date.year, date.month, date.day, 23, 59, 59);
              _isSelectingEndDate = false;
            }
          } else {
            // If selected date is before start date, reset and start over
            _startDate = DateTime(date.year, date.month, date.day, 0, 0, 0);
            _endDate = null;
            _isSelectingEndDate = true;
          }
        }
      }

      // Notify about selection changes
      if (widget.onDateChanged != null && _startDate != null) {
        widget.onDateChanged!(_startDate!, _endDate);
      }
    });

    // After updating selection, smoothly scroll to make the selected date visible
    if (_startDate != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToSelectedDateCell(_startDate!);
      });
    }

    if (shouldAutoConfirm) {
      _confirmSelection();
    }
  }

  /// Scroll to the selected date with guaranteed precision.
  /// Uses a two-phase approach: first jump to approximate position,
  /// then use GlobalKey for exact cell positioning.
  void _scrollToSelectedDates() {
    if (_startDate == null || !_scrollController.hasClients) return;

    _scrollToDateWithPrecision(_startDate!);
  }

  /// Two-phase scroll: first jump to the month area, then precisely to the cell.
  void _scrollToDateWithPrecision(DateTime date) {
    if (!_scrollController.hasClients) return;

    // Calculate the month index relative to the base focused month
    final baseFocusedMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);
    final targetMonth = DateTime(date.year, date.month, 1);
    final monthIndex =
        (targetMonth.year - baseFocusedMonth.year) * 12 +
        (targetMonth.month - baseFocusedMonth.month);

    if (monthIndex < 0) return; // Date is before the start

    // Determine if we're using two-column layout
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    // Use the ListView's item index to jump
    final listIndex = isLargeScreen ? (monthIndex ~/ 2) : monthIndex;

    // First, jump to make sure the target month is built in the ListView
    // We use jumpTo with estimated position to trigger building of that section
    _scrollController.jumpTo(0); // Reset first

    // Schedule the precise scroll after the frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) return;

      // Try to find the GlobalKey for the date
      final key = _dayCellKeys[_formatDateKey(date)];

      if (key?.currentContext != null) {
        // Key exists, use precise scrolling
        Scrollable.ensureVisible(
          key!.currentContext!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          alignment: 0.3, // Position slightly above center
        );
      } else {
        // Key doesn't exist yet, scroll to estimated position and retry
        _scrollToMonthAndRetry(date, listIndex, isLargeScreen, 0);
      }
    });
  }

  /// Scroll to the month area and retry finding the cell.
  void _scrollToMonthAndRetry(
    DateTime date,
    int listIndex,
    bool isLargeScreen,
    int attempt,
  ) {
    if (!mounted || !_scrollController.hasClients || attempt > 5) return;

    // Estimate month height (header + weekdays + max 6 weeks + margin)
    // Header: ~50px, weekdays: ~30px, weeks: 6*48=288px, margin: 24px = ~392px
    const estimatedMonthHeight = 380.0;

    final estimatedOffset = listIndex * estimatedMonthHeight;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final targetOffset = estimatedOffset.clamp(0.0, maxScroll);

    // Jump to the estimated position
    _scrollController.jumpTo(targetOffset);

    // Wait for the frame to build and try again
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final key = _dayCellKeys[_formatDateKey(date)];

      if (key?.currentContext != null) {
        // Found it! Use precise scrolling
        Scrollable.ensureVisible(
          key!.currentContext!,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
          alignment: 0.3,
        );
      } else {
        // Still not found, try again with increased offset
        _scrollToMonthAndRetry(date, listIndex + 1, isLargeScreen, attempt + 1);
      }
    });
  }

  /// Smoothly scroll to ensure the given date's cell is visible.
  /// This is used after user selections for precise, cell-level auto-scrolling.
  void _scrollToSelectedDateCell(DateTime date) {
    if (!_scrollController.hasClients) return;

    final key = _dayCellKeys[_formatDateKey(date)];
    if (key == null) {
      // Key not created yet, try the full precision scroll
      _scrollToDateWithPrecision(date);
      return;
    }

    final ctx = key.currentContext;
    if (ctx == null) {
      // Context not available, try the full precision scroll
      _scrollToDateWithPrecision(date);
      return;
    }

    // Use Scrollable.ensureVisible for precise scrolling to the day cell
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      alignment: 0.3, // Position slightly above center for better UX
    );
  }

  Widget _buildActionButtons() {
    final buttonStyle = _style.buttonStyle;
    final canConfirm = widget.selectionMode == DateSelectionMode.single
        ? _startDate != null
        : (_startDate != null && _endDate != null);

    // Build list of buttons based on visibility flags
    final List<Widget> buttons = [];

    if (widget.showCancelButton) {
      buttons.add(
        Expanded(
          child: OutlinedButton(
            onPressed: widget.isModal
                ? () => Navigator.of(context).pop()
                : _cancelSelection,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: buttonStyle.cancelButtonBorderColor),
              padding: EdgeInsets.symmetric(
                vertical: buttonStyle.buttonVerticalPadding,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  buttonStyle.buttonBorderRadius,
                ),
              ),
            ),
            child: Text(
              _translate('datePicker.cancel'),
              style: TextStyle(
                color: buttonStyle.cancelButtonTextColor,
                fontSize: buttonStyle.buttonFontSize,
              ),
            ),
          ),
        ),
      );
    }

    if (widget.showCancelButton && widget.showConfirmButton) {
      buttons.add(SizedBox(width: buttonStyle.buttonSpacing));
    }

    if (widget.showConfirmButton) {
      buttons.add(
        Expanded(
          flex: widget.showCancelButton ? 2 : 1,
          child: ElevatedButton(
            onPressed: canConfirm ? _confirmSelection : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: _primaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: buttonStyle.buttonVerticalPadding,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  buttonStyle.buttonBorderRadius,
                ),
              ),
              elevation: buttonStyle.confirmButtonElevation,
            ),
            child: Text(
              _translate('datePicker.confirm'),
              style: TextStyle(
                color: Colors.white,
                fontWeight: buttonStyle.confirmButtonFontWeight,
                fontSize: buttonStyle.buttonFontSize,
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: buttonStyle.containerPadding,
      decoration: BoxDecoration(
        color: buttonStyle.containerBackgroundColor,
        boxShadow: buttonStyle.showContainerShadow
            ? [
                BoxShadow(
                  color: buttonStyle.containerShadowColor,
                  spreadRadius: buttonStyle.containerShadowSpreadRadius,
                  blurRadius: buttonStyle.containerShadowBlurRadius,
                  offset: buttonStyle.containerShadowOffset,
                ),
              ]
            : null,
      ),
      child: SafeArea(child: Row(children: buttons)),
    );
  }

  void _cancelSelection() {
    // Reset selections for embedded widget mode
    setState(() {
      _startDate = widget.initialStartDate;
      _endDate = widget.initialEndDate;
      _isSelectingEndDate = false;
    });
  }

  void _confirmSelection() {
    if (widget.selectionMode == DateSelectionMode.single) {
      if (_startDate != null) {
        // Only auto-close modal if autoClose is enabled and in modal mode
        if (widget.autoClose && widget.isModal) {
          Navigator.of(context).pop();
        }
      }
    } else {
      if (_startDate != null && _endDate != null) {
        // Only auto-close modal if autoClose is enabled and in modal mode
        if (widget.autoClose && widget.isModal) {
          Navigator.of(context).pop();
        }
      }
    }

    if (_startDate != null && _endDate != null) {
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(_startDate!, _endDate);
      }
    }
  }

  /// Public method to manually confirm selection (useful when autoClose: false)
  /// Returns true if selection is valid and confirmed
  bool confirmSelection() {
    bool isValid = false;

    if (widget.selectionMode == DateSelectionMode.single) {
      if (_startDate != null) {
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(_startDate!, null);
        }
        isValid = true;
      }
    } else {
      if (_startDate != null && _endDate != null) {
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(_startDate!, _endDate);
        }
        isValid = true;
      }
    }

    return isValid;
  }
}
