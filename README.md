## images![Screenshot (124)](https://github.com/user-attachments/assets/b3dfb331-1b9c-4843-95e7-13bf97bbc06e)

![Screenshot (126)](https://github.com/user-attachments/assets/79b737b2-e779-4016-ab7d-2cb7f3919bff)

# Route Task

## Overview
This Flutter project follows the Clean Architecture with MVVM (Model-View-ViewModel) pattern, organized into four main layers: App, Data, Domain, and Presentation. Each layer has a specific responsibility, promoting separation of concerns and making the codebase easier to manage and scale.

## Project Structure

### 1. App Layer
The App layer contains essential configurations and setups for the application. It includes:
- **App:** The main application class and configurations.
- **Injectable-Get It:** Dependency injection setup using the injectable and get_it packages.
- **Extensions:** Important extension methods and classes used throughout the app.
- **Constants**: Constant values and important classes used across the application.

### 2. Data Layer
The Data layer is responsible for handling all data-related operations, including fetching data from remote servers, local databases, and transforming data between different formats.

#### Contents:
- **Response:**
  - Data models representing API responses.
- **Network:**
  - Network service setup and API client configurations.
  - Error handling classes and mechanisms.
  - **Failure and Error Handling:**
    - Classes to manage different types of errors and failures from the network layer.
  - **Internet Checker:**
    - Utility to check the current internet connectivity status.
- **Mapper:**
  - Classes to map data from API models to domain models.
- **Repository Implementation:**
  - Concrete implementations of repository interfaces defined in the Domain layer.
- **Data Source:**
  - Sources of data, including remote APIs and local databases.
- **App API**: API definitions and endpoints.
- **Dio Factory**: Configuration and setup for Dio, a powerful HTTP client for Dart.


### 3. Domain Layer
The Domain layer contains the core business logic of the application. It includes:
- **Models:** Data models used within the domain layer.
- **Use Cases:** Classes that encapsulate specific business rules or actions.
- **Repository Pattern:** Abstract definitions of repositories, outlining the data operations that can be performed.

### 4. Presentation Layer
The Presentation layer handles the user interface and user interaction logic. It includes:
- **Base Folder:** Foundational components like base cubit, cubit listener, cubit builder, base widgets, and bloc observer.
- **Common Folder:** Reusable components or utilities shared across different parts of the application.
- **Resources:** Management utilities for assets, text styles, fonts, colors, routes, styles, strings, themes, and values.
- **Home Screen:** View and ViewModel for the home screen UI and logic.
- **Search Functionality:** Implementation of search UI and logic.


## Dependencies

- cupertino_icons
- json_annotation
- retrofit
- dartz
- network_info_plus
- internet_connection_checker_plus
- bloc
- flutter_bloc
- rxdart
- get_it
- pretty_dio_logger
- lottie
- flutter_svg
- cached_network_image
- mockito

## Getting Started
1. Clone the repository:
   ```sh
   https://github.com/Abdalla-Eldaly/Route-Task.git
