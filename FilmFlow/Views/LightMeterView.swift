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
    @State private var ev = 0.0

    var body: some View {
        if let image = manager.frame {
            Grid {
                GridRow {
                    VStack(alignment: .leading) {
                        Text("ISO: \(manager.videoDevice?.iso ?? 0)")
                        Text("Aperture: \(Float((manager.videoDevice?.lensAperture)!))")
                        Text("Sutter Speed: \(Float(CMTimeGetSeconds((manager.videoDevice?.exposureDuration)!)))")
                    }
                    Image(image, scale: 1.0, orientation: .up, label: Text("frame"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                GridRow {
                    VStack {
                        Text("Other Info")
                        Text("EV: \(ev)")
                    }
                    Button(action: {
                        let iso = manager.videoDevice?.iso
                        let aperture = manager.videoDevice?.lensAperture
                        let shutterSpeed = CMTimeGetSeconds((manager.videoDevice?.exposureDuration)!)

                        ev = Double(log2(Float(iso!)) + log2(Float(aperture!)) - log2(Float(shutterSpeed)))
                    }) {
                        Text("Calculate EV")
                    }
                }
            }.padding()
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
