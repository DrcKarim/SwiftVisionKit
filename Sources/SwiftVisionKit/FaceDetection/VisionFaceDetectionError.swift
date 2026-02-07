//
//  VisionFaceDetectionError.swift
//  SwiftVisionKit
//
//  Created by Karim Bouchaane on 07/02/2026.
//

public enum VisionFaceDetectionError: Error {
    case invalidImage
    case noFacesFound
    case visionError(Error)
}
