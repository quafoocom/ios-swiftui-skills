---
name: ios-persistence-sync
description: Use this skill for iOS persistence, SQLite, SwiftData, UserDefaults, Keychain, FileManager storage, iCloud sync, backup/restore, migrations, offline-first data design, and conflict-safe synchronization.
---

# iOS Persistence and Sync Skill

Choose storage based on data semantics.

## Storage Selection

Use:

- UserDefaults: small preferences and feature flags
- Keychain: credentials, tokens, secrets
- SQLite: structured relational data
- SwiftData: object graph data when OS target allows
- FileManager: documents, cache files, downloaded assets
- App Groups container: data shared with widgets/extensions

Avoid:

- Secrets in UserDefaults
- Large datasets in UserDefaults
- Unstructured JSON blobs for relational data
- Database access directly from Views

## Repository Pattern

Repositories expose domain-level APIs:

```swift
protocol ItemRepositoryProtocol {
    func fetchItems() async throws -> [Item]
    func saveItems(_ items: [Item]) async throws
}
```

The ViewModel should not know whether data came from SQLite, SwiftData, network, or files.

## SQLite Rules

Use:

- Schema versioning
- Explicit migrations
- Transactions for batch writes
- Background queues/actors for DB work
- Stable primary keys
- Indexes for frequent queries

Avoid:

- Main-thread DB operations
- Destructive migrations without backup
- Implicit schema changes

## Backup and Restore

Safe restore process:

1. Download/copy incoming archive or database to temp directory
2. Validate file existence and integrity
3. Validate schema/application version
4. Open database read-only if possible
5. Compare incoming metadata with local metadata
6. Ask before destructive overwrite unless explicitly automated
7. Backup current local data before replacing
8. Replace atomically
9. Reopen database and verify
10. Report progress and support cancellation

## iCloud Sync

Design for:

- iCloud unavailable
- Partial download
- Partial upload
- Conflict resolution
- Duplicate events
- Out-of-order updates
- Offline editing
- Multiple devices

Use stable IDs and idempotent operations.

## Event Log Sync

For conflict-prone data, prefer append-only events:

```text
event_id
entity_id
event_type
payload
device_id
created_at
logical_clock
schema_version
```

Rules:

- Events must be idempotent
- Processing must track last applied state
- Batch events to avoid file explosion
- Validate event schema before applying
- Never assume remote ordering is perfect

## Conflict Handling

Prefer deterministic merge rules:

- Last-write-wins only for simple fields
- Per-field merge when practical
- Tombstones for deletes
- Stable conflict records for manual resolution when needed

## Testing

Test:

- Migration from old versions
- Corrupt database handling
- Missing iCloud container
- Partial restore
- Cancellation
- Duplicate sync events
- Multi-device conflict scenarios
