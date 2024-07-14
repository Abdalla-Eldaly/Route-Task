# Route Task

## Overview
This Flutter project follows the Clean Architecture with MVVM (Model-View-ViewModel) pattern, organized into four main layers: App, Data, Domain, and Presentation. Each layer has a specific responsibility, promoting separation of concerns and making the codebase easier to manage and scale.

## Project Structure

### 1. App Layer
The App layer contains essential configurations and setups for the application. It includes:
- **App:** The main application class and configurations.
- **Injectable-Get It:** Dependency injection setup using the injectable and get_it packages.
- **Extensions:** Important extension methods and classes used throughout the app.

### 2. Data Layer
The Data layer handles data operations, including network requests and data mapping. It contains:
- **Response:** Classes to handle API responses.
- **Network:** Network setup, error handling, and internet connectivity checking.
  - **Failure and Error Handling:** Mechanisms to handle various types of network failures and errors.
  - **Internet Checker:** Utility to check internet connectivity status.
- **Mapper:** Classes to map data between different layers.
- **Repository Implementation:** Concrete implementations of repositories defined in the Domain layer.
- **Data Source:** Sources of data, such as remote APIs or local databases.

### 3. Domain Layer
The Domain layer contains the core business logic of the application. It includes:
- **Models:** Data models used within the domain layer.
- **Use Cases:** Classes that encapsulate specific business rules or actions.
- **Repository Pattern:** Abstract definitions of repositories, outlining the data operations that can be performed.

### 4. Presentation Layer
The Presentation layer handles the user interface and user interaction logic. It includes:
- **Base Cubit (Bloc):** Base classes for managing state using the Cubit pattern from the bloc package.
- **States:** Different states that the UI can be in, managed by the Cubit.
- **Listener:** Components that react to state changes.
- **Observer and Builder:** Classes to observe state changes and build UI accordingly.
- **View and ViewModel:** Separation of UI components (View) from their business logic (ViewModel).



## Getting Started
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/your-repo-name.git
