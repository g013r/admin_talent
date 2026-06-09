import 'package:flutter/material.dart';
import 'package:admin_talent/core/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CvUploadSection extends StatelessWidget {
  const CvUploadSection({Key? key}) : super(key: key);

  static final Uri _cvUrl = Uri.parse('https://example.com/cv.pdf');

  Future<void> _openCv() async {
    if (await canLaunchUrl(_cvUrl)) {
      await launchUrl(_cvUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir el CV';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'CV disponible',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E1E2E),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: _openCv,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.insert_drive_file_outlined,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Ver CV',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
