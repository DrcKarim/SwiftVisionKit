//
//  VisionObjectDetectionError.swift
//  SwiftVisionKit
//
//  Created by Karim Bouchaane on 07/02/2026.
//

public enum VisionObjectDetectionError: Error {
    case invalidImage
    case noObjectsFound
    case visionError(Error)
}
