# 📱 Reward Tracker

## 🚀 Project Overview
The **Gamified Reward Tracker** is a Flutter-based mobile app designed to motivate users by allowing them to earn and track rewards for achieving goals or completing tasks. It features a modern UI, reward claim logic, toast/notification feedback, and smooth navigation between dashboard components.

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

## 🧠 Approach

1. **UI Development:**
   - Used `MaterialApp` and custom fonts (Poppins) for a clean aesthetic.
   - Dashboard implemented in `RewardPage` with interactive elements like a "Claim" button.

2. **Feedback Mechanism:**
   - Added **local notifications** using `flutter_local_notifications` to simulate push-like behavior.
   - Introduced a **custom Alert Dialog** using `showDialog()` to confirm reward claims.

3. **State Management:**
   - Used stateless widgets where applicable; no external state management libraries used for simplicity.
  
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

## 💡 Suggestions & Future Improvements

- 🔔 **Notification Scheduler:** Add support for scheduled notifications/reminders.
- 🔐 **Persistent Storage:** Integrate `shared_preferences` or a local database like `Hive` to store user rewards.
- 🎨 **Gamification Enhancements:** Include points, badges, leaderboards, or animations for better engagement.

## ✅ Conclusion

This project provided valuable experience in UI development, platform integration, and troubleshooting Flutter's build environment. It lays the foundation for a fully-featured gamified habit tracker or reward system app.

## 👨‍💻 Author

- **GitHub** — [@Ojas-Berdia23](https://github.com/Ojas-Berdia23)

---

