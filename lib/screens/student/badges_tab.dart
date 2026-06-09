import 'package:flutter/material.dart';
import 'package:admin_talent/core/app_colors.dart';

class BadgesTab extends StatefulWidget {
  const BadgesTab({Key? key}) : super(key: key);

  @override
  _BadgesTabState createState() => _BadgesTabState();
}

class _BadgesTabState extends State<BadgesTab> {
  String _selectedFilter = 'Todas';

  final List<String> _filters = ['Todas', 'Ganadas', 'Bloqueadas'];

  final List<Map<String, dynamic>> _badges = [
    {
      'title': 'Liderazgo',
      'date': '18/04/2026',
      'color': AppColors.primaryColor,
      'icon': Icons.groups,
      'isLocked': false,
      'description': 'Liderar un proyecto de equipo con éxito.',
    },
    {
      'title': 'Análisis Financiero',
      'date': '10/04/2026',
      'color': Colors.teal,
      'icon': Icons.show_chart,
      'isLocked': false,
      'description': 'Dominar los conceptos básicos de pronósticos.',
    },
    {
      'title': 'Negociación',
      'date': '30/03/2026',
      'color': Colors.blue[600],
      'icon': Icons.handshake,
      'isLocked': false,
      'description': 'Cerrar con éxito un acuerdo comercial clave.',
    },
    {
      'title': 'Planificación Estratégica',
      'date': '22/03/2026',
      'color': Colors.orange[400],
      'icon': Icons.track_changes,
      'isLocked': false,
      'description': 'Crear una hoja de ruta estratégica de 5 años.',
    },
    {
      'title': 'Gurú del Marketing',
      'date': '',
      'color': Colors.pink[400],
      'icon': Icons.campaign,
      'isLocked': true,
      'description': 'Completar el simulador de marketing avanzado.',
    },
    {
      'title': 'Innovación',
      'date': '',
      'color': Colors.amber[600],
      'icon': Icons.lightbulb,
      'isLocked': true,
      'description': 'Proponer una idea de nuevo producto aprobada.',
    },
    {
      'title': 'Oratoria',
      'date': '',
      'color': Colors.deepPurple[400],
      'icon': Icons.mic,
      'isLocked': true,
      'description': 'Realizar una presentación ante la junta directiva.',
    },
    {
      'title': 'Ciencia de Datos',
      'date': '',
      'color': Colors.indigo[400],
      'icon': Icons.data_usage,
      'isLocked': true,
      'description': 'Analizar un conjunto de datos de más de 10k filas.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    int earnedCount = _badges.where((b) => !b['isLocked']).length;
    double progress = earnedCount / _badges.length;

    List<Map<String, dynamic>> filteredBadges = _badges.where((badge) {
      if (_selectedFilter == 'Ganadas') return !badge['isLocked'];
      if (_selectedFilter == 'Bloqueadas') return badge['isLocked'];
      return true;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProgressSummary(earnedCount, _badges.length, progress),
                  const SizedBox(height: 24),
                  _buildFilterPills(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.78, // Adjust for card height
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _buildBadgeCard(filteredBadges[index]);
                },
                childCount: filteredBadges.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 30), // Bottom padding
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSummary(int earned, int total, double progress) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.08)),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.emoji_events,
              color: AppColors.secondaryColor,
              size: 36,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tus Logros',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E2E),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$earned de $total Insignias Ganadas',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterPills() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final filter = _filters[index];
          final isSelected = filter == _selectedFilter;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedFilter = filter;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? AppColors.primaryColor : Colors.grey.withOpacity(0.2),
                ),
                boxShadow: [
                  if (!isSelected)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                ],
              ),
              child: Text(
                filter,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey[700],
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBadgeCard(Map<String, dynamic> badge) {
    bool isLocked = badge['isLocked'];
    Color badgeColor = isLocked ? Colors.grey[300]! : badge['color'];
    IconData iconData = isLocked ? Icons.lock : badge['icon'];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 70,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.shield,
                  size: 70,
                  color: badgeColor,
                ),
                Icon(
                  iconData,
                  size: 32,
                  color: isLocked ? Colors.grey[500] : Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            badge['title'],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isLocked ? Colors.grey[500] : const Color(0xFF1E1E2E),
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              badge['description'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[500],
                height: 1.3,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (!isLocked)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Ganada el ${badge['date']}',
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
