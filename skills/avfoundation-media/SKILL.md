---
name: avfoundation-media
description: Use this skill for AVFoundation, AVAudioSession, audio playback, recording, text-to-speech, speech recognition, media interruptions, route changes, background audio, and iOS audio lifecycle management.
---

# AVFoundation and Media Skill

Audio behavior must be centralized and predictable.

## AVAudioSession Rules

Centralize audio session ownership.

Handle:

- Category
- Mode
- Options
- Activation/deactivation
- Interruptions
- Route changes
- Background behavior
- Bluetooth/headphones
- Mixing/ducking policy

Avoid:

- Random session configuration across features
- Multiple independent audio managers
- Reconfiguring audio session during interruption unless necessary

## Playback

Playback code should handle:

- Start
- Pause
- Resume
- Stop
- Interruption
- Route changes
- Remote controls if applicable
- Background policy if applicable

## Recording

Recording requires:

- Microphone permission
- Proper session category
- Route handling
- Cleanup on cancellation
- File lifecycle management

## Text-to-Speech

TTS rules:

- Use `AVSpeechSynthesizer`
- Avoid duplicate rapid utterances
- Handle pause/resume/stop
- Provide fallback voices
- Avoid simulator-specific assumptions
- Publish UI state on MainActor

## Speech Recognition

Speech recognition rules:

- Request speech permission
- Request microphone permission
- Use a clear session lifecycle
- Remove audio taps
- Cancel recognition tasks
- End audio requests
- Prevent zombie callbacks using session IDs

## Interruption Handling

On interruption began:

- Pause active playback/recording
- Mark interrupted state
- Avoid immediate restart

On interruption ended:

- Check options
- Resume only when appropriate
- Reconfigure session safely

## Testing

Test:

- Incoming call interruption
- Headphone unplug
- Bluetooth route switch
- Background/foreground transition
- Permission denied
- Simulator vs device behavior
