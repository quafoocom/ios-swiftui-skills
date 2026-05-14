---
name: ios-testing-performance
description: Use this skill for iOS unit testing, ViewModel tests, repository tests, XCTest, mocking, dependency injection, performance profiling, SwiftUI performance, memory usage, Instruments, and production hardening.
---

# iOS Testing and Performance Skill

Production iOS code should be testable and measurable.

## Testing Priorities

Prioritize tests for:

- ViewModel state transitions
- Repository behavior
- API decoding
- Error mapping
- Persistence migrations
- Sync conflict handling
- Purchase entitlement interpretation
- Signal-processing algorithms
- Critical business rules

## Testable Design

Use protocols:

```swift
protocol ClockProtocol {
    func now() -> Date
}
```

Inject dependencies:

- Repositories
- API clients
- Database clients
- Clocks
- UUID generators
- File systems where useful

Avoid hardcoded globals in testable logic.

## ViewModel Testing

Test:

- Initial state
- Loading state
- Success state
- Failure state
- Cancellation behavior
- Retry behavior

## Async Tests

Use XCTest async support:

```swift
func testLoadSuccess() async throws {
    let repository = MockRepository(result: .success([Item(id: 1)]))
    let viewModel = await ExampleViewModel(repository: repository)

    await viewModel.load()

    // Assert final state.
}
```

## Performance Rules

Avoid:

- Heavy work in SwiftUI body
- Unstable list IDs
- Excessive ObservableObject invalidation
- Synchronous image decoding on main thread
- Database work on main thread
- Unbounded in-memory caches

Use:

- Lazy containers
- Pagination
- Caching
- Background work
- Throttling
- Stable identity

## Instruments

Use Instruments for:

- Time Profiler
- Allocations
- Leaks
- Main Thread Checker
- SwiftUI rendering issues
- Energy usage

## Release Hardening

Before release:

- Remove debug-only logs
- Check crash-prone force unwraps
- Verify offline behavior
- Verify memory warnings
- Verify background transitions
- Verify first launch and upgrade paths
