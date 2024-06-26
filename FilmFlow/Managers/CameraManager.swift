//
//  CameraManager.swift
//  FilmFlow
//
//  Created by Ying-Shan Lin on 2024/4/4.
//

import AVFoundation
import CoreImage
import UIKit

class CameraManager: NSObject, ObservableObject {
    @Published var frame: CGImage?
    @Published var videoDevice: AVCaptureDevice?

    private var permissionGranted = true
    private let captureSession = AVCaptureSession()
    private var videoOutput: AVCaptureVideoDataOutput!
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    private let context = CIContext()

    override init() {
        super.init()
        self.checkPermission()
        sessionQueue.async { [unowned self] in
            self.setupCaptureSession()
            self.captureSession.startRunning()
        }
    }

    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized: // The user has previously granted access to the camera.
            self.permissionGranted = true

        case .notDetermined: // The user has not yet been asked for camera access.
            self.requestPermission()

            // Combine the two other cases into the default case
        default:
            self.permissionGranted = false
        }
    }

    func requestPermission() {
        // Strong reference not a problem here but might become one in the future.
        AVCaptureDevice.requestAccess(for: .video) { [unowned self] granted in
            self.permissionGranted = granted
        }
    }

    func setupCaptureSession() {
        self.videoOutput = AVCaptureVideoDataOutput()

        guard permissionGranted else { return }
        guard let videoDevice = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) ?? AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            fatalError("Missing expected back camera device.")
        }

        DispatchQueue.main.async { [unowned self] in
            self.videoDevice = videoDevice
        }
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else { return }
        guard captureSession.canAddInput(videoDeviceInput) else { return }
        captureSession.addInput(videoDeviceInput)

        self.videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "sampleBufferQueue"))
        captureSession.addOutput(videoOutput)

        self.videoOutput.connection(with: .video)?.videoRotationAngle = 90
    }
    func stopCaptureSession() {
        sessionQueue.async { [unowned self] in
            if self.captureSession.isRunning {
                self.captureSession.stopRunning()
            }
        }
    }
}


extension CameraManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let cgImage = imageFromSampleBuffer(sampleBuffer: sampleBuffer) else { return }

        // All UI updates should be/ must be performed on the main queue.
        DispatchQueue.main.async { [unowned self] in
            self.frame = cgImage
        }
    }

    private func imageFromSampleBuffer(sampleBuffer: CMSampleBuffer) -> CGImage? {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return nil }
        let ciImage = CIImage(cvPixelBuffer: imageBuffer)
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return nil }

        return cgImage
    }
}
