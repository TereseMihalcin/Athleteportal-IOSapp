//
//  AthletePortalApp.swift
//  AthletePortal
//
//  Created by Daniel Williams on 17/03/2021.
//

import SwiftUI

@main
struct AthletePortalApp: App {
    @StateObject private var scheduleModel = ScheduleModel()
    
    // Connection to db here?
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(scheduleModel)
        }
    }
}
