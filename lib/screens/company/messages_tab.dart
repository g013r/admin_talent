import 'package:flutter/material.dart';
import 'package:admin_talent/core/app_colors.dart';
import 'package:admin_talent/screens/chat_detail_screen.dart';

class CompanyMessagesTab extends StatelessWidget {
  const CompanyMessagesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chats = [
      {
        'name': 'Hector QZ',
        'career': 'Administración de Empresas',
        'lastMessage':
            'Buenas tardes, quedo a la espera de su respuesta sobre la vacante.',
        'time': '10:45 AM',
        'unread': true,
        'avatar':
            'https://ui-avatars.com/api/?name=Hector+QZ&background=323232&color=fff&size=100',
      },
      {
        'name': 'Carlos Dávila',
        'career': 'Arquitectura de Plataformas y Servicios de Tecnologías de Información',
        'lastMessage':
            'Le he enviado mi portafolio de redes y conectividad. Saludos.',
        'time': 'Ayer',
        'unread': false,
        'avatar':
            'https://ui-avatars.com/api/?name=Carlos+Davila&background=FECA00&color=323232&size=100',
      },
      {
        'name': 'Ana María Flores',
        'career': 'Contabilidad',
        'lastMessage':
            'Perfecto, agendemos la entrevista para el día de mañana.',
        'time': '15 de Mayo',
        'unread': false,
        'avatar':
            'https://ui-avatars.com/api/?name=Ana+Maria&background=FE0000&color=fff&size=100',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      body: chats.isEmpty
          ? const Center(
              child: Text(
                'No tienes conversaciones activas',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.withOpacity(0.06)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.01),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundImage: NetworkImage(chat['avatar']),
                        ),
                        if (chat['unread'])
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          chat['name'],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: chat['unread']
                                ? FontWeight.bold
                                : FontWeight.bold,
                            color: const Color(0xFF1E1E2E),
                          ),
                        ),
                        Text(
                          chat['time'],
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chat['career'],
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            chat['lastMessage'],
                            style: TextStyle(
                              fontSize: 12,
                              color: chat['unread']
                                  ? AppColors.textColor
                                  : Colors.grey[500],
                              fontWeight: chat['unread']
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatDetailScreen(
                            userName: chat['name'],
                            userSub: chat['career'],
                            avatarUrl: chat['avatar'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
