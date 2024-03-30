//
//  FilmFlowApp.swift
//  FilmFlow
//
//  Created by Ying-Shan Lin on 2024/3/30.
//

import SwiftUI
import SwiftData

@main
struct FilmFlowApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Camera.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabView {
                CameraListView()
                    .tabItem {
                        Label("Camera List", systemImage: "camera")
                    }
                LightMeterView()
                    .tabItem {
                        Label("Light Meter", systemImage: "circle.lefthalf.striped.horizontal")
                    }
                InfoView()
                    .tabItem {
                        Label("Info", systemImage: "info")
                    }
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
