<div align="center">

#  Hungry App

**A Pixel-Perfect, High-Performance Food Delivery Application built with Flutter.**

<img width="1067" height="330" alt="image" src="https://github.com/user-attachments/assets/2d2acc82-9764-49e0-a308-ad369b7261fb" />


---
[![Flutter Version](https://img.shields.io/badge/Flutter-%5E3.9.0-blue.svg?logo=flutter)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.x-blue.svg?logo=dart)](https://dart.dev)
[![State Management](https://img.shields.io/badge/State_Management-Bloc-purple.svg)](https://bloclibrary.dev/)
[![Architecture](https://img.shields.io/badge/Architecture-Clean_Architecture-green.svg)]()



*The primary focus of this project is to implement a complex, pixel-perfect, and highly responsive User Interface (UI), seamlessly integrated with robust business logic to ensure dynamic and interactive user experiences.*

</div>

---

## UI/UX Showcase

This project heavily emphasizes a premium visual aesthetic. Utilizing custom typography (`LuckiestGuy`), scalable vector graphics (`flutter_svg`), and dynamic screen sizing (`flutter_screenutil`), the app maintains a flawless look across all device sizes.


https://github.com/user-attachments/assets/ac6b6413-302f-4b8a-bd12-9c535fcd9d9b


---

## Features & Interactivity

The beautiful front-end is backed by solid functional logic, making the UI not just pretty, but truly interactive and data driven.

*   **Responsive Layouts:** Implemented using `flutter_screenutil` to ensure UI components scale perfectly across varying screen dimensions and pixel densities.
*   **State-Driven UI:** leveraging **Bloc** (`flutter_bloc`) for predictable state management, ensuring smooth transitions and real-time updates without dropping frames.
*   **Form Validation:** Robust client-side validation logic for Authentication (Login/Sign Up) and Checkout processes, providing instant, visually appealing user feedback.
*   **API Integration & Mocking:** Structured networking layer utilizing `dio` for efficient API consumption, with support for easy mocking during UI development.
*   **Fluid Animations:** Custom micro-interactions and transitions between screens (like moving from Home to Product Details) to enhance the premium feel of the app.
*   **Local Caching:** Utilizing `shared_preferences` for persisting user sessions and application settings.

---

##  Architecture & Tech Stack

The codebase strictly adheres to **Clean Architecture** principles, combining it with a **Feature-First** folder structure. This ensures absolute separation of concerns between the UI and the underlying business logic.

### Tech Stack
*   **Framework:** Flutter (`^3.9.0`) & Dart
*   **State Management:** Bloc & Cubit (`flutter_bloc: ^9.1.1`, `bloc: ^9.2.0`)
*   **Dependency Injection:** GetIt (`get_it: ^8.2.0`)
*   **Networking:** Dio (`dio: ^5.9.0`)
*   **UI Utilities:** `flutter_screenutil`, `flutter_svg`, `cupertino_icons`

### Folder Structure (Feature-Based)
Inside the `lib/` directory, the code is divided into `core` (shared utilities, routing, networking, DI, themes) and `features` (isolated modules like auth, home, cart).

Each feature follows a strict 3-tier architecture:
1.  **`presentation/`**: Contains ONLY UI elements (Screens, Custom Widgets). It listens to the Manager/Bloc for state changes.
2.  **`manager/`**: Contains the Bloc/Cubit classes. This is the brain of the feature, handling logic, talking to the data layer, and emitting states to the UI.
3.  **`data/`**: Handles data retrieval (Repositories, API services, local storage).

This structure guarantees adherence to **SOLID principles**, making the UI highly testable and the logic easily replaceable.

---

##  DevOps & CI/CD (Forward-Looking)

To maintain code quality and ensure the UI remains pixel-perfect across updates, the following DevOps workflows are planned/implemented:

*   **Static Code Analysis:** Enforced using `flutter_lints` to maintain Dart best practices and code consistency.
*   **Automated Testing:** 
    *   *Unit Tests:* Covering Bloc logic and data parsing.
    *   *Widget/UI Tests:* Automated tests to verify that critical UI components render correctly and handle user interactions as expected.
*   **GitHub Actions CI/CD:** A robust pipeline to automatically trigger:
    1.  `flutter analyze` & `flutter test` on every Pull Request.
    2.  Automated builds for Android (APK/AAB) and iOS (IPA) upon merging to the main branch.
    3.  Automated deployment to Firebase App Distribution or TestFlight for QA testing.

---

## 🛠 Getting Started

Follow these instructions to run the Hungry App on your local machine.

### Prerequisites
*   [Flutter SDK](https://flutter.dev/docs/get-started/install) (`^3.9.0` or higher)
*   Android Studio & Xcode for emulators || simulators
*   VS Code or any preferred IDE

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Ismail-Magdy/hungry.git
   cd hungry
   ```

2. **Fetch dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   Ensure you have a connected device or a running emulator/simulator.
   ```bash
   flutter run
   ```

---
*Developed with ❤️ by Ismail Magdy*
