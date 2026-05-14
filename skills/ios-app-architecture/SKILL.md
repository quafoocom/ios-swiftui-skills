---
name: ios-app-architecture
description: Use this skill for iOS app architecture, module structure, MVVM, feature-based organization, dependency injection, repository/service layering, large SwiftUI project refactoring, and maintainability reviews. Do not use for one-off UI styling tasks.
---

# iOS App Architecture Skill

Use feature-first architecture with clear boundaries.

## Recommended Structure

```text
App/
├── Core/
│   ├── Networking/
│   ├── Persistence/
│   ├── Logging/
│   ├── Theme/
│   ├── Extensions/
│   ├── Utilities/
│   └── DependencyInjection/
├── Features/
│   └── FeatureName/
│       ├── Models/
│       ├── Views/
│       ├── ViewModels/
│       ├── Services/
│       ├── Repositories/
│       ├── Components/
│       └── Supporting/
├── Shared/
│   ├── Models/
│   ├── Components/
│   └── Resources/
└── Resources/
```

## Layering

Preferred flow:

```text
View
→ ViewModel
→ Repository
→ Service / API Client / Database
→ External system
```

## Responsibilities

### View

- Renders state
- Captures user interaction
- Owns local UI-only state

### ViewModel

- Coordinates UI state
- Calls repositories/services
- Handles screen-level business flow
- Usually `@MainActor`

### Repository

- Provides domain-level data APIs
- Hides storage/network details
- Handles caching policy when appropriate

### Service

- Performs specialized work
- Encapsulates framework APIs
- Converts low-level behavior into app-friendly operations

## Dependency Injection

Prefer protocol-based injection for testable boundaries.

```swift
protocol ItemRepositoryProtocol {
    func fetchItems() async throws -> [Item]
}
```

Avoid uncontrolled singletons. If singletons exist, wrap them behind protocols where possible.

## State Ownership

Rules:

- One owner per mutable state source
- Avoid duplicate sources of truth
- Do not spread navigation state across unrelated objects
- Avoid global stores unless the app truly needs one

## Refactoring Guidance

When refactoring:

1. Identify current responsibilities
2. Extract business logic from Views
3. Define protocols at boundaries
4. Move persistence/networking out of ViewModels if too heavy
5. Add tests around behavior before major rewrites
6. Keep migration incremental

## Architecture Review Checklist

Check:

- Are feature boundaries clear?
- Are Views free of business logic?
- Are ViewModels testable?
- Are dependencies injected?
- Are persistence/network layers hidden?
- Is state ownership obvious?
- Are global dependencies justified?
- Can the feature be changed without touching unrelated modules?
