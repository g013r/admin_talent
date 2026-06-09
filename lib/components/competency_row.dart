import 'package:admin_talent/core/app_colors.dart';
import 'package:flutter/material.dart';

class CompetencyRow extends StatefulWidget {
  final IconData icon;
  final String label;
  final double value;
  final String? displayValue;

  const CompetencyRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    this.displayValue,
  }) : super(key: key);

  @override
  _CompetencyRowState createState() => _CompetencyRowState();
}

class _CompetencyRowState extends State<CompetencyRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(widget.icon, color: AppColors.primaryColor, size: 24),
          SizedBox(width: 15),
          SizedBox(
            width: 120,
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1E1E2E),
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: widget.value,
                minHeight: 8,
                backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Text(
            widget.displayValue ?? "${(widget.value * 100).toInt()}%",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
