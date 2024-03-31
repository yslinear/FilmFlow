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
    @State private var maxShutterSpeed = 0

    var body: some View {
        Form {
            Section(header: Text("Camera Info")) {
                TextField("Name", text: $camera.name)
            }
            // TODO: Add more fields
            Section(header: Text("Camera Settings")) {
                Picker("Max Shutter Speed", selection: $maxShutterSpeed) {
                    Text("8000").tag(8000)
                    Text("4000").tag(4000)
                    Text("2000").tag(2000)
                    Text("1000").tag(1000)
                    Text("500").tag(500)
                    Text("250").tag(250)
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
