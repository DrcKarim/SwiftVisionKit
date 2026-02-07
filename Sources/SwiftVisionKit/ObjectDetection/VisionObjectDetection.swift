//
//  VisionObjectDetection.swift
//  SwiftVisionKit
//
//  Created by Karim Bouchaane on 07/02/2026.
//

import Vision

public enum VisionObjectDetection {

    /// Detects objects in a CGImage using Apple Vision.
    public static func detectObjects(
        from cgImage: CGImage
    ) async throws -> [DetectedObject] {

        try await withCheckedThrowingContinuation { continuation in

            let request = VNRecognizeObjectsRequest { request, error in
                if let error = error {
                    continuation.resume(throwing: VisionObjectDetectionError.visionError(error))
                    return
                }

                let observations = request.results as? [VNRecognizedObjectObservation] ?? []

                if observations.isEmpty {
                    continuation.resume(throwing: VisionObjectDetectionError.noObjectsFound)
                    return
                }

                let objects: [DetectedObject] = observations.compactMap { observation in
                    guard let topLabel = observation.labels.first else {
                        return nil
                    }

                    return DetectedObject(
                        label: topLabel.identifier,
                        confidence: topLabel.confidence,
                        boundingBox: observation.boundingBox
                    )
                }

                continuation.resume(returning: objects)
            }

            let handler = VNImageRequestHandler(cgImage: cgImage)

            do {
                try handler.perform([request])
            } catch {
                continuation.resume(throwing: VisionObjectDetectionError.visionError(error))
            }
        }
    }
}
