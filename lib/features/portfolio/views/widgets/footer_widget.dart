import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/utils/constants/app_colors.dart';
import 'package:flutter_application_1/core/utils/constants/app_strings.dart';
import 'package:flutter_application_1/core/utils/constants/app_text_styles.dart';
import 'package:flutter_application_1/core/common/widgets/responsive_widget.dart';
import 'package:flutter_application_1/features/portfolio/controllers/portfolio_controller.dart';

/// Footer widget with copyright and social links
class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
      ),
      padding: ResponsivePadding.all(context),
      child: ResponsiveWidget(
        mobile: _buildMobileLayout(controller),
        desktop: _buildDesktopLayout(controller),
      ),
    );
  }

  Widget _buildDesktopLayout(PortfolioController controller) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: _buildBrandSection()),
            Expanded(flex: 1, child: _buildQuickLinks(controller)),
            Expanded(flex: 1, child: _buildSocialSection(controller)),
          ],
        ),
        const SizedBox(height: 40),
        Divider(color: AppColors.textOnPrimary.withValues(alpha: 0.2)),
        const SizedBox(height: 20),
        _buildCopyright(),
      ],
    );
  }

  Widget _buildMobileLayout(PortfolioController controller) {
    return Column(
      children: [
        _buildBrandSection(),
        const SizedBox(height: 32),
        _buildQuickLinks(controller),
        const SizedBox(height: 32),
        _buildSocialSection(controller),
        const SizedBox(height: 32),
        Divider(color: AppColors.textOnPrimary.withValues(alpha: 0.2)),
        const SizedBox(height: 20),
        _buildCopyright(),
      ],
    );
  }

  Widget _buildBrandSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.fullName,
          style: AppTextStyles.heading4.copyWith(
            color: AppColors.textOnPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          AppStrings.profession,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textOnPrimary.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Building beautiful mobile experiences\nwith Flutter',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textOnPrimary.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickLinks(PortfolioController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: AppTextStyles.heading5.copyWith(
            color: AppColors.textOnPrimary,
          ),
        ),
        const SizedBox(height: 16),
        _buildFooterLink('Home', () {}),
        _buildFooterLink('About', () {}),
        _buildFooterLink('Skills', () {}),
        _buildFooterLink('Projects', () {}),
        _buildFooterLink('Contact', () {}),
      ],
    );
  }

  Widget _buildFooterLink(String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textOnPrimary.withValues(alpha: 0.8),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialSection(PortfolioController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect',
          style: AppTextStyles.heading5.copyWith(
            color: AppColors.textOnPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildSocialIcon(
              icon: Icons.code,
              onTap: () => controller.launchURL(AppStrings.githubUrl),
            ),
            const SizedBox(width: 12),
            _buildSocialIcon(
              icon: Icons.work,
              onTap: () => controller.launchURL(AppStrings.linkedinUrl),
            ),
            const SizedBox(width: 12),
            _buildSocialIcon(
              icon: Icons.email,
              onTap: () => controller.openEmail(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          AppStrings.email,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textOnPrimary.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.phone,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textOnPrimary.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.textOnPrimary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.textOnPrimary.withValues(alpha: 0.2),
          ),
        ),
        child: Icon(icon, color: AppColors.textOnPrimary, size: 20),
      ),
    );
  }

  Widget _buildCopyright() {
    return Column(
      children: [
        Text(
          AppStrings.footerText,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textOnPrimary.withValues(alpha: 0.8),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.footerDevelopedBy,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textOnPrimary.withValues(alpha: 0.6),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
