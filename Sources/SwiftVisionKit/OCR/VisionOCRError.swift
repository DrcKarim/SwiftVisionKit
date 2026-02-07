//
//  VisionOCRError.swift
//  SwiftVisionKit
//
//  Created by Karim Bouchaane on 07/02/2026.
//

public enum VisionOCRError: Error {
    case invalidImage
    case noTextFound
    case visionError(Error)
}
