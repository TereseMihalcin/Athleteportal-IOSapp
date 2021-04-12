//
//  SyncContentView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 29/03/2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Combine

struct SyncContentView: View {
    // Observe the Realm app object in order to react to login state changes
    @ObservedObject var app: RealmSwift.App
    // Observe a realm that may be opened after login
    @State var realm: Realm?
    
    // // This specific partition key confirms this object will be apart of the main (and only) partition of events
    //      inside the main (and also only) schedule in this application across all users
    // I didn't realize how it worked exactly when I configured it, so now it's this complex value lol
    
    var body: AnyView {
        
        guard let user = app.currentUser else {
            return AnyView(SportSelectView(app: app))
        }
        
        return AnyView(HomeScheduleView()
            .environment(\.realmConfiguration,
                         app.currentUser!.configuration(partitionValue: partitionValue)))
        
    }
        
}

        // If there is not a coach logged in, show the SportSelctView to log them in
//        guard let user = app.currentUser else {
//            return SportSelectView(app: app)
//                .environment(\.realmConfiguration,
//                             app.currentUser!.configuration(partitionValue: "masterSchedule"))
//        }
        // If a user is logged in but the realm is not open yet, then show a progress spinner while opening it
        // Realm.asyncOpen() downloads the remote changes before the realm opens, which may take a moment

        
        // THIS MIGHT NOT BE NECESSARY
        
        //        guard let realm = realm else {
//            print("Attempting to open synced Realm...")
//            return AnyView(ProgressView()
//                            .onReceive(Realm.asyncOpen(configuration: user.configuration(partitionValue: partitionValue)).assertNoFailure()) { realm in
//                                print("Successfully opened realm \(realm)")
//                                // Preload one schedule if it doesn't exist. This app only allows one group (schedule) per user partition
////                                print(realm.schema)
//                                print(realm)
//
//            // THIS CODE WAS FROM WHEN SCHEDULE DATA MODEL WAS USED
////                                if realm.objects(Schedule.self).count == 0 {
////                                    print("realm was found to not have a Schedule yet")
////                                    try! realm.write {
////                                        realm.add(Schedule())
////                                        print("Schedule successfully added to the realm")
////                                    }
////                                }
//                                // Assign the realm to the state property to trigger a view refresh
////                                print("Realm found to already contain a Schedule")
//
//                                self.realm = realm
//        })
//    }
        
        
        // If logged in and the realm has been opened, then go to the HomeScheduleView for the only schedule in the realm
//        guard let realm = realm else {
//            return HomeScheduleView()
//                .environment(\.realmConfiguration,
//                             app.currentUser!.configuration(partitionValue: "masterSchedule"))
//        }

// I'm not quite sure how to make these MongoDB data models work in previews because of how they are passed down from view to view
//      If you need to test or look at the view, either load it in the simulator, or comment out the @ObservedRealmObject above, update the
//      dependencies in the code, and then use the preview code below. Let me know if you have questions or if that doesn't make sense

//struct SportSelectView_Previews: PreviewProvider {
//    static var previews: some View {
//        SyncContentView()
//            .preferredColorScheme(.dark)
//    }
//}
