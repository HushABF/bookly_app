# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Quick Start Commands

### Development
- **Run app**: `flutter run`
- **Run on specific device**: `flutter run -d <device_id>`
- **List available devices**: `flutter devices`

### Code Quality
- **Analyze code**: `flutter analyze`
- **Format code**: `dart format lib/`
- **Get dependencies**: `flutter pub get`
- **Update dependencies**: `flutter pub upgrade`

### Building
- **Build APK (Android)**: `flutter build apk`
- **Build iOS**: `flutter build ios`
- **Build web**: `flutter build web`

## Architecture Overview

This is a **Flutter app** that displays books using the **Google Books API**. The architecture follows clean architecture principles with clear separation of concerns.

### Key Layers

1. **Core** (`lib/core/`)
   - **Models**: `book_model/` - JSON-serializable data models for the Google Books API response
   - **Errors**: `errors/failures.dart` - Failure handling using dartz `Either` type
   - **Utils**: API service, routing, dependency injection, styling, utility functions
   - **Widgets**: Reusable widgets (loading indicators, error widgets, buttons)

2. **Features** (`lib/features/`)
   - **Home**: Browse featured and newest books, view book details
   - **Search**: Search for books by query
   - **Splash**: Initial app startup screen

   Each feature follows **presentation → data** structure:
   - `presentation/`: UI layer with Cubits for state management
   - `data/`: Repository pattern with abstract interfaces and implementations

### State Management

- Uses **BLoC/Cubit** (flutter_bloc) for state management
- Each feature has dedicated Cubits: `FeaturedBooksCubit`, `NewestBooksCubit`, `SimilarBooksCubit`, `SearchBooksCubit`
- State follows pattern: `Initial` → `Loading` → `Success`/`Failure`
- **Cubit pattern**: Classes emit states; methods are simple functions (vs BLoC which uses events)

### Data Flow Pattern

```
View (BlocConsumer/BlocBuilder)
  ↓
Cubit (business logic, calls repository methods)
  ↓
Repository (abstract interface in domain)
  ↓
Repository Implementation (data fetching)
  ↓
API Service (Dio HTTP client)
```

### Dependency Injection

- Uses **GetIt** for service locator pattern
- Setup in `lib/core/utils/service_locator.dart` in `setupServiceLocator()` function
- Singletons registered: `ApiService`, `HomeRepoImpl`, `SearchRepoImpl`
- Initialized at app startup in `main.dart`

### Routing

- Uses **GoRouter** for navigation
- Routes defined in `lib/core/utils/app_router.dart`
- Routes:
  - `/` → SplashView
  - `/homeView` → HomeView
  - `/searchView` → SearchView (with SearchBooksCubit provider)
  - `/bookDetailsView` → BookDetailsView (receives BookModel as extra parameter)

### API Integration

- **Base URL**: `https://www.googleapis.com/books/v1/`
- **Client**: Dio for HTTP requests
- **Service**: `ApiService` class wraps Dio, methods in repos construct endpoints
- Common queries: free-ebooks filter, sorted by newest/relevance

### Error Handling

- **dartz** package for functional programming (`Either<Failure, Success>`)
- `Failure` abstract class with `ServerFailure` implementation
- `ServerFailure.fromDioError()` for Dio exception handling
- Repositories return `Either<Failure, Data>` - left for errors, right for success

### Key Dependencies

- `flutter_bloc: ^9.1.1` - State management
- `go_router: ^17.0.0` - Navigation
- `dio: ^5.9.0` - HTTP client
- `dartz: ^0.10.1` - Functional programming (Either type)
- `get_it: ^9.1.0` - Service locator
- `equatable: ^2.0.7` - Value equality
- `cached_network_image: ^3.4.1` - Image caching
- `url_launcher: ^6.3.2` - Opening URLs
- `google_fonts: ^6.3.2` - Custom fonts
- `font_awesome_flutter: ^10.12.0` - Icons

## Project Structure

