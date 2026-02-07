//
//  DetectedFace.swift
//  SwiftVisionKit
//
//  Created by Karim Bouchaane on 07/02/2026.
//

import CoreGraphics

public struct DetectedFace: Sendable {
    public let boundingBox: CGRect

    public init(boundingBox: CGRect) {
        self.boundingBox = boundingBox
    }
}
