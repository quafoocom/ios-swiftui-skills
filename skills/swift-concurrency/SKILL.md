---
name: swift-concurrency
description: Use this skill for Swift async/await, Task cancellation, MainActor isolation, structured concurrency, task lifecycle bugs, actor design, Combine-to-async migration, and concurrency safety in iOS apps.
---

# Swift Concurrency Skill

Use modern Swift concurrency safely and predictably.

## Core Rules

Prefer:

- Structured concurrency
- `async` / `await`
- MainActor isolation for UI state
- Explicit cancellation
- Actors for shared mutable state
- AsyncSequence for streams when appropriate

Avoid:

- Unnecessary `Task.detached`
- Fire-and-forget tasks without lifecycle ownership
- Updating UI state off MainActor
- Blocking calls inside async functions
- Ignoring cancellation

## ViewModel Pattern

```swift
@MainActor
final class ExampleViewModel: ObservableObject {
    @Published private(set) var state: ViewState<[Item]> = .idle

    private let repository: ItemRepositoryProtocol
    private var loadTask: Task<Void, Never>?

    init(repository: ItemRepositoryProtocol) {
        self.repository = repository
    }

    func startLoading() {
        loadTask?.cancel()
        loadTask = Task {
            await load()
        }
    }

    func cancelLoading() {
        loadTask?.cancel()
        loadTask = nil
    }

    private func load() async {
        state = .loading

        do {
            let items = try await repository.fetchItems()
            try Task.checkCancellation()
            state = .loaded(items)
        } catch is CancellationError {
            // Usually do not show an error for user-initiated cancellation.
        } catch {
            state = .failed(error.localizedDescription)
        }
    }
}
```

## Cancellation

Long-running tasks must check cancellation:

```swift
try Task.checkCancellation()
```

Loops should either:

- Use cancellable async APIs
- Check cancellation explicitly
- Exit promptly when cancelled

## MainActor

Use `@MainActor` for:

- ViewModels that publish UI state
- UI-facing observable services
- Methods that mutate UI-bound state

Avoid using MainActor for:

- Database work
- File I/O
- Image decoding
- Heavy computation
- Network decoding

## Actors

Use actors to protect shared mutable state:

```swift
actor CacheStore<Key: Hashable, Value> {
    private var storage: [Key: Value] = [:]

    func value(for key: Key) -> Value? {
        storage[key]
    }

    func set(_ value: Value, for key: Key) {
        storage[key] = value
    }
}
```

## TaskGroup

Use `withThrowingTaskGroup` for independent parallel work.

Avoid parallelism when order, rate limits, or resource contention matter.

## Debug Checklist

When fixing concurrency bugs, inspect:

- Which actor owns the state?
- Can the task outlive the View/ViewModel?
- Is cancellation handled?
- Are there races on shared mutable state?
- Are UI mutations on MainActor?
- Are expensive operations accidentally on MainActor?
