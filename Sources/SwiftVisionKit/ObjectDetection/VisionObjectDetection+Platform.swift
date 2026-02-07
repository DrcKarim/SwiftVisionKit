//
//  VisionObjectDetection+Platform.swift
//  SwiftVisionKit
//
//  Created by Karim Bouchaane on 07/02/2026.
//

import Foundation

#if canImport(UIKit)
import UIKit

public extension VisionObjectDetection {

    static func detectObjects(from image: UIImage) async throws -> [DetectedObject] {
        guard let cgImage = image.cgImage else {
            throw VisionObjectDetectionError.invalidImage
        }
        return try await detectObjects(from: cgImage)
    }
}
#endif

#if canImport(AppKit)
import AppKit

public extension VisionObjectDetection {

    static func detectObjects(from image: NSImage) async throws -> [DetectedObject] {
        guard let cgImage = image.cgImage(
            forProposedRect: nil,
            context: nil,
            hints: nil
        ) else {
            throw VisionObjectDetectionError.invalidImage
        }
        return try await detectObjects(from: cgImage)
    }
}
#endif
