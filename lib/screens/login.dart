import 'package:admin_talent/components/InwardClipper.dart';
import 'package:admin_talent/components/custom_input.dart';
import 'package:admin_talent/core/app_colors.dart';
import 'package:admin_talent/screens/register.dart';
import 'package:admin_talent/screens/screen_main.dart';
import 'package:admin_talent/screens/teacher/teacher_main.dart';
import 'package:admin_talent/screens/company/company_main.dart';
import 'package:admin_talent/data/dummy_data.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _dniController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    String dni = _dniController.text;
    String password = _passwordController.text;

    if (DummyData.validUsers.containsKey(dni) &&
        DummyData.validUsers[dni]!['password'] == password) {
      String role = DummyData.validUsers[dni]!['role']!;
      Widget nextScreen;

      if (role == "teacher") {
        nextScreen = TeacherMain();
      } else if (role == "company") {
        nextScreen = CompanyMain();
      } else {
        nextScreen = ScreenMain();
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => nextScreen),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("DNI o contraseña incorrectos"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo_principal.png", height: 130),
                  Text(
                    "¡Bienvenido denuevo!",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text("Inicia sesion para seguir mostrando tu talento"),

                  //Formulario
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 5,
                      top: 20,
                    ),
                    child: CustomInput(
                      label: "DNI",
                      hintText: "Ingresa tu DNI",
                      icon: Icons.person,
                      controller: _dniController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 5,
                      top: 10,
                    ),
                    child: CustomInput(
                      label: "Contraseña",
                      hintText: "Ingresa tu contraseña",
                      icon: Icons.lock,
                      controller: _passwordController,
                      obscureText: true,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        print("Hola");
                      },
                      child: Text(
                        "¿Olvidaste tu contraseña?",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),

                  // ==Boton de iniciar sesion==
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ElevatedButton(
                      style: AppColors.elevatedButtonStyle,
                      onPressed: _login,
                      child: Text("Iniciar Sesión"),
                    ),
                  ),

                  Text("O"),
                  SizedBox(height: 5),

                  // ===Google o linkedin===
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.textColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/google.png",
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Continua con Google",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.textColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/linkedin.png",
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Continua con LinkedIn",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // ===Para registrar nueva cuenta===
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿No tienes cuenta?",
                        style: TextStyle(fontSize: 13),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text(
                          "Registrate",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),

                  ClipPath(
                    clipper: InwardClipper(),
                    child: Container(
                      height: 60,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
