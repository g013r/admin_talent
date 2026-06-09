import 'package:flutter/material.dart';
import 'package:admin_talent/core/app_colors.dart';
import 'package:admin_talent/screens/chat_detail_screen.dart';
import 'package:admin_talent/components/profile/about_me_section.dart';
import 'package:admin_talent/components/profile/work_experience_section.dart';
import 'package:admin_talent/components/profile/skills_section.dart';
import 'package:admin_talent/components/profile/professional_links_section.dart';
import 'package:admin_talent/data/dummy_data.dart';
import 'package:admin_talent/models/user_model.dart';

class StudentProfileDetailScreen extends StatefulWidget {
  final Map<String, dynamic> studentData;

  const StudentProfileDetailScreen({Key? key, required this.studentData})
    : super(key: key);

  @override
  _StudentProfileDetailScreenState createState() =>
      _StudentProfileDetailScreenState();
}

class _StudentProfileDetailScreenState
    extends State<StudentProfileDetailScreen> {
  late bool _isHired;
  bool _showAllSkills = false;

  @override
  void initState() {
    super.initState();
    _isHired = widget.studentData['status'] == 'Contratado';
  }

  @override
  Widget build(BuildContext context) {
    final studentMap = widget.studentData;

    final student = Student(
      id: 'mock_id',
      name: studentMap['name'],
      career: studentMap['career'],
      cycle: studentMap['cycle'],
      average: studentMap['average']?.toDouble() ?? 15.0,
      profileCompletion: 100,
      avatarUrl: studentMap['avatar'],
      aboutMe: _getBiographyForCareer(studentMap['career'], studentMap['name']),
      links: DummyData.currentStudent.links,
      projects: DummyData.currentStudent.projects,
      workExperiences: DummyData.currentStudent.workExperiences,
      softSkills: DummyData.currentStudent.softSkills,
      otherSkills: DummyData.currentStudent.otherSkills,
    );

    // Unidades didácticas y notas simuladas según su carrera
    final List<Map<String, dynamic>> allSkills = _getSkillsForCareer(
      student.career,
    );
    final List<Map<String, dynamic>> skills = _showAllSkills 
        ? allSkills 
        : allSkills.take(3).toList();
    
    final List<Map<String, dynamic>> projects = _getProjectsForCareer(
      student.career,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      appBar: AppBar(
        backgroundColor: AppColors.textColor,
        title: const Text('Expediente del Talento'),
        foregroundColor: AppColors.secondaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header del Estudiante con la paleta de IESRFA
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
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.secondaryColor,
                    ),
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(student.avatarUrl),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    student.career,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${student.cycle} • Promedio: ${student.average}',
                    style: const TextStyle(fontSize: 13, color: Colors.white70),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _isHired ? Colors.green : AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _isHired ? 'Candidato Contratado' : 'Talento Disponible',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: _isHired ? Colors.white : AppColors.textColor,
                      ),
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
                  // Puntuación de Empleabilidad (Circular Indicator)
                  const Text(
                    'Índice de Empleabilidad',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E2E),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.withOpacity(0.06)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              CircularProgressIndicator(
                                value: student.average / 20.0,
                                strokeWidth: 8,
                                backgroundColor: AppColors.primaryColor
                                    .withOpacity(0.1),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  AppColors.primaryColor,
                                ),
                              ),
                              Center(
                                child: Text(
                                  student.average.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1E1E2E),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Perfil Académico Sobresaliente',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Este alumno cuenta con múltiples evidencias certificadas por el personal docente de la IESRFA.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Capacidades y Unidades Didácticas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          'Capacidades y Unidades Didácticas Certificadas',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E1E2E),
                          ),
                        ),
                      ),
                      if (allSkills.length > 3)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _showAllSkills = !_showAllSkills;
                            });
                          },
                          child: Text(
                            _showAllSkills ? "Ver menos" : "Ver más",
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.withOpacity(0.06)),
                    ),
                    child: Column(
                      children: skills.map((skill) {
                        return Column(
                          children: [
                            ListTile(
                              leading: const Icon(
                                Icons.verified,
                                color: Colors.green,
                                size: 22,
                              ),
                              title: Text(
                                skill['unit'],
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  const Text(
                                    'Evaluación: ',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                  Row(
                                    children: List.generate(5, (starIndex) {
                                      return Icon(
                                        starIndex < skill['rating']
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: AppColors.secondaryColor,
                                        size: 13,
                                      );
                                    }),
                                  ),
                                ],
                              ),
                              trailing: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor.withOpacity(
                                    0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'Nota: ${skill['grade']}',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            if (skill != skills.last)
                              const Divider(height: 1, indent: 50),
                          ],
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Evidencias de Proyectos
                  const Text(
                    'Portafolio de Proyectos y Evidencias',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E2E),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    children: projects.map((project) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.06),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.textColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.insert_drive_file,
                                color: AppColors.textColor,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    project['title'],
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Archivo: ${project['file']}',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.blue[700],
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Biografía / Acerca de mí
                  const Text(
                    'Perfil Biográfico',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E2E),
                    ),
                  ),
                  const SizedBox(height: 12),
                  AboutMeSection(student: student),

                  const SizedBox(height: 24),

                  const Text(
                    'Experiencia Formativa y de Trabajo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E2E),
                    ),
                  ),
                  const SizedBox(height: 12),
                  WorkExperienceSection(student: student),

                  const SizedBox(height: 24),

                  const Text(
                    'Habilidades y Conocimientos',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E2E),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SkillsSection(student: student),

                  const SizedBox(height: 24),

                  const Text(
                    'Enlaces Profesionales',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E2E),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ProfessionalLinksSection(student: student),

                  const SizedBox(height: 30),

                  // Barra de Acciones Corporativas
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatDetailScreen(
                                  userName: student.name,
                                  userSub: student.career,
                                  avatarUrl: student.avatarUrl,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.chat_bubble_outline),
                          label: const Text('Mensaje Directo'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.textColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _isHired = !_isHired;
                              widget.studentData['status'] = _isHired
                                  ? 'Contratado'
                                  : 'Disponible';
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  _isHired
                                      ? '¡Excelente! Candidato marcado como CONTRATADO.'
                                      : 'Candidato marcado como disponible.',
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          icon: Icon(
                            _isHired ? Icons.undo : Icons.check_circle,
                          ),
                          label: Text(
                            _isHired ? 'Liberar Talento' : 'Contratar Talento',
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isHired
                                ? Colors.grey[600]
                                : AppColors.primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getSkillsForCareer(String career) {
    if (career == 'Administración de Empresas') {
      return DummyData.admCourses.map((course) {
        int grade = 15 + (course.length % 5);
        return {
          'unit': course,
          'grade': grade,
          'rating': grade >= 18 ? 5 : 4,
        };
      }).toList();
    } else if (career == 'Contabilidad') {
      return [
        {'unit': 'Auditoría Financiera', 'grade': 18, 'rating': 5},
        {'unit': 'Costos y Presupuestos', 'grade': 17, 'rating': 4},
        {'unit': 'Software Contable', 'grade': 16, 'rating': 4},
      ];
    } else if (career ==
        'Arquitectura de Plataformas y Servicios de Tecnologías de Información') {
      return [
        {'unit': 'Diseño de Redes y Conectividad', 'grade': 18, 'rating': 5},
        {
          'unit': 'Administración de Sistemas Operativos',
          'grade': 16,
          'rating': 4,
        },
        {'unit': 'Base de Datos Multidimensionales', 'grade': 17, 'rating': 4},
      ];
    } else if (career == 'Mecatrónica Automotriz') {
      return [
        {'unit': 'Sistemas Eléctricos del Vehículo', 'grade': 19, 'rating': 5},
        {'unit': 'Diagnóstico de Motores EFI', 'grade': 17, 'rating': 4},
        {'unit': 'Electrónica Automotriz Avanzada', 'grade': 18, 'rating': 5},
      ];
    } else {
      return [
        {'unit': 'Competencias Técnicas I', 'grade': 17, 'rating': 4},
        {'unit': 'Proyecto de Aplicación Integral', 'grade': 18, 'rating': 5},
      ];
    }
  }

  List<Map<String, dynamic>> _getProjectsForCareer(String career) {
    if (career == 'Administración de Empresas') {
      return [
        {
          'title': 'Diseño del Plan Estratégico – EcoHome Solutions',
          'file': 'EcoHome_PlanEstrategico.pdf',
        },
        {
          'title': 'Clima y Cultura Laboral – E-Commerce RFA',
          'file': 'Clima_Laboral_RFA.pdf',
        },
      ];
    } else if (career == 'Contabilidad') {
      return [
        {
          'title': 'Auditoría de Estados Financieros – Inversiones S.A.',
          'file': 'Auditoria_Inversiones.pdf',
        },
        {
          'title': 'Presupuesto Operativo Q3 - Panadería San José',
          'file': 'Presupuestos_Bakery.xlsx',
        },
      ];
    } else if (career ==
        'Arquitectura de Plataformas y Servicios de Tecnologías de Información') {
      return [
        {
          'title': 'Implementación de Red LAN de Servidores - IESRFA',
          'file': 'Red_LAN_IESRFA.png',
        },
        {
          'title': 'Esquema de Base de Datos PostgreSQL',
          'file': 'DB_Schema_Recruit.sql',
        },
      ];
    } else if (career == 'Mecatrónica Automotriz') {
      return [
        {
          'title': 'Diagnóstico Eléctrico de Sistema EFI - Hyundai Accent',
          'file': 'Diagnostico_EFI.pdf',
        },
        {
          'title': 'Análisis del Sistema de Transmisión Automática DSG',
          'file': 'Transmision_DSG.docx',
        },
      ];
    } else {
      return [
        {
          'title': 'Proyecto Final de Evidencias Técnicas',
          'file': 'Evidencia_Integrada.pdf',
        },
      ];
    }
  }

  String _getBiographyForCareer(String career, String name) {
    if (career == 'Administración de Empresas') {
      return 'Estudiante de Administración de Empresas comprometido con la excelencia académica. Apasionado por la gestión de procesos, planificación estratégica, y optimización de recursos. Demuestra excelentes capacidades analíticas de mercado.';
    } else if (career == 'Contabilidad') {
      return 'Estudiante del programa de Contabilidad enfocado en auditoría tributaria y análisis de costos. Con alto dominio de software contable de vanguardia y análisis de estados financieros corporativos.';
    } else if (career ==
        'Arquitectura de Plataformas y Servicios de Tecnologías de Información') {
      return 'Estudiante avanzado del programa de APSTI. Especializado en diseño de infraestructura de redes locales y administración de servidores basados en Linux y Windows Server. Altamente resolutivo.';
    } else if (career == 'Mecatrónica Automotriz') {
      return 'Estudiante del programa de Mecatrónica Automotriz apasionado por el diagnóstico de fallas complejas y electrónica automotriz avanzada. Amplio manejo de instrumental como escáneres multimarca y osciloscopios.';
    } else {
      return 'Estudiante destacado del Instituto de Educación Superior Tecnológico Público de las Fuerzas Armadas. Cuenta con competencias técnicas validadas y certificadas por docentes de primer nivel.';
    }
  }

  String _getCareerAbbreviation(String career) {
    if (career == 'Administración de Empresas') return 'ADM';
    if (career == 'Contabilidad') return 'CON';
    if (career == 'Arquitectura de Plataformas y Servicios de Tecnologías de Información') return 'APSTI';
    if (career == 'Mecatrónica Automotriz') return 'MA';
    if (career == 'Enfermería Técnica') return 'ENF';
    if (career == 'Mecánica de Producción Industrial') return 'MPI';
    if (career == 'Electricidad Industrial') return 'EEI';
    if (career == 'Electrónica Industrial') return 'EIE';
    return career;
  }
}
