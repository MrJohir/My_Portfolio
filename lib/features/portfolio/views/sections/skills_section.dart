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

  // Skills data organized by category
  static const Map<String, List<String>> _skillsData = {
    'Framework & Languages': [
      'Flutter',
      'Dart',
      'Kotlin',
      'Java',
      'Swift',
      'JavaScript',
    ],
    'Backend & Database': [
      'Firebase',
      'REST API',
      'SQLite',
      'Hive',
      'Cloud Firestore',
      'MySQL',
    ],
    'State Management': ['GetX', 'Provider', 'BLoC', 'Riverpod'],
    'Tools & Others': [
      'Git & GitHub',
      'VS Code',
      'Android Studio',
      'Xcode',
      'Figma',
      'Postman',
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
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 40,
        mainAxisSpacing: 40,
        childAspectRatio: 2.8,
      ),
      itemCount: _skillsData.length,
      itemBuilder: (context, index) {
        final entry = _skillsData.entries.elementAt(index);
        return FadeInUp(
          duration: Duration(milliseconds: 800 + (index * 100)),
          child: SkillCategory(title: entry.key, skills: entry.value),
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
