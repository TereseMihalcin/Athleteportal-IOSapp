//
//  SportSelectView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Combine

struct SportSelectView: View {
    @EnvironmentObject var environmentModel: EnvironmentModel
    
    // The realm we are working in
    @Environment(\.realm) var realm
    
    // Results containing all events from the database - var will be used when creating schedule list
    @ObservedResults(Event.self) var events
            
    var body: some View {
        // This view will be the initial screen viewed upon opening the app. It will prompt the user to select a sport, and then upon selecting a sport, it will authenticate them as their sports respective coach, this will then be stored for convenience sake when showing schedules and scheduling new events
        // While we are using authenticating users on the backend, they are technically anonymous, and their sport is being saved in an @EnvironmentObject for later use
        
        NavigationView {
            VStack {
                // FRONTEND PEOPLE WORKING ON THIS VIEW: Lines 29-34 contain everything needed to create one login button for one sport (in this case, baseball)
                //      In order to make a button for every sport, lines 29-34 just need to be copied and pasted, with the text displaying a team name needing changed
                //          on each one (aka, wherever is says 'baseball'
                Button("Login as Baseball Coach",action: {
                    environmentModel.currentSport = "Baseball"
                    NavigationLink("", destination: HomeScheduleView()
                        .environment(\.realmConfiguration,
                                     app.currentUser!.configuration(partitionValue: partitionValue)))
                })
            }
        }
        
    }
}

// For some reason I think I was able to get the other previews working, but this one does not work and I have no idea why

//struct SportSelectView_Previews: PreviewProvider {
//    static var previews: some View {
//        SportSelectView()
//            .preferredColorScheme(.dark)
//    }
//}
