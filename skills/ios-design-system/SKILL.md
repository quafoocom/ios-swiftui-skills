---
name: ios-design-system
description: Use this skill for SwiftUI design systems, reusable UI components, semantic colors, typography, spacing, dark mode, accessibility-aware styling, reusable modifiers, theming, and polished iOS visual implementation.
---

# iOS Design System Skill

Build consistent, reusable, accessible SwiftUI design systems.

## Recommended Structure

```text
Core/DesignSystem/
├── Colors/
│   └── AppColor.swift
├── Typography/
│   └── AppFont.swift
├── Layout/
│   ├── AppSpacing.swift
│   └── AppRadius.swift
├── Effects/
│   ├── AppShadow.swift
│   └── AppAnimation.swift
├── Components/
└── Theme/
```

## Principles

Use:

- Semantic colors
- Reusable typography tokens
- Consistent spacing
- Consistent corner radius
- Reusable components
- Accessibility-aware contrast
- Light and dark mode support

Avoid:

- Random hardcoded colors
- Inconsistent spacing
- One-off button styles
- Text styles scattered across views
- Color-only meaning

## Semantic Tokens

Prefer semantic names:

```swift
enum AppColor {
    static let background = Color("Background")
    static let surface = Color("Surface")
    static let primaryText = Color("PrimaryText")
    static let secondaryText = Color("SecondaryText")
    static let accent = Color("Accent")
}
```

## Component Design

Reusable components should:

- Accept content/configuration
- Avoid hidden global state
- Support accessibility
- Support light/dark mode
- Avoid fixed sizes unless intentional

## Motion

Animations should:

- Communicate state
- Avoid distraction
- Respect Reduce Motion when important
- Avoid excessive simultaneous effects

## Accessibility

Check:

- Dynamic Type support
- VoiceOver labels
- Contrast
- Hit targets
- Reduce Motion
- Large Content Viewer if useful
