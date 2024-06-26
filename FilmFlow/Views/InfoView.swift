//
//  InfoView.swift
//  FilmFlow
//
//  Created by Ying-Shan Lin on 2024/3/30.
//

import Foundation
import SwiftUI
import SwiftData

struct InfoView: View {
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeNow = ""
    let dateFormatter = DateFormatter()
    @StateObject var locationManager = LocationManager()

    var body: some View {
        List {
            Section(header: Text("Time")) {
                Text("Current Time: " + timeNow)
                    .onReceive(timer) { _ in
                        self.timeNow = dateFormatter.string(from: Date())
                    }
                    .onAppear(perform: {dateFormatter.dateFormat = "LLLL dd, hh:mm:ss a"})
                Text("Current Timezone: \(TimeZone.current.identifier) UTC \(TimeZone.current.secondsFromGMT() >= 0 ? "+" : "-")\(abs(TimeZone.current.secondsFromGMT()) / 3600)")
            }
            Section(header: Text("Location")) {
                switch locationManager.manager.authorizationStatus {
                case .authorizedAlways, .authorizedWhenInUse:
                    if let location = locationManager.location {
                        Text("Latitude: \(location.coordinate.latitude)")
                        Text("Longitude: \(location.coordinate.longitude)")
                        Text("Altitude: \(location.altitude)")
                    }
                case .denied:
                    Text("Location access denied")
                case .notDetermined, .restricted:
                    Text("Location access not determined, Please enable location access in Settings")
                @unknown default:
                    Text("Unknown location access status")
                }
            }
        }
        .onAppear {
            locationManager.start()
        }
        .onDisappear {
            locationManager.stop()
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(configurations: config)

    return InfoView()
        .modelContainer(container)
}
