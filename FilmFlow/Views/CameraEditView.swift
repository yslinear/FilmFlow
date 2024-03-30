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

    var body: some View {
        Form {
            Section(header: Text("Camera Info")) {
                TextField("Name", text: $camera.name)
                DatePicker("Timestamp", selection: $camera.timestamp)
            }
        }
    }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Camera.self, configurations: config)
    let camera = Camera(name: "Name String", timestamp: Date())

    return CameraEditView(camera: camera)
        .modelContainer(container)
}
