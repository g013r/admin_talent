import 'package:flutter/material.dart';
import 'package:admin_talent/core/app_colors.dart';
import 'package:admin_talent/components/project_card.dart';
import 'package:admin_talent/data/dummy_data.dart';

class ProjectsTab extends StatefulWidget {
  const ProjectsTab({Key? key}) : super(key: key);

  @override
  _ProjectsTabState createState() => _ProjectsTabState();
}

class _ProjectsTabState extends State<ProjectsTab> {
  String _selectedCategory = 'Todos';
  String _selectedSemester = 'Todos';

  final List<String> _categories = ['Todos', ...DummyData.admCourses];

  final List<String> _semesters = [
    'Todos',
    'Semestre 1',
    'Semestre 2',
    'Semestre 3',
    'Semestre 4',
    'Semestre 5',
    'Semestre 6',
    'Egresado',
  ];

  List<Map<String, dynamic>> get _projects =>
      DummyData.currentStudent.projects.map((p) => p.toMap()).toList();

  @override
  Widget build(BuildContext context) {
    // Scaffold inside a tab can have its own FloatingActionButton
    return Scaffold(
      backgroundColor: const Color(
        0xFFF9F9FB,
      ), // Very light greyish/white background
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // Categories
          SizedBox(
            height: 36,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = category == _selectedCategory;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        if (!isSelected)
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                      ],
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey[700],
                        fontSize: 14,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Semestres
          SizedBox(
            height: 36,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _semesters.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final semester = _semesters[index];
                final isSelected = semester == _selectedSemester;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedSemester = semester;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.secondaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        if (!isSelected)
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                      ],
                    ),
                    child: Text(
                      semester,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey[700],
                        fontSize: 14,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Projects List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 80), // Padding for FAB
              itemCount: _projects.length,
              itemBuilder: (context, index) {
                final project = _projects[index];
                // Filter logic
                if (_selectedCategory != 'Todos' &&
                    project['category'] != _selectedCategory) {
                  return const SizedBox.shrink();
                }
                if (_selectedSemester != 'Todos' &&
                    project['cycle'] != _selectedSemester) {
                  return const SizedBox.shrink();
                }
                return ProjectCard(project: project);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add project action
        },
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
