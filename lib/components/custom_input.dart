import 'package:admin_talent/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  //Parametros del componente
  final String label;
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;
  final bool obscureText;

  const CustomInput({
    Key? key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //Texto del input
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 8),
          child: Text(label, style: TextStyle(color: AppColors.textColor)),
        ),
        //Caja del input
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 6),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,

              hintText: hintText,
              hintStyle: TextStyle(color: Colors.black45),
              prefixIcon: Icon(icon, color: AppColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
