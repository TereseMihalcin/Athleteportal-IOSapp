//
//  SyncContentView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 29/03/2021.
//

import SwiftUI
import RealmSwift
import Combine

struct SyncContentView: View {
    // Observe the Realm app object in order to react to login state changes
    @ObservedObject var app: RealmSwift.App
    // Observe a realm that may be opened after login
    @State var realm: Realm?
    
    var body: AnyView {
        // If there is not coach logged in, show the SportSelctView to log them in
        guard let user = app.currentUser else {
            return AnyView(SportSelectView(app: app))
        }
        // If a user is logged in but the realm is not open yet, then show a progress spinner while opening it
        // Realm.asyncOpen() downloads the remote changes before the realm opens, which may take a moment
        guard let realm = realm else {
            return AnyView(ProgressView()
                            .onReceive(Realm.asyncOpen(configuration: user.configuration(partitionValue: user.id)).assertNoFailure()) { realm in
                                // Preload one schedule if it doesn't exist. This app only allows one group (schedule) per user partition
                                if realm.objects(Schedule.self).count == 0 {
                                    try! realm.write {
                                        realm.add(Schedule())
                                    }
                                }
                                // Assign the realm to the state property to trigger a view refresh
                                self.realm = realm
        })
    }
        // If logged in and the realm has been opened, then go to the HomeScheduleView for the only schedule in the realm
        return AnyView(HomeScheduleView(schedule: realm.objects(Schedule.self).first!,
                                        leadingBarButton: AnyView(LogoutButtonView(app: app))))
    }
        
}

// I'm not quite sure how to make these MongoDB data models work in previews because of how they are passed down from view to view
//      If you need to test or look at the view, either load it in the simulator, or comment out the @ObservedRealmObject above, update the
//      dependencies in the code, and then use the preview code below. Let me know if you have questions or if that doesn't make sense

//struct SportSelectView_Previews: PreviewProvider {
//    static var previews: some View {
//        SyncContentView()
//            .preferredColorScheme(.dark)
//    }
//}
