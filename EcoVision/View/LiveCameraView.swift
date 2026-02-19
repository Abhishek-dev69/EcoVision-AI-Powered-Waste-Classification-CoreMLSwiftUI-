//
//  LiveCameraView.swift
//  EcoVision
//

import SwiftUI
import AVFoundation

// MARK: SwiftUI Wrapper

struct LiveCameraView: UIViewControllerRepresentable {

    @ObservedObject var viewModel: CameraViewModel

    func makeUIViewController(context: Context) -> LiveCameraController {

        let controller = LiveCameraController()
        controller.viewModel = viewModel
        return controller
    }

    func updateUIViewController(_ uiViewController: LiveCameraController, context: Context) {}
}


// MARK: UIKit Camera Controller

class LiveCameraController: UIViewController {

    var viewModel: CameraViewModel!

    private let session = AVCaptureSession()
    private var previewLayer: AVCaptureVideoPreviewLayer!

    private let sessionQueue = DispatchQueue(label: "camera.session.queue")

    override func viewDidLoad() {
        super.viewDidLoad()

        checkPermissionAndSetup()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        previewLayer?.frame = view.bounds
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        stopSession()
    }

    deinit {
        stopSession()
    }

}


// MARK: Camera Setup

extension LiveCameraController {

    private func checkPermissionAndSetup() {

        switch AVCaptureDevice.authorizationStatus(for: .video) {

        case .authorized:

            setupCamera()

        case .notDetermined:

            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in

                if granted {
                    DispatchQueue.main.async {
                        self?.setupCamera()
                    }
                }
            }

        default:
            break
        }
    }

    private func setupCamera() {

        sessionQueue.async {

            guard let device = AVCaptureDevice.default(
                .builtInWideAngleCamera,
                for: .video,
                position: .back
            ) else { return }

            guard let input = try? AVCaptureDeviceInput(device: device) else {
                return
            }

            if self.session.canAddInput(input) {
                self.session.addInput(input)
            }

            let output = AVCaptureVideoDataOutput()

            output.alwaysDiscardsLateVideoFrames = true

            output.setSampleBufferDelegate(
                self,
                queue: DispatchQueue(label: "camera.frame.processing")
            )

            if self.session.canAddOutput(output) {
                self.session.addOutput(output)
            }

            DispatchQueue.main.async {

                self.previewLayer = AVCaptureVideoPreviewLayer(session: self.session)

                self.previewLayer.videoGravity = .resizeAspectFill
                self.previewLayer.frame = self.view.bounds

                self.view.layer.addSublayer(self.previewLayer)
            }

            self.session.startRunning()
        }
    }

    private func stopSession() {

        sessionQueue.async {

            if self.session.isRunning {
                self.session.stopRunning()
            }
        }
    }
}


// MARK: Frame Processing

extension LiveCameraController: AVCaptureVideoDataOutputSampleBufferDelegate {

    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer: CMSampleBuffer,
        from connection: AVCaptureConnection
    ) {

        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
        else { return }

        viewModel.processLiveFrame(pixelBuffer)
    }
}

