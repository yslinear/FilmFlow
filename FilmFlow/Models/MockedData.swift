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
        Camera(name: "Leica M6", timestamp: Date()),
        Camera(name: "Nikon FM2", timestamp: Date()),
        Camera(name: "Canon AE-1", timestamp: Date()),
        Camera(name: "Pentax K1000", timestamp: Date()),
        Camera(name: "Olympus OM-1", timestamp: Date()),
        Camera(name: "Minolta X-700", timestamp: Date()),
        Camera(name: "Contax G2", timestamp: Date()),
        Camera(name: "Hasselblad 500C/M", timestamp: Date()),
        Camera(name: "Mamiya 7", timestamp: Date()),
        Camera(name: "Rolleiflex 2.8F", timestamp: Date()),
        Camera(name: "Polaroid SX-70", timestamp: Date()),
        Camera(name: "Fuji GW690", timestamp: Date()),
        Camera(name: "Yashica Mat-124G", timestamp: Date()),
        Camera(name: "Konica Hexar AF", timestamp: Date()),
        Camera(name: "Ricoh GR1", timestamp: Date()),
        Camera(name: "Olympus XA", timestamp: Date()),
        Camera(name: "Canon QL17 GIII", timestamp: Date()),
        Camera(name: "Nikon F3", timestamp: Date()),
        Camera(name: "Leica M3", timestamp: Date()),
    ]
}

#endif
