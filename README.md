# Date Picker

A Flutter package providing custom Material Design date picker components with enhanced customization options and screen size control.

## Features

- **Custom Single Date Picker**: Select a single date with a customizable dialog
- **Custom Date Range Picker**: Select a date range with start and end dates
- **Multiple Entry Modes**:
  - Calendar mode for visual date selection
  - Input mode for text-based date entry
  - Calendar-only and input-only modes
- **Screen Size Control**: Force large or small screen layouts regardless of actual device size
- **Material Design 3 Support**: Full support for Material Design 3 styling
- **Customizable**:
  - Custom icons for mode switching
  - Custom labels and help text
  - Custom validation messages
  - Keyboard navigation support
- **Accessibility**: Built-in keyboard navigation and screen reader support

## Getting Started

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  date_picker:
    path: path/to/date_picker
```

Then run:

```bash
flutter pub get
```

## Usage

### Single Date Picker

#### Basic Usage

```dart
final DateTime? selectedDate = await showCustomDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
);

if (selectedDate != null) {
  print('Selected date: $selectedDate');
}
```

#### With Screen Size Control

```dart
// Force large screen layout (tablet/desktop style)
final DateTime? date = await showCustomDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
  forceLargeScreenLayout: true,
);

// Force small screen layout (mobile style)
final DateTime? date = await showCustomDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
  forceSmallScreenLayout: true,
);
```

#### With Custom Options

```dart
final DateTime? date = await showCustomDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
  helpText: 'Select a date',
  cancelText: 'Cancel',
  confirmText: 'OK',
  initialEntryMode: DatePickerEntryMode.calendar,
  selectableDayPredicate: (DateTime date) {
    // Disable weekends
    return date.weekday != DateTime.saturday &&
           date.weekday != DateTime.sunday;
  },
);
```

### Date Range Picker

#### Basic Usage

```dart
final DateTimeRange? selectedRange = await showCustomDateRangePicker(
  context: context,
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
);

if (selectedRange != null) {
  print('Start: ${selectedRange.start}');
  print('End: ${selectedRange.end}');
}
```

#### With Screen Size Control

```dart
// Force large screen layout
final DateTimeRange? range = await showCustomDateRangePicker(
  context: context,
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
  forceLargeScreenLayout: true,
);

// Force small screen layout
final DateTimeRange? range = await showCustomDateRangePicker(
  context: context,
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
  forceSmallScreenLayout: true,
);
```

#### With Custom Options

```dart
final DateTimeRange? range = await showCustomDateRangePicker(
  context: context,
  initialDateRange: DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(const Duration(days: 7)),
  ),
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
  helpText: 'Select a date range',
  cancelText: 'Cancel',
  saveText: 'Save',
  fieldStartLabelText: 'Start Date',
  fieldEndLabelText: 'End Date',
);
```

## Screen Size Configuration

The package provides two parameters to control the layout:

- **`forceLargeScreenLayout`**: Forces the picker to use landscape/large screen layout regardless of actual screen size. This is useful for tablets or desktop applications.
- **`forceSmallScreenLayout`**: Forces the picker to use portrait/small screen layout regardless of actual screen size. This is useful for maintaining consistent mobile-style UI.

If both parameters are set to `true`, `forceLargeScreenLayout` takes precedence.

## Enhanced Date Range Picker

The package also includes an `EnhancedDateRangePicker` class that provides a simplified wrapper around the date picker functionality. This is particularly useful for applications that need a consistent, easy-to-use API.

### Basic Usage

```dart
import 'package:date_picker/enhanced_date_picker.dart';

await EnhancedDateRangePicker.show(
  context: context,
  initialCheckIn: DateTime.now(),
  initialCheckOut: DateTime.now().add(Duration(days: 3)),
  title: 'Select Your Stay Dates',
  onDateRangeSelected: (checkIn, checkOut) {
    print('Check-in: $checkIn');
    print('Check-out: $checkOut');
  },
);
```

### With GetX Integration

The `EnhancedDateRangePicker` works seamlessly with GetX:

```dart
await EnhancedDateRangePicker.show(
  context: Get.context!,
  style: myCustomStyle,
  initialCheckIn: controller.searchCheckIn,
  initialCheckOut: controller.searchCheckOut,
  title: 'hotelDetails.selectStayDates'.tr, // Translation support
  onDateRangeSelected: (checkIn, checkOut) {
    controller.updateCheckInDate(checkIn);
    controller.updateCheckOutDate(checkOut);
  },
);
```

### Available Parameters

- `context` (required): The build context
- `style`: Custom styling options (optional)
- `initialCheckIn`: Initial check-in date (optional)
- `initialCheckOut`: Initial check-out date (optional)
- `title`: Dialog title, supports translations (optional)
- `onDateRangeSelected` (required): Callback function that receives the selected dates
- `firstDate`: The earliest selectable date (defaults to today)
- `lastDate`: The latest selectable date (defaults to 2 years from now)
- `helpText`: Help text displayed at the top of the picker (optional)
- `saveText`: Text for the save button (optional)
- `cancelText`: Text for the cancel button (optional)
- `forceLargeScreenLayout`: Force large screen layout (optional)
- `forceSmallScreenLayout`: Force small screen layout (optional)

## Examples

See the `/example` folder for a complete example app demonstrating:

- Single date picker with auto layout
- Single date picker with forced large screen layout
- Single date picker with forced small screen layout
- Date range picker with auto layout
- Date range picker with forced large screen layout
- Date range picker with forced small screen layout

To run the example:

```bash
cd example
flutter pub get
flutter run
```

## Additional Information

This package is based on Flutter's Material Design date picker components with additional customization options and screen size control features.

For issues, feature requests, or contributions, please visit the project repository.
# date_picker
