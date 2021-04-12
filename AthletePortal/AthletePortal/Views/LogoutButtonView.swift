//
//  LogoutButtonView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 30/03/2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Combine

struct LogoutButtonView: View {
    // Will be used to udpate currentSport to "" upong logging out
    @EnvironmentObject var environmentModel: EnvironmentModel
    @ObservedObject var app: RealmSwift.App
    @State var isLoggingOut = false
    
    var body: some View {
    
        Button("Log Out") {
            guard let user = app.currentUser else {
                return
            }
            isLoggingOut = true
            user.logOut() { error in
                isLoggingOut = false
                // Other views are observing the app and will detect that the currentUser has changed
                print("Logged out")
                environmentModel.currentSport = ""
            }
        }.disabled(app.currentUser == nil || isLoggingOut)
        
    }
}

// I'm not quite sure how to make these MongoDB data models work in previews because of how they are passed down from view to view
//      If you need to test or look at the view, either load it in the simulator, or comment out the @ObservedRealmObject above, update the
//      dependencies in the code, and then use the preview code below. Let me know if you have questions or if that doesn't make sense

//struct SportSelectView_Previews: PreviewProvider {
//    static var previews: some View {
//        LogoutButtonView()
//            .preferredColorScheme(.dark)
//    }
//}
