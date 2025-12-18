import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constants/app_colors.dart';
import 'package:flutter_application_1/core/utils/constants/app_strings.dart';
import 'package:flutter_application_1/core/utils/constants/app_text_styles.dart';
import 'package:flutter_application_1/core/common/widgets/section_title.dart';
import 'package:flutter_application_1/core/common/widgets/responsive_widget.dart';

/// About section with bio and professional info
/// Features gradient cards and smooth animations
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.surface, AppColors.background],
        ),
      ),
      padding: ResponsivePadding.all(context),
      child: Column(
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: AppColors.aboutGradient,
              ).createShader(bounds),
              child: const SectionTitle(
                title: AppStrings.aboutTitle,
                subtitle: AppStrings.aboutSubtitle,
              ),
            ),
          ),
          const SizedBox(height: 60),
          ResponsiveWidget(
            mobile: _buildMobileLayout(),
            desktop: _buildDesktopLayout(),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: _buildContent(),
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          child: FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: _buildStats(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          child: _buildContent(),
        ),
        const SizedBox(height: 40),
        FadeInUp(
          duration: const Duration(milliseconds: 1200),
          child: _buildStats(),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.aboutDescription, style: AppTextStyles.bodyLarge),
        const SizedBox(height: 24),
        Text(
          AppStrings.aboutExtended,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.aboutGradient,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.aboutGradient[0].withValues(alpha: 0.3),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        children: [
          ZoomIn(
            duration: const Duration(milliseconds: 600),
            delay: const Duration(milliseconds: 200),
            child: _buildStatItem(
              icon: Icons.emoji_events,
              label: 'Current Role',
              value: 'Team Lead',
            ),
          ),
          const SizedBox(height: 24),
          ZoomIn(
            duration: const Duration(milliseconds: 600),
            delay: const Duration(milliseconds: 400),
            child: _buildStatItem(
              icon: Icons.business,
              label: 'Company',
              value: 'Softvency IT Limited',
            ),
          ),
          const SizedBox(height: 24),
          ZoomIn(
            duration: const Duration(milliseconds: 600),
            delay: const Duration(milliseconds: 600),
            child: _buildStatItem(
              icon: Icons.location_on,
              label: 'Location',
              value: AppStrings.location,
            ),
          ),
          const SizedBox(height: 24),
          ZoomIn(
            duration: const Duration(milliseconds: 600),
            delay: const Duration(milliseconds: 800),
            child: _buildStatItem(
              icon: Icons.school,
              label: 'Education',
              value: 'BSc in CSE',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
