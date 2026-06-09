import 'package:admin_talent/components/InwardClipper.dart';
import 'package:admin_talent/components/custom_input.dart';
import 'package:admin_talent/core/app_colors.dart';
import 'package:admin_talent/screens/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(surfaceTintColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo_iesrfa.png", height: 130),
            Text(
              "Crea una cuenta",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "Unete a AdminTalent y muestra tus habilidades a los mejores empleadores",
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
                top: 20,
              ),
              child: CustomInput(
                label: "DNI",
                hintText: "Ingresa tu DNI",
                icon: Icons.person,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
                top: 10,
              ),
              child: CustomInput(
                label: "Nombre",
                hintText: "Ingresa tu nombre",
                icon: Icons.near_me,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
                top: 10,
              ),
              child: CustomInput(
                label: "Centro de estudios",
                hintText: "Ingresa tu centro de estudios",
                icon: Icons.school,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
                top: 20,
              ),
              child: CustomInput(
                label: "Contraseña",
                hintText: "Ingresa tu contraseña",
                icon: Icons.lock,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
                top: 20,
              ),
              child: CustomInput(
                label: "Confirmar contraseña",
                hintText: "Confirma tu contraseña",
                icon: Icons.lock,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: AppColors.primaryColor,
                    onChanged: (bool? newValue) {},
                    value: true,
                    side: BorderSide(color: AppColors.primaryColor),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 13),
                      children: [
                        TextSpan(text: "Acepto "),
                        TextSpan(
                          text: "términos y condiciones",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: " de AdminTalent"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                style: AppColors.elevatedButtonStyle,
                onPressed: () {},
                child: Text("Registrarse"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("¿Ya tienes cuenta?", style: TextStyle(fontSize: 13)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    "Inicia sesión",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ClipPath(
              clipper: InwardClipper(),
              child: Container(height: 60, color: AppColors.backgroundColor),
            ),
          ],
        ),
      ),
    );
  }
}
