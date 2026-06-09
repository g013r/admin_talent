import 'package:flutter/material.dart';
import 'package:admin_talent/core/app_colors.dart';
import 'package:admin_talent/screens/company/student_profile_detail.dart';

class CompanyHomeTab extends StatelessWidget {
  const CompanyHomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Listado de los 10 mejores perfiles iniciales (Ranking)
    final List<Map<String, dynamic>> rankingStudents = [
      {
        'rank': 1,
        'name': 'Elena Torres',
        'career': 'Contabilidad',
        'average': 19.0,
        'cycle': 'Egresado',
        'competency': 'Análisis Financiero',
        'avatar':
            'https://ui-avatars.com/api/?name=Elena+Torres&background=FE0000&color=fff&size=100',
      },
      {
        'rank': 2,
        'name': 'Mariela Ortiz',
        'career': 'Enfermería Técnica',
        'average': 18.0,
        'cycle': 'VI Semestre',
        'competency': 'Primeros Auxilios',
        'avatar':
            'https://ui-avatars.com/api/?name=Mariela+Ortiz&background=FECA00&color=323232&size=100',
      },
      {
        'rank': 3,
        'name': 'Hector QZ',
        'career': 'Administración de Empresas',
        'average': 18.5,
        'cycle': 'VI Semestre',
        'competency': 'Planificación Estratégica',
        'avatar':
            'https://ui-avatars.com/api/?name=Hector+QZ&background=323232&color=fff&size=100',
      },
      {
        'rank': 4,
        'name': 'Sofía Rojas',
        'career': 'Mecatrónica Automotriz',
        'average': 17.9,
        'cycle': 'VI Semestre',
        'competency': 'Sistemas Eléctricos del Vehículo',
        'avatar':
            'https://ui-avatars.com/api/?name=Sofia+Rojas&background=323232&color=fff&size=100',
      },
      {
        'rank': 5,
        'name': 'Ana María Flores',
        'career': 'Contabilidad',
        'average': 17.2,
        'cycle': 'V Semestre',
        'competency': 'Auditoría Financiera',
        'avatar':
            'https://ui-avatars.com/api/?name=Ana+Maria&background=FE0000&color=fff&size=100',
      },
      {
        'rank': 6,
        'name': 'Diego Cáceres',
        'career': 'Electrónica Industrial',
        'average': 17.0,
        'cycle': 'V Semestre',
        'competency': 'Sistemas Microprogramables',
        'avatar':
            'https://ui-avatars.com/api/?name=Diego+C&background=FE0000&color=fff&size=100',
      },
      {
        'rank': 7,
        'name': 'Luis Alva',
        'career': 'Electricidad Industrial',
        'average': 16.5,
        'cycle': 'V Semestre',
        'competency': 'Instalaciones Eléctricas',
        'avatar':
            'https://ui-avatars.com/api/?name=Luis+Alva&background=FE0000&color=fff&size=100',
      },
      {
        'rank': 8,
        'name': 'Carlos Dávila',
        'career':
            'Arquitectura de Plataformas y Servicios de Tecnologías de Información',
        'average': 16.8,
        'cycle': 'IV Semestre',
        'competency': 'Diseño de Redes y Conectividad',
        'avatar':
            'https://ui-avatars.com/api/?name=Carlos+Davila&background=FECA00&color=323232&size=100',
      },
      {
        'rank': 9,
        'name': 'Jorge Bustamante',
        'career': 'Mecánica de Producción Industrial',
        'average': 15.9,
        'cycle': 'IV Semestre',
        'competency': 'Soldadura Avanzada',
        'avatar':
            'https://ui-avatars.com/api/?name=Jorge+B&background=323232&color=fff&size=100',
      },
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner de bienvenida corporativo con la marca IESRFA
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF323232), AppColors.primaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                      ),
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://ui-avatars.com/api/?name=TechCorp+Solutions&background=ffffff&color=323232&size=100',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '¡Hola, Reclutador!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'TechCorp Solutions • Socio RFA',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Encuentra el talento técnico y profesional mejor calificado del instituto con evidencias certificadas.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Resumen Corporativo
                const Text(
                  'Métricas de Selección',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E2E),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildMetricCard(
                        title: 'Vistas a Perfiles',
                        value: '7',
                        icon: Icons.remove_red_eye_outlined,
                        color: AppColors.textColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildMetricCard(
                        title: 'Postulantes',
                        value: '4',
                        icon: Icons.folder_shared_outlined,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Lista de los mejores perfiles (Ranking de Estudiantes)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '🏆 Top 10 Alumnos Destacados (Ranking)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E1E2E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Lista de estudiantes top
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: rankingStudents.length,
                  itemBuilder: (context, index) {
                    final student = rankingStudents[index];
                    student['status'] ??= 'Disponible';

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentProfileDetailScreen(
                              studentData: student,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.06),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Medalla del Rank
                            Container(
                              width: 32,
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 0
                                    ? AppColors.secondaryColor
                                    : index == 1
                                    ? Colors.grey[300]
                                    : index == 2
                                    ? Colors.brown[300]
                                    : Colors.grey[100],
                              ),
                              child: Text(
                                '#${student['rank']}',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: index < 3
                                      ? AppColors.textColor
                                      : Colors.grey[600],
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(student['avatar']),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    student['name'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1E1E2E),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    student['career'],
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey[600],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Evidencia Top: ${student['competency']}',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${student['average']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                Text(
                                  student['cycle'],
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }
}
