# Tv Maze App

TV Shows & Actors Search: Instantly find and save your favorite shows and actors with Tv Maze app.

# Main Features
* Search & view Tv Shows details (summarry, episode, etc).
* Save & view your favotrite Tv Shows.
* Search & view Actors details (tv shows, bio, etc).
* Protect the app with PIN or Device authentication.


## Getting Started
1. Install Flutter 3.19.5
2. Run in your terminal $: flutter clean && flutter pub get
4. Lauch an Android or iOS simulator
3. Run in your terminal $: flutter run

## Software Architecture
Feature based clean architecture. Each feature has four layers/folders (domain, data, state, presentation):

* Domain: Interfaces for data models, repository abstract interfaces, dtos, enum, events, etc.
* Data: Data repositories & data normalizer (json to dart interfaces from the domain).
* State: The state management is going to be Cubit, similar to Redux, where different states are emitted in the cubit class (loading, loaded/success,error). Then cubit builder is used in the presentation screen & widget to manage the app state. The repositories are injected to the cubit, so unit testing can easily be achieved later on.
* Presentation: UI Screen & Widgets/Components

## API/Backend
TVmaze API (https://www.tvmaze.com/api) is used to access comprehensive data on actors and TV shows. Through this API, users can seamlessly search and retrieve information about their favorite actors, TV series, episodes, and more.

## Local Storage
Hive, a lightweight and efficient NoSQL database, is to handle the storage and management of user favorite TV shows. Hive provides seamless integration with Flutter, offering fast and persistent storage capabilities.

## State Management
Cubits are used for efficient state management, ensuring a seamless and reactive user experience. Cubits, part of the Bloc library, provide a straightforward and scalable approach to managing application state.

## Unit Testing
Comprehensive unit testing for both API data repositories and Cubits. A suite of tests was implemented to verify the functionality of the API data repositories, ensuring accurate data retrieval and processing under various scenarios. Run *flutter test* to trigger all the unit tests.


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
