//
//  LiveCameraView.swift
//  EcoVision
//
//  Created by Abhishek on 17/02/26.
//

import SwiftUI
import AVFoundation

struct LiveCameraView: UIViewControllerRepresentable {

    @ObservedObject var viewModel: CameraViewModel

    func makeUIViewController(context: Context) -> LiveCameraController {

        let controller = LiveCameraController()
        controller.viewModel = viewModel
        return controller
    }

    func updateUIViewController(_ uiViewController: LiveCameraController, context: Context) {}
}

class LiveCameraController: UIViewController {

    var viewModel: CameraViewModel!

    private let session = AVCaptureSession()
    private var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
    }

    private func setupCamera() {

        session.sessionPreset = .high

        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                   for: .video,
                                                   position: .back),
              let input = try? AVCaptureDeviceInput(device: device)
        else { return }

        session.addInput(input)

        let output = AVCaptureVideoDataOutput()

        output.setSampleBufferDelegate(self,
                                       queue: DispatchQueue(label: "live.camera"))

        session.addOutput(output)

        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = view.bounds
        previewLayer.videoGravity = .resizeAspectFill

        view.layer.addSublayer(previewLayer)

        session.startRunning()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = view.bounds
    }
}

extension LiveCameraController: AVCaptureVideoDataOutputSampleBufferDelegate {

    func captureOutput(_ output: AVCaptureOutput,
                       didOutput sampleBuffer: CMSampleBuffer,
                       from connection: AVCaptureConnection) {

        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
        else { return }

        viewModel.processLiveFrame(pixelBuffer)
    }
}
