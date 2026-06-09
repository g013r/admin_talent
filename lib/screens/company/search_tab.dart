import 'package:flutter/material.dart';
import 'package:admin_talent/core/app_colors.dart';
import 'package:admin_talent/screens/company/student_profile_detail.dart';

class CompanySearchTab extends StatefulWidget {
  const CompanySearchTab({Key? key}) : super(key: key);

  @override
  _CompanySearchTabState createState() => _CompanySearchTabState();
}

class _CompanySearchTabState extends State<CompanySearchTab> {
  // Mock Data of Candidates representing all IESRFA study programs
  final List<Map<String, dynamic>> _candidates = [
    {
      'name': 'Luis Alva',
      'career': 'Electricidad Industrial',
      'cycle': 'V Semestre',
      'average': 16.5,
      'competency': 'Instalaciones Eléctricas',
      'evidence': 'Esquema_Tablero.dwg',
      'avatar': 'https://ui-avatars.com/api/?name=Luis+Alva&background=FE0000&color=fff&size=100',
      'status': 'Disponible',
    },
    {
      'name': 'Mariela Ortiz',
      'career': 'Enfermería Técnica',
      'cycle': 'VI Semestre',
      'average': 18.0,
      'competency': 'Primeros Auxilios',
      'evidence': 'Certificado_RCP.pdf',
      'avatar': 'https://ui-avatars.com/api/?name=Mariela+Ortiz&background=FECA00&color=323232&size=100',
      'status': 'Disponible',
    },
    {
      'name': 'Jorge Bustamante',
      'career': 'Mecánica de Producción Industrial',
      'cycle': 'IV Semestre',
      'average': 15.9,
      'competency': 'Soldadura Avanzada',
      'evidence': 'Estructura_Metalica.jpg',
      'avatar': 'https://ui-avatars.com/api/?name=Jorge+B&background=323232&color=fff&size=100',
      'status': 'Disponible',
    },
    {
      'name': 'Diego Cáceres',
      'career': 'Electrónica Industrial',
      'cycle': 'V Semestre',
      'average': 17.0,
      'competency': 'Sistemas Microprogramables',
      'evidence': 'Dispositivo_IoT.bin',
      'avatar': 'https://ui-avatars.com/api/?name=Diego+C&background=FE0000&color=fff&size=100',
      'status': 'Disponible',
    },
    {
      'name': 'Hector QZ',
      'career': 'Administración de Empresas',
      'cycle': 'VI Semestre',
      'average': 18.5,
      'competency': 'Planificación Estratégica',
      'evidence': 'EcoHome_PlanEstrategico.pdf',
      'avatar': 'https://ui-avatars.com/api/?name=Hector+QZ&background=323232&color=fff&size=100',
      'status': 'Disponible',
    },
    {
      'name': 'Ana María Flores',
      'career': 'Contabilidad',
      'cycle': 'V Semestre',
      'average': 17.2,
      'competency': 'Auditoría Financiera',
      'evidence': 'Auditoria_Inversiones.pdf',
      'avatar': 'https://ui-avatars.com/api/?name=Ana+Maria&background=FE0000&color=fff&size=100',
      'status': 'Disponible',
    },
    {
      'name': 'Carlos Dávila',
      'career': 'Arquitectura de Plataformas y Servicios de Tecnologías de Información',
      'cycle': 'IV Semestre',
      'average': 16.8,
      'competency': 'Diseño de Redes y Conectividad',
      'evidence': 'Red_LAN_IESRFA.png',
      'avatar': 'https://ui-avatars.com/api/?name=Carlos+Davila&background=FECA00&color=323232&size=100',
      'status': 'Disponible',
    },
    {
      'name': 'Sofía Rojas',
      'career': 'Mecatrónica Automotriz',
      'cycle': 'VI Semestre',
      'average': 17.9,
      'competency': 'Sistemas Eléctricos del Vehículo',
      'evidence': 'Diagnostico_EFI.pdf',
      'avatar': 'https://ui-avatars.com/api/?name=Sofia+Rojas&background=323232&color=fff&size=100',
      'status': 'Contratado',
    },
    {
      'name': 'Elena Torres',
      'career': 'Contabilidad',
      'cycle': 'Egresado',
      'average': 19.0,
      'competency': 'Análisis Financiero',
      'evidence': 'Balance_General.xlsx',
      'avatar': 'https://ui-avatars.com/api/?name=Elena+Torres&background=FE0000&color=fff&size=100',
      'status': 'Disponible',
    },
    {
      'name': 'Martín Silva',
      'career': 'Administración de Empresas',
      'cycle': 'Egresado',
      'average': 18.2,
      'competency': 'Gestión de Proyectos',
      'evidence': 'Proyecto_Marketing.pdf',
      'avatar': 'https://ui-avatars.com/api/?name=Martin+Silva&background=323232&color=fff&size=100',
      'status': 'Disponible',
    },
  ];

