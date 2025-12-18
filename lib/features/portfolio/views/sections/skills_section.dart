import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constants/app_colors.dart';
import 'package:flutter_application_1/core/utils/constants/app_strings.dart';
import 'package:flutter_application_1/core/common/widgets/section_title.dart';
import 'package:flutter_application_1/core/common/widgets/skill_card.dart';
import 'package:flutter_application_1/core/common/widgets/responsive_widget.dart';

/// Skills section displaying technical skills
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  // Skills data organized by category from CV
  static const Map<String, List<String>> _skillsData = {
    'Framework & Languages': [
      'Flutter SDK',
      'Dart (OOP)',
      'Java',
      'C',
      'C++',
      'JavaScript',
    ],
    'State Management': ['GetX', 'BLoC', 'Provider', 'Riverpod'],
    'Backend & APIs': [
      'REST APIs',
      'Firebase Services',
      'Complex JSON Handling',
      'API Integration',
      'Cloud Functions',
    ],
    'Real-Time Systems': [
      'WebSockets',
      'Socket.IO (Chat)',
      'Agora (Audio/Video Call)',
      'Live Updates',
    ],
    'Local Storage': [
      'Hive',
      'Secure Storage',
      'Shared Preferences',
      'Get Storage',
    ],
    'Authentication': [
      'Firebase Auth',
      'Google Login',
      'Facebook Login',
      'JWT Tokens',
    ],
    'Payment Integration': [
      'Stripe',
      'SSLCommerz',
      'Payment Gateways',
      'Secure Transactions',
    ],
    'Maps & Location': [
      'Google Maps SDK',
      'Geolocator',
      'Location Services',
      'Geofencing',
    ],
    'AI & Smart Features': [
      'AI API Integration',
      'AI Coach',
      'Recommendation Logic',
      'Smart Assistants',
    ],
    'Tools & Platforms': [
      'Android Studio',
      'VS Code',
      'Xcode',
      'Git & GitHub',
      'Postman',
      'Figma',
    ],
    'App Deployment': [
      'Play Store Publishing',
      'App Store Publishing',
      'App Signing',
      'Version Management',
      'Store Compliance',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: ResponsivePadding.all(context),
      child: Column(
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: const SectionTitle(
              title: AppStrings.skillsTitle,
              subtitle: AppStrings.skillsSubtitle,
            ),
          ),
          const SizedBox(height: 60),
          _buildSkillsGrid(context),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    return ResponsiveWidget(
      mobile: _buildMobileLayout(),
      tablet: _buildTabletLayout(),
      desktop: _buildDesktopLayout(),
    );
  }

  Widget _buildDesktopLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth - 40) / 2;
        return Wrap(
          spacing: 40,
          runSpacing: 40,
          children: _skillsData.entries.map((entry) {
            final index = _skillsData.entries.toList().indexOf(entry);
            return FadeInUp(
              duration: Duration(milliseconds: 800 + (index * 100)),
              child: SizedBox(
                width: cardWidth,
                child: SkillCategory(title: entry.key, skills: entry.value),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildTabletLayout() {
    return Column(
      children: _skillsData.entries.map((entry) {
        final index = _skillsData.entries.toList().indexOf(entry);
        return FadeInUp(
          duration: Duration(milliseconds: 800 + (index * 100)),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SkillCategory(title: entry.key, skills: entry.value),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: _skillsData.entries.map((entry) {
        final index = _skillsData.entries.toList().indexOf(entry);
        return FadeInUp(
          duration: Duration(milliseconds: 800 + (index * 100)),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: SkillCategory(title: entry.key, skills: entry.value),
          ),
        );
      }).toList(),
    );
  }
}
