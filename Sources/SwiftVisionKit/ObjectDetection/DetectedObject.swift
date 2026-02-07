//
//  ObjectDetection.swift
//  SwiftVisionKit
//
//  Created by Karim Bouchaane on 07/02/2026.
//

import CoreGraphics

public struct DetectedObject {
    public let label: String
    public let confidence: Float
    public let boundingBox: CGRect

    public init(label: String, confidence: Float, boundingBox: CGRect) {
        self.label = label
        self.confidence = confidence
        self.boundingBox = boundingBox
    }
}
