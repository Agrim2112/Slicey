# Slicey - Your Ultimate Pizza App

Slicey is a Flutter-based mobile application that provides a wide variety of pizza options. Users can browse through different pizzas, add their favorite ones to the cart, and make purchases seamlessly. The app is built using Flutter and Firebase, and it implements the BLoC pattern for state management.

## Features

- **Browse Pizzas**: Explore a diverse selection of delicious pizzas.
- **Add to Cart**: Add your favorite pizzas to the cart.
- **Checkout**: Purchase pizzas directly from the app.
- **User Authentication**: Secure login and signup using Firebase Authentication.
- **Real-time Database**: Store and retrieve data in real-time using Firebase Firestore.
- **State Management**: Efficient state management with the BLoC pattern.

## Tech Stack

- **Flutter**: Frontend framework for building cross-platform mobile applications.
- **Firebase**: Backend services for authentication, real-time database, and cloud functions.
- **BLoC (Business Logic Component)**: State management solution for Flutter.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Firebase account: [Firebase Console](https://console.firebase.google.com/)

### Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/slicey.git
    cd slicey
    ```

2. **Install dependencies:**
    ```bash
    flutter pub get
    ```

3. **Set up Firebase:**
    - Go to the [Firebase Console](https://console.firebase.google.com/).
    - Create a new project and add an Android/iOS app to the project.
    - Download the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) file.
    - Place the `google-services.json` file in the `android/app` directory and `GoogleService-Info.plist` in the `ios/Runner` directory.

4. **Run the app:**
    ```bash
    flutter run
    ```

