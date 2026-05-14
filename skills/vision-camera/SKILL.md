---
name: vision-camera
description: Use this skill for iOS camera capture, AVFoundation camera pipelines, Vision framework, body pose, hand pose, optical flow, image analysis, real-time signal processing, frame throttling, and camera-based UI features.
---

# Vision and Camera Skill

Separate capture, analysis, signal processing, and UI.

## Architecture

Preferred pipeline:

```text
CameraCaptureService
→ FrameProcessor
→ VisionAnalyzer
→ SignalProcessor
→ ViewModel
→ SwiftUI View
```

## Camera Rules

Camera code should:

- Request permission
- Configure capture session off main thread
- Deliver frames efficiently
- Control frame rate when needed
- Handle orientation
- Handle lifecycle start/stop
- Avoid retaining sample buffers longer than necessary

## Vision Rules

Vision analysis should:

- Run off main thread
- Normalize coordinates
- Preserve confidence values
- Reject low-confidence observations
- Handle missing detections
- Avoid blocking frame delivery

## Real-Time Processing

For real-time features:

- Throttle if analysis is expensive
- Drop frames if processing falls behind
- Prefer latest-frame processing over queue buildup
- Keep UI updates limited and meaningful

## Signal Processing

Use careful filtering:

- Smooth noise without destroying meaningful peaks
- Track timestamps
- Use confidence-aware filtering
- Use finite state machines for event detection when appropriate
- Avoid overfitting thresholds to one device or lighting condition

## Coordinate Handling

Always document coordinate spaces:

- Vision normalized coordinates
- Camera buffer coordinates
- Preview layer coordinates
- SwiftUI view coordinates

Handle mirroring and orientation explicitly.

## Performance Checklist

Check:

- CPU usage
- Memory pressure
- Thermal state
- Frame drops
- Main thread usage
- Battery impact

## Testing

Test:

- Poor lighting
- Partial body visibility
- Fast motion
- Camera shake
- Different device orientations
- Different camera resolutions
- Low-confidence frames
