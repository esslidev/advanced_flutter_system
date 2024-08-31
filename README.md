# Ali salem's Advanced Flutter System

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

```
└── 📁lib
    └── 📁config
        └── 📁routes
            └── 📁locations
                └── 📁app_locations
                    └── bad_routing.dart
                    └── home_location.dart
                └── 📁home_locations
                    └── dashboard_location.dart
            └── app_routes.dart
            └── home_routes.dart
        └── 📁theme
            └── app_style.dart
    └── 📁core
        └── 📁constants
            └── api_constants.dart
            └── app_paths.dart
            └── app_theme.dart
            └── shared_preference_keys.dart
        └── 📁enums
            └── theme_enums.dart
            └── user.dart
            └── widget_enums.dart
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
            └── network_util.dart
            └── prefs_util.dart
            └── responsive_screen_adapter.dart
            └── responsive_size_adapter.dart
            └── third_party_auth_util.dart
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
                └── credentials.dart
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
                └── 📁app
                    └── 📁language
                    └── 📁route
                        └── route_bloc.dart
                        └── route_event.dart
                        └── route_state.dart
                    └── 📁theme
                        └── theme_bloc.dart
                        └── theme_event.dart
                        └── theme_state.dart
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
                └── 📁dropdown
                    └── dropdown.dart
                └── 📁error
                    └── error.dart
                └── 📁loading
                    └── loading.dart
            └── 📁screens
                └── 📁bad_routing
                    └── bad_routing.dart
                └── 📁home
                    └── 📁components
                    └── 📁dashboard
                        └── dashboard.dart
                    └── home.dart
            └── 📁widgets
                └── 📁common
                    └── custom_button.dart
                    └── custom_display.dart
                    └── custom_field.dart
                    └── custom_line.dart
                    └── custom_table.dart
                    └── custom_text_field.dart
                    └── custom_text.dart
                    └── custom_tooltip.dart
                └── 📁features
                    └── bread_crumbs.dart
                    └── custom_navigation_indicator.dart
                    └── global_card.dart
    └── locator.dart
    └── main.dart
```