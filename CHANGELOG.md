# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2024-11-24

### Added

- **EnhancedDateRangePicker**: New simplified wrapper class for easy date range selection
  - Static `show` method for displaying date range picker
  - Callback-based API for receiving selected dates
  - Support for GetX and other state management solutions
  - Translation support for titles and labels
  - All screen size configuration options available
- Screen size configuration options:
  - `forceLargeScreenLayout` parameter to force large screen (tablet/desktop) layout
  - `forceSmallScreenLayout` parameter to force small screen (mobile) layout
  - Both parameters available in `showCustomDatePicker` and `showCustomDateRangePicker`
- Complete example app demonstrating:
  - Single date picker with auto layout
  - Single date picker with forced large screen layout
  - Single date picker with forced small screen layout
  - Date range picker with auto layout
  - Date range picker with forced large screen layout
  - Date range picker with forced small screen layout
  - Enhanced date range picker usage
- Comprehensive README with usage examples and documentation
- Example README with detailed instructions

### Fixed

- Removed dead code in `showCustomDateRangePicker` (duplicate return statement)
- Removed undefined variables:
  - `maxRangeDate` in validation logic
  - `showToast` and `ToastPosition` in validation
  - `systemOverlayStyle` in AppBar
- Updated deprecated API usage:
  - Replaced `Color.withOpacity()` with `Color.withValues(alpha:)` (3 occurrences)
  - Replaced `TextScaler.textScaleFactor` with `TextScaler.scale()`
- Removed unused imports:
  - `dart:developer`
  - `package:flutter/widgets.dart` (duplicate)
- Removed unused constants:
  - `_inputRangeLandscapeDialogSize`
- Removed unused local variables in multiple locations

### Changed

- Updated package to use Flutter SDK ^3.9.0
- Improved code quality by removing all warnings and errors
- Enhanced date picker dialogs to respect screen size configuration

### Technical Details

- Added `_getEffectiveOrientation()` helper method in:
  - `_CustomDatePickerDialogState`
  - `_DateRangePickerDialogState`
  - `_InputDateRangePickerDialog`
- Screen size parameters propagate through the widget tree:
  - `showCustomDatePicker` → `CustomDatePickerDialog` → `_CustomDatePickerDialogState`
  - `showCustomDateRangePicker` → `DateRangePickerDialog` → `_DateRangePickerDialogState` → child dialogs

## [0.1.0] - Initial Release

### Added

- Custom single date picker (`showCustomDatePicker`)
- Custom date range picker (`showCustomDateRangePicker`)
- Support for calendar and input entry modes
- Material Design 3 styling support
- Customizable icons, labels, and validation messages
- Keyboard navigation and accessibility features
