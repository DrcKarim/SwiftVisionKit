# SwiftVisionKit

SwiftVisionKit is a lightweight, Apple-native Swift package that provides clean, async/await wrappers around Apple Vision for common on-device AI tasks on iOS and macOS.

The goal of the library is to simplify Vision APIs while keeping everything:

- Apple-native
- Privacy-friendly (on-device)
- Easy to integrate
- Easy to extend

## Features

 **Optical Character Recognition (OCR)**
- Extract text from images
- Async/await API
- Language correction support

 **Animal Detection (Apple Vision)**
- Detect animals (cats, dogs, etc.)
- Based on `VNRecognizeAnimalsRequest`
- Returns labels, confidence, and bounding boxes

 **Note:** Apple Vision does not provide generic object detection. This feature is limited to animals.

 **Face Detection**
- Detect faces in images
- Bounding boxes only (no landmarks yet)
- Fast and on-device

## Requirements

- iOS 15+
- macOS 12+
- Swift 5.7+
- Xcode 14+

## Installation

### Swift Package Manager

Add SwiftVisionKit using Xcode:

1. **File → Add Packages**
2. Enter the repository URL:
   ```
   https://github.com/DrcKarim/SwiftVisionKit
   ```
3. Add the package to your target

## Usage

Import the library:

```swift
import SwiftVisionKit
```

### OCR Example

```swift
let text = try await VisionOCR.recognizeText(from: image)
print(text)
```

Supported inputs:
- `UIImage`
- `NSImage`
- `CGImage`

### Animal Detection Example

Detect animals using Apple Vision:

```swift
let animals = try await VisionAnimalDetection.detectAnimals(from: image)

for animal in animals {
    print(animal.label, animal.confidence)
}
```

Returned data:
- `label` (e.g. "cat", "dog")
- `confidence`
- `boundingBox`

**Note:** This feature uses Apple Vision animal recognition.  
Generic object detection will be added later using CoreML.

### Face Detection Example

```swift
let faces = try await VisionFaceDetection.detectFaces(from: image)

for face in faces {
    print(face.boundingBox)
}
```

## Supported Platforms

| Platform | Supported |
|----------|-----------|
| iOS      | Yes       |
| macOS    | Yes       |
| watchOS  | No        |
| tvOS     | No        |

## Architecture

SwiftVisionKit follows a clear internal structure:

```
SwiftVisionKit/
├── OCR/
├── AnimalDetection/
├── FaceDetection/
```

Each feature is isolated, making the library easy to maintain and extend.

## Roadmap

- Generic object detection using CoreML
- Face landmarks
- Confidence scores for OCR
- Batch image processing
- PDF text extraction

## Contributing

Contributions are welcome.

You can:
- Open issues for bugs or feature requests
- Submit pull requests with improvements
- Suggest new Vision-based features

Please keep changes focused and consistent with the existing API style.

## License

MIT License  
Copyright (c) 2026 Karim Bouchaane
