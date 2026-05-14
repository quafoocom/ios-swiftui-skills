---
name: ios-networking
description: Use this skill for iOS networking, API client design, URLSession, Alamofire integration, Codable models, request authentication, retries, cancellation, error handling, and backend API consumption in Swift apps.
---

# iOS Networking Skill

Design networking as a replaceable infrastructure layer.

## Layering

```text
View
→ ViewModel
→ Repository
→ API Client
→ URLSession / Alamofire
```

Views must never call network APIs directly.

## API Client Requirements

An API client should:

- Build requests
- Attach common headers
- Validate response status
- Decode response bodies
- Map errors into domain-friendly errors
- Respect cancellation
- Avoid leaking transport details upward

## Error Model

Use typed errors:

```swift
enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case httpStatus(Int, Data?)
    case decoding(Error)
    case network(Error)
    case unauthorized
    case cancelled

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .invalidResponse:
            return "Invalid response."
        case .httpStatus(let code, _):
            return "Request failed with status code \(code)."
        case .decoding(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        case .network(let error):
            return error.localizedDescription
        case .unauthorized:
            return "Unauthorized."
        case .cancelled:
            return "Request was cancelled."
        }
    }
}
```

## Codable Rules

- Keep DTOs separate from domain models when API shape differs from app shape.
- Use explicit CodingKeys when needed.
- Handle date decoding deliberately.
- Avoid force decoding assumptions.

## Authentication

Requirements:

- Do not hardcode secrets
- Store tokens in Keychain
- Centralize auth header injection
- Handle 401/403 explicitly
- Avoid logging tokens or PII

## Retry Policy

Retry only when safe:

- Transient network failure
- 5xx status
- Timeout

Avoid retrying:

- Non-idempotent requests without idempotency keys
- 4xx validation errors
- Authentication failures without token refresh logic

## Alamofire

If the project uses Alamofire:

- Keep Alamofire inside infrastructure code
- Do not expose Alamofire types to Views/ViewModels
- Convert Alamofire errors into app-level errors
- Keep request interceptors centralized

## Testing

Test:

- URL construction
- Header injection
- Status handling
- Decoding
- Error mapping
- Cancellation
