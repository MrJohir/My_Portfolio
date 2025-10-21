import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constants/app_colors.dart';
import 'package:flutter_application_1/core/utils/constants/app_text_styles.dart';

/// Skill badge widget for displaying individual skills
/// Used in the skills section with icon and label
class SkillCard extends StatefulWidget {
  const SkillCard({
    super.key,
    required this.skillName,
    this.icon,
    this.iconUrl,
  });

  final String skillName;
  final IconData? icon;
  final String? iconUrl;

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -5.0 : 0.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.primary.withValues(alpha: 0.1)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? AppColors.primary : AppColors.border,
              width: _isHovered ? 2 : 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  color: _isHovered
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  size: 20,
                ),
              if (widget.iconUrl != null)
                Image.network(
                  widget.iconUrl!,
                  width: 20,
                  height: 20,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.code,
                    color: _isHovered
                        ? AppColors.primary
                        : AppColors.textSecondary,
                    size: 20,
                  ),
                ),
              if (widget.icon != null || widget.iconUrl != null)
                const SizedBox(width: 8),
              Text(
                widget.skillName,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: _isHovered ? AppColors.primary : AppColors.textPrimary,
                  fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Skill category widget for grouping skills
class SkillCategory extends StatelessWidget {
  const SkillCategory({super.key, required this.title, required this.skills});

  final String title;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.heading5.copyWith(color: AppColors.primary),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: skills
              .map(
                (skill) => SkillCard(
                  skillName: skill,
                  icon: Icons.check_circle_outline,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
