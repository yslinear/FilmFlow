//
//  CameraView.swift
//  FilmFlow
//
//  Created by Ying-Shan Lin on 2024/3/30.
//

import Foundation
import SwiftUI
import SwiftData

struct CameraEditView: View {
    @Bindable var camera: Camera
    @State private var maxShutterSpeed = CameraConstant.maxShutterSpeeds[0]

    // init(camera: Camera?) {
    //     _camera = Bindable(wrappedValue: camera ?? Camera(name: "", maxShutterSpeed: nil, timestamp: Date()))
    // }

    var body: some View {
        Form {
            Section(header: Text("Camera Info")) {
                TextField("Name", text: $camera.name)
            }
            // TODO: Add more fields
            Section(header: Text("Camera Settings")) {
                Picker("Max Shutter Speed", selection: $camera.maxShutterSpeed) {
                    ForEach(CameraConstant.maxShutterSpeeds, id: \.self) { speed in
                        Text(speed).tag(speed)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Camera.self, configurations: config)

    return CameraEditView(camera: Camera.mockedData[0])
        .modelContainer(container)
}
