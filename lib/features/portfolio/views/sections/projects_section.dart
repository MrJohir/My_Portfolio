import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/utils/constants/app_colors.dart';
import 'package:flutter_application_1/core/utils/constants/app_strings.dart';
import 'package:flutter_application_1/core/common/widgets/section_title.dart';
import 'package:flutter_application_1/core/common/widgets/project_card.dart';
import 'package:flutter_application_1/core/common/widgets/responsive_widget.dart';
import 'package:flutter_application_1/features/portfolio/controllers/portfolio_controller.dart';

/// Projects section displaying portfolio projects
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: ResponsivePadding.all(context),
      child: Column(
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: const SectionTitle(
              title: AppStrings.projectsTitle,
              subtitle: AppStrings.projectsSubtitle,
            ),
          ),
          const SizedBox(height: 60),
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              );
            }

            if (controller.projects.isEmpty) {
              return Center(
                child: Text(
                  'No projects available',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            }

            return ResponsiveWidget(
              mobile: _buildMobileLayout(controller),
              tablet: _buildTabletLayout(controller),
              desktop: _buildDesktopLayout(controller),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(PortfolioController controller) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: 0.75,
      ),
      itemCount: controller.projects.length,
      itemBuilder: (context, index) {
        final project = controller.projects[index];
        return FadeInUp(
          duration: Duration(milliseconds: 800 + (index * 100)),
          child: ProjectCard(
            title: project.title,
            description: project.description,
            technologies: project.technologies,
            imageUrl: project.imageUrl,
            githubUrl: project.githubUrl,
            liveUrl: project.liveUrl,
          ),
        );
      },
    );
  }

  Widget _buildTabletLayout(PortfolioController controller) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 0.75,
      ),
      itemCount: controller.projects.length,
      itemBuilder: (context, index) {
        final project = controller.projects[index];
        return FadeInUp(
          duration: Duration(milliseconds: 800 + (index * 100)),
          child: ProjectCard(
            title: project.title,
            description: project.description,
            technologies: project.technologies,
            imageUrl: project.imageUrl,
            githubUrl: project.githubUrl,
            liveUrl: project.liveUrl,
          ),
        );
      },
    );
  }

  Widget _buildMobileLayout(PortfolioController controller) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.projects.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final project = controller.projects[index];
        return FadeInUp(
          duration: Duration(milliseconds: 800 + (index * 100)),
          child: ProjectCard(
            title: project.title,
            description: project.description,
            technologies: project.technologies,
            imageUrl: project.imageUrl,
            githubUrl: project.githubUrl,
            liveUrl: project.liveUrl,
          ),
        );
      },
    );
  }
}
