//
//  TipKitExampleApp.swift
//  TipKitExample
//
//  Created by sardar saqib on 21/03/2025.
//

import SwiftUI
import TipKit

@main
struct TipKitExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    init() {
        do {
            try setupTips()
        } catch {
            print("Error initializing tips: \(error)")
        }
    }

   
    private func setupTips() throws {
        // Purge all TipKit-related data.
        try Tips.resetDatastore()

        // Configure and load all tips in the app.
        try Tips.configure()
    }
}
