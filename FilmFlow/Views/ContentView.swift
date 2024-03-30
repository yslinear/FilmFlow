//
//  ContentView.swift
//  FilmFlow
//
//  Created by Ying-Shan Lin on 2024/3/30.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var cameras: [Camera]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(cameras) { item in
                    NavigationLink {
                        Text("Camera at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
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
            Text("Select an item")
        }
    }

    private func addCamera() {
        withAnimation {
            let newCamera = Camera(timestamp: Date())
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
    ContentView()
        .modelContainer(for: Camera.self, inMemory: true)
}
