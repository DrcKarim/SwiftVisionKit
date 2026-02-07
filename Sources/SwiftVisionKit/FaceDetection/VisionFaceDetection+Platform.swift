//
//  VisionFaceDetection+Platform.swift
//  SwiftVisionKit
//
//  Created by Karim Bouchaane on 07/02/2026.
//

import Foundation

#if canImport(UIKit)
import UIKit

public extension VisionFaceDetection {

    static func detectFaces(from image: UIImage) async throws -> [DetectedFace] {
        guard let cgImage = image.cgImage else {
            throw VisionFaceDetectionError.invalidImage
        }
        return try await detectFaces(from: cgImage)
    }
}
#endif

#if canImport(AppKit)
import AppKit

public extension VisionFaceDetection {

    static func detectFaces(from image: NSImage) async throws -> [DetectedFace] {
        guard let cgImage = image.cgImage(
            forProposedRect: nil,
            context: nil,
            hints: nil
        ) else {
            throw VisionFaceDetectionError.invalidImage
        }
        return try await detectFaces(from: cgImage)
    }
}
#endif