  String _searchQuery = '';
  String _selectedCareer = 'Todos';

  final List<String> _careersFilter = [
    'Todos',
    'Administración de Empresas',
    'Arquitectura de Plataformas y Servicios de Tecnologías de Información',
    'Contabilidad',
    'Electricidad Industrial',
    'Electrónica Industrial',
    'Enfermería Técnica',
    'Mecánica de Producción Industrial',
    'Mecatrónica Automotriz'
  ];

  void _showCandidateDetails(BuildContext context, Map<String, dynamic> candidate) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            final bool isHired = candidate['status'] == 'Contratado';

            return Container(
              padding: EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(candidate['avatar']),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              candidate['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E1E2E),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              candidate['career'],
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 12),
                  _buildDetailRow('Semestre Académico', candidate['cycle']),
                  _buildDetailRow('Promedio del Semestre', '${candidate['average']} / 20'),
                  _buildDetailRow('Evidencia Destacada', candidate['competency']),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.attachment, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          candidate['evidence'],
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue[700],
                            decoration: TextDecoration.underline,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Iniciando chat interno con ${candidate['name']}...'),
                                backgroundColor: AppColors.primaryColor,
                              ),
                            );
                          },
                          icon: const Icon(Icons.chat_bubble_outline),
                          label: const Text('Contactar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.textColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
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
                            setModalState(() {
                              candidate['status'] = isHired ? 'Disponible' : 'Contratado';
                            });
                            setState(() {}); // Update background search list
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  isHired
                                      ? 'Candidato marcado como disponible.'
                                      : '¡Felicidades! Candidato marcado como CONTRATADO.',
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          icon: Icon(isHired ? Icons.undo : Icons.check_circle_outline),
                          label: Text(isHired ? 'Liberar' : 'Contratar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isHired ? Colors.grey[700] : AppColors.primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 13, color: Colors.grey[600], fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textColor),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredCandidates = _candidates.where((candidate) {
      final matchesSearch = candidate['name'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
          candidate['competency'].toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCareer = _selectedCareer == 'Todos' || candidate['career'] == _selectedCareer;
      return matchesSearch && matchesCareer;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      body: Column(
        children: [
          // Filtro de Búsqueda y Carrera
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Buscar por nombre o unidad didáctica...',
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
                const SizedBox(height: 10),
                // Combo de Filtrado por Programa de Estudio
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedCareer,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCareer = newValue!;
                        });
                      },
                      items: _careersFilter.map((career) {
                        return DropdownMenuItem<String>(
                          value: career,
                          child: Text(
                            career,
                            style: const TextStyle(fontSize: 13, color: AppColors.textColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Lista de Talentos
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredCandidates.length,
              itemBuilder: (context, index) {
                final candidate = filteredCandidates[index];
                final bool isHired = candidate['status'] == 'Contratado';

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
                            radius: 26,
                            backgroundImage: NetworkImage(candidate['avatar']),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      candidate['name'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1E1E2E),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: isHired ? Colors.green.withOpacity(0.1) : AppColors.secondaryColor.withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        candidate['status'],
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                          color: isHired ? Colors.green : AppColors.textColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  candidate['career'],
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Unidad: ${candidate['competency']}',
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
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(height: 1),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star, color: AppColors.secondaryColor, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                'Promedio: ${candidate['average']}',
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StudentProfileDetailScreen(studentData: candidate),
                                ),
                              ).then((_) {
                                setState(() {});
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.textColor,
                              foregroundColor: AppColors.secondaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                            ),
                            child: const Text('Ver Evidencias', style: TextStyle(fontSize: 12)),
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
