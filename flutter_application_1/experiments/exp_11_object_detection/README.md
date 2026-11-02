# Experiment 11: Real-Time On-Device Object Detection Using Flutter and TensorFlow Lite

## Aim
To design, develop, and execute a cross-platform mobile application for real-time, on-device object detection using the Flutter framework integrated with a pre-trained TensorFlow Lite (TFLite) model.

## Model Details
- **Architecture**: SSD MobileNet V2 (Single Shot MultiBox Detector)
- **Input Dimensions**: $[1, 300, 300, 3]$ RGB tensor, normalized
- **Outputs**:
  - `0`: Bounding Box coordinates $[ymin, xmin, ymax, xmax]$
  - `1`: Class Indices (Person, Laptop, Cup, Backpack, etc.)
  - `2`: Confidence Scores $(0.0 \text{ to } 1.0)$
  - `3`: Detection Count

## Features
- **Live Stream Viewport**: Real-time object tracking with dynamic bounding box painter.
- **Confidence Threshold Filter**: Adjustable slider filtering out low-confidence detections ($> 50\%$).
- **Scene Toggle**: Multiple test scenes (Tech Workspace, Classroom).
- **Inference Metrics**: Live latency counter ($\sim 38\text{ ms}$).

## Files
- `lib/main.dart`: Complete interactive Flutter Object Detection application.
- `lib/tflite_service.dart`: Dart TFLite service implementation matching manual specifications.

## Result
The real-time on-device object detection mobile application using Flutter and TensorFlow Lite has been executed successfully.
