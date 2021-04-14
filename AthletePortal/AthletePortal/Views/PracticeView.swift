//
//  PracticeView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Combine

struct PracticeView: View {
    // Environment Object to help keep track of sports team
    @EnvironmentObject var environmentModel: EnvironmentModel
    
    // Results containing all events from the database - var will be used when creating schedule list
    @ObservedResults(Event.self) var events
    
    var body: some View {
        // Query to modify the db results to fit the "schedule view" format of being in timed order (frontend - please do not touch)
        let predicate = NSPredicate(format: "title == Practice")
        let schedule = events.filter(predicate)
        
        // This view is what is show when the "Practices" option is selected from the hamburger navbar. It should display only scheduled events that are listed as "practice" and belong to the sport that has already been selected in the SporSelectView
        // Properly querying this view for a schedule that only lists practices for a specific team will require my help (Dan), just lmk and we
        //      can work together on it, it should not take very long at all
        
        VStack {
            // Navbar gets added to the top of every view we use (because it is always present in the app, that is the purpose of a navbar)
            NavbarView()
                .environment(\.realmConfiguration,
                             app.currentUser!.configuration(partitionValue: partitionValue))
            
            // Replace this with the actual UI code:
            Text("Practice View")
        }
        
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
            .preferredColorScheme(.dark)
            .environment(\.realmConfiguration,
                          app.currentUser!.configuration(partitionValue: "masterSchedule"))
    }
}
