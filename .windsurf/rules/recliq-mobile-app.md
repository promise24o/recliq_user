---
trigger: always_on
description: Enforce Clean Architecture with MobX and Freezed for all feature-related code in this Flutter project
---

You are working on a Flutter project that strictly follows Clean Architecture.

Every new feature MUST be created under lib/features/<feature_name>/ with this exact folder structure (feature name in lowercase_with_underscores):

lib/features/<feature_name>/
├── data/
│   ├── datasources/                  # Concrete data sources (API, secure storage, Firebase, etc.)
│   │   └── <feature>_datasource.dart
│   └── repositories/                 # Repository implementations
│       └── <feature>_repository_impl.dart
├── domain/
│   ├── entities/                     # Immutable business models using Freezed
│   │   ├── <entity>.dart
│   │   ├── <entity>.freezed.dart
│   │   └── <entity>.g.dart
│   ├── repositories/                 # Abstract repository interfaces
│   │   └── <feature>_repository.dart
│   └── usecases/                     # One use case per file, single responsibility
│       └── <use_case_name>.dart
└── presentation/
    ├── mobx/                         # MobX state management stores
    │   ├── <feature>_store.dart
    │   └── <feature>_store.g.dart
    └── pages/                        # Full screens / routes
        └── <page_name>_page.dart

Strict rules you MUST always follow:

1. Feature folders use lowercase_with_underscores only (e.g., auth, user_profile, wallet).

2. Domain layer is pure Dart: no Flutter, no external packages, no dependencies on data or presentation layers.

3. All entities MUST use Freezed for immutability (generate .freezed.dart and .g.dart files).

4. State management in presentation layer uses MobX exclusively — create corresponding store in presentation/mobx/ with generated .g.dart.

5. Repository interfaces belong in domain/repositories/, implementations in data/repositories/.

6. Data sources (remote/local) belong in data/datasources/.

7. All pages/screens go in presentation/pages/ and are named <name>_page.dart.

8. Dependency rule: presentation → domain → data only. Never reverse dependencies.

9. When generating, refactoring, or adding code to any feature, always respect this exact structure, naming conventions, and layer responsibilities.

This architecture ensures separation of concerns, high testability, and adherence to SOLID principles across the entire codebase.