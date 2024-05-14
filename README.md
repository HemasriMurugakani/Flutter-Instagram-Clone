# Flutter Instagram Clone

This is a free and open-source project - clone of the Instagram app.

### Prerequisites

* You'll need to have Flutter installed on your machine. You can follow the official instructions to set up Flutter [here](https://docs.flutter.dev/get-started/install).
* A working installation of Dart SDK.
* An IDE such as Android Studio, IntelliJ IDEA, or Visual Studio Code configured with Flutter.

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/flutter-instagram-clone.git
   cd flutter-instagram-clone
   ```
2. **Fetch the dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the app:**
   ```bash
   flutter run
   ```

## Project Structure

The project is structured as follows:

```
lib/
  data/                  # Contains data models for the app
    image_data.dart
  instagram/             # Contains the core logic of the Instagram clone
    main_screen.dart
    profile_screen.dart
    reels_screen.dart
    register_screen.dart
    search_screen.dart
    shop_screen.dart
  screens/               # Contains the UI components of the app
    image_cart.dart
  widgets/               # Contains reusable UI components
    circle_story.dart
    post_cart.dart
    profile_tabs.dart
    story_widget.dart
    text_field.dart
assets/                 # Contains the app's assets
  img/                   # Contains images used in the app
    logo.png
main.dart                # The entry point of the application
```

## Features

- **User Authentication:** Sign up, sign in, and logout functionality.
- **Profile Management:** Users can view and edit their profiles.
- **Image Sharing:** Users can post images and view images posted by others.
- **Stories:** Users can view and post stories.
- **Reels:** Users can view and create short videos.
- **Search:** Users can search for other users and content.


## Technologies Used

- **Flutter:** UI toolkit for building natively compiled applications.
- **Dart:** Programming language optimized for building mobile, desktop, server, and web applications.
- **Firebase:** For backend services like authentication, cloud storage, and Firestore.

## Troubleshooting

### Common Issues

1. **Flutter not installed:**
   Make sure you have followed the [Flutter installation guide](https://docs.flutter.dev/get-started/install) and added Flutter to your PATH.

2. **Dependencies not resolved:**
   Run `flutter pub get` to fetch all the dependencies.

3. **Build errors:**
   Make sure your Flutter SDK and Dart SDK are up to date. You can upgrade Flutter by running:
   ```bash
   flutter upgrade
   ```

4. **Device not detected:**
   Ensure that you have a device connected or an emulator running. Check connected devices with:
   ```bash
   flutter devices
   ```

### Useful Commands

- **Run the app:**
  ```bash
  flutter run
  ```
- **Analyze the code:**
  ```bash
  flutter analyze
  ```
- **Run tests:**
  ```bash
  flutter test
  ```
- **Build the APK:**
  ```bash
  flutter build apk
  ```
