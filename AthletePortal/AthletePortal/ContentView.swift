//
//  ContentView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 17/03/2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Combine

@main
struct ContentView: SwiftUI.App {
    @StateObject private var environmentModel = EnvironmentModel()
        
    var body: some Scene {
        WindowGroup {
            if let app = app {
                SyncContentView(app: app)
                    .environmentObject(environmentModel)
            }
            
        }
    }
}

