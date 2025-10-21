import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/features/portfolio/controllers/portfolio_controller.dart';
import 'package:flutter_application_1/features/portfolio/views/sections/hero_section.dart';
import 'package:flutter_application_1/features/portfolio/views/sections/about_section.dart';
import 'package:flutter_application_1/features/portfolio/views/sections/skills_section.dart';
import 'package:flutter_application_1/features/portfolio/views/sections/projects_section.dart';
import 'package:flutter_application_1/features/portfolio/views/sections/contact_section.dart';
import 'package:flutter_application_1/features/portfolio/views/widgets/footer_widget.dart';
import 'package:flutter_application_1/core/utils/constants/app_colors.dart';

/// Main portfolio screen containing all sections
class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    Get.put(PortfolioController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: const [
                HeroSection(),
                SizedBox(height: 60),
                AboutSection(),
                SizedBox(height: 60),
                SkillsSection(),
                SizedBox(height: 60),
                ProjectsSection(),
                SizedBox(height: 60),
                ContactSection(),
                SizedBox(height: 20),
                FooterWidget(),
              ],
            ),
          ),
          // Scroll to top button
          Positioned(right: 20, bottom: 20, child: _buildScrollToTopButton()),
        ],
      ),
    );
  }

  Widget _buildScrollToTopButton() {
    return FloatingActionButton(
      onPressed: () {
        // Scroll to top functionality
      },
      backgroundColor: AppColors.primary,
      child: const Icon(Icons.arrow_upward, color: AppColors.textOnPrimary),
    );
  }
}
