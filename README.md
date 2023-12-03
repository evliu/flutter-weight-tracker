# Weight Tracker

Everest's project to learn Dart, Flutter, Firebase Auth & Firestore. All features, architecture, and aesthetics that were implemented beyond the requirements were made during the research and discovery phase of Dart, Flutter, and the ecosystem.

This simple weight tracker will allow users to keep a record of weight in lbs with the newest entries on top. Users can also edit and delete entries.

-   User is able to sign in anonymously and sign out
-   User can see, add, edit, and delete weight entries
-   Entries are synced in real-time with Firebase Firestore

The goal here was also to build with decent architecture with testable code and use SOLID principles. The app is not production level and no tests are included. There is much more to learn and do but time runs short, so enjoy!

## Getting Started

### Set up instructions

Set up instructions for cloning this repository:

1.  Clone the repository using the command:

    ```
    git clone git@github.com:evliu/flutter-weight-tracker.git
    ```

2.  Navigate to the project directory:

    ```
    cd flutter-weight-tracker
    ```

3.  Run the following command to install the required dependencies:

    ```
    flutter pub get
    ```

4.  Connect a device or start an emulator.

5.  Run the app using the command:
    ```
    flutter run
    ```

Note: Make sure you have Flutter SDK installed and configured properly before proceeding with the above steps.

## Notes

### Assumptions

-   Input validation: Assuming that the input data will always be valid and not implementing checks for invalid or unexpected input.
-   Error handling: Assuming that errors will not occur during the execution of the code and not implementing proper error handling mechanisms.
-   Edge cases: Assuming edge cases have not all been covered and not considering scenarios that may lead to unexpected behavior or errors.
-   Security: Assuming that the codebase is running in a secure environment and not implementing additional security measures such as input sanitization or authentication/authorization checks, including interaction with Firestore.

### Videos

You can find the videos in the [videos folder](/videos). One video demonstrates the basic useage of the app running off an iPhone. The second video demonstrates the real-time Firestore feature.
