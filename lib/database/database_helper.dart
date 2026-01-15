import 'package:hive_flutter/hive_flutter.dart';
import '../models/task.dart';

class HiveService {
  static const String _taskBoxName = 'tasks';
  static Box<Task>? _taskBox;

  // Initialize Hive
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskAdapter());
    _taskBox = await Hive.openBox<Task>(_taskBoxName);
  }

  // Get the task box
  static Box<Task> get taskBox {
    if (_taskBox == null || !_taskBox!.isOpen) {
      throw Exception('Hive box not initialized. Call init() first.');
    }
    return _taskBox!;
  }

  // Create a task
  static Future<Task> createTask(Task task) async {
    await taskBox.put(task.id, task);
    return task;
  }

  // Read a single task
  static Task? readTask(String id) {
    return taskBox.get(id);
  }

  // Read all tasks
  static List<Task> readAllTasks() {
    return taskBox.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  // Search tasks
  static List<Task> searchTasks(String query) {
    final lowerQuery = query.toLowerCase();
    return taskBox.values.where((task) {
      final titleMatch = task.title.toLowerCase().contains(lowerQuery);
      final descMatch =
          task.description?.toLowerCase().contains(lowerQuery) ?? false;
      return titleMatch || descMatch;
    }).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  // Get tasks by completion status
  static List<Task> getTasksByStatus(bool isCompleted) {
    return taskBox.values.where((task) => task.isCompleted == isCompleted).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  // Update a task
  static Future<void> updateTask(Task task) async {
    await task.save();
  }

  // Delete a task
  static Future<void> deleteTask(String id) async {
    await taskBox.delete(id);
  }

  // Get statistics
  static Map<String, int> getStatistics() {
    final total = taskBox.length;
    final completed = taskBox.values.where((task) => task.isCompleted).length;

    return {
      'total': total,
      'completed': completed,
      'pending': total - completed,
    };
  }

  // Close all boxes
  static Future<void> close() async {
    await Hive.close();
  }
}