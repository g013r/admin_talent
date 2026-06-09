import 'package:flutter/material.dart';
import 'package:admin_talent/core/app_colors.dart';

class TeacherStudentsTab extends StatefulWidget {
  const TeacherStudentsTab({Key? key}) : super(key: key);

  @override
  _TeacherStudentsTabState createState() => _TeacherStudentsTabState();
}

class _TeacherStudentsTabState extends State<TeacherStudentsTab> {
  final List<Map<String, dynamic>> _students = [
    {
      'name': 'Hector QZ',
      'career': 'Administración de Empresas',
      'cycle': 'V Semestre',
      'average': 18.5,
      'validatedCount': 14,
      'progress': 0.85,
      'avatarUrl':
          'https://ui-avatars.com/api/?name=Hector+QZ&background=323232&color=fff&size=100',
    },
    {
      'name': 'Ana María Flores',
      'career': 'Contabilidad',
      'cycle': 'VI Semestre',
      'average': 17.2,
      'validatedCount': 10,
      'progress': 0.75,
      'avatarUrl':
          'https://ui-avatars.com/api/?name=Ana+Maria&background=FE0000&color=fff&size=100',
    },
    {
      'name': 'Carlos Dávila',
      'career':
          'Arquitectura de Plataformas y Servicios de Tecnologías de Información',
      'cycle': 'IV Semestre',
      'average': 16.8,
      'validatedCount': 8,
      'progress': 0.68,
      'avatarUrl':
          'https://ui-avatars.com/api/?name=Carlos+Davila&background=FECA00&color=323232&size=100',
    },
    {
      'name': 'Sofía Rojas',
      'career': 'Mecatrónica Automotriz',
      'cycle': 'II Semestre',
      'average': 17.9,
      'validatedCount': 12,
      'progress': 0.80,
      'avatarUrl':
          'https://ui-avatars.com/api/?name=Sofia+Rojas&background=323232&color=fff&size=100',
    },
  ];

  String _searchQuery = '';

  void _showAwardCongratulationDialog(
    BuildContext context,
    String studentName,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: const [
              Icon(
                Icons.emoji_events,
                color: AppColors.secondaryColor,
                size: 28,
              ),
              SizedBox(width: 10),
              Text('Enviar Felicitación'),
            ],
          ),
          content: Text(
            '¿Deseas enviar un reconocimiento especial a $studentName por su excelente desempeño académico en este semestre?',
            style: const TextStyle(fontSize: 14, height: 1.4),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '¡Felicitación enviada a $studentName con éxito!',
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Enviar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredStudents = _students.where((student) {
      return student['name'].toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          student['career'].toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      body: Column(
        children: [
          // Buscador superior
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar estudiante por nombre o carrera...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Lista de alumnos
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredStudents.length,
              itemBuilder: (context, index) {
                final student = filteredStudents[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.withOpacity(0.06)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(student['avatarUrl']),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  student['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1E1E2E),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  student['career'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${student['cycle']} • Promedio: ${student['average']}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(height: 1),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Entregas validadas: ${student['validatedCount']}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              SizedBox(
                                width: 140,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: LinearProgressIndicator(
                                    value: student['progress'],
                                    minHeight: 6,
                                    backgroundColor: Colors.grey[200],
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          AppColors.primaryColor,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton.icon(
                            onPressed: () => _showAwardCongratulationDialog(
                              context,
                              student['name'],
                            ),
                            icon: const Icon(
                              Icons.workspace_premium_outlined,
                              size: 16,
                            ),
                            label: const Text('Felicitar'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.textColor,
                              foregroundColor: AppColors.secondaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
