import 'package:admin_talent/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:admin_talent/screens/teacher/teacher_profile_tab.dart';
import 'package:admin_talent/screens/teacher/home_tab.dart';
import 'package:admin_talent/screens/teacher/validate_tab.dart';
import 'package:admin_talent/screens/teacher/students_tab.dart';
import 'package:admin_talent/screens/login.dart';

class TeacherMain extends StatefulWidget {
  TeacherMain({Key? key}) : super(key: key);

  @override
  _TeacherMainState createState() => _TeacherMainState();
}

class _TeacherMainState extends State<TeacherMain> {
  int _currentIndex = 0; // Empezamos en la pestaña de Inicio por defecto

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const TeacherHomeTab(),
      const TeacherValidateTab(),
      const TeacherStudentsTab(),
      const TeacherProfileTab(),
    ];

    final List<String> titles = [
      "Level work",
      "Validaciones",
      "Mis Alumnos",
      "Perfil Docente",
    ];

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey[500],
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: _currentIndex,
          elevation: 0,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.home_filled),
              ),
              label: "Inicio",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.fact_check_outlined),
              ),
              label: "Validar",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.people_outline),
              ),
              label: "Alumnos",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.person_outline),
              ),
              label: "Perfil",
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.textColor,
        title: Text(titles[_currentIndex]),
        foregroundColor: AppColors.secondaryColor,
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ],
      ),
      body: tabs[_currentIndex],
    );
  }
}
