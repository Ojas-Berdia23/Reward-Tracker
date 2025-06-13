# 📱 Reward Tracker

This Flutter project simulates the reception of a Firebase Cloud Messaging (FCM) alert (e.g., "Screen time limit exceeded") and displays it as a toast notification. It's part of the **Gamified Reward Tracker** app and is useful for testing in-app notification behavior without setting up real Firebase infrastructure.

---

## 🚀 Features

- Simulates Firebase alerts with a button click
- Displays toast notifications (using `fluttertoast`)
- Clean and simple UI
- Easy integration with existing dashboard/navigation flows

---

## 📸 Preview

| Screen | Description |
|--------|-------------|
| ![Home](screenshots/home.png) | Tap the button to simulate a Firebase alert |

---

## 🛠️ Setup Instructions

1. **Clone the repo**
   ```bash
   git clone https://github.com/yourusername/gamified_reward_tracker.git
   cd gamified_reward_tracker
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

---

## 📂 Project Structure

```
lib/
├── main.dart                  # Entry point with simulation logic
├── pages/
│   └── dashboard.dart         # Placeholder for main dashboard
test/
└── widget_test.dart           # Widget tests
```

---

## 🔔 Simulate a Firebase Message

The `simulateFirebaseMessage()` function displays a toast:

```dart
void simulateFirebaseMessage() {
  Fluttertoast.showToast(
    msg: "Screen time limit exceeded",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
  );
}
```

---

## 👨‍💻 Author

- **GitHub** — [@Ojas-Berdia23](https://github.com/Ojas-Berdia23)

---