```
lib/
├── main.dart                          # App entry, MultiBlocProvider setup
├── constants.dart                     # App-wide constants (colors, etc.)
├── core/
│   ├── errors/failures.dart           # Failure types for error handling
│   ├── models/book_model/             # Multi-level JSON models for Google Books API
│   ├── utils/
│   │   ├── api_service.dart           # Dio wrapper for API calls
│   │   ├── app_router.dart            # GoRouter configuration
│   │   ├── service_locator.dart       # GetIt dependency setup
│   │   ├── styles.dart                # Text/color styling constants
│   │   ├── assets.dart                # Asset paths
│   │   └── functions/
│   │       └── custom_url.dart        # URL utilities
│   └── widgets/                       # Shared UI components
├── features/
│   ├── home/
│   │   ├── data/
│   │   │   ├── repos/                 # HomeRepo abstract, HomeRepoImpl concrete
│   │   │   └── models/                # Feature-specific data models (if any)
│   │   └── presentation/
│   │       ├── manager/               # Cubits (featured_books, newest_books, similar_books)
│   │       └── views/                 # HomeView, BookDetailsView
│   ├── search/
│   │   ├── data/repos/                # SearchRepo implementation
│   │   └── presentation/
│   │       ├── manager/               # SearchBooksCubit
│   │       └── views/                 # SearchView
│   └── splash/
│       └── presentation/views/        # SplashView
```

## Common Development Tasks

### Adding a New Feature
1. Create feature folder under `lib/features/<feature_name>/`
2. Set up data layer: create abstract repo in `data/repos/`, implement it
3. Set up presentation layer: create Cubit in `presentation/manager/`, create view(s)
4. Register repository in `service_locator.dart`
5. Add route in `app_router.dart`
6. If needed, add BlocProvider in route or use existing patterns

### Creating a New Cubit
1. Create file: `lib/features/<feature>/presentation/manager/<name>/<name>_cubit.dart`
2. Use `part` directive for state file: `part '<name>_state.dart'`
3. Extend `Cubit<YourState>` with repository in constructor
4. State file uses sealed classes: `Initial`, `Loading`, `Success`, `Failure`
5. Example pattern in `featured_books_cubit.dart`

### Adding API Endpoints
1. Add method to abstract `Repo` in `features/<feature>/data/repos/`
2. Implement in `RepoImpl` using `apiService.get(endPoint: '...')`
3. Return `Either<Failure, List<BookModel>>` for error handling
4. Add corresponding Cubit method that calls repo method
5. Add exception handling: check `if (e is DioException)` and use `ServerFailure.fromDioError(e)`

### Styling and Constants
- Colors and theme: `lib/constants.dart` (e.g., `kPrimaryColor`)
- Text styles: `lib/core/utils/styles.dart`
- Google Fonts configured in `main.dart` with Montserrat theme

## Testing Notes

- Uses `flutter_test` from Flutter SDK
- No extensive test suite currently in place
- To run tests: `flutter test` or `flutter test test/<test_file>.dart` for specific test

## Official Flutter Guidelines

This project follows the **[Flutter AI Rules](./FLUTTER_RULES.md)** established by the official Flutter team. Review that document for comprehensive guidance on Flutter/Dart development standards.

**Key Deviations from Official Guidelines in This Project:**
- Uses **BLoC/Cubit** (third-party) instead of built-in `ValueNotifier`/`ChangeNotifier` for state management - this is a valid choice for larger apps but the Flutter team recommends built-in solutions where possible
- All other practices align with official guidelines: go_router for navigation, SOLID principles, clean architecture layers, google_fonts for typography

## Notes

- App uses sealed classes for state types (Dart 3.0+ feature) - provides exhaustive switch checking
- Equatable package ensures proper equality for state objects
- All book data comes from Google Books API (free tier)
- URL launching supported via `url_launcher` package for opening book links
- Image caching via `cached_network_image` for network book covers


---
# IMPORTANT: UPDATE THIS FILE EACH TIME THERE A BIG CHANGE TO CODE
---