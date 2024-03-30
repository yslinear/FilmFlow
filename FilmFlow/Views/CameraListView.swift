//
//  CameraListView.swift
//  FilmFlow
//
//  Created by Ying-Shan Lin on 2024/3/30.
//

import SwiftUI
import SwiftData

struct CameraListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var cameras: [Camera]
    @State private var isPresentingCameraEditView = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(cameras) {camera in
                    NavigationLink(camera.name,
                                   destination: CameraEditView(camera: camera)
                    )
                }
                .onDelete(perform: deleteCameras)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addCamera) {
                        Label("Add Camera", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an camera")
        }
    }

    private func addCamera() {
        // FIXME: generate random name
        let randomName = "Camera \(Int.random(in: 1...1000))"
        withAnimation {
            let newCamera = Camera(name: randomName, timestamp: Date())
            modelContext.insert(newCamera)
        }
    }

    private func deleteCameras(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(cameras[index])
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Camera.self, configurations: config)

    for i in 1...10 {
        let camera = Camera(name: "Camera \(i)", timestamp: Date())
        container.mainContext.insert(camera)
    }

    return CameraListView()
        .modelContainer(container)
}
