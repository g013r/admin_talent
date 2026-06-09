import '../models/user_model.dart';

class DummyData {
  // Credenciales válidas
  static final Map<String, Map<String, String>> validUsers = {
    "71662255": {"password": "71662255", "role": "student"},
    "11111111": {"password": "password", "role": "teacher"},
    "22222222": {"password": "password", "role": "company"},
  };

  // Datos del estudiante
  static Student get currentStudent => Student(
    id: 's1',
    name: 'HectorQZ',
    career: 'Administración de Empresas',
    cycle: 'VI Semestre',
    average: 18.5,
    profileCompletion: 80,
    avatarUrl:
        'https://ui-avatars.com/api/?name=Usuario+Test&background=323232&color=fff&size=100',
    aboutMe:
        'Estudiante de Administración de Empresas comprometido con la excelencia académica. Apasionado por la gestión de procesos, planificación estratégica, y optimización de recursos. Habilidades en análisis de mercado y desarrollo organizativo.',
    links: {
      'LinkedIn': 'linkedin.com/in/hectorqz',
      'GitHub': 'github.com/hectorqz',
      'Portafolio Web': 'hectorqz.dev',
    },
    softSkills: [
      'Liderazgo',
      'Trabajo en equipo',
      'Resolución de problemas',
      'Comunicación asertiva',
      'Adaptabilidad',
    ],
    otherSkills: [
      'Microsoft Excel (Avanzado)',
      'Adobe Premiere Pro (Edición de video)',
      'Power BI (Básico)',
      'Inglés B2',
    ],
    workExperiences: [
      WorkExperience(
        id: 'we1',
        company: 'Empresa XYZ S.A.C.',
        role: 'Asistente Administrativo',
        startDate: 'Ene 2025',
        endDate: 'Actualidad',
        description:
            'Gestión de documentos, atención al cliente y apoyo en procesos de recursos humanos.',
      ),
      WorkExperience(
        id: 'we2',
        company: 'Agencia de Marketing Digital',
        role: 'Practicante de Marketing',
        startDate: 'Jul 2024',
        endDate: 'Dic 2024',
        description:
            'Apoyo en creación de contenido, edición de video para campañas y análisis de métricas.',
      ),
    ],
    projects: [
      Project(
        id: 'pj1',
        title: 'Plan Estratégico y de Negocios 2026',
        category: 'Plan de negocios',
        cycle: 'Semestre 6',
        date: '12/05/2026',
        verified: true,
        iconType: 'pdf',
      ),
      Project(
        id: 'pj2',
        title: 'Análisis de Legislación en Startups',
        category: 'Legislación comercial y tributaria',
        cycle: 'Semestre 5',
        date: '15/05/2026',
        verified: true,
        iconType: 'pdf',
      ),
      Project(
        id: 'pj3',
        title: 'Reducción de Costos Operativos',
        category: 'Análisis de costos',
        cycle: 'Semestre 4',
        date: '10/05/2026',
        verified: true,
        iconType: 'dashboard',
      ),
      Project(
        id: 'pj4',
        title: 'Evaluación de Herramientas Financieras',
        category: 'Herramientas financieras',
        cycle: 'Semestre 3',
        date: '08/05/2026',
        verified: true,
        iconType: 'ppt',
      ),
      Project(
        id: 'pj5',
        title: 'Presupuesto Anual Corporativo',
        category: 'Presupuesto empresarial',
        cycle: 'Semestre 4',
        date: '01/05/2026',
        verified: true,
        iconType: 'swot',
      ),
      Project(
        id: 'pj6',
        title: 'Impacto Económico Global',
        category: 'Economía aplicada a los negocios',
        cycle: 'Semestre 2',
        date: '28/04/2026',
        verified: true,
        iconType: 'pdf',
      ),
      Project(
        id: 'pj7',
        title: 'Innovación en Pagos Digitales',
        category: 'Fundamentos de la innovación tecnológica',
        cycle: 'Semestre 1',
        date: '25/04/2026',
        verified: true,
        iconType: 'dashboard',
      ),
      Project(
        id: 'pj8',
        title: 'Desarrollo de Nuevo Emprendimiento',
        category: 'Emprendimiento empresarial',
        cycle: 'Semestre 3',
        date: '20/04/2026',
        verified: true,
        iconType: 'ppt',
      ),
      Project(
        id: 'pj9',
        title: 'Auditoría de Calidad Empresarial',
        category: 'Procesos de la calidad empresarial',
        cycle: 'Semestre 5',
        date: '18/04/2026',
        verified: true,
        iconType: 'swot',
      ),
      Project(
        id: 'pj10',
        title: 'Implementación de IA en Ventas',
        category: 'Inteligencia artificial aplicada a los negocios',
        cycle: 'Semestre 6',
        date: '15/04/2026',
        verified: true,
        iconType: 'pdf',
      ),
      Project(
        id: 'pj11',
        title: 'Análisis Financiero Q1',
        category: 'Análisis financiero',
        cycle: 'Semestre 4',
        date: '10/04/2026',
        verified: true,
        iconType: 'dashboard',
      ),
      Project(
        id: 'pj12',
        title: 'ROI de Proyectos de Inversión',
        category: 'Administración de proyectos de inversión',
        cycle: 'Semestre 6',
        date: '05/04/2026',
        verified: true,
        iconType: 'ppt',
      ),
      Project(
        id: 'pj13',
        title: 'Dashboard de Control Operativo',
        category: 'Control del plan operativo empresarial',
        cycle: 'Semestre 5',
        date: '01/04/2026',
        verified: true,
        iconType: 'dashboard',
      ),
      Project(
        id: 'pj14',
        title: 'Estrategia de Exportación',
        category: 'Técnicas de comercio exterior',
        cycle: 'Semestre 6',
        date: '28/03/2026',
        verified: true,
        iconType: 'pdf',
      ),
      Project(
        id: 'pj15',
        title: 'Transformación Tecnológica',
        category: 'Innovación tecnológica aplicada',
        cycle: 'Semestre 6',
        date: '25/03/2026',
        verified: true,
        iconType: 'swot',
      ),
      Project(
        id: 'pj16',
        title: 'Taller de Resolución de Conflictos',
        category: 'Negociación y solución de conflictos',
        cycle: 'Semestre 2',
        date: '20/03/2026',
        verified: true,
        iconType: 'ppt',
      ),
      Project(
        id: 'pj17',
        title: 'Experiencias formativas',
        category:
            'Experiencias formativas en situaciones reales de trabajo (ESRT)',
        cycle: 'Egresado',
        date: '15/03/2026',
        verified: false,
        iconType: 'dashboard',
      ),
    ],
  );

