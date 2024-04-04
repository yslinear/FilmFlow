//
//  LightMeterView.swift
//  FilmFlow
//
//  Created by Ying-Shan Lin on 2024/3/30.
//

import Foundation
import SwiftUI
import SwiftData
import AVFoundation

struct LightMeterView: View {
    @StateObject var manager = CameraManager()

    var body: some View {
        if let image = manager.frame {
            VStack() {
                Image(image, scale: 1.0, orientation: .up, label: Text("frame"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 300)
                Text("ISO: \(manager.videoDevice?.iso ?? 0)")
                Text("Aperture: \(Float((manager.videoDevice?.lensAperture)!))")
                Text("Sutter Speed: \(Float(CMTimeGetSeconds((manager.videoDevice?.exposureDuration)!)))")
            }
        } else {
            Text("Loading...")
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(configurations: config)

    return LightMeterView()
        .modelContainer(container)
}
