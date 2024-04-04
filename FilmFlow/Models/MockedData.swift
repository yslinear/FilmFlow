//
//  MockedData.swift
//  FilmFlow
//
//  Created by Ying-Shan Lin on 2024/3/31.
//

import Foundation

#if DEBUG

extension Camera {
    static let mockedData: [Camera] = [
        Camera(name: "Leica M6", maxShutterSpeed: CameraConstant.maxShutterSpeeds[3]),
        Camera(name: "Nikon FM2", maxShutterSpeed: CameraConstant.maxShutterSpeeds[2]),
        Camera(name: "Canon AE-1", maxShutterSpeed: CameraConstant.maxShutterSpeeds[1]),
        Camera(name: "Pentax K1000", maxShutterSpeed: CameraConstant.maxShutterSpeeds[3]),
        Camera(name: "Olympus OM-1", maxShutterSpeed: CameraConstant.maxShutterSpeeds[0]),
        Camera(name: "Minolta X-700", maxShutterSpeed: CameraConstant.maxShutterSpeeds[1]),
        Camera(name: "Contax G2", maxShutterSpeed: CameraConstant.maxShutterSpeeds[2]),
        Camera(name: "Hasselblad 500C/M", maxShutterSpeed: CameraConstant.maxShutterSpeeds[3]),
        Camera(name: "Mamiya 7", maxShutterSpeed: CameraConstant.maxShutterSpeeds[0]),
        Camera(name: "Rolleiflex 2.8F", maxShutterSpeed: CameraConstant.maxShutterSpeeds[0]),
        Camera(name: "Polaroid SX-70", maxShutterSpeed: CameraConstant.maxShutterSpeeds[0]),
        Camera(name: "Fuji GW690", maxShutterSpeed: CameraConstant.maxShutterSpeeds[0]),
        Camera(name: "Yashica Mat-124G", maxShutterSpeed: CameraConstant.maxShutterSpeeds[0]),
        Camera(name: "Konica Hexar AF", maxShutterSpeed: CameraConstant.maxShutterSpeeds[0]),
        Camera(name: "Ricoh GR1", maxShutterSpeed: CameraConstant.maxShutterSpeeds[0]),
        Camera(name: "Olympus XA", maxShutterSpeed: CameraConstant.maxShutterSpeeds[0]),
        Camera(name: "Canon QL17 GIII", maxShutterSpeed: CameraConstant.maxShutterSpeeds[0]),
        Camera(name: "Nikon F3", maxShutterSpeed: CameraConstant.maxShutterSpeeds[0]),
        Camera(name: "Leica M3", maxShutterSpeed: CameraConstant.maxShutterSpeeds[0]),
    ]
}

#endif
