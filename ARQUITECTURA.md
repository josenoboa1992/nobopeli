nobopeli/
│
├── 📱 lib/                              # Código fuente principal de la aplicación
│   │
│   ├── main.dart                        # Punto de entrada de la app
│   │                                    # ✓ Configura Riverpod, Router y Theme
│   │
│   ├── 🎛️ config/                       # CONFIGURACIÓN GLOBAL
│   │   │                                # ¿Por qué? Centraliza toda la configuración
│   │   │                                # que NO es lógica de negocio
│   │   │
│   │   ├── constants/                   # Constantes de la aplicación
│   │   │   └── environment.dart         # ✓ API Keys, URLs base, secrets
│   │   │                                # ✓ Variables de entorno (.env)
│   │   │
│   │   ├── router/                      # Configuración de navegación
│   │   │   └── app_router.dart          # ✓ Rutas con GoRouter
│   │   │                                # ✓ Navegación declarativa
│   │   │
│   │   └── theme/                       # Tema visual de la app
│   │       └── app_theme.dart           # ✓ Colores, tipografía, estilos
│   │                                    # ✓ Dark/Light mode
│   │
│   ├── 🧠 domain/                       # LÓGICA DE NEGOCIO PURA
│   │   │                                # ¿Por qué? Capa independiente de frameworks
│   │   │                                # Sin dependencias externas (Flutter, Dio, etc)
│   │   │
│   │   ├── entities/                    # Modelos de negocio puros
│   │   │   └── movie.dart               # ✓ Clase Movie limpia
│   │   │                                # ✓ Representa el concepto de negocio
│   │   │                                # ✓ Sin fromJson, sin dependencias
│   │   │
│   │   ├── repositories/                # Contratos (interfaces abstractas)
│   │   │   └── movie_repository.dart    # ✓ Define QUÉ se puede hacer
│   │   │                                # ✓ No define CÓMO se hace
│   │   │                                # ✓ abstract class MovieRepository
│   │   │
│   │   └── datasources/                 # Contratos de fuentes de datos
│   │       └── movie_datasource.dart    # ✓ Define la interfaz para obtener datos
│   │                                    # ✓ Puede ser API, DB local, Firebase, etc.
│   │
│   ├── 🏗️ infrstructure/                # IMPLEMENTACIÓN TÉCNICA
│   │   │                                # ¿Por qué? Detalles de implementación
│   │   │                                # separados de la lógica de negocio
│   │   │
│   │   ├── datasource/                  # Implementaciones de datasources
│   │   │   └── moviedb_datasource.dart  # ✓ Implementa MovieDatasource
│   │   │                                # ✓ Usa Dio para llamadas HTTP
│   │   │                                # ✓ Conecta con TheMovieDB API
│   │   │
│   │   ├── repositories/                # Implementaciones de repositories
│   │   │   └── movie_repository_imple.dart # ✓ Implementa MovieRepository
│   │   │                                # ✓ Delega al datasource
│   │   │                                # ✓ Capa intermedia (puede agregar caché)
│   │   │
│   │   ├── mappers/                     # Conversores DTO ↔ Entity
│   │   │   └── movie_mapper.dart        # ✓ Convierte MovieDB → Movie
│   │   │                                # ✓ Limpia datos de la API
│   │   │                                # ✓ Adapta formatos externos
│   │   │
│   │   └── models/                      # DTOs (Data Transfer Objects)
│   │       └── moviesdb/                # Organizado por fuente de datos
│   │           ├── moviedb_response.dart # ✓ Modelo de respuesta de API
│   │           └── movie_moviedb.dart    # ✓ Modelo específico de TheMovieDB
│   │                                    # ✓ Con fromJson/toJson
│   │
│   └── 🎨 presentation/                 # CAPA DE PRESENTACIÓN (UI)
│       │                                # ¿Por qué? Todo lo relacionado con UI
│       │                                # y gestión de estado visual
│       │
│       ├── providers/                   # Estado global (Riverpod)
│       │   ├── providers.dart           # ✓ Exporta todos los providers
│       │   └── movies/                  # Providers organizados por feature
│       │       ├── movies_providers.dart          # ✓ Provider de películas
│       │       ├── movies_repository_provider.dart # ✓ Inyección del repository
│       │       └── movies_slide_show_provider.dart # ✓ Estado del slideshow
│       │
│       ├── screen/                      # Pantallas completas
│       │   ├── screen.dart              # ✓ Exporta todas las screens
│       │   └── movies/                  # Screens organizadas por feature
│       │       └── home_screen.dart     # ✓ Pantalla principal de películas
│       │
│       └── widgets/                     # Componentes reutilizables
│           ├── widgets.dart             # ✓ Exporta todos los widgets
│           │
│           ├── shared/                  # Widgets compartidos en toda la app
│           │   ├── custom_appBar.dart              # ✓ AppBar personalizado
│           │   └── custom_bottom_navegation_bar.dart # ✓ BottomNav global
│           │
│           └── movies/                  # Widgets específicos de películas
│               └── movies_slide_show.dart # ✓ Carrusel de películas
│
│
├── 📦 android/                          # Configuración Android nativa
├── 📦 ios/                              # Configuración iOS nativa
├── 📦 web/                              # Configuración Web
├── 📦 windows/                          # Configuración Windows
├── 📦 linux/                            # Configuración Linux
├── 📦 macos/                            # Configuración macOS
│
├── 🔧 pubspec.yaml                      # Dependencias del proyecto
├── 🔧 analysis_options.yaml             # Reglas de análisis estático
└── 📝 README.md                         # Documentación del proyecto



┌─────────────────────────────────────────────────────────┐
│  PRESENTATION  → Lo que el usuario VE e INTERACTÚA      │
│  (screens, widgets, providers)                           │
└───────────────────────┬─────────────────────────────────┘
                        │ Depende de ↓
┌───────────────────────▼─────────────────────────────────┐
│  DOMAIN  → REGLAS DE NEGOCIO (sin dependencias)         │
│  (entities, repositories abstractos, datasources)        │
└───────────────────────┬─────────────────────────────────┘
                        │ Implementado por ↓
┌───────────────────────▼─────────────────────────────────┐
│  INFRASTRUCTURE  → DETALLES TÉCNICOS                     │
│  (APIs, mappers, modelos, implementaciones)              │
└──────────────────────────────────────────────────────────┘

lib/
├── domain/
│   ├── entities/
│   │   ├── movie.dart
│   │   └── series.dart                    ← NUEVO
│   ├── repositories/
│   │   ├── movie_repository.dart
│   │   └── series_repository.dart         ← NUEVO
│   └── datasources/
│       ├── movie_datasource.dart
│       └── series_datasource.dart         ← NUEVO
│
├── infrastructure/
│   ├── datasource/
│   │   ├── moviedb_datasource.dart
│   │   └── seriesdb_datasource.dart       ← NUEVO
│   ├── repositories/
│   │   ├── movie_repository_imple.dart
│   │   └── series_repository_imple.dart   ← NUEVO
│   └── mappers/
│       ├── movie_mapper.dart
│       └── series_mapper.dart             ← NUEVO
│
└── presentation/
    ├── providers/
    │   ├── movies/
    │   └── series/                        ← NUEVO
    ├── screen/
    │   ├── movies/
    │   └── series/                        ← NUEVO
    └── widgets/
        ├── movies/
        └── series/                        ← NUEVO