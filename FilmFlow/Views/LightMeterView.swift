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
    var body: some View {
        Text("Light Meter")
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(configurations: config)

    return LightMeterView()
        .modelContainer(container)
}
