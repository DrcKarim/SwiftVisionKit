//
//  VisionObjectDetection.swift
//  SwiftVisionKit
//
//  Created by Karim Bouchaane on 07/02/2026.
//
import Vision

public enum VisionAnimalDetection {

    public static func detectAnimals(from cgImage: CGImage) async throws -> [DetectedAnimal] {

        try await withCheckedThrowingContinuation { continuation in
            var resumed = false
            
            let request = VNRecognizeAnimalsRequest { request, error in
                guard !resumed else { return }
                resumed = true
                
                if let error = error {
                    continuation.resume(
                        throwing: VisionAnimalDetectionError.visionError(error)
                    )
                    return
                }

                let observations = request.results as? [VNRecognizedObjectObservation] ?? []

                let animals = observations.compactMap { observation -> DetectedAnimal? in
                    guard let label = observation.labels.first else { return nil }
                    return DetectedAnimal(
                        label: label.identifier,
                        confidence: label.confidence,
                        boundingBox: observation.boundingBox
                    )
                }

                continuation.resume(returning: animals)
            }

            let handler = VNImageRequestHandler(cgImage: cgImage)

            do {
                try handler.perform([request])
            } catch {
                guard !resumed else { return }
                resumed = true
                continuation.resume(
                    throwing: VisionAnimalDetectionError.visionError(error)
                )
            }
        }
    }
}

