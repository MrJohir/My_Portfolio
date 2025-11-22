import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/utils/constants/app_colors.dart';
import 'package:flutter_application_1/core/utils/constants/app_strings.dart';
import 'package:flutter_application_1/core/utils/constants/app_text_styles.dart';
import 'package:flutter_application_1/core/common/widgets/responsive_widget.dart';
import 'package:flutter_application_1/core/common/widgets/animated_gradient_background.dart';
import 'package:flutter_application_1/features/portfolio/controllers/portfolio_controller.dart';

/// Hero section with introduction and profile image
/// Features advanced animations with gradients and floating effects
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();
    final screenHeight = MediaQuery.of(context).size.height;
    final minHeight = screenHeight < 600 ? 600.0 : screenHeight * 0.9;

    return SizedBox(
      height: minHeight,
      child: Stack(
        children: [
          // Animated gradient background
          const Positioned.fill(child: AnimatedGradientBackground()),
          // Floating particles
          const Positioned.fill(child: FloatingParticles()),
          // Main content
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: minHeight),
              child: Container(
                width: double.infinity,
                padding: ResponsivePadding.all(context),
                child: ResponsiveWidget(
                  mobile: _buildMobileLayout(context, controller),
                  tablet: _buildTabletLayout(context, controller),
                  desktop: _buildDesktopLayout(context, controller),
                ),
              ),
            ),
          ),
        ],
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
        // Animated greeting with shimmer effect
        FadeInDown(
          duration: const Duration(milliseconds: 800),
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: AppColors.heroGradient,
            ).createShader(bounds),
            child: Text(
              AppStrings.heroGreeting,
              style: AppTextStyles.subtitle1.copyWith(
                color: Colors.white,
                fontSize: isMobile ? 16 : 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Animated name with gradient
        FadeInLeft(
          duration: const Duration(milliseconds: 1000),
          delay: const Duration(milliseconds: 200),
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: AppColors.heroGradient,
            ).createShader(bounds),
            child: Text(
              AppStrings.fullName,
              style:
                  (isMobile ? AppTextStyles.heading1 : AppTextStyles.display1)
                      .copyWith(
                        fontSize: isMobile ? 32 : 48,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Animated typewriter effect for profession
        FadeInRight(
          duration: const Duration(milliseconds: 1000),
          delay: const Duration(milliseconds: 400),
          child: SizedBox(
            height: isMobile ? 30 : 40,
            child: DefaultTextStyle(
              style: AppTextStyles.heading2.copyWith(
                fontSize: isMobile ? 20 : 28,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    AppStrings.profession,
                    speed: const Duration(milliseconds: 100),
                    textStyle: AppTextStyles.heading2.copyWith(
                      fontSize: isMobile ? 20 : 28,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: AppColors.heroGradient,
                        ).createShader(const Rect.fromLTWH(0, 0, 500, 40)),
                    ),
                  ),
                  TypewriterAnimatedText(
                    'Flutter Developer',
                    speed: const Duration(milliseconds: 100),
                    textStyle: AppTextStyles.heading2.copyWith(
                      fontSize: isMobile ? 20 : 28,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: AppColors.heroGradient,
                        ).createShader(const Rect.fromLTWH(0, 0, 500, 40)),
                    ),
                  ),
                  TypewriterAnimatedText(
                    'Mobile App Developer',
                    speed: const Duration(milliseconds: 100),
                    textStyle: AppTextStyles.heading2.copyWith(
                      fontSize: isMobile ? 20 : 28,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: AppColors.heroGradient,
                        ).createShader(const Rect.fromLTWH(0, 0, 500, 40)),
                    ),
                  ),
                ],
                repeatForever: true,
                pause: const Duration(milliseconds: 1500),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Subtitle with fade animation
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          delay: const Duration(milliseconds: 600),
          child: Text(
            AppStrings.heroSubtitle,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
              fontSize: isMobile ? 14 : 18,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ),
        const SizedBox(height: 40),
        // Social links with stagger animation
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 800),
          child: _buildSocialLinks(controller),
        ),
        const SizedBox(height: 40),
        // CTA buttons with bounce animation
        BounceInUp(
          duration: const Duration(milliseconds: 1200),
          delay: const Duration(milliseconds: 1000),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
            children: [
              _buildGradientButton(
                text: AppStrings.ctaButton,
                icon: Icons.mail_outline,
                onPressed: () {},
                isMobile: isMobile,
              ),
              _buildOutlinedGradientButton(
                text: AppStrings.viewProjects,
                icon: Icons.work_outline,
                onPressed: () {},
                isMobile: isMobile,
              ),
            ],
          ),
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
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: AppColors.heroGradient),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(icon, color: AppColors.textOnPrimary, size: 24),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
    bool isMobile = false,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: isMobile ? 48 : 56,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: AppColors.buttonGradient),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.textOnPrimary),
              const SizedBox(width: 8),
              Text(
                text,
                style: AppTextStyles.button.copyWith(
                  color: AppColors.textOnPrimary,
                  fontSize: isMobile ? 14 : 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOutlinedGradientButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
    bool isMobile = false,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: isMobile ? 48 : 56,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: AppColors.primary),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: AppColors.buttonGradient,
                ).createShader(bounds),
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(width: 8),
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: AppColors.buttonGradient,
                ).createShader(bounds),
                child: Text(
                  text,
                  style: AppTextStyles.button.copyWith(
                    color: Colors.white,
                    fontSize: isMobile ? 14 : 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage({bool isMobile = false}) {
    final size = isMobile ? 280.0 : 380.0;

    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeOutCubic,
        builder: (context, value, child) {
          return Transform.scale(
            scale: 0.8 + (value * 0.2),
            child: Opacity(
              opacity: value,
              child: _AnimatedFloatingImage(size: size),
            ),
          );
        },
      ),
    );
  }
}

/// Animated floating profile image widget
class _AnimatedFloatingImage extends StatefulWidget {
  const _AnimatedFloatingImage({required this.size});

  final double size;

  @override
  State<_AnimatedFloatingImage> createState() => _AnimatedFloatingImageState();
}

class _AnimatedFloatingImageState extends State<_AnimatedFloatingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -10),
      end: const Offset(0, 10),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offsetAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: _offsetAnimation.value,
          child: Center(
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: AppColors.heroGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.4),
                    blurRadius: 30,
                    spreadRadius: 5,
                    offset: const Offset(0, 10),
                  ),
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.2),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(6),
              child: Container(
                width: widget.size - 12,
                height: widget.size - 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: ClipOval(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final size = constraints.maxWidth;
                      return SizedBox(
                        width: size,
                        height: size,
                        child: Image.asset(
                          'assets/images/profile.jpg',
                          width: size,
                          height: size,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: AppColors.heroGradient,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 100,
                                  color: Colors.white,
                                ),
                              ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
