import 'package:flutter/material.dart';
import 'package:admin_talent/core/app_colors.dart';

class TeacherValidateTab extends StatefulWidget {
  const TeacherValidateTab({Key? key}) : super(key: key);

  @override
  _TeacherValidateTabState createState() => _TeacherValidateTabState();
}

class _TeacherValidateTabState extends State<TeacherValidateTab> {
  final List<Map<String, dynamic>> _submissions = [
    {
      'id': 1,
      'studentName': 'Hector QZ',
      'projectName': 'Diseño del Plan Estratégico – EcoHome Solutions',
      'category': 'Planificación Estratégica',
      'date': '12/05/2026',
      'status': 'Pendiente',
      'evidence': 'EcoHome_PlanEstrategico.pdf',
    },
    {
      'id': 2,
      'studentName': 'Ana María Flores',
      'projectName': 'Auditoría de Estados Financieros – Inversiones S.A.',
      'category': 'Auditoría Financiera',
      'date': '16/05/2026',
      'status': 'Validado',
      'evidence': 'Auditoria_Inversiones.pdf',
      'rating': 5,
      'comment': 'Excelente análisis tributario y financiero. Muy detallado.',
    },
    {
      'id': 3,
      'studentName': 'Carlos Dávila',
      'projectName': 'Implementación de Red LAN de Servidores - IESRFA',
      'category': 'Diseño de Redes y Conectividad',
      'date': '15/05/2026',
      'status': 'Pendiente',
      'evidence': 'Red_LAN_IESRFA.png',
    },
    {
      'id': 4,
      'studentName': 'Sofía Rojas',
      'projectName': 'Diagnóstico Eléctrico de Sistema EFI - Hyundai Accent',
      'category': 'Sistemas Eléctricos del Vehículo',
      'date': '10/05/2026',
      'status': 'Validado',
      'evidence': 'Diagnostico_EFI.pdf',
      'rating': 4,
      'comment': 'Buen uso del osciloscopio para diagnosticar la red CAN-Bus del vehículo.',
    },
  ];

  void _showValidationBottomSheet(BuildContext context, Map<String, dynamic> submission) {
    int selectedRating = 5;
    final TextEditingController commentController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
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
                  const Text(
                    'Validación Académica',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E2E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Evaluando a: ${submission['studentName']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    'Proyecto: ${submission['projectName']}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 12),

                  // Sistema de Estrellas
                  const Text(
                    'Puntuación (Sistema de Estrellas)',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E2E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < selectedRating ? Icons.star : Icons.star_border,
                          color: AppColors.secondaryColor,
                          size: 32,
                        ),
                        onPressed: () {
                          setModalState(() {
                            selectedRating = index + 1;
                          });
                        },
                      );
                    }),
                  ),

                  const SizedBox(height: 20),

                  // Caja de Comentarios
                  const Text(
                    'Feedback y Observaciones',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E2E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: commentController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Deja un comentario o reconocimiento para el estudiante...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Botón de confirmación
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: BorderSide(color: Colors.grey[300]!),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: AppColors.textColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              submission['status'] = 'Validado';
                              submission['rating'] = selectedRating;
                              submission['comment'] = commentController.text;
                            });
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Trabajo certificado con éxito'),
                                backgroundColor: AppColors.primaryColor,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Certificar Trabajo'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _submissions.length,
        itemBuilder: (context, index) {
          final sub = _submissions[index];
          final bool isPending = sub['status'] == 'Pendiente';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sub['category'],
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isPending
                            ? AppColors.secondaryColor.withOpacity(0.15)
                            : Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        sub['status'],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isPending ? AppColors.textColor : Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  sub['projectName'],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E2E),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.person, size: 14, color: Colors.grey[500]),
                    const SizedBox(width: 4),
                    Text(
                      sub['studentName'],
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.attachment, size: 14, color: Colors.grey[500]),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        sub['evidence'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue[700],
                          decoration: TextDecoration.underline,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (!isPending) ...[
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'Evaluación: ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: List.generate(5, (starIndex) {
                          return Icon(
                            starIndex < sub['rating'] ? Icons.star : Icons.star_border,
                            color: AppColors.secondaryColor,
                            size: 16,
                          );
                        }),
                      ),
                    ],
                  ),
                  if (sub['comment'] != null && sub['comment'].isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      '"${sub['comment']}"',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
                      ),
                    ),
                  ]
                ],
                const SizedBox(height: 16),
                if (isPending)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _showValidationBottomSheet(context, sub),
                      icon: const Icon(Icons.verified_outlined, size: 18),
                      label: const Text('Certificar y Comentar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.textColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
