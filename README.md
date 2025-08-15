# Flutter Assignment 3 - Clean Architecture with MVVM

A Flutter project demonstrating clean architecture principles, MVVM pattern, and provider state management for scalable and maintainable applications.

## 🏗️ Architecture Overview

This project follows **Clean Architecture** principles with **MVVM (Model-View-ViewModel)** pattern, ensuring:

- **Separation of Concerns**: Clear boundaries between layers
- **Testability**: Easy to unit test each layer independently
- **Maintainability**: Code is organized and easy to understand
- **Scalability**: Easy to add new features without affecting existing code
- **Dependency Inversion**: High-level modules don't depend on low-level modules

## 📁 Project Structure

```
lib/
├── core/                           # Core functionality shared across the app
│   ├── constants/                  # App-wide constants
│   ├── di/                        # Dependency injection
│   ├── error/                     # Error handling and failures
│   ├── network/                   # Network layer (API client)
│   ├── theme/                     # App theming (colors, text styles)
│   ├── usecases/                  # Base use case interface
│   ├── utils/                     # Utility classes (logger)
│   └── widgets/                   # Reusable UI components
├── features/                      # Feature-based modules
│   └── auth/                      # Authentication feature
│       ├── data/                  # Data layer
│       │   ├── models/            # Data models (JSON serializable)
│       │   ├── repositories/      # Repository implementations
│       │   └── datasources/       # Remote and local data sources
│       ├── domain/                # Domain layer (business logic)
│       │   ├── entities/          # Business entities
│       │   ├── repositories/      # Repository interfaces
│       │   └── usecases/          # Business use cases
│       └── presentation/          # Presentation layer (UI)
│           ├── screens/           # UI screens
│           ├── viewmodels/        # ViewModels (MVVM)
│           └── widgets/           # Feature-specific widgets
└── main.dart                      # App entry point
```

## 🎯 Key Features

### 1. **Clean Architecture Layers**

- **Presentation Layer**: UI, ViewModels, and user interactions
- **Domain Layer**: Business logic, entities, and use cases
- **Data Layer**: Data sources, repositories, and models

### 2. **MVVM Pattern**

- **Model**: Data models and business entities
- **View**: UI screens and widgets
- **ViewModel**: State management and business logic coordination

### 3. **Provider State Management**

- Centralized state management
- Reactive UI updates
- Easy testing and debugging

### 4. **Dependency Injection**

- GetIt for service locator pattern
- Loose coupling between components
- Easy to mock for testing

### 5. **Network Layer**

- Dio HTTP client with interceptors
- Comprehensive error handling
- Request/response logging
- Token management

### 6. **Theme System**

- Consistent color scheme
- Typography system
- Light/dark theme support
- Material 3 design

### 7. **Error Handling**

- Custom failure classes
- Centralized error management
- User-friendly error messages

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.8.1 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / VS Code

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd flutter_assignment3
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Code Generation

For JSON serialization, run:
```bash
flutter packages pub run build_runner build
```

Or for continuous generation:
```bash
flutter packages pub run build_runner watch
```

## 📱 Features Implemented

### Authentication System
- Login/Registration screens
- Form validation
- Error handling
- User session management

### UI Components
- Custom buttons with multiple styles
- Consistent theming
- Responsive design
- Loading states

### State Management
- Provider-based state management
- MVVM architecture
- Reactive UI updates

## 🧪 Testing

The architecture is designed for easy testing:

```dart
// Example test for a use case
void main() {
  group('LoginUseCase', () {
    late MockAuthRepository mockRepository;
    late LoginUseCase useCase;

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = LoginUseCase(mockRepository);
    });

    test('should return AuthResponse when login is successful', () async {
      // Arrange
      final params = LoginParams(email: 'test@example.com', password: 'password');
      final expectedResponse = AuthResponse(success: true, message: 'Success');
      
      when(mockRepository.login(any, any))
          .thenAnswer((_) async => Right(expectedResponse));

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, Right(expectedResponse));
      verify(mockRepository.login(params.email, params.password));
    });
  });
}
```

## 🔧 Configuration

### Environment Variables
Update `lib/core/constants/app_constants.dart`:
```dart
class AppConstants {
  static const String baseUrl = 'https://your-api-url.com';
  static const String apiVersion = '/v1';
  // ... other constants
}
```

### Theme Customization
Modify `lib/core/theme/app_colors.dart` and `app_text_styles.dart` to match your brand.

## 📚 Dependencies

### Core Dependencies
- **provider**: State management
- **dio**: HTTP client
- **get_it**: Dependency injection
- **dartz**: Functional programming
- **logger**: Logging utility

### Development Dependencies
- **build_runner**: Code generation
- **json_serializable**: JSON serialization

## 🏗️ Adding New Features

### 1. **Create Feature Module**
```
features/
└── new_feature/
    ├── data/
    ├── domain/
    └── presentation/
```

### 2. **Define Domain Layer**
- Create entities
- Define repository interfaces
- Implement use cases

### 3. **Implement Data Layer**
- Create data models
- Implement repositories
- Add data sources

### 4. **Build Presentation Layer**
- Create ViewModels
- Build UI screens
- Add to dependency injection

### 5. **Update Main App**
- Add providers
- Configure routing
- Handle navigation

## 🔍 Code Quality

### Linting
The project uses `flutter_lints` for code quality:
```yaml
dev_dependencies:
  flutter_lints: ^5.0.0
```

### Analysis Options
Configured in `analysis_options.yaml` for consistent code style.

## 🚀 Deployment

### Build Commands
```bash
# Android APK
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

## 🤝 Contributing

1. Follow the existing architecture patterns
2. Add tests for new features
3. Update documentation
4. Follow Flutter coding conventions

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

For questions or issues:
1. Check the documentation
2. Review existing code examples
3. Create an issue with detailed description

## 🔮 Future Enhancements

- [ ] Unit tests for all layers
- [ ] Integration tests
- [ ] CI/CD pipeline
- [ ] More features (profile, settings, etc.)
- [ ] Internationalization (i18n)
- [ ] Analytics integration
- [ ] Push notifications
- [ ] Offline support

---

**Happy Coding! 🎉**
