//
//  LightMeterView.swift
//  FilmFlow
//
//  Created by Ying-Shan Lin on 2024/3/30.
//

import Foundation
import SwiftUI
import SwiftData

struct LightMeterView: View {
    @StateObject var manager = CameraManager()

    var image: CGImage?

    var body: some View {
        Grid {
            GridRow {
                if let image = manager.frame {
                    Image(image, scale: 1.0, orientation: .up, label: Text("frame"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 240, height: 240)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                } else {
                    Color.red
                }
            }
            Divider()
            GridRow {
                Text("ISO: \(manager.videoDevice?.iso ?? 0)")
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(configurations: config)

    return LightMeterView()
        .modelContainer(container)
}
