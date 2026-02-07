//
//  VisionObjectDetectionError.swift
//  SwiftVisionKit
//
//  Created by Karim Bouchaane on 07/02/2026.
//

public enum VisionAnimalDetectionError: Error {
    case invalidImage
    case noAnimalsFound
    case visionError(Error)
}

