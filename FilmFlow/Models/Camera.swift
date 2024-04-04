//
//  Item.swift
//  FilmFlow
//
//  Created by Ying-Shan Lin on 2024/3/30.
//

import Foundation
import SwiftData

@Model
final class Camera: Identifiable {
    var name: String
    var maxShutterSpeed: String

    init(name: String = "Camera - \(Date.timeIntervalSinceReferenceDate)", maxShutterSpeed: String = CameraConstant.maxShutterSpeeds[0]) {
        self.name = name
        self.maxShutterSpeed = maxShutterSpeed
    }
}
