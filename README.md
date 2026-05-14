# iOS SwiftUI Codex Skills

This package contains a modular set of Codex Skills for production-grade iOS SwiftUI development.

## Why modular skills?

Codex Skills work best when each skill is focused on one reusable job. Instead of putting all iOS rules into one large `SKILL.md`, this package splits iOS engineering guidance into focused skills:

- `ios-swiftui-core`
- `ios-app-architecture`
- `swift-concurrency`
- `ios-networking`
- `ios-persistence-sync`
- `storekit2-iap`
- `widgetkit-activitykit`
- `avfoundation-media`
- `vision-camera`
- `ios-testing-performance`
- `appstore-release`

## Install

Recommended global install:

```bash
mkdir -p ~/.codex/skills
cp -R ios-swiftui-skills/skills/* ~/.codex/skills/
```

Alternative project-level install:

```bash
mkdir -p .codex/skills
cp -R ios-swiftui-skills/skills/* .codex/skills/
```

## Usage examples

```text
Use the ios-swiftui-core skill to review this SwiftUI screen.
```

```text
Use the storekit2-iap skill to implement subscription entitlement handling.
```

```text
Use the ios-persistence-sync skill to design a SQLite migration and iCloud sync flow.
```

```text
Use the swift-concurrency skill to fix task cancellation and MainActor issues.
```

## Notes

- These skills are generic and contain no project-specific product information.
- Prefer project-level skills for team or repository-specific conventions.
- Keep `AGENTS.md` for repository build/test commands and local rules.
