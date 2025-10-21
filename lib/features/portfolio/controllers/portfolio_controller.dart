import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_1/features/portfolio/models/project.dart';
import 'package:flutter_application_1/features/portfolio/models/contact_form.dart';
import 'package:flutter_application_1/features/portfolio/data/mock_projects.dart';
import 'package:flutter_application_1/core/utils/constants/app_strings.dart';

/// Portfolio controller for managing portfolio state and actions
/// Handles project data, contact form submission, and URL launching
class PortfolioController extends GetxController {
  // Form controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  // Form key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Observable state
  final RxList<Project> projects = <Project>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isSubmitting = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProjects();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }

  /// Load projects data
  void loadProjects() {
    try {
      isLoading.value = true;
      projects.value = MockProjects.getProjects();
    } catch (e) {
      debugPrint('Error loading projects: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Submit contact form
  Future<void> submitContactForm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isSubmitting.value = true;

      final contactForm = ContactForm(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        message: messageController.text.trim(),
      );

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Log the form data (in production, send to backend/Firebase)
      debugPrint('Contact Form Submitted: ${contactForm.toString()}');

      // Show success message
      Get.snackbar(
        'Success',
        AppStrings.messageSentSuccess,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF4CAF50),
        colorText: const Color(0xFFFFFFFF),
        duration: const Duration(seconds: 3),
      );

      // Clear form
      nameController.clear();
      emailController.clear();
      messageController.clear();
      formKey.currentState?.reset();
    } catch (e) {
      debugPrint('Error submitting contact form: $e');
      Get.snackbar(
        'Error',
        AppStrings.messageSentError,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFF44336),
        colorText: const Color(0xFFFFFFFF),
        duration: const Duration(seconds: 3),
      );
    } finally {
      isSubmitting.value = false;
    }
  }

  /// Launch URL in browser
  Future<void> launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
      Get.snackbar(
        'Error',
        'Could not open URL',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFF44336),
        colorText: const Color(0xFFFFFFFF),
      );
    }
  }

  /// Open email client
  Future<void> openEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: AppStrings.email,
      query: 'subject=Portfolio Inquiry',
    );
    await launchURL(emailUri.toString());
  }

  /// Make phone call
  Future<void> makePhoneCall() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: AppStrings.phone);
    await launchURL(phoneUri.toString());
  }

  /// Scroll to section
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }
}
