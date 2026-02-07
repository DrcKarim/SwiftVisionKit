//
//  VisionObjectDetection+Platform.swift
//  SwiftVisionKit
//
//  Created by Karim Bouchaane on 07/02/2026.
//

import Foundation

#if canImport(UIKit)
import UIKit

public extension VisionAnimalDetection {

    static func detectAnimals(
        from image: UIImage
    ) async throws -> [DetectedAnimal] {
        guard let cgImage = image.cgImage else {
            throw VisionAnimalDetectionError.invalidImage
        }
        return try await detectAnimals(from: cgImage)
    }
}
#endif

#if canImport(AppKit)
import AppKit

public extension VisionAnimalDetection {

    static func detectAnimals(
        from image: NSImage
    ) async throws -> [DetectedAnimal] {
        guard let cgImage = image.cgImage(
            forProposedRect: nil,
            context: nil,
            hints: nil
        ) else {
            throw VisionAnimalDetectionError.invalidImage
        }
        return try await detectAnimals(from: cgImage)
    }
}
#endif
