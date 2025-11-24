# Enhanced Date Range Picker

A highly customizable and feature-rich date picker package for Flutter that supports both single date selection and date range selection. Perfect for any Flutter application including mobile, tablet, desktop, and web.

![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue)
![Dart](https://img.shields.io/badge/Dart-3.0%2B-blue)
![License](https://img.shields.io/badge/license-MIT-green)

## ✨ Features

- 📅 **Dual Selection Modes**: Single date or date range selection
- 🎨 **Highly Customizable**: Control colors, translations, and UI visibility
- 📱 **Responsive Design**: Adapts to screen size with single/two-column layouts
- 🌍 **Internationalization**: Built-in support for English and Arabic (easily extensible)
- 🎯 **Two Display Modes**: Modal bottom sheet or embedded widget
- 🔧 **Flexible Sizing**: Custom width and height for embedded mode
- 👁️ **Visibility Control**: Show/hide header, title, buttons, and more
- 🎭 **Smart Layout**: Responsive layout based on widget width, not just screen size
- 🚀 **Zero Dependencies**: No external state management required
- ♿ **Accessible**: Keyboard navigation and screen reader support

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  enhanced_date_range_picker:
    git:
      url: https://github.com/yourusername/date_picker.git
```

Or for local development:

```yaml
dependencies:
  enhanced_date_range_picker:
    path: path/to/date_picker
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

### Modal Bottom Sheet (Default)

```dart
import 'package:enhanced_date_range_picker/date_picker.dart';

// Single Date Selection
ElevatedButton(
  onPressed: () {
    EnhancedDateRangePicker.show(
      context: context,
      selectionMode: DateSelectionMode.single,
      onDateSelected: (startDate, endDate) {
        print('Selected date: $startDate');
      },
    );
  },
  child: Text('Select Date'),
)

// Date Range Selection
ElevatedButton(
  onPressed: () {
    EnhancedDateRangePicker.show(
      context: context,
      selectionMode: DateSelectionMode.range,
      onDateSelected: (startDate, endDate) {
        print('Selected range: $startDate to $endDate');
      },
    );
  },
  child: Text('Select Date Range'),
)
```

### Embedded Widget

```dart
// Embed directly in your layout
EnhancedDateRangePicker(
  isModal: false,
  height: 500,
  width: 400,
  selectionMode: DateSelectionMode.single,
  primaryColor: Colors.blue,
  onDateSelected: (startDate, endDate) {
    print('Selected: $startDate');
  },
)
```

## 📖 Comprehensive Examples

### 1. Single Date Selection (Modal)

Perfect for appointments, deadlines, birthdays, and events.

```dart
EnhancedDateRangePicker.show(
  context: context,
  selectionMode: DateSelectionMode.single,
  primaryColor: Colors.blue,
  locale: 'en',
  onDateSelected: (startDate, endDate) {
    setState(() {
      _selectedDate = startDate;
    });
  },
);
```

### 2. Date Range Selection (Modal)

Ideal for booking systems, report date ranges, and analytics filtering.

```dart
EnhancedDateRangePicker.show(
  context: context,
  selectionMode: DateSelectionMode.range,
  primaryColor: Colors.green,
  locale: 'en',
  onDateSelected: (startDate, endDate) {
    setState(() {
      _startDate = startDate;
      _endDate = endDate;
    });
  },
);
```

### 3. Arabic Localization

Full RTL support with Arabic translations.

```dart
EnhancedDateRangePicker.show(
  context: context,
  selectionMode: DateSelectionMode.single,
  primaryColor: Colors.green,
  locale: 'ar',
  onDateSelected: (startDate, endDate) {
    print('التاريخ المختار: $startDate');
  },
);
```

### 4. Embedded Widget with Custom Size

Perfect for dashboards and custom layouts.

```dart
Center(
  child: EnhancedDateRangePicker(
    isModal: false,
    height: 500,
    width: 400,
    selectionMode: DateSelectionMode.range,
    primaryColor: Colors.purple,
    onDateSelected: (startDate, endDate) {
      print('Range: $startDate to $endDate');
    },
  ),
)
```

### 5. Responsive Width-Based Layout

The calendar adapts to the widget's width, not just screen size.

```dart
// Small width - shows single column even on large screens
EnhancedDateRangePicker(
  isModal: false,
  height: 500,
  width: 350,  // < 600px → single column
  selectionMode: DateSelectionMode.range,
  onDateSelected: (startDate, endDate) {},
)

// Large width - shows two columns even on small screens
EnhancedDateRangePicker(
  isModal: false,
  height: 500,
  width: 700,  // > 600px → two columns
  selectionMode: DateSelectionMode.range,
  onDateSelected: (startDate, endDate) {},
)
```

### 6. Minimal Calendar (No Header, No Buttons)

Perfect for embedding in custom forms with external controls.

```dart
EnhancedDateRangePicker(
  isModal: false,
  height: 400,
  width: 350,
  showHeader: false,
  showActionButtons: false,
  selectionMode: DateSelectionMode.single,
  onDateSelected: (startDate, endDate) {
    // Handle selection externally
  },
)
```

### 7. Calendar Without Title

Cleaner look for space-constrained layouts.

```dart
EnhancedDateRangePicker(
  isModal: false,
  height: 500,
  width: 400,
  showTitle: false,
  selectionMode: DateSelectionMode.range,
  onDateSelected: (startDate, endDate) {
    print('Selected: $startDate to $endDate');
  },
)
```

### 8. Calendar with Only Confirm Button

Streamlined user flow for quick selections.

```dart
EnhancedDateRangePicker(
  isModal: false,
  height: 500,
  width: 400,
  showCancelButton: false,
  selectionMode: DateSelectionMode.single,
  onDateSelected: (startDate, endDate) {
    print('Confirmed: $startDate');
  },
)
```

### 9. Custom Colors and Translations

```dart
EnhancedDateRangePicker.show(
  context: context,
  selectionMode: DateSelectionMode.range,
  primaryColor: Color(0xFF6200EE),
  locale: 'en',
  translations: {
    'datePicker.title': 'Pick Your Date',
    'datePicker.confirm': 'Done',
    'datePicker.cancel': 'Close',
  },
  onDateSelected: (startDate, endDate) {
    print('Custom picker: $startDate to $endDate');
  },
);
```

## 🎨 Customization Options

### Display Mode

| Parameter | Type   | Default | Description                                   |
| --------- | ------ | ------- | --------------------------------------------- |
| `isModal` | `bool` | `true`  | Show as modal bottom sheet or embedded widget |

### Selection Mode

| Parameter       | Type                | Default | Description                         |
| --------------- | ------------------- | ------- | ----------------------------------- |
| `selectionMode` | `DateSelectionMode` | `range` | Single date or date range selection |

### Sizing (Embedded Mode Only)

| Parameter | Type      | Default | Description                       |
| --------- | --------- | ------- | --------------------------------- |
| `height`  | `double?` | `null`  | Custom height for embedded widget |
| `width`   | `double?` | `null`  | Custom width for embedded widget  |

### Visibility Control

| Parameter           | Type   | Default | Description                      |
| ------------------- | ------ | ------- | -------------------------------- |
| `showHeader`        | `bool` | `true`  | Show/hide entire header section  |
| `showTitle`         | `bool` | `true`  | Show/hide title text             |
| `showSelectedDates` | `bool` | `true`  | Show/hide selected dates display |
| `showActionButtons` | `bool` | `true`  | Show/hide action buttons section |
| `showCancelButton`  | `bool` | `true`  | Show/hide Cancel button          |
| `showConfirmButton` | `bool` | `true`  | Show/hide Confirm button         |

### Styling

| Parameter      | Type     | Default             | Description                                      |
| -------------- | -------- | ------------------- | ------------------------------------------------ |
| `primaryColor` | `Color`  | `Color(0xFF2196F3)` | Primary color for selections and buttons         |
| `title`        | `String` | `''`                | Custom title (uses default translation if empty) |

### Localization

| Parameter      | Type                   | Default | Description                    |
| -------------- | ---------------------- | ------- | ------------------------------ |
| `locale`       | `String`               | `'en'`  | Locale code ('en', 'ar', etc.) |
| `translations` | `Map<String, String>?` | `null`  | Custom translation overrides   |

### Date Configuration

| Parameter          | Type        | Default | Description                        |
| ------------------ | ----------- | ------- | ---------------------------------- |
| `initialStartDate` | `DateTime?` | `null`  | Initial start date                 |
| `initialEndDate`   | `DateTime?` | `null`  | Initial end date (range mode only) |

### Callbacks

| Parameter        | Type                            | Required | Description                    |
| ---------------- | ------------------------------- | -------- | ------------------------------ |
| `onDateSelected` | `Function(DateTime, DateTime?)` | Yes      | Called when dates are selected |

## 🌍 Internationalization

### Built-in Languages

- 🇬🇧 English (`en`)
- 🇸🇦 Arabic (`ar`)

### Adding Custom Translations

```dart
EnhancedDateRangePicker.show(
  context: context,
  locale: 'es',
  translations: {
    'datePicker.title': 'Seleccionar Fecha',
    'datePicker.titleRange': 'Seleccionar Rango de Fechas',
    'datePicker.startDate': 'Fecha de Inicio',
    'datePicker.endDate': 'Fecha de Fin',
    'datePicker.cancel': 'Cancelar',
    'datePicker.confirm': 'Confirmar',
    'datePicker.sunday': 'Dom',
    'datePicker.monday': 'Lun',
    'datePicker.tuesday': 'Mar',
    'datePicker.wednesday': 'Mié',
    'datePicker.thursday': 'Jue',
    'datePicker.friday': 'Vie',
    'datePicker.saturday': 'Sáb',
  },
  onDateSelected: (startDate, endDate) {},
);
```

## 📱 Responsive Design

The calendar automatically adapts its layout based on available width:

- **Width > 600px**: Two-column layout (2 months side-by-side)
- **Width ≤ 600px**: Single-column layout (1 month per row)

This applies to both screen width (modal mode) and widget width (embedded mode).

## 🎯 Use Cases

- 📅 **Appointment Scheduling**: Single date selection for bookings
- 📊 **Report Date Ranges**: Range selection for analytics
- 🎂 **Birthday/Event Selection**: Single date for special occasions
- 📝 **Task Deadlines**: Single date for due dates
- 🏨 **Booking Systems**: Range selection for hotel/rental bookings
- 📈 **Analytics Filtering**: Range selection for data analysis
- 💻 **Web Applications**: Embedded widgets in dashboards
- 📱 **Tablet Applications**: Responsive two-column layout
- 🎨 **Custom Forms**: Minimal calendar with external controls
- 📋 **Dashboard Widgets**: Compact embedded calendars

## 🏃 Running the Example

The package includes a comprehensive example app demonstrating all features:

```bash
cd example
flutter pub get
flutter run
```

The example app includes:

- **Modal Examples**: Single date and date range selection in modal bottom sheets
- **Embedded Examples**: Calendars embedded directly in the screen
- **Localization Examples**: English and Arabic language support
- **Customization Examples**: Different visibility configurations
- **Responsive Examples**: Different width configurations

## 📚 API Reference

### EnhancedDateRangePicker Class

Main widget class for the date picker.

#### Constructor

```dart
EnhancedDateRangePicker({
  Key? key,
  DateTime? initialStartDate,
  DateTime? initialEndDate,
  required Function(DateTime startDate, DateTime? endDate)? onDateSelected,
  String title = '',
  Color primaryColor = const Color(0xFF2196F3),
  Map<String, String>? translations,
  String locale = 'en',
  DateSelectionMode selectionMode = DateSelectionMode.range,
  bool isModal = true,
  double? height,
  double? width,
  bool showHeader = true,
  bool showTitle = true,
  bool showSelectedDates = true,
  bool showActionButtons = true,
  bool showCancelButton = true,
  bool showConfirmButton = true,
})
```

#### Static Method

```dart
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
})
```

### DateSelectionMode Enum

```dart
enum DateSelectionMode {
  single,  // Select a single date
  range,   // Select a date range (start and end dates)
}
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Built with Flutter's Material Design components
- Inspired by modern date picker UX patterns
- Special thanks to the Flutter community

## 📞 Support

For issues, feature requests, or questions:

- Open an issue on GitHub
- Check the [IMPROVEMENTS.md](IMPROVEMENTS.md) file for detailed change history
- Review the example app for implementation guidance

## 🔄 Changelog

See [IMPROVEMENTS.md](IMPROVEMENTS.md) for a detailed list of changes and improvements.

---

Made with ❤️ using Flutter
