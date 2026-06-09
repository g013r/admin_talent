import 'package:flutter/material.dart';
import 'package:admin_talent/core/app_colors.dart';
import 'package:admin_talent/components/competency_row.dart';
import 'package:admin_talent/components/project_card_mini.dart';
import 'package:admin_talent/data/dummy_data.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool _showAllCourses = false;

  @override
  Widget build(BuildContext context) {
    final student = DummyData.currentStudent;
    final allCourses = DummyData.admCourses;
    final visibleCourses = _showAllCourses
        ? allCourses
        : allCourses.take(4).toList();

    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 180,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF323232), AppColors.primaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Header con foto y saludo ===
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Foto circular
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.secondaryColor,
                          width: 3,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(student.avatarUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    // Texto de saludo
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Hola, ${student.name}!",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          student.career,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${student.cycle} • Promedio: ${student.average}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // === Contenido blanco con borde redondeado ===
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Promedio General",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E1E2E),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Puntuación y mensaje
                      Row(
                        children: [
                          // Círculo de progreso
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CircularProgressIndicator(
                                  value: student.average / 20.0,
                                  strokeWidth: 10,
                                  backgroundColor: AppColors.primaryColor
                                      .withOpacity(0.1),
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        AppColors.primaryColor,
                                      ),
                                ),
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        student.average.toString(),
                                        style: const TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF1E1E2E),
                                        ),
                                      ),
                                      const Text(
                                        "/20",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 25),
                          // Mensaje
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "¡Estás en el Top 10!",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Tu promedio general te clasifica entre los mejores de tu programa.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 35),
                      Divider(color: Colors.grey[200]),
                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Cursos Cursados",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E1E2E),
                            ),
                          ),
                          if (allCourses.length > 4)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _showAllCourses = !_showAllCourses;
                                });
                              },
                              child: Text(
                                _showAllCourses ? "Ver menos" : "Ver más",
                                style: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      ...visibleCourses.map((course) {
                        int grade = 15 + (course.length % 5);
                        return CompetencyRow(
                          icon: Icons.check_circle_outline,
                          label: course,
                          value: grade / 20.0,
                          displayValue: grade.toString(),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // ===Proyectos destacados===
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Proyectos destacados",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Desliza",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Colors.grey[600],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: student.projects.take(3).map((p) {
                          return ProyectsCard(
                            title: p.title,
                            tag: p.category,
                            imagePath: "assets/images/image1.jpg",
                            tagColor: AppColors.primaryColor,
                            tagBackgroundColor: AppColors.primaryColor
                                .withOpacity(0.1),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
