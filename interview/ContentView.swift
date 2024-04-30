//
//  ContentView.swift
//  interview
//
//  Created by Chiran Siriwardena on 4/28/24.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @Environment(\.modelContext) var context
    var body: some View {
        ProductList()
    }
}

#Preview {
    ContentView()
}
