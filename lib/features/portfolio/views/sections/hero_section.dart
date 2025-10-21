import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/utils/constants/app_colors.dart';
import 'package:flutter_application_1/core/utils/constants/app_strings.dart';
import 'package:flutter_application_1/core/utils/constants/app_text_styles.dart';
import 'package:flutter_application_1/core/utils/constants/app_assets.dart';
import 'package:flutter_application_1/core/common/widgets/custom_button.dart';
import 'package:flutter_application_1/core/common/widgets/responsive_widget.dart';
import 'package:flutter_application_1/features/portfolio/controllers/portfolio_controller.dart';

/// Hero section with introduction and profile image
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.background,
            AppColors.primary.withValues(alpha: 0.05),
          ],
        ),
      ),
      child: Padding(
        padding: ResponsivePadding.all(context),
        child: ResponsiveWidget(
          mobile: _buildMobileLayout(context, controller),
          tablet: _buildTabletLayout(context, controller),
          desktop: _buildDesktopLayout(context, controller),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    PortfolioController controller,
  ) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: _buildContent(context, controller),
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 4,
          child: FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: _buildProfileImage(),
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(
    BuildContext context,
    PortfolioController controller,
  ) {
    return Column(
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1000),
          child: _buildProfileImage(),
        ),
        const SizedBox(height: 40),
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          child: _buildContent(context, controller),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    PortfolioController controller,
  ) {
    return Column(
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1000),
          child: _buildProfileImage(isMobile: true),
        ),
        const SizedBox(height: 30),
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          child: _buildContent(context, controller, isMobile: true),
        ),
      ],
    );
  }

  Widget _buildContent(
    BuildContext context,
    PortfolioController controller, {
    bool isMobile = false,
  }) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.heroGreeting,
          style: AppTextStyles.subtitle1.copyWith(
            color: AppColors.primary,
            fontSize: isMobile ? 16 : 20,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 16),
        Text(
          AppStrings.fullName,
          style: (isMobile ? AppTextStyles.heading1 : AppTextStyles.display1)
              .copyWith(fontSize: isMobile ? 32 : 48),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 16),
        Text(
          AppStrings.profession,
          style: AppTextStyles.heading2.copyWith(
            color: AppColors.primary,
            fontSize: isMobile ? 20 : 28,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 24),
        Text(
          AppStrings.heroSubtitle,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textSecondary,
            fontSize: isMobile ? 14 : 18,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 40),
        _buildSocialLinks(controller),
        const SizedBox(height: 40),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            CustomButton(
              text: AppStrings.ctaButton,
              onPressed: () {
                // Scroll to contact section
              },
              icon: Icons.mail_outline,
              height: isMobile ? 48 : 56,
            ),
            CustomButton(
              text: AppStrings.viewProjects,
              onPressed: () {
                // Scroll to projects section
              },
              isOutlined: true,
              icon: Icons.work_outline,
              height: isMobile ? 48 : 56,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialLinks(PortfolioController controller) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSocialIcon(
          icon: Icons.code,
          tooltip: AppStrings.tooltipGithub,
          onTap: () => controller.launchURL(AppStrings.githubUrl),
        ),
        const SizedBox(width: 16),
        _buildSocialIcon(
          icon: Icons.work,
          tooltip: AppStrings.tooltipLinkedin,
          onTap: () => controller.launchURL(AppStrings.linkedinUrl),
        ),
        const SizedBox(width: 16),
        _buildSocialIcon(
          icon: Icons.email_outlined,
          tooltip: AppStrings.tooltipEmail,
          onTap: () => controller.openEmail(),
        ),
        const SizedBox(width: 16),
        _buildSocialIcon(
          icon: Icons.phone_outlined,
          tooltip: AppStrings.tooltipPhone,
          onTap: () => controller.makePhoneCall(),
        ),
      ],
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required String tooltip,
    required VoidCallback onTap,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
      ),
    );
  }

  Widget _buildProfileImage({bool isMobile = false}) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: isMobile ? 300 : 400,
        maxHeight: isMobile ? 300 : 400,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ClipOval(
          child: Image.network(
            AppAssets.profileImagePlaceholder,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: AppColors.primary.withValues(alpha: 0.1),
              child: const Icon(
                Icons.person,
                size: 100,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
