//
//  Item.swift
//  FilmFlow
//
//  Created by Ying-Shan Lin on 2024/3/30.
//

import Foundation
import SwiftData

@Model
final class Camera {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
