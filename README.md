# BIOSTask

## Overview

BIOSTask is an iOS application developed using the latest version of Swift and SwiftUI. This project adopts the Model-View-ViewModel (MVVM) architecture to ensure a clear separation of concerns, making the codebase more maintainable and testable. The application integrates several key technologies and practices to provide a robust and scalable solution.

## Key Features

- **Swift & SwiftUI**: Built with the latest version of Swift and SwiftUI, ensuring modern and efficient UI development.
- **MVVM Architecture**: Implements the MVVM design pattern to separate the business logic from the UI, enhancing code readability and testability.
- **Moya Framework**: Utilizes Moya, a powerful network abstraction layer, to handle API requests and responses seamlessly.
- **Reusable Views**: Includes a set of reusable SwiftUI views to promote code reuse and consistency across the application.
- **Unit Testing**: Comprehensive unit tests are written using XCTest to ensure the reliability and correctness of the code.

## Project Structure

- **Models**: Contains the data models used in the application.
- **Views**: SwiftUI views that define the user interface.
- **ViewModels**: Responsible for handling the business logic and interacting with the models.
- **Services**: Contains the network layer implemented using the Moya framework.
- **Tests**: Unit tests to validate the functionality of the application.

## Getting Started

### Prerequisites

- Xcode 14 or later
- iOS 15.0 or later

### Installation

Clone the repository:

```bash
git clone https://github.com/AhmedSalemMusallam/BIOSTask.git
cd BIOSTask
```

## Running the App

Select the target device or simulator and click the "Run" button in Xcode.

## Usage

### API Integration

The application uses Moya to handle network requests. The services are defined in the `Services` folder, which includes API calls and response handling.

### Unit Testing

Unit tests are written using XCTest. To run the tests, select the `BIOSTaskTests` target and press `Command + U` or navigate to `Product > Test` in the Xcode menu.

### Reusable Views

The project includes several reusable SwiftUI views to maintain consistency and reduce code duplication. These views can be found in the `Views` folder.

## Contribution

Contributions are welcome! Please open an issue or submit a pull request for any improvements or new features.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

## Acknowledgements

- [Point-Free](https://www.pointfree.co/): For developing the Composable Architecture and providing valuable resources for Swift and SwiftUI development.
- [Moya](https://github.com/Moya/Moya): For the powerful network abstraction layer.

## Screen Shoots
![Simulator Screenshot - Salem - iPhone 15 - 2024-05-17 at 08 35 31](https://github.com/AhmedSalemMusallam/BIOSTask/assets/117483832/1cefca7c-09cf-4e31-bf69-7975078ccd43)
![Simulator Screenshot - Salem - iPhone 15 - 2024-05-17 at 08 35 40](https://github.com/AhmedSalemMusallam/BIOSTask/assets/117483832/02660778-431f-47b7-b8b5-82be36fb1add)
