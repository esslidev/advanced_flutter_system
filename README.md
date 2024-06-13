# Ali's Advanced Flutter System

Welcome to my Advanced Flutter System repository! This project is built with clean architecture principles and leverages several powerful libraries and tools including BLoC, GetIt, Beamer, Retrofit, and build_runner and much more...

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## Features

- **Clean Architecture**: Ensures a scalable and maintainable codebase.
- **State Management**: Utilizes BLoC for predictable state management.
- **Dependency Injection**: GetIt is used for dependency injection.
- **Routing**: Beamer is implemented for advanced routing.
- **Networking**: Retrofit is used for API calls.
- **Code Generation**: build_runner is used for generating code.

## Technologies Used

- Flutter
- Dart
- BLoC (Business Logic Component)
- GetIt
- Beamer
- Retrofit
- build_runner

### Prerequisites

- Flutter SDK
- Dart SDK
- Visual Studio Code (or your preferred IDE)

### Installation

1. **Clone the repository**:

    ```bash
    git clone https://github.com/your-username/advanced-flutter-system.git
    cd advanced-flutter-system
    ```

2. **Install dependencies**:

    ```bash
    flutter pub get
    ```

3. **Generate code**:

    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

4. **Run the project**:

    ```bash
    flutter run
    ```

## Folder Structure

The project follows a clean architecture structure:

```plaintext
└── 📁lib
    └── 📁config
        └── 📁routes
            └── app_routes.dart
            └── home_routes.dart
            └── 📁locations
                └── 📁app_locations
                    └── bad_routing.dart
                    └── home_location.dart
                └── 📁home_locations
                    └── dashboard_location.dart
                    └── settings_location.dart
        └── 📁theme
            └── app_themes.dart
    └── 📁core
        └── 📁constants
            └── api_constants.dart
            └── app_colors.dart
            └── app_paths.dart
            └── shared_preference_keys.dart
        └── 📁enums
            └── api_enums.dart
            └── user.dart
        └── 📁resources
            └── data_state.dart
            └── menu_model.dart
        └── 📁util
            └── api_util.dart
            └── app_util.dart
            └── custom_timer.dart
            └── events_util.dart
            └── localization_service.dart
            └── navigation_util.dart
            └── prefs_util.dart
            └── responsive_screen_adapter.dart
            └── responsive_size_adapter.dart
            └── route_path_service.dart
    └── 📁features
        └── 📁data
            └── 📁data_sources
                └── 📁remote
                    └── auth_api_service.dart
                    └── auth_api_service.g.dart
                    └── user_api_service.dart
                    └── user_api_service.g.dart
            └── 📁models
                └── auth_response.dart
                └── data_response.dart
                └── data_response.g.dart
                └── user_model.dart
                └── user_model.g.dart
            └── 📁repository_impl
                └── auth.dart
                └── user.dart
        └── 📁domain
            └── 📁entities
                └── auth_response.dart
                └── data_response.dart
                └── user.dart
            └── 📁repository
                └── auth.dart
                └── user.dart
            └── 📁usecases
                └── auth.dart
                └── user.dart
        └── 📁presentation
            └── 📁bloc
                └── 📁app_blocs
                    └── 📁route
                        └── route_bloc.dart
                        └── route_event.dart
                        └── route_state.dart
                └── 📁local
                └── 📁remote
                    └── 📁auth
                        └── auth_bloc.dart
                        └── auth_event.dart
                        └── auth_state.dart
                    └── 📁user
                        └── user_bloc.dart
                        └── user_event.dart
                        └── user_state.dart
            └── 📁overlays
                └── 📁busy
                    └── busy.dart
                └── 📁error
                    └── error.dart
            └── 📁screens
                └── 📁bad_routing
                    └── bad_routing.dart
                └── 📁dashboard
                    └── dashboard.dart
                └── 📁home
                    └── 📁components
                        └── home_navigator.dart
                        └── top_bar.dart
                    └── home.dart
                └── 📁settings
                    └── settings.dart
            └── 📁widgets
                └── bread_crumbs.dart
                └── custom_button.dart
                └── custom_dropdown.dart
                └── custom_table.dart
                └── custom_text_field.dart
                └── field.dart
    └── locator.dart
    └── main.dart
```