  // Lista de profesores de ejemplo
  static List<Professor> get professors => [
    Professor(
      id: 'p1',
      name: 'Dr. Roberto Sánchez',
      units: ['Plan de negocios', 'Análisis financiero'],
      avatarUrl:
          'https://ui-avatars.com/api/?name=Roberto+S&background=0D8ABC&color=fff',
    ),
    Professor(
      id: 'p2',
      name: 'Dra. María González',
      units: ['Legislación comercial y tributaria', 'Técnicas de comercio exterior'],
      avatarUrl:
          'https://ui-avatars.com/api/?name=Maria+G&background=E91E63&color=fff',
    ),
  ];

  // Lista de empresas de ejemplo
  static List<Company> get companies => [
    Company(
      id: 'c1',
      name: 'TechSolutions Corp',
      industry: 'Tecnología',
      logoUrl:
          'https://ui-avatars.com/api/?name=Tech+Solutions&background=4CAF50&color=fff',
      description:
          'Innovando el futuro del desarrollo de software empresarial.',
    ),
    Company(
      id: 'c2',
      name: 'Finanzas Globales S.A.',
      industry: 'Banca',
      logoUrl:
          'https://ui-avatars.com/api/?name=Finanzas+Globales&background=FF9800&color=fff',
      description: 'Tu socio confiable para el crecimiento financiero.',
    ),
  ];

  // Lista de cursos de Administración de Empresas (ADM)
  static List<String> get admCourses => [
    'Plan de negocios',
    'Legislación comercial y tributaria',
    'Análisis de costos',
    'Herramientas financieras',
    'Presupuesto empresarial',
    'Economía aplicada a los negocios',
    'Fundamentos de la innovación tecnológica',
    'Emprendimiento empresarial',
    'Procesos de la calidad empresarial',
    'Inteligencia artificial aplicada a los negocios',
    'Análisis financiero',
    'Administración de proyectos de inversión',
    'Control del plan operativo empresarial',
    'Técnicas de comercio exterior',
    'Innovación tecnológica aplicada',
    'Negociación y solución de conflictos',
    'Experiencias formativas en situaciones reales de trabajo (ESRT)',
  ];
}
