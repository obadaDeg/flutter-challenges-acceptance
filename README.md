# Flutter E-Commerce App: Categories, Favorites, Cart, and Profile

## Overview

This project focuses on the development of several key pages and functionalities for an e-commerce app using Flutter and the BLoC pattern for state management. The app features a user-friendly interface for browsing categories, managing favorites, adding products to the cart, and user profile customization.

### Categories Page

- **Features:** Displays a list or grid of product categories for users to browse.
- **Implementation:** Utilizes `GridView.builder` or `ListView.builder` to display categories fetched from a Cubit/BLoC, which handles the business logic and state management.

### Favorites Page

- **Features:** Allows users to view and manage their favorite products, including adding or removing items from the favorites list.
- **Implementation:** Leverages a Cubit/BLoC to handle the logic of favoriting and un-favoriting items. The UI uses `ListView.builder` to display the list of favorite items, with options to add or remove them from favorites.

### Add to Cart Page

- **Features:** Enables users to add products to their cart and view their current cart items.
- **Implementation:** Managed by a dedicated Cubit/BLoC for cart operations, including adding and removing items. The UI might include a `ListView` of cart items and controls for adjusting quantities.

### Profile Page

- **Features:** Displays user information and provides options to edit the profile, view orders, access settings, and log out. Integrates UI with Cubit for dynamic content management.
- **Implementation:** Built with a `StatefulWidget` and utilizes a Profile Cubit for handling user data and actions. The UI features `ListTile` for menu options and forms for editing user information.

### Search Page

- **Features:** Offers a search functionality for users to find products by keywords.
- **Implementation:** Implements a search bar and displays search results using a `ListView.builder`. The search logic and data fetching are managed by a Search Cubit/BLoC.

## Setup

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Run `flutter pub get` to install the required dependencies.
4. Execute `flutter run` to launch the app on your device or emulator.

## Dependencies

- flutter_bloc: For state management using the BLoC pattern.
- flutter_carousel_widget: For carousel features in the Favorites page.

Ensure your project is configured to handle the Cubit/BLoC patterns effectively, and adjust the dependency versions as needed to match your development environment. This setup aims to provide a scalable structure for building complex e-commerce app functionalities with Flutter.
