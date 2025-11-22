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
class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    Get.put(PortfolioController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverToBoxAdapter(child: HeroSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 60)),
              const SliverToBoxAdapter(child: AboutSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 60)),
              const SliverToBoxAdapter(child: SkillsSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 60)),
              const SliverToBoxAdapter(child: ProjectsSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 60)),
              const SliverToBoxAdapter(child: ContactSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              const SliverToBoxAdapter(child: FooterWidget()),
              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          ),
          // Scroll to top button
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: AppColors.primary,
              child: const Icon(
                Icons.arrow_upward,
                color: AppColors.textOnPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
