Todo Planner App

A modern, feature-rich todo list application built with Flutter and Hive database.

Features

Create, Edit, Delete Tasks - Full CRUD operations
Priority Levels - Low, Medium, High with color coding
Due Dates & Times - Calendar and time picker
Search Functionality - Find tasks quickly
Statistics Dashboard - Track your progress
Beautiful UI - Modern Material Design 3 with teal & coral theme
Hive Storage - Fast, lightweight NoSQL database

 Setup Instructions

1. Create Flutter Project
```bash
flutter create todo_planner_app
cd todo_planner_app
```

 2. Replace Files

Copy all the provided files into your project structure:


lib/
├── main.dart
├── models/
│   ├── task.dart
│   └── task.g.dart
├── database/
│   └── database_helper.dart
└── pages/
    ├── home_page.dart
    ├── add_edit_task_page.dart
    └── search_page.dart
```

Note: You can delete the `utils/` folder if it exists - we removed the notification feature.

3. Update pubspec.yaml

Replace your `pubspec.yaml` with the provided version.

4. Update AndroidManifest.xml (Optional)

You can use the default AndroidManifest.xml or replace it with the provided simplified version.

5. Install Dependencies

```bash
flutter pub get
```

6. Generate Hive Adapter (Optional - Already Provided)

The `task.g.dart` file is already provided. But if you need to regenerate it in the future, run:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

7. Run the App

```bash
flutter run
```

How to Use

Creating a Task
1. Tap the "New Task" floating button
2. Enter task title (required)
3. Add description (optional)
4. Select priority level
5. Set due date and time (optional)
6. Tap the checkmark ✓ to save

Managing Tasks
- Complete: Tap the checkbox next to any task
- Edit: Tap on the task card
- Delete: Tap the delete icon (trash can)
- Search: Use the search icon in the app bar

Filtering Tasks
Tap the filter icon (top right) to view:
- All Tasks
- Pending Tasks
- Completed Tasks

 Architecture

File Organization

main.dart** - App entry point, initializes Hive
models/task.dart** - Task data model with Hive annotations
models/task.g.dart** - Generated Hive TypeAdapter (auto-generated)
database/database_helper.dart** - Hive database operations (CRUD)
pages/home_page.dart** - Main screen with task list and stats
pages/add_edit_task_page.dart** - Form for creating/editing tasks
pages/search_page.dart** - Search functionality

Hive Database Structure

Hive stores objects in boxes (like tables). Our app uses one box:
tasks box: Stores Task objects with automatic serialization

```dart
@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0) String title;
  @HiveField(1) String? description;
  @HiveField(2) DateTime? dueDate;
  @HiveField(3) String priority;
  @HiveField(4) bool isCompleted;
  @HiveField(5) DateTime createdAt;
  @HiveField(6) String id;
}
```

 Color Scheme

- Primary (Teal)**: `#008B8B`
- Secondary (Coral)**: `#FF6B6B`
- Priority Colors**:
  - High: Red (#EF5350)
  - Medium: Orange (#FFA726)
  - Low: Green (#66BB6A)

 Key Technologies

- Flutter SDK - Cross-platform UI framework
- Hive- Fast, lightweight NoSQL database
- intl- Date and time formatting

 Code Highlights

 Hive Initialization
Hive is initialized in `main.dart` before the app starts:
```dart
await HiveService.init();
```

 Task Model with Hive Annotations
The Task model uses Hive annotations for automatic serialization:
```dart
@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0) String title;
  // ... other fields
}
```

 CRUD Operations
Simple and efficient Hive operations:
```dart
// Create
await HiveService.createTask(task);

// Read all
List<Task> tasks = HiveService.readAllTasks();

// Update
await HiveService.updateTask(task);

// Delete
await HiveService.deleteTask(taskId);
```

 Why Hive?

Advantages:
- ⚡ **Faster**: Up to 10x faster than SQLite for many operations
- 🎯 **Simpler**: No SQL queries, just store and retrieve objects
- 📦 **Lighter**: Smaller package size and no native dependencies
- 🔄 **Type-safe**: Compile-time type checking
- 💾 **Efficient**: Binary serialization for compact storage
- 🚀 **No boilerplate**: Less code compared to SQLite

 When to use Hive:
- ✅ Simple to medium complexity apps
- ✅ When you need fast local storage
- ✅ When you prefer working with objects rather than SQL
- ✅ When you want to avoid native SDK dependencies

 Assignment Notes

This project demonstrates:
- ✅ Hive NoSQL database integration
- ✅ Clean code architecture with separated concerns
- ✅ Proper file organization
- ✅ Material Design 3 principles
- ✅ State management
- ✅ CRUD operations
- ✅ Type adapters and code generation
- ✅ Date/time handling
- ✅ Search functionality
- ✅ User-friendly UI/UX

 Troubleshooting

 Hive Box Errors
- Delete app and reinstall if the Hive box structure changed
- Make sure to call `HiveService.init()` before accessing boxes

 Build Errors
- Run `flutter clean` then `flutter pub get`
- If task.g.dart has issues, regenerate it: `flutter pub run build_runner build --delete-conflicting-outputs`
- Ensure Flutter SDK is up to date: `flutter upgrade`

 Import Errors
- Make sure all files are in the correct folders
- Check that `part 'task.g.dart';` is in task.dart
- Verify all imports match your file structure

 Android SDK Errors
- This version doesn't require any special Android SDK components
- If you get SDK errors, run `flutter doctor` to check your setup

 Learning Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Hive Documentation](https://docs.hivedb.dev/)
- [Material Design 3](https://m3.material.io/)

 Future Enhancements (Optional)

If you want to add more features later:
- 📱 Categories/tags for tasks
- 🔔 Local notifications (requires additional setup)
- 📊 Charts and analytics
- 🌙 Dark mode
- 🔄 Cloud sync
- 🗂️ Task sorting options

<img width="720" height="1600" alt="Screenshot_20260115_030549" src="https://github.com/user-attachments/assets/39700c7b-56b1-493b-a930-f8c0300064aa" />
<img width="720" height="1600" alt="Screenshot_20260115_030530" src="https://github.com/user-attachments/assets/70c35355-471c-4b1e-a7f1-91a4a1f9306f" />
<img width="720" height="1600" alt="Screenshot_20260115_030227" src="https://github.com/user-attachments/assets/39ff7fa8-21a8-44f2-9bbf-c79319a3846f" />
<img width="720" height="1600" alt="Screenshot_20260115_030126" src="https://github.com/user-attachments/assets/ec1011f3-a4b5-4b8a-87a6-2da8de1d8666" />
<img width="720" height="1600" alt="Screenshot_20260115_030102" src="https://github.com/user-attachments/assets/a3f4e1d0-30ea-423a-9966-82c6bf0a925e" />
<img width="720" height="1600" alt="Screenshot_20260115_030047" src="https://github.com/user-attachments/assets/5a709418-a2d2-4613-8968-4cbc7123dc24" />
<img width="720" height="1600" alt="Screenshot_20260115_025907" src="https://github.com/user-attachments/assets/0d1acf86-61c0-4c66-aca4-69b875a0fa14" />
<img width="720" height="1600" alt="Screenshot_20260115_025730" src="https://github.com/user-attachments/assets/d9d6533d-ce72-4acc-98c6-d8e2386d63a6" />
<img width="720" height="1600" alt="Screenshot_20260115_025611" src="https://github.com/user-attachments/assets/4f5860fa-5cf4-499d-845e-7d805b19423f" />

