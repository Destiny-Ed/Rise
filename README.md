# Rise – Habit Tracker & Streak Builder

## 📌 Overview

**Rise** is a powerful habit tracker designed to help users build and maintain habits, stay consistent, and reach their goals. With features like streak tracking, social habit sharing, reminders, and leaderboards, Rise makes habit-building engaging and effective.

## ✨ Features
- ✅ **Create & Manage Habits** – Set daily, weekly, or custom habits with reminders.
- 🔥 **Track Streaks** – Stay motivated with visual progress tracking.
- 👥 **Social Habit Sharing** – Invite friends, view their habits, support each other, and comment in a community section.
- 🏆 **Leaderboard** – Compete with friends and top habit builders.
- 🔔 **Smart Reminders** – Get personalized notifications for habit completion.
- 💎 **Premium Features** – Unlock advanced insights, unlimited habits, and more.
- 📨 Send and receive invites for habit tracking
- 👤 User profile management

## 🏗️ Architecture – Feature-Based MVVM
Rise follows a **Feature-First MVVM Architecture** using **Provider** for state management. This ensures scalability, modularity, and clean separation of concerns.

### **📂 Folder Structure**
```
lib/
│── main.dart                   # Entry point of the app
│── app.dart                    # Root widget with route management
│
│
├── core/                        # Core utilities & global services
│   ├── services/                # Services (API, Auth, Notifications)
│   ├── utils/                   # Global utilities (formatters, extensions)
│   ├── theme/                   # App-wide themes & styles
├   ├── config/                   # Configuration
│
├── features/                    # Feature-first structure
│   ├── auth/                    # Authentication feature
│   │   ├── data/                # Data handling (models & repositories)
│   │   ├── domain/              # Business logic (Use Cases)
│   │   ├── presentation/        # UI & State Management
│   │   │   ├── views/           # Screens (LoginView, SignupView)
│   │   │   ├── providers/       # AuthProvider (using ChangeNotifier)
│   │   │   ├── widgets/         # Reusable UI components
│   │   ├── auth_module.dart     # Exports everything for easy access
│   │
│   ├── habits/                  # Habit tracking feature
│   │   ├── data/                # Habit models & repositories
│   │   ├── domain/              # Business logic (Use Cases)
│   │   ├── presentation/        # UI & State Management
│   │   │   ├── views/           # Screens (HabitListView, HabitDetailView)
│   │   │   ├── providers/       # HabitProvider (handles state)
│   │   │   ├── widgets/         # Habit-specific UI components
│   │   ├── habits_module.dart   # Exports everything for easy access
│   │
│   ├── leaderboard/             # Leaderboard feature
│   ├── notifications/           # Habit reminder notifications
│   ├── subscriptions/           # Premium feature handling
│   ├── invites/                 # Invite friends to habits
│   ├── profile/                 # User profile management
│   ├── community/               # Comments and discussions
│
└── shared/                      # Shared resources across features
    ├── widgets/                 # Global UI components (buttons, loaders)
    ├── models/                  # Generic models (User, AppSettings)
    ├── services/                # Reusable services (Database, API)
```

## 🔧 Tech Stack
- **Frontend**: Flutter (Dart)
- **Backend**: Firebase Firestore, Firebase Authentication
- **State Management**: Provider
- **Notifications**: Firebase Cloud Messaging (FCM) and Local Notification Service
- **Payment Gateway**: Google Play Billing & Apple StoreKit (for subscriptions) or Revenue Cat

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed
- Firebase project setup
- Google Play & Apple Developer accounts (for subscriptions)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/destiny-ed/rise.git
   cd rise-habit-tracker
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Configure Firebase:
   - Add `google-services.json` (Android) & `GoogleService-Info.plist` (iOS) to `android/app/` & `ios/Runner/` respectively.
4. Run the app:
   ```bash
   flutter run
   ```

## 🛠 Roadmap
### Phase 1: Core Features
- [ ] User authentication (Google, Apple, Email)
- [ ] Create, edit, delete habits
- [ ] Track daily habit completion & streaks

### Phase 2: Social & Engagement
- [ ] Habit sharing & comments
- [ ] Leaderboard based on streaks
- [ ] Smart habit notifications

### Phase 3: Monetization & Optimization
- [ ] Subscription model for premium features
- [ ] UI/UX enhancements
- [ ] Performance improvements

## 📄 License
MIT License - See [LICENSE](LICENSE) for details.

## 📬 Contact & Contribution
Want to contribute? Open an issue or submit a pull request!

## 🤝 Contributing
1. Fork the repository
2. Create a feature branch (`git checkout -b feature-name`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature-name`)
5. Create a pull request


- Email: talk2destinyed@gmail.com
- Watch Complete Youtube Video : [https://www.youtube.com/@Destiny_Ed]


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
