class WorkExperience {
  final String id;
  final String company;
  final String role;
  final String startDate;
  final String endDate;
  final String description;

  WorkExperience({
    required this.id,
    required this.company,
    required this.role,
    required this.startDate,
    required this.endDate,
    required this.description,
  });
}

class Project {
  final String id;
  final String title;
  final String category;
  final String cycle;
  final String date;
  final bool verified;
  final String iconType;

  Project({
    required this.id,
    required this.title,
    required this.category,
    required this.cycle,
    required this.date,
    required this.verified,
    required this.iconType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'cycle': cycle,
      'date': date,
      'verified': verified,
      'iconType': iconType,
    };
  }
}

class Student {
  final String id;
  final String name;
  final String career;
  final String cycle;
  final double average;
  final int profileCompletion;
  final String avatarUrl;
  final String aboutMe;
  final Map<String, String> links;
  final List<Project> projects;
  final List<WorkExperience> workExperiences;
  final List<String> softSkills;
  final List<String> otherSkills;

  Student({
    required this.id,
    required this.name,
    required this.career,
    required this.cycle,
    required this.average,
    required this.profileCompletion,
    required this.avatarUrl,
    required this.aboutMe,
    required this.links,
    required this.projects,
    required this.workExperiences,
    required this.softSkills,
    required this.otherSkills,
  });
}

class Professor {
  final String id;
  final String name;
  final List<String> units;
  final String avatarUrl;

  Professor({
    required this.id,
    required this.name,
    required this.units,
    required this.avatarUrl,
  });
}

class Company {
  final String id;
  final String name;
  final String industry;
  final String logoUrl;
  final String description;

  Company({
    required this.id,
    required this.name,
    required this.industry,
    required this.logoUrl,
    required this.description,
  });
}
