//
//  CameraViewModel.swift
//  EcoVision
//
//  Created by Abhishek on 12/02/26.
//

import UIKit
import AVFoundation
internal import Combine

final class CameraViewModel: ObservableObject {

    @Published var result: DetectionResult?
    @Published var isShowingResult = false

    private let classifier = WasteClassifierService()

    func classifyImage(_ image: UIImage) {
        guard let pixelBuffer = image.toPixelBuffer() else { return }

        classifier.classify(pixelBuffer: pixelBuffer) { [weak self] result in
            DispatchQueue.main.async {
                self?.result = result
                self?.isShowingResult = result != nil
            }
        }
    }
}
