//
//  interviewApp.swift
//  interview
//
//  Created by Chiran Siriwardena on 4/28/24.
//

import SwiftUI
import SwiftData

@main
struct interviewApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                ContentView()
            }
        }
        .modelContainer(for: Product.self)
    }
}
