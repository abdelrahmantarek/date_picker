# Enhanced Date Range Picker - Example App

This example app demonstrates all the features and capabilities of the Enhanced Date Range Picker package.

## 🚀 Running the Example

```bash
flutter pub get
flutter run
```

## 📱 What's Included

### 1. Modal Examples Page

Demonstrates the date picker as a modal bottom sheet:

#### Single Date Selection

- **English**: Single date picker with English locale
- **Arabic**: Single date picker with Arabic locale and RTL support

#### Date Range Selection

- **English**: Date range picker with English locale
- **Arabic**: Date range picker with Arabic locale and RTL support

### 2. Embedded Widget Examples Page

Shows the date picker embedded directly in the screen:

#### Basic Embedded Widgets

- **Single Date Selection**: Compact calendar for selecting one date
- **Date Range Selection**: Full-featured calendar for selecting a date range

#### Responsive Width Examples

- **Small Width (350px)**: Single-column layout even on large screens
- **Medium Width (400px)**: Adaptive layout based on threshold
- **Large Width (700px)**: Two-column layout even on small screens

#### Visibility Customization Examples

- **Minimal Calendar**: No header, no buttons - just the calendar
- **Calendar Without Title**: Cleaner look for space-constrained layouts
- **Calendar With Only Confirm Button**: Streamlined user flow

## 🎨 Features Demonstrated

### Selection Modes

- ✅ Single date selection
- ✅ Date range selection

### Display Modes

- ✅ Modal bottom sheet
- ✅ Embedded widget

### Localization

- ✅ English (en)
- ✅ Arabic (ar) with RTL support

### Customization

- ✅ Custom colors
- ✅ Custom sizes (width and height)
- ✅ Visibility control (header, title, buttons)
- ✅ Responsive layouts

### Responsive Design

- ✅ Widget width-based layout (not just screen size)
- ✅ Single-column layout for narrow widths
- ✅ Two-column layout for wide widths

## 💡 Code Examples

### Modal Bottom Sheet

```dart
ElevatedButton(
  onPressed: () {
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
  },
  child: Text('Select Single Date'),
)
```

### Embedded Widget

```dart
EnhancedDateRangePicker(
  isModal: false,
  height: 500,
  width: 400,
  selectionMode: DateSelectionMode.range,
  primaryColor: Colors.purple,
  locale: 'en',
  onDateSelected: (startDate, endDate) {
    setState(() {
      _selectedRange = DateTimeRange(start: startDate, end: endDate!);
    });
  },
)
```

### Minimal Calendar

```dart
EnhancedDateRangePicker(
  isModal: false,
  height: 400,
  width: 350,
  showHeader: false,
  showActionButtons: false,
  selectionMode: DateSelectionMode.single,
  primaryColor: Colors.teal,
  onDateSelected: (startDate, endDate) {
    // Handle selection
  },
)
```

## 🎯 Learning Path

1. **Start with Modal Examples**: Understand basic usage
2. **Explore Embedded Widgets**: Learn about direct integration
3. **Try Different Widths**: See responsive behavior
4. **Customize Visibility**: Create minimal calendars
5. **Test Localization**: Switch between languages

## 📝 Notes

- All examples are self-contained in `main.dart`
- State management uses simple `setState` (no external dependencies)
- Examples demonstrate best practices for each use case
- Code is well-commented for learning purposes

## 🔗 Related Files

- [Main Package README](../README.md)
- [Improvements Documentation](../IMPROVEMENTS.md)
- [Package Source Code](../lib/date_picker.dart)

---

Happy coding! 🎉
