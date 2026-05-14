---
name: widgetkit-activitykit
description: Use this skill for WidgetKit, widgets, App Intents, App Groups, TimelineProvider, AppIntentTimelineProvider, ActivityKit, Live Activities, Dynamic Island, lock screen UI, and extension data sharing in iOS apps.
---

# WidgetKit and ActivityKit Skill

Widgets and Live Activities must be lightweight, reliable, and extension-safe.

## WidgetKit Rules

Widgets should:

- Use App Groups for shared data
- Avoid heavy computation in timeline generation
- Avoid unnecessary network requests
- Precompute data in the main app when practical
- Use compact models
- Respect refresh limits
- Handle missing data gracefully

## Data Sharing

Use App Groups:

```text
group.com.example.app
```

Store widget-readable data in:

- Shared UserDefaults for tiny data
- Shared files for structured snapshots
- Shared database only when carefully managed

Avoid letting the widget perform heavy database work.

## Timeline Design

Timeline entries should be:

- Small
- Codable-friendly
- Render-ready
- Independent of large app services

## App Intents

Use App Intents for configurable widgets or interactive actions when supported.

Keep intent actions fast and safe.

## ActivityKit Rules

Live Activities should:

- Use compact state
- Avoid excessive updates
- Update only when visible value changes
- Separate lock screen and Dynamic Island layouts
- Handle activity end states

## Dynamic Island

Design separately for:

- Compact leading
- Compact trailing
- Minimal
- Expanded regions

Avoid cramming dense text into compact regions.

## Capability Checklist

Check:

- App Groups
- Widget extension target
- Live Activities capability if needed
- Correct bundle identifiers
- Shared container access
- Info.plist configuration

## Testing

Test:

- Cold widget render
- Missing shared data
- App not launched recently
- Different widget sizes
- Lock screen appearance
- Dynamic Island states
- Activity update frequency
