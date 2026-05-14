---
name: appstore-release
description: Use this skill for App Store readiness, iOS release checklist, privacy labels, Info.plist usage descriptions, App Tracking Transparency, app metadata, subscriptions metadata, localization readiness, screenshots, and review risk reduction.
---

# App Store Release Skill

Prepare iOS apps for App Store submission and review.

## Release Checklist

Verify:

- App builds in Release configuration
- No debug-only UI remains
- No sensitive logs remain
- Crash reporting is configured if used
- Permissions have clear usage descriptions
- Privacy labels match actual SDK behavior
- App metadata matches real functionality
- Screenshots reflect current app
- Restore purchases exists if required
- Subscriptions and IAP metadata are complete if used
- Offline/error states are handled
- First launch and upgrade flows work

## Privacy

Check:

- Camera usage
- Microphone usage
- Speech recognition
- Photo library
- Location
- Bluetooth
- Contacts
- Tracking
- Third-party SDK data collection

Do not include unused permission descriptions.

Do not declare tracking unless the app or SDK actually tracks according to Apple's definitions.

## Info.plist

Every protected resource needs a clear usage string.

Usage descriptions should be:

- Honest
- Specific
- User understandable
- Not overly broad

## IAP Review Readiness

For in-app purchases:

- Products configured
- Prices set
- Review screenshots uploaded if needed
- Subscription group configured if needed
- Restore purchases available
- Terms and privacy links available
- Paywall copy accurate
- Entitlement behavior testable

## Localization

Check:

- App name
- Subtitle
- Keywords
- Description
- Screenshots
- In-app strings
- Permission strings
- IAP product names/descriptions

Avoid fixed-width UI that breaks in translation.

## Review Risk Reduction

Avoid:

- Misleading feature claims
- Hidden paid functionality
- Broken restore purchase flow
- Dead buttons
- Crashes on permission denial
- Placeholder content
- Private APIs
- Undocumented background behavior

## Final Verification

Before submission:

1. Clean install test
2. Upgrade test
3. Offline test
4. Permission denied test
5. Purchase/restore test if relevant
6. Localization smoke test
7. Device-only behavior test
8. App Store metadata review
