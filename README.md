# 🏫 School Management App (SMA)

A minimal Flutter-based school management system that supports **Admin**, **Teacher**, and **Student** roles. Built using `GetX` for state management and `SharedPreferences` for local persistence.

> 🚧 **Note:** This project uses hardcoded user data and dummy values – no actual backend or database integration.

---

## ✨ Features

### 👩‍💼 Admin Panel

- ✅ Login with hardcoded credentials
- 📊 Dashboard with:
  - Total Students
  - Total Teachers
  - Total Classes
- ➕ Add Student / Add Teacher
- 📋 View & manage student and teacher lists
  - Edit / Delete
  - Search / Filter

### 👨‍🏫 Teacher Panel

- ✅ Login with hardcoded credentials
- 📚 View assigned classes, student list, and timetable (static)
- 🔔 View dummy notifications

### 👨‍🎓 Student Panel

- ✅ Login with hardcoded credentials
- 📖 View enrolled class info, subjects, timetable (static)
- 🔔 View dummy notifications

---

## 🔐 Login Credentials (Hardcoded)

| Role    | Username  | Password     |
| ------- | --------- | ------------ |
| Admin   | `admin`   | `admin123`   |
| Teacher | `teacher` | `teacher123` |
| Student | `student` | `student123` |

---

## 🧰 Tech Stack

- **Flutter** 3.x
- **GetX** for routing and state management
- **Shared Preferences** for local storage
- **Material 3 (Flutter)** UI

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
  shared_preferences: ^2.2.2
```
---

## 👨‍💻 Developer

**Made with ❤️ by Aditya Vishwakarma**

---

## 🔗 License

This project is open-source and available for learning and improvement.
