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

/// Enhanced Date Picker - A versatile date picker for any use case
/// Supports both single date selection and date range selection
/// Can be used as a standalone widget or shown as a modal bottom sheet
class EnhancedDateRangePicker extends StatefulWidget {
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  final Function(DateTime startDate, DateTime? endDate)? onDateSelected;
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

  const EnhancedDateRangePicker({
    super.key,
    this.initialStartDate,
    this.initialEndDate,
    required this.onDateSelected,
    this.title = '',
    this.primaryColor = const Color(0xFF2196F3),
    this.translations,
    this.locale = 'en',
    this.selectionMode = DateSelectionMode.range,
    this.isModal = true,
    this.height,
    this.width,
    this.showHeader = true,
    this.showTitle = true,
    this.showSelectedDates = true,
    this.showActionButtons = true,
    this.showCancelButton = true,
    this.showConfirmButton = true,
  });

  @override
  State<EnhancedDateRangePicker> createState() =>
      _EnhancedDateRangePickerState();

  /// Show the date picker as a modal bottom sheet
  static Future<void> show({
    required BuildContext context,
    DateTime? initialStartDate,
    DateTime? initialEndDate,
    required Function(DateTime startDate, DateTime? endDate) onDateSelected,
    String title = '',
    Color primaryColor = const Color(0xFF2196F3),
    Map<String, String>? translations,
    String locale = 'en',
    DateSelectionMode selectionMode = DateSelectionMode.range,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EnhancedDateRangePicker(
        initialStartDate: initialStartDate,
        initialEndDate: initialEndDate,
        onDateSelected: onDateSelected,
        title: title,
        primaryColor: primaryColor,
        translations: translations,
        locale: locale,
        selectionMode: selectionMode,
        isModal: true, // Always true for modal display
      ),
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
      'datePicker.sunday': 'الأحد',
      'datePicker.monday': 'الإثنين',
      'datePicker.tuesday': 'الثلاثاء',
      'datePicker.wednesday': 'الأربعاء',
      'datePicker.thursday': 'الخميس',
      'datePicker.friday': 'الجمعة',
      'datePicker.saturday': 'السبت',
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

class _EnhancedDateRangePickerState extends State<EnhancedDateRangePicker>
    with TickerProviderStateMixin {
  DateTime? _startDate;
  DateTime? _endDate;
  DateTime _focusedDay = DateTime.now();
  bool _isSelectingEndDate = false;
  late ScrollController _scrollController;
  bool _localeInitialized = false;

  /// Helper method to translate strings
  String _translate(String key) {
    return _DatePickerTranslations.translate(
      key,
      widget.locale,
      widget.translations,
    );
  }

  @override
  void initState() {
    super.initState();
    _startDate = widget.initialStartDate;
    _endDate = widget.initialEndDate;

    // Always start from current month and reset selection state
    _focusedDay = DateTime.now();
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
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: content,
      );
    } else {
      // Standalone widget style
      return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: content,
      );
    }
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Drag handle (only in modal mode)
          if (widget.isModal)
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          if (widget.isModal) const SizedBox(height: 16),

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
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (widget.isModal)
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
              ],
            ),

          // Selected dates display
          if (widget.showSelectedDates && (_startDate != null))
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: _buildSelectedDatesDisplay(),
            ),
        ],
      ),
    );
  }

  Widget _buildSelectedDatesDisplay() {
    if (widget.selectionMode == DateSelectionMode.single) {
      // Single date display
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: widget.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          _startDate != null
              ? DateFormat('MMM dd, yyyy', widget.locale).format(_startDate!)
              : '',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: widget.primaryColor,
          ),
        ),
      );
    } else {
      // Date range display
      return Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: widget.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _translate('datePicker.startDate'),
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _startDate != null
                        ? DateFormat(
                            'MMM dd, yyyy',
                            widget.locale,
                          ).format(_startDate!)
                        : '-',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: widget.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: widget.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _translate('datePicker.endDate'),
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _endDate != null
                        ? DateFormat(
                            'MMM dd, yyyy',
                            widget.locale,
                          ).format(_endDate!)
                        : '-',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: widget.primaryColor,
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: isLargeScreen
            ? 3
            : 6, // 3 rows of 2 months or 6 single months
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

            final secondMonthDate = DateTime(
              _focusedDay.year,
              _focusedDay.month + secondMonthIndex,
              1,
            );

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildMonthCalendar(firstMonthDate)),
                const SizedBox(width: 16),
                Expanded(child: _buildMonthCalendar(secondMonthDate)),
              ],
            );
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
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Month header
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              monthName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: widget.primaryColor,
                fontSize: 18,
              ),
            ),
          ),

          // Days of week header
          _buildDaysOfWeekHeader(),

          const SizedBox(height: 8),

          // Calendar grid
          _buildMonthGrid(monthDate),
        ],
      ),
    );
  }

  Widget _buildDaysOfWeekHeader() {
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
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
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

    for (int week = 0; week < weeksNeeded; week++) {
      final weekDays = <Widget>[];

      for (int dayOfWeek = 0; dayOfWeek < 7; dayOfWeek++) {
        if (week == 0 && dayOfWeek < firstWeekday) {
          // Empty cell before the first day of the month
          weekDays.add(const Expanded(child: SizedBox(height: 44)));
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
          weekDays.add(const Expanded(child: SizedBox(height: 44)));
        }
      }

      weeks.add(Row(children: weekDays));
    }

    return Column(children: weeks);
  }

  Widget _buildDayCell(DateTime date, DateTime monthDate) {
    final isCurrentMonth = date.month == monthDate.month;
    final isToday = _isSameDay(date, DateTime.now());
    final isPastDate = date.isBefore(
      DateTime.now().subtract(const Duration(days: 1)),
    );
    final isStartDate = _startDate != null && _isSameDay(date, _startDate!);
    final isEndDate = _endDate != null && _isSameDay(date, _endDate!);
    final isInRange = _isDateInRange(date);

    // Check if date is beyond 30-day range when start date is selected (only for range mode)
    final isBeyondMaxRange =
        widget.selectionMode == DateSelectionMode.range &&
        _startDate != null &&
        _isSelectingEndDate &&
        date.isAfter(_startDate!) &&
        date.difference(_startDate!).inDays >= 30;

    Color? backgroundColor;
    Color? textColor;
    BorderRadius? borderRadius;
    Border? border;
    bool isSelectable = true;

    if (isPastDate) {
      textColor = Colors.grey[400];
      isSelectable = false;
    } else if (isBeyondMaxRange) {
      // Red highlight for dates beyond 30-day limit
      backgroundColor = Colors.red.withValues(alpha: 0.1);
      textColor = Colors.red[700];
      border = Border.all(color: Colors.red.withValues(alpha: 0.5), width: 1);
      borderRadius = BorderRadius.circular(8);
      isSelectable = false;
    } else if (isStartDate || isEndDate) {
      backgroundColor = widget.primaryColor;
      textColor = Colors.white;
      borderRadius = BorderRadius.circular(20);
    } else if (isInRange) {
      backgroundColor = widget.primaryColor.withValues(alpha: 0.2);
      textColor = widget.primaryColor;
      borderRadius = BorderRadius.circular(8);
    } else if (isToday) {
      border = Border.all(color: widget.primaryColor, width: 2);
      textColor = widget.primaryColor;
      borderRadius = BorderRadius.circular(20);
    } else {
      textColor = isCurrentMonth ? Colors.black87 : Colors.grey[400];
    }

    return Expanded(
      child: GestureDetector(
        onTap: isSelectable ? () => _onDateTap(date) : null,
        child: Container(
          height: 44,
          margin: const EdgeInsets.all(2),
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
                    ? FontWeight.bold
                    : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isDateInRange(DateTime date) {
    if (_startDate == null || _endDate == null) return false;
    return date.isAfter(_startDate!) && date.isBefore(_endDate!);
  }

  void _onDateTap(DateTime date) {
    setState(() {
      if (widget.selectionMode == DateSelectionMode.single) {
        // Single date selection mode
        _startDate = date;
        _endDate = null;
        _isSelectingEndDate = false;

        // Auto-confirm for single date selection
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(date, null);
          Navigator.of(context).pop();
        }
      } else {
        // Date range selection mode
        if (_startDate == null || _isSelectingEndDate == false) {
          // Selecting start date - can be any future date
          _startDate = date;
          _endDate = null;
          _isSelectingEndDate = true;
        } else {
          // Selecting end date
          if (date.isAfter(_startDate!)) {
            // Check if the range is within 30 days
            final daysDifference = date.difference(_startDate!).inDays;
            if (daysDifference < 30) {
              _endDate = date;
              _isSelectingEndDate = false;
            }
          } else {
            // If selected date is before start date, reset and start over
            _startDate = date;
            _endDate = null;
            _isSelectingEndDate = true;
          }
        }
      }
    });
  }

  void _scrollToSelectedDates() {
    if (_startDate == null || !_scrollController.hasClients) return;

    // Determine if we're using two-column layout
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    // Calculate which month the start date is in relative to the base focused month
    final baseFocusedMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);
    final startMonth = DateTime(_startDate!.year, _startDate!.month, 1);

    // Calculate the difference in months from the base focused month
    final monthDifference =
        (startMonth.year - baseFocusedMonth.year) * 12 +
        (startMonth.month - baseFocusedMonth.month);

    // Scroll if the selected date is not in the currently visible area
    // Handle both forward and backward scrolling within the 6-month range
    if (monthDifference >= 0 && monthDifference < 6) {
      // Calculate scroll offset based on month difference
      // Each month takes approximately 300 pixels (header + calendar grid + margin)
      const monthHeight = 300.0;

      // For large screens with 2 columns, we need to scroll to the row containing the month
      // For mobile, we scroll to the specific month
      final scrollOffset = isLargeScreen
          ? (monthDifference ~/ 2) *
                monthHeight // Scroll to the row (2 months per row)
          : monthDifference * monthHeight; // Scroll to the specific month

      // Get current scroll position to determine if we need to scroll
      final currentOffset = _scrollController.offset;

      // Only scroll if we're not already at the target position (with some tolerance)
      if ((scrollOffset - currentOffset).abs() > 50) {
        // Ensure we don't scroll beyond the available content
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final targetOffset = scrollOffset.clamp(0.0, maxScrollExtent);

        // Smooth scroll to the selected month
        _scrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    } else if (monthDifference < 0) {
      // If the date is before the base focused month, scroll to the beginning
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    } else if (monthDifference >= 6) {
      // If the date is beyond the 6-month range, scroll to the maximum extent
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      _scrollController.animateTo(
        maxScrollExtent,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildActionButtons() {
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
              side: BorderSide(color: Colors.grey[400]!),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              _translate('datePicker.cancel'),
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ),
        ),
      );
    }

    if (widget.showCancelButton && widget.showConfirmButton) {
      buttons.add(const SizedBox(width: 16));
    }

    if (widget.showConfirmButton) {
      buttons.add(
        Expanded(
          flex: widget.showCancelButton ? 2 : 1,
          child: ElevatedButton(
            onPressed: canConfirm ? _confirmSelection : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Text(
              _translate('datePicker.confirm'),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
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
      if (_startDate != null && widget.onDateSelected != null) {
        widget.onDateSelected!(_startDate!, null);
        Navigator.of(context).pop();
      }
    } else {
      if (_startDate != null &&
          _endDate != null &&
          widget.onDateSelected != null) {
        widget.onDateSelected!(_startDate!, _endDate);
        Navigator.of(context).pop();
      }
    }
  }
}
