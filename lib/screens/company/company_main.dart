import 'package:admin_talent/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:admin_talent/screens/company/company_profile_tab.dart';
import 'package:admin_talent/screens/company/home_tab.dart';
import 'package:admin_talent/screens/company/search_tab.dart';
import 'package:admin_talent/screens/company/messages_tab.dart';
import 'package:admin_talent/screens/login.dart';

class CompanyMain extends StatefulWidget {
  CompanyMain({Key? key}) : super(key: key);

  @override
  _CompanyMainState createState() => _CompanyMainState();
}

class _CompanyMainState extends State<CompanyMain> {
  int _currentIndex = 0; // Empezamos en la pestaña de Inicio por defecto

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const CompanyHomeTab(),
      const CompanySearchTab(),
      const CompanyMessagesTab(),
      const CompanyProfileTab(),
    ];

    final List<String> titles = [
      "TechCorp Solutions",
      "Buscar Talentos",
      "Mensajes",
      "Perfil de Empresa",
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
                child: Icon(Icons.search),
              ),
              label: "Buscar",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.message_outlined),
              ),
              label: "Mensajes",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.business),
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
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
        ],
      ),
      body: tabs[_currentIndex],
    );
  }
}
