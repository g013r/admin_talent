import 'package:flutter/material.dart';
import 'package:admin_talent/core/app_colors.dart';
import 'package:admin_talent/models/user_model.dart';

class ProfessionalLinksSection extends StatelessWidget {
  final Student student;

  const ProfessionalLinksSection({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: student.links.entries.map((entry) {
          IconData icon;
          Color iconColor;
          if (entry.key.toLowerCase().contains('linkedin')) {
            icon = Icons.link;
            iconColor = Colors.blue[700]!;
          } else if (entry.key.toLowerCase().contains('github')) {
            icon = Icons.code;
            iconColor = Colors.black87;
          } else {
            icon = Icons.language;
            iconColor = AppColors.primaryColor;
          }
          
          return Column(
            children: [
              _buildLinkItem(
                icon: icon,
                title: entry.key,
                value: entry.value,
                iconColor: iconColor,
              ),
              if (entry.key != student.links.keys.last)
                const Divider(height: 24, thickness: 1),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLinkItem({
    required IconData icon,
    required String title,
    required String value,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: iconColor),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E1E2E),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.edit_outlined, size: 20, color: Colors.grey),
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }
}
