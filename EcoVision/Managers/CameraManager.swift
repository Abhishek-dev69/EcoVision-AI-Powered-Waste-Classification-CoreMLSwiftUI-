import Foundation
import AVFoundation
import UIKit
import Combine

final class CameraManager: NSObject, ObservableObject {
    
    @Published var capturedImage: UIImage?
    
    private let session = AVCaptureSession()
    private let output = AVCapturePhotoOutput()
    
    func setupCamera() {
        session.beginConfiguration()
        
        guard let device = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: device),
              session.canAddInput(input),
              session.canAddOutput(output) else {
            return
        }
        
        session.addInput(input)
        session.addOutput(output)
        
        session.commitConfiguration()
        session.startRunning()
    }
    
    func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        output.capturePhoto(with: settings, delegate: self)
    }
}

extension CameraManager: AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput,
                     didFinishProcessingPhoto photo: AVCapturePhoto,
                     error: Error?) {
        
        guard let data = photo.fileDataRepresentation(),
              let image = UIImage(data: data) else {
            return
        }
        
        DispatchQueue.main.async {
            self.capturedImage = image
        }
    }
}

