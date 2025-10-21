import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/utils/constants/app_colors.dart';
import 'package:flutter_application_1/core/utils/constants/app_strings.dart';
import 'package:flutter_application_1/core/utils/constants/app_text_styles.dart';
import 'package:flutter_application_1/core/utils/validators/app_validator.dart';
import 'package:flutter_application_1/core/common/widgets/section_title.dart';
import 'package:flutter_application_1/core/common/widgets/custom_text_field.dart';
import 'package:flutter_application_1/core/common/widgets/custom_button.dart';
import 'package:flutter_application_1/core/common/widgets/responsive_widget.dart';
import 'package:flutter_application_1/features/portfolio/controllers/portfolio_controller.dart';

/// Contact section with form and contact information
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: ResponsivePadding.all(context),
      child: Column(
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: const SectionTitle(
              title: AppStrings.contactTitle,
              subtitle: AppStrings.contactSubtitle,
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            duration: const Duration(milliseconds: 900),
            child: Text(
              AppStrings.contactDescription,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          ResponsiveWidget(
            mobile: _buildMobileLayout(controller),
            desktop: _buildDesktopLayout(controller),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(PortfolioController controller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: _buildContactForm(controller),
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 4,
          child: FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: _buildContactInfo(controller),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(PortfolioController controller) {
    return Column(
      children: [
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          child: _buildContactInfo(controller),
        ),
        const SizedBox(height: 40),
        FadeInUp(
          duration: const Duration(milliseconds: 1200),
          child: _buildContactForm(controller),
        ),
      ],
    );
  }

  Widget _buildContactForm(PortfolioController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.contactFormTitle, style: AppTextStyles.heading3),
            const SizedBox(height: 24),
            CustomTextField(
              controller: controller.nameController,
              label: AppStrings.nameLabel,
              hint: AppStrings.nameHint,
              prefixIcon: Icons.person_outline,
              validator: (value) => AppValidator.validateFullName(value),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: controller.emailController,
              label: AppStrings.emailLabel,
              hint: AppStrings.emailHint,
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => AppValidator.validateEmail(value),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: controller.messageController,
              label: AppStrings.messageLabel,
              hint: AppStrings.messageHint,
              prefixIcon: Icons.message_outlined,
              maxLines: 4,
              validator: (value) => AppValidator.validateMessage(value),
            ),
            const SizedBox(height: 24),
            Obx(
              () => SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: AppStrings.sendButton,
                  onPressed: controller.isSubmitting.value
                      ? null
                      : controller.submitContactForm,
                  isLoading: controller.isSubmitting.value,
                  icon: Icons.send,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(PortfolioController controller) {
    return Column(
      children: [
        _buildContactInfoCard(
          icon: Icons.email_outlined,
          title: AppStrings.emailMe,
          subtitle: AppStrings.email,
          onTap: () => controller.openEmail(),
        ),
        const SizedBox(height: 24),
        _buildContactInfoCard(
          icon: Icons.phone_outlined,
          title: AppStrings.callMe,
          subtitle: AppStrings.phone,
          onTap: () => controller.makePhoneCall(),
        ),
        const SizedBox(height: 24),
        _buildContactInfoCard(
          icon: Icons.location_on_outlined,
          title: 'Location',
          subtitle: AppStrings.location,
          onTap: null,
        ),
        const SizedBox(height: 32),
        _buildSocialLinks(controller),
      ],
    );
  }

  Widget _buildContactInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.primary, size: 28),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.bodySmall),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.textSecondary,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks(PortfolioController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            AppColors.accent.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(AppStrings.followMe, style: AppTextStyles.heading5),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(
                icon: Icons.code,
                onTap: () => controller.launchURL(AppStrings.githubUrl),
              ),
              const SizedBox(width: 16),
              _buildSocialButton(
                icon: Icons.work,
                onTap: () => controller.launchURL(AppStrings.linkedinUrl),
              ),
              const SizedBox(width: 16),
              _buildSocialButton(
                icon: Icons.email,
                onTap: () => controller.openEmail(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: AppColors.textOnPrimary, size: 24),
      ),
    );
  }
}
