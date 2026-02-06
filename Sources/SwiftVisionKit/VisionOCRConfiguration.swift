//
//  VisionOCRConfiguration.swift
//  SwiftVisionKit
//
//  Created by Karim Bouchaane on 07/02/2026.
//

import Vision

public struct VisionOCRConfiguration {
    public var recognitionLevel: VNRequestTextRecognitionLevel
    public var usesLanguageCorrection: Bool

    public init(
        recognitionLevel: VNRequestTextRecognitionLevel = .accurate,
        usesLanguageCorrection: Bool = true
    ) {
        self.recognitionLevel = recognitionLevel
        self.usesLanguageCorrection = usesLanguageCorrection
    }
}
