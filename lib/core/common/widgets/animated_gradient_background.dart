import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constants/app_colors.dart';

/// Animated gradient background with smooth color transitions
/// Creates a dynamic, modern background effect
class AnimatedGradientBackground extends StatefulWidget {
  const AnimatedGradientBackground({
    super.key,
    this.child,
    this.colors = AppColors.backgroundGradient,
  });

  final Widget? child;
  final List<Color> colors;

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
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
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, _animation.value * 0.5, _animation.value],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.background.withValues(alpha: 0.9),
                  AppColors.background.withValues(alpha: 0.7),
                  AppColors.background.withValues(alpha: 0.9),
                ],
                begin: Alignment(-1.0 + (_animation.value * 2), -1.0),
                end: Alignment(1.0 - (_animation.value * 2), 1.0),
              ),
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}

/// Floating particles animation for background
class FloatingParticles extends StatefulWidget {
  const FloatingParticles({super.key});

  @override
  State<FloatingParticles> createState() => _FloatingParticlesState();
}

class _FloatingParticlesState extends State<FloatingParticles>
    with TickerProviderStateMixin {
  final List<AnimationController> _controllers = [];
  final List<Animation<Offset>> _animations = [];
  final int particleCount = 50;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < particleCount; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 10 + (i % 5)),
      )..repeat();

      final animation = Tween<Offset>(
        begin: Offset((i % 10) / 10.0, 1.5),
        end: Offset(((i + 3) % 10) / 10.0, -0.5),
      ).animate(CurvedAnimation(parent: controller, curve: Curves.linear));

      _controllers.add(controller);
      _animations.add(animation);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(particleCount, (index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            return Positioned(
              left:
                  MediaQuery.of(context).size.width *
                  _animations[index].value.dx,
              top:
                  MediaQuery.of(context).size.height *
                  _animations[index].value.dy,
              child: Container(
                width: 4 + (index % 3) * 2,
                height: 4 + (index % 3) * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.3),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.5),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
