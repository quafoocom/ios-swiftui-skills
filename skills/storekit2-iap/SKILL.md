---
name: storekit2-iap
description: Use this skill for StoreKit 2, in-app purchases, subscriptions, lifetime purchases, transaction handling, entitlement state, restore purchases, server validation, App Store Server API integration, and subscription edge cases in iOS apps.
---

# StoreKit 2 and IAP Skill

Use StoreKit 2 for purchase flows and entitlement observation.

## Core Requirements

Always handle:

- Product loading
- Purchase result states
- Transaction verification
- `Transaction.currentEntitlements`
- `Transaction.updates`
- Revocation/refunds
- Expiration
- Restore purchases
- Finishing transactions
- User-visible errors

## Local Entitlement Rules

Local StoreKit state is useful for UI, but server-protected functionality should use server-side validation.

Do not treat a transaction as active when:

- It is revoked
- It is expired
- Verification fails
- The product is not recognized
- The subscription group policy says another entitlement supersedes it

## Transaction Handling

Always finish handled transactions:

```swift
await transaction.finish()
```

Do not finish transactions before important entitlement handling is complete.

## Purchase Result Handling

Handle all cases:

- `.success`
- `.userCancelled`
- `.pending`
- unknown future cases

Use `@unknown default`.

## Subscription Considerations

Consider:

- Expiration
- Grace period
- Billing retry
- Refund
- Revocation
- Upgrade
- Downgrade
- Family sharing if applicable
- Intro offers
- Promotional offers

## Restore Purchases

Provide a restore entry point if the app sells non-consumables or subscriptions.

Use:

```swift
try await AppStore.sync()
```

Then refresh entitlement state.

## Server Validation

For protected server-side features:

- Send transaction JWS to backend
- Bind entitlements using stable Apple transaction identifiers
- Validate signed transaction data server-side
- Avoid trusting only client-sent product IDs
- Make upload idempotent
- Store environment separately for sandbox/production

## Client Architecture

Recommended files:

```text
Core/IAP/
├── IAPManager.swift
├── IAPProduct.swift
├── EntitlementState.swift
├── PurchaseError.swift
└── IAPServiceProtocol.swift
```

## Testing

Test with:

- StoreKit configuration files
- Sandbox testers
- Expired subscriptions
- Billing retry if relevant
- Refund/revocation behavior
- Restore purchases
- Network unavailable during validation
