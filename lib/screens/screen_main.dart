import 'package:admin_talent/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:admin_talent/screens/login.dart';
import 'package:admin_talent/screens/student/home_tab.dart';
import 'package:admin_talent/screens/student/projects_tab.dart';
import 'package:admin_talent/screens/student/simulators_tab.dart';
import 'package:admin_talent/screens/student/badges_tab.dart';
import 'package:admin_talent/screens/student/profile_tab.dart';

class ScreenMain extends StatefulWidget {
  ScreenMain({Key? key}) : super(key: key);

  @override
  _ScreenMainState createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const HomeTab(),
      const ProjectsTab(),
      const SimulatorsTab(),
      const BadgesTab(),
      const ProfileTab(),
    ];

    final List<String> titles = [
      "Level work",
      "Mis proyectos",
      "Simuladores",
      "Insignias",
      "Mi Perfil",
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
                child: Icon(Icons.snippet_folder_outlined),
              ),
              label: "Proyectos",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.fact_check_outlined),
              ),
              label: "Simuladores",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.military_tech_outlined),
              ),
              label: "Insignias",
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
          if (_currentIndex == 1)
            IconButton(icon: const Icon(Icons.search), onPressed: () {})
          else ...[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.pushNamed(context, '/notificaciones');
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
          IconButton(
            icon: const Icon(Icons.logout),
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
