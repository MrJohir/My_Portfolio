import 'package:flutter_application_1/features/portfolio/models/project.dart';

/// Mock project data for the portfolio
/// Replace with API calls or Firebase data in production
class MockProjects {
  static List<Project> getProjects() {
    return [
      Project(
        id: '1',
        title: 'E-Commerce Mobile App',
        description:
            'A full-featured e-commerce mobile application with product catalog, cart, checkout, and payment integration. Built with Flutter and Firebase.',
        technologies: ['Flutter', 'Dart', 'Firebase', 'GetX', 'REST API'],
        imageUrl:
            'https://via.placeholder.com/600x400/2196F3/ffffff?text=E-Commerce+App',
        githubUrl: 'https://github.com/MrJohir',
        completedDate: DateTime(2024, 12, 15),
      ),
      Project(
        id: '2',
        title: 'Weather Forecast App',
        description:
            'Real-time weather forecasting app with location-based weather data, 7-day forecast, and beautiful weather animations.',
        technologies: ['Flutter', 'Weather API', 'Provider', 'Geolocator'],
        imageUrl:
            'https://via.placeholder.com/600x400/00BCD4/ffffff?text=Weather+App',
        githubUrl: 'https://github.com/MrJohir',
        liveUrl: 'https://example.com',
        completedDate: DateTime(2024, 11, 20),
      ),
      Project(
        id: '3',
        title: 'Task Management System',
        description:
            'Productivity app for managing tasks, projects, and team collaboration with real-time sync and notifications.',
        technologies: ['Flutter', 'Firebase', 'GetX', 'Cloud Functions'],
        imageUrl:
            'https://via.placeholder.com/600x400/4CAF50/ffffff?text=Task+Manager',
        githubUrl: 'https://github.com/MrJohir',
        completedDate: DateTime(2024, 10, 5),
      ),
      Project(
        id: '4',
        title: 'Fitness Tracker App',
        description:
            'Health and fitness tracking application with workout plans, calorie counter, and progress tracking features.',
        technologies: ['Flutter', 'SQLite', 'Provider', 'Charts'],
        imageUrl:
            'https://via.placeholder.com/600x400/FF9800/ffffff?text=Fitness+Tracker',
        githubUrl: 'https://github.com/MrJohir',
        completedDate: DateTime(2024, 9, 10),
      ),
      Project(
        id: '5',
        title: 'Social Media Dashboard',
        description:
            'Admin dashboard for managing social media posts, analytics, and user engagement across multiple platforms.',
        technologies: ['Flutter Web', 'Firebase', 'Charts', 'GetX'],
        imageUrl:
            'https://via.placeholder.com/600x400/9C27B0/ffffff?text=Social+Dashboard',
        githubUrl: 'https://github.com/MrJohir',
        liveUrl: 'https://example.com',
        completedDate: DateTime(2024, 8, 25),
      ),
      Project(
        id: '6',
        title: 'Recipe Finder App',
        description:
            'Discover and save delicious recipes with step-by-step instructions, ingredient lists, and cooking tips.',
        technologies: ['Flutter', 'Recipe API', 'Hive', 'BLoC'],
        imageUrl:
            'https://via.placeholder.com/600x400/F44336/ffffff?text=Recipe+Finder',
        githubUrl: 'https://github.com/MrJohir',
        completedDate: DateTime(2024, 7, 15),
      ),
    ];
  }

  /// Get featured projects (top 3)
  static List<Project> getFeaturedProjects() {
    return getProjects().take(3).toList();
  }

  /// Get project by ID
  static Project? getProjectById(String id) {
    try {
      return getProjects().firstWhere((project) => project.id == id);
    } catch (e) {
      return null;
    }
  }
}
