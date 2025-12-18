import 'package:flutter_application_1/features/portfolio/models/project.dart';

/// Real production projects from CV
/// Live applications published on Google Play Store & Apple App Store
class MockProjects {
  static List<Project> getProjects() {
    return [
      // Featured Production Apps
      Project(
        id: '1',
        title: 'Reparo - Service Booking Platform',
        description:
            '🏆 LIVE ON APP STORES | Production-grade service booking platform connecting users with vehicle repair service providers. '
            'Features include real-time booking flow, supplier management, live communication via WebSockets, secure payment gateway integration (Stripe, SSLCommerz), '
            'and Google Maps integration for location services. End-to-end ownership including architecture design, team coordination, and store deployment.',
        technologies: [
          'Flutter',
          'GetX',
          'REST API',
          'WebSockets',
          'Firebase',
          'Payment Gateway',
          'Google Maps',
          'Push Notifications',
        ],
        imageUrl:
            'https://via.placeholder.com/600x400/FF6B35/ffffff?text=Reparo+Live',
        githubUrl: 'https://github.com/MrJohir',
        liveUrl: 'https://apps.apple.com/us/app/reparo/id6756050921',
        completedDate: DateTime(2024, 12, 1),
      ),
      Project(
        id: '2',
        title: 'BreakFree - Mind Recovery App',
        description:
            '🏆 LIVE ON APP STORES | Comprehensive mental wellness application featuring habit tracking, progress analytics, motivational content system, and AI-powered coaching. '
            'Integrated AI Coach provides smart guidance and behavioral improvement recommendations. Real-time sync via WebSockets, Firebase authentication, '
            'and push notifications for daily motivation. Successfully published on both Google Play Store & Apple App Store with end-to-end deployment responsibility.',
        technologies: [
          'Flutter',
          'GetX',
          'REST API',
          'Firebase Auth',
          'WebSockets',
          'AI Coach Integration',
          'FCM',
          'Analytics',
        ],
        imageUrl:
            'https://via.placeholder.com/600x400/9C27B0/ffffff?text=BreakFree+AI',
        githubUrl: 'https://github.com/MrJohir',
        completedDate: DateTime(2024, 11, 15),
      ),
      Project(
        id: '3',
        title: 'EventSphere - Event Management Platform',
        description:
            '🏆 PRODUCTION APP | End-to-end event planning and venue booking system with secure payment flow, real-time event updates via WebSockets, '
            'and Firebase Cloud Messaging for push notifications. Features include event discovery, ticketing system, attendee management, and payment gateway integration. '
            'Successfully published on Google Play Store & Apple App Store. Led architecture design and team implementation.',
        technologies: [
          'Flutter',
          'GetX',
          'REST API',
          'WebSockets',
          'Firebase',
          'Payment Gateway',
          'FCM',
          'Real-time Updates',
        ],
        imageUrl:
            'https://via.placeholder.com/600x400/2196F3/ffffff?text=EventSphere',
        githubUrl: 'https://github.com/MrJohir',
        completedDate: DateTime(2024, 10, 20),
      ),
      Project(
        id: '4',
        title: 'VitalityHub - Fitness & Wellness App',
        description:
            '🏆 PRODUCTION APP | Personalized fitness and wellness platform with goal tracking, real-time analytics, social leaderboard, and community features. '
            'Integrated Google & Facebook authentication, location-based gym finder using Google Maps, workout video streaming, and nutrition tracking. '
            'Real-time leaderboard updates and social sharing capabilities. Clean architecture with GetX state management.',
        technologies: [
          'Flutter',
          'GetX',
          'REST API',
          'Google Maps',
          'Social Auth',
          'Firebase',
          'Real-time Analytics',
          'Video Streaming',
        ],
        imageUrl:
            'https://via.placeholder.com/600x400/4CAF50/ffffff?text=VitalityHub',
        githubUrl: 'https://github.com/MrJohir',
        completedDate: DateTime(2024, 9, 10),
      ),
      // Additional Portfolio Projects
      Project(
        id: '5',
        title: 'Crafty Bay - E-Commerce App',
        description:
            'Full-featured e-commerce mobile application with secure authentication, product catalog with filtering & search, '
            'shopping cart system, wishlist functionality, and payment gateway integration. Includes order tracking, user reviews, '
            'and Firebase push notifications. Implemented clean MVC architecture with GetX state management.',
        technologies: [
          'Flutter',
          'GetX',
          'REST API',
          'Payment Gateway',
          'Firebase',
          'Secure Auth',
          'Local Storage',
        ],
        imageUrl:
            'https://via.placeholder.com/600x400/FF9800/ffffff?text=Crafty+Bay',
        githubUrl: 'https://github.com/MrJohir',
        completedDate: DateTime(2024, 8, 5),
      ),
      Project(
        id: '6',
        title: 'News App - Real-time News Feed',
        description:
            'API-driven news aggregation app with real-time content updates, category filtering, bookmarking system, and social sharing. '
            'Features include offline reading mode using Hive local storage, push notifications for breaking news, and beautiful responsive UI. '
            'Optimized for performance with lazy loading and image caching.',
        technologies: [
          'Flutter',
          'Provider',
          'News API',
          'Hive',
          'FCM',
          'Offline Mode',
          'Share Plugin',
        ],
        imageUrl:
            'https://via.placeholder.com/600x400/E91E63/ffffff?text=News+App',
        githubUrl: 'https://github.com/MrJohir',
        completedDate: DateTime(2024, 7, 20),
      ),
      Project(
        id: '7',
        title: 'Weather App - Location-based Forecasting',
        description:
            'Real-time weather forecasting application with location-based weather data, 7-day forecast, hourly predictions, and weather alerts. '
            'Integrated Geolocator for automatic location detection, beautiful weather animations, and offline caching for last viewed locations. '
            'Clean UI with dark/light theme support.',
        technologies: [
          'Flutter',
          'Provider',
          'Weather API',
          'Geolocator',
          'Shared Preferences',
          'Animations',
        ],
        imageUrl:
            'https://via.placeholder.com/600x400/00BCD4/ffffff?text=Weather+App',
        githubUrl: 'https://github.com/MrJohir',
        completedDate: DateTime(2024, 6, 15),
      ),
      Project(
        id: '8',
        title: 'Task Manager - Productivity App',
        description:
            'CRUD-based task management application with task categories, priority levels, due date reminders, and progress tracking. '
            'Features include local storage using Hive, Firebase sync for backup, search & filter functionality, and statistics dashboard. '
            'Clean and intuitive UI following Material Design guidelines.',
        technologies: [
          'Flutter',
          'GetX',
          'Hive',
          'Firebase Sync',
          'Local Notifications',
          'Charts',
        ],
        imageUrl:
            'https://via.placeholder.com/600x400/673AB7/ffffff?text=Task+Manager',
        githubUrl: 'https://github.com/MrJohir',
        completedDate: DateTime(2024, 5, 10),
      ),
      Project(
        id: '9',
        title: 'Google Maps Integration App',
        description:
            'Comprehensive Google Maps implementation with live location tracking, custom markers, route optimization, distance calculation, '
            'and turn-by-turn navigation. Features include geofencing, location history, nearby places search, and offline map caching. '
            'Demonstrates advanced Maps SDK integration and location services.',
        technologies: [
          'Flutter',
          'Google Maps SDK',
          'Geolocator',
          'Geocoding',
          'Directions API',
          'Places API',
        ],
        imageUrl:
            'https://via.placeholder.com/600x400/795548/ffffff?text=Maps+App',
        githubUrl: 'https://github.com/MrJohir',
        completedDate: DateTime(2024, 4, 25),
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
