# Smart Cafeteria App

A **Flutter**-based mobile application designed to streamline the cafeteria experience by allowing users to browse menu items, place orders, and track their order status in real-time.

<video width="640" height="360" controls>
  <source src="https://github.com/MdSadiqulAlam/smart_cafeteria/raw/main/SmartCafeteria_demo.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>



## Features
- **User Authentication:** Sign in using Firebase Authentication.
- **Menu Browsing:** View available food items with images, descriptions, and prices.
- **Order Placement:** Add items to the cart and place orders.
- **Stock Management:** Ensures items are available before order placement.
- **Real-time Order Tracking:** Check pending and completed orders.
- **Firebase Integration:** Uses Firestore for real-time database operations.
- **Image Uploading:** Uploads item images to Firebase Storage.
- **Snackbars & UI Feedback:** Provides real-time feedback on user actions.

## Technologies Used
- **Flutter** (Dart)
- **Firebase Authentication** (User authentication)
- **Cloud Firestore** (Database storage)
- **Firebase Storage** (Image storage)
- **GetX** (State management and navigation)
- **Image Picker** (For selecting images from gallery or camera)

## Installation
1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-repo/smart-cafeteria.git
   cd smart-cafeteria
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Setup Firebase:**
   - Create a Firebase project.
   - Add your `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) inside the `android/app/` and `ios/Runner/` directories, respectively.
   - Enable Firebase Authentication, Firestore, and Storage.

4. **Run the app:**
   ```sh
   flutter run
   ```


## How It Works
1. **User logs in** using Firebase Authentication.
2. **Browse menu** and view available items.
3. **Add items to cart** and place an order.
4. **Order validation:** Ensures stock availability before placing the order.
5. **Order processing:** Moves from pending to completed status.
6. **Real-time updates:** Users get instant updates on order status.

## Future Enhancements
- Add payment gateway integration.
- Implement order history feature.
- Improve UI/UX design.


