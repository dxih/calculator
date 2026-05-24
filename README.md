# Flutter Calculator

A simple, clean Flutter calculator application built with **Clean Architecture** principles for easy maintenance and updates.

## Architecture Overview

The project follows **Clean Architecture** with three main layers:

### 1. **Domain Layer** (`lib/domain/`)
- **Models**: Pure data models (`CalculationResult`)
- **Repositories**: Abstract interfaces defining business logic contracts (`CalculatorRepository`)
- **Independent** of any framework or external dependencies

### 2. **Data Layer** (`lib/data/`)
- **Datasources**: Concrete implementation of data operations (`CalculatorLocalDataSource`)
- **Repositories**: Implementation of domain repository contracts
- **Handles** calculation logic and history management

### 3. **Presentation Layer** (`lib/presentation/`)
- **Screens**: UI screens (`CalculatorScreen`)
- **Providers**: State management using Provider pattern (`CalculatorProvider`)
- **Widgets**: Reusable UI components (`CalculatorButton`, `HistoryPanel`)

## Key Features

✅ **Clean Architecture** - Easy to update and maintain
✅ **Provider State Management** - Simple and efficient state handling
✅ **Calculation History** - Keeps track of calculations
✅ **Error Handling** - Graceful error management
✅ **Responsive Design** - Adapts to different screen sizes
✅ **Expression Evaluation** - Support for basic math operations (+, -, *, /)

## File Structure

```
lib/
├── domain/
│   ├── models/
│   │   └── calculation_result.dart
│   └── repositories/
│       └── calculator_repository.dart
├── data/
│   ├── datasources/
│   │   └── calculator_local_datasource.dart
│   └── repositories/
│       └── calculator_repository_impl.dart
├── presentation/
│   ├── providers/
│   │   └── calculator_provider.dart
│   ├── screens/
│   │   └── calculator_screen.dart
│   └── widgets/
│       ├── calculator_button.dart
│       └── history_panel.dart
└── main.dart
```

## Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart (>=3.0.0)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/dxih/calculator.git
cd calculator
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## How to Extend & Update

### Adding New Operations
1. Update `_evaluateExpression()` in `lib/data/datasources/calculator_local_datasource.dart`
2. Add new operator buttons in `lib/presentation/screens/calculator_screen.dart`

### Adding Features
- **New calculations**: Modify the `CalculatorProvider`
- **UI changes**: Update widgets in `lib/presentation/widgets/`
- **Business logic**: Update `CalculatorRepository` implementations

### Adding New Datasources
1. Create a new datasource class implementing `CalculatorLocalDataSource`
2. Update the Provider setup in `main.dart`
3. No changes needed in domain or presentation layers!

## Dependencies

- **provider** (^6.0.0) - State management
- **intl** (^0.19.0) - Internationalization

## License

This project is open source and available under the MIT License.

## Author

Created by dxih
