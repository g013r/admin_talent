import 'package:admin_talent/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:admin_talent/components/profile/profile_header.dart';
import 'package:admin_talent/components/profile/professional_links_section.dart';
import 'package:admin_talent/components/profile/cv_upload_section.dart';
import 'package:admin_talent/components/profile/about_me_section.dart';
import 'package:admin_talent/components/profile/work_experience_section.dart';
import 'package:admin_talent/components/profile/skills_section.dart';
import 'package:admin_talent/data/dummy_data.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final student = DummyData.currentStudent;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB), // Fondo claro
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ProfileHeader(student: student),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.edit, color: AppColors.primaryColor),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Enlaces Profesionales',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E2E),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    size: 20,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ProfessionalLinksSection(student: student),

            const SizedBox(height: 24),

            const Text(
              'Currículum Vitae',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E1E2E),
              ),
            ),
            const SizedBox(height: 12),
            const CvUploadSection(),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Acerca de mí',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E2E),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    size: 20,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            AboutMeSection(student: student),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Experiencia Formativa y de Trabajo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E2E),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    size: 20,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            WorkExperienceSection(student: student),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Habilidades y Conocimientos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E2E),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    size: 20,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SkillsSection(student: student),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
