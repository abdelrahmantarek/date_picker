import 'package:flutter/material.dart';
import 'package:date_picker/date_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Picker Examples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DatePickerHomePage(),
    );
  }
}

class DatePickerHomePage extends StatelessWidget {
  const DatePickerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Date Picker Examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose Example Type',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ModalExamplesPage(),
                  ),
                );
              },
              icon: const Icon(Icons.open_in_new),
              label: const Text('Modal Bottom Sheet Examples'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EmbeddedWidgetExamplesPage(),
                  ),
                );
              },
              icon: const Icon(Icons.calendar_month),
              label: const Text('Embedded Widget Examples'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModalExamplesPage extends StatefulWidget {
  const ModalExamplesPage({super.key});

  @override
  State<ModalExamplesPage> createState() => _ModalExamplesPageState();
}

class _ModalExamplesPageState extends State<ModalExamplesPage> {
  DateTime? _selectedSingleDate;
  DateTime? _selectedSingleDateArabic;
  DateTimeRange? _selectedDateRange;
  DateTimeRange? _selectedDateRangeArabic;
  DateTimeRange? _selectedDateRangeCustomColor;
  DateTime? _selectedManualCloseDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Enhanced Date Picker Examples'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Enhanced Date Picker Examples',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Single Date Selection
              const Text(
                'Single Date Selection',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              const Text(
                'English',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              if (_selectedSingleDate != null)
                Text(
                  'Selected: ${_selectedSingleDate!.toLocal().toString().split(' ')[0]}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _showSingleDatePicker,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Select Single Date'),
              ),

              const SizedBox(height: 16),

              const Text(
                'عربي',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              if (_selectedSingleDateArabic != null)
                Text(
                  'التاريخ المختار: ${_selectedSingleDateArabic!.toLocal().toString().split(' ')[0]}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _showSingleDatePickerArabic,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('اختر تاريخ واحد'),
              ),

              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 16),

              // Date Range Selection
              const Text(
                'Date Range Selection',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              const Text(
                'English',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              if (_selectedDateRange != null)
                Text(
                  'Selected: ${_selectedDateRange!.start.toLocal().toString().split(' ')[0]} - ${_selectedDateRange!.end.toLocal().toString().split(' ')[0]}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _showDateRangePicker,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Select Date Range'),
              ),

              const SizedBox(height: 16),

              const Text(
                'عربي',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              if (_selectedDateRangeArabic != null)
                Text(
                  'النطاق المختار: ${_selectedDateRangeArabic!.start.toLocal().toString().split(' ')[0]} - ${_selectedDateRangeArabic!.end.toLocal().toString().split(' ')[0]}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _showDateRangePickerArabic,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('اختر نطاق التاريخ'),
              ),

              const SizedBox(height: 16),

              const Text(
                'Custom Color (Purple)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              if (_selectedDateRangeCustomColor != null)
                Text(
                  'Selected: ${_selectedDateRangeCustomColor!.start.toLocal().toString().split(' ')[0]} - ${_selectedDateRangeCustomColor!.end.toLocal().toString().split(' ')[0]}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _showDateRangePickerCustomColor,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Select Date Range (Purple)'),
              ),

              const SizedBox(height: 32),

              // Manual Close Example
              const Text(
                'Manual Close Control',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              const Text(
                'Manual Close (autoClose: false)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              if (_selectedManualCloseDate != null)
                Text(
                  'Selected: ${_selectedManualCloseDate!.toLocal().toString().split(' ')[0]}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _showManualCloseDatePicker,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Select Date (Manual Close)'),
              ),
              const SizedBox(height: 8),
              const Text(
                'This example shows how to manually control closing.\nYou can perform validation or other actions before closing.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Single Date Picker - English
  Future<void> _showSingleDatePicker() async {
    await EnhancedDateRangePicker.show(
      context: context,
      initialStartDate: _selectedSingleDate,
      primaryColor: Colors.blue,
      locale: 'en',
      selectionMode: DateSelectionMode.single,
      onDateChanged: (startDate, endDate) {
        // Live update while user is tapping days
        setState(() {
          _selectedSingleDate = startDate;
        });
      },
      onDateSelected: (startDate, endDate) {
        // Final confirmation (same behavior here)
        setState(() {
          _selectedSingleDate = startDate;
        });
      },
    );
  }

  // Single Date Picker - Arabic
  Future<void> _showSingleDatePickerArabic() async {
    await EnhancedDateRangePicker.show(
      context: context,
      initialStartDate: _selectedSingleDateArabic,
      primaryColor: Colors.green,
      locale: 'ar',
      selectionMode: DateSelectionMode.single,
      onDateSelected: (startDate, endDate) {
        setState(() {
          _selectedSingleDateArabic = startDate;
        });
      },
    );
  }

  // Date Range Picker - English
  Future<void> _showDateRangePicker() async {
    await EnhancedDateRangePicker.show(
      context: context,
      initialStartDate: _selectedDateRange?.start,
      initialEndDate: _selectedDateRange?.end,
      primaryColor: Colors.blue,
      locale: 'en',
      selectionMode: DateSelectionMode.range,
      onDateSelected: (startDate, endDate) {
        if (endDate != null) {
          setState(() {
            _selectedDateRange = DateTimeRange(start: startDate, end: endDate);
          });
        }
      },
    );
  }

  // Date Range Picker - Arabic
  Future<void> _showDateRangePickerArabic() async {
    await EnhancedDateRangePicker.show(
      context: context,
      initialStartDate: _selectedDateRangeArabic?.start,
      initialEndDate: _selectedDateRangeArabic?.end,
      primaryColor: Colors.green,
      locale: 'ar',
      selectionMode: DateSelectionMode.range,
      onDateSelected: (startDate, endDate) {
        if (endDate != null) {
          setState(() {
            _selectedDateRangeArabic = DateTimeRange(
              start: startDate,
              end: endDate,
            );
          });
        }
      },
    );
  }

  // Date Range Picker - Custom Color
  Future<void> _showDateRangePickerCustomColor() async {
    await EnhancedDateRangePicker.show(
      context: context,
      initialStartDate: _selectedDateRangeCustomColor?.start,
      initialEndDate: _selectedDateRangeCustomColor?.end,
      primaryColor: Colors.purple,
      locale: 'en',
      selectionMode: DateSelectionMode.range,
      onDateSelected: (startDate, endDate) {
        if (endDate != null) {
          setState(() {
            _selectedDateRangeCustomColor = DateTimeRange(
              start: startDate,
              end: endDate,
            );
          });
        }
      },
    );
  }

  // Manual Close Date Picker
  Future<void> _showManualCloseDatePicker() async {
    await EnhancedDateRangePicker.show(
      context: context,
      initialStartDate: _selectedManualCloseDate,
      primaryColor: Colors.orange,
      locale: 'en',
      selectionMode: DateSelectionMode.single,
      autoClose: false, // Don't auto-close
      onDateSelected: (startDate, endDate) {
        // Update the state first
        setState(() {
          _selectedManualCloseDate = startDate;
        });

        // Show a confirmation dialog before closing
        showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('Date Selected'),
            content: Text(
              'You selected: ${startDate.toLocal().toString().split(' ')[0]}\n\nDo you want to confirm this selection?',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext); // Close dialog
                  // Don't close the date picker - user can select again
                },
                child: const Text('Select Again'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext); // Close dialog
                  Navigator.pop(context); // Close date picker manually
                },
                child: const Text('Confirm'),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Embedded Widget Examples Page
class EmbeddedWidgetExamplesPage extends StatefulWidget {
  const EmbeddedWidgetExamplesPage({super.key});

  @override
  State<EmbeddedWidgetExamplesPage> createState() =>
      _EmbeddedWidgetExamplesPageState();
}

class _EmbeddedWidgetExamplesPageState
    extends State<EmbeddedWidgetExamplesPage> {
  DateTime? _selectedSingleDate;
  DateTimeRange? _selectedDateRange;
  DateTime? _selectedManualCloseDate;

  // GlobalKey to access the date picker state when autoClose: false
  final GlobalKey<EnhancedDateRangePickerState> _datePickerKey =
      GlobalKey<EnhancedDateRangePickerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Embedded Widget Examples'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Date Picker as Embedded Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'The date picker can be embedded directly in your screen layout.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // Single Date Selection Example
            const Text(
              'Single Date Selection',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (_selectedSingleDate != null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Selected: ${_selectedSingleDate!.toLocal().toString().split(' ')[0]}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Center(
              child: EnhancedDateRangePicker(
                initialStartDate: _selectedSingleDate,
                selectionMode: DateSelectionMode.single,
                primaryColor: Colors.blue,
                locale: 'en',
                isModal: false,
                height: 500,
                width: 400,
                onDateSelected: (startDate, endDate) {
                  setState(() {
                    _selectedSingleDate = startDate;
                  });
                },
              ),
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 32),

            // Responsive Width Example
            const Text(
              'Responsive Width Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Small width (350px) - Shows single column layout even on large screens',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Center(
              child: EnhancedDateRangePicker(
                selectionMode: DateSelectionMode.single,
                primaryColor: Colors.orange,
                locale: 'en',
                isModal: false,
                height: 500,
                width: 350, // Small width - forces single column
                onDateSelected: (startDate, endDate) {},
              ),
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 32),

            // Date Range Selection Example
            const Text(
              'Date Range Selection',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (_selectedDateRange != null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Selected: ${_selectedDateRange!.start.toLocal().toString().split(' ')[0]} - ${_selectedDateRange!.end.toLocal().toString().split(' ')[0]}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Center(
              child: EnhancedDateRangePicker(
                initialStartDate: _selectedDateRange?.start,
                initialEndDate: _selectedDateRange?.end,
                selectionMode: DateSelectionMode.range,
                primaryColor: Colors.purple,
                locale: 'en',
                isModal: false,
                height: 500,
                width: 450,
                onDateSelected: (startDate, endDate) {
                  if (endDate != null) {
                    setState(() {
                      _selectedDateRange = DateTimeRange(
                        start: startDate,
                        end: endDate,
                      );
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 32),

            // Customization Examples
            const Text(
              'Visibility Customization Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Minimal calendar - no header, no buttons
            const Text(
              '1. Minimal Calendar (No Header, No Buttons)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Center(
              child: EnhancedDateRangePicker(
                selectionMode: DateSelectionMode.single,
                primaryColor: Colors.teal,
                locale: 'en',
                isModal: false,
                height: 400,
                width: 350,
                showHeader: false,
                showActionButtons: false,
                onDateSelected: (startDate, endDate) {},
              ),
            ),

            const SizedBox(height: 32),

            // Calendar without title
            const Text(
              '2. Calendar Without Title',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Center(
              child: EnhancedDateRangePicker(
                selectionMode: DateSelectionMode.range,
                primaryColor: Colors.indigo,
                locale: 'en',
                isModal: false,
                height: 500,
                width: 400,
                showTitle: false,
                showActionButtons: false,
                onDateSelected: (startDate, endDate) {},
              ),
            ),

            const SizedBox(height: 32),

            // Calendar with only Confirm button
            const Text(
              '3. Calendar With Only Confirm Button',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Center(
              child: EnhancedDateRangePicker(
                selectionMode: DateSelectionMode.single,
                primaryColor: Colors.deepOrange,
                locale: 'en',
                isModal: false,
                height: 500,
                width: 400,
                showCancelButton: false,
                onDateSelected: (startDate, endDate) {},
              ),
            ),

            const SizedBox(height: 32),

            // Flexible Size with Max Constraints
            const Text(
              '4. Flexible Size with Max Constraints',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'No fixed width/height - adapts to available space with max constraints',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            Center(
              child: EnhancedDateRangePicker(
                selectionMode: DateSelectionMode.range,
                primaryColor: Colors.teal,
                locale: 'en',
                isModal: false,
                // No width/height specified - will adapt to available space
                maxWidth: 600, // But won't exceed 600px width
                maxHeight: 500, // And won't exceed 500px height
                onDateSelected: (startDate, endDate) {},
              ),
            ),

            const SizedBox(height: 32),

            // Embedded Widget with External Save Button
            const Text(
              '5. Embedded Widget with External Save Button',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'With autoClose: false, the widget won\'t call onDateSelected automatically.\nUse GlobalKey to access selected dates and call confirmSelection() manually.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'This example validates the date before saving (only future dates allowed)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            if (_selectedManualCloseDate != null)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green.shade700),
                    const SizedBox(width: 8),
                    Text(
                      'Saved: ${_selectedManualCloseDate!.toLocal().toString().split(' ')[0]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            Center(
              child: Column(
                children: [
                  EnhancedDateRangePicker(
                    key: _datePickerKey, // Key to access state
                    selectionMode: DateSelectionMode.single,
                    primaryColor: Colors.indigo,
                    locale: 'en',
                    isModal: false,
                    height: 450,
                    width: 400,
                    autoClose: false, // Don't call onDateSelected automatically
                    showActionButtons: false, // Hide default buttons
                    onDateChanged: (startDate, endDate) {
                      print(" onDateChanged called!");
                    },
                    onDateSelected: (startDate, endDate) {
                      print(" onDateSelected called!");
                      // This will be called when user clicks Save button
                      // via confirmSelection() method
                      setState(() {
                        _selectedManualCloseDate = startDate;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Get selected date from picker state
                      final pickerState = _datePickerKey.currentState;
                      if (pickerState == null ||
                          pickerState.selectedStartDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a date first!'),
                            backgroundColor: Colors.orange,
                          ),
                        );
                        return;
                      }

                      final selectedDate = pickerState.selectedStartDate!;

                      // Validate: only allow future dates
                      if (selectedDate.isBefore(
                        DateTime.now().subtract(const Duration(days: 1)),
                      )) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please select today or a future date!',
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      // Show confirmation dialog
                      showDialog(
                        context: context,
                        builder: (dialogContext) => AlertDialog(
                          title: const Text('Confirm Selection'),
                          content: Text(
                            'Do you want to save this date?\n\n${selectedDate.toLocal().toString().split(' ')[0]}',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(dialogContext);
                              },
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Call confirmSelection to trigger onDateSelected
                                if (pickerState.confirmSelection()) {
                                  Navigator.pop(dialogContext);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Date saved successfully!'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Save Date'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      disabledBackgroundColor: Colors.grey.shade300,
                      disabledForegroundColor: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
