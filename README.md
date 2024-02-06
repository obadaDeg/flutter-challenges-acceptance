# Flutter Favorite & Profile Pages

## Overview

This task includes the development of two main pages for a food delivery app: the Favorite page and the Profile page, using Flutter.

## Favorite Page

- **Features:** Showcases favorite products in a carousel and list format. Includes "Hot Offer" highlights, an "Order Now" button, and allows users to remove items from favorites.
- **Implementation:** Uses `FlutterCarousel` for the carousel and `ListView.builder` for listing favorite products, with product details managed by a `Product` model.

## Profile Page

- **Features:** Displays user info (profile picture, name, contact number), options to edit the profile, view orders, access settings, and log out. Includes "Call Us" and "Email Us" functionalities.
- **Implementation:** Built as a `StatelessWidget`, utilizing `ListTile` for menu options, and modal dialogs for contacting support.

## Setup

1. Clone the repo and navigate to the project directory.
2. Run `flutter pub get` to install dependencies.
3. Execute `flutter run` to start the app.

## Dependencies

- flutter_carousel_widget
