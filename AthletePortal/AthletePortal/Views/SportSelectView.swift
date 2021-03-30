//
//  SportSelectView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import SwiftUI
import RealmSwift
import Combine

struct SportSelectView: View {
    // Hold an error if one occurs so we can display it
    @State var error: Error?
    
    // Keep track of whether login is in process or not
    @State var isLoggingIn = false
    
    // The instance of our Realm app passed down fron SyncContenteView
    @ObservedObject var app: RealmSwift.App
    
    var body: some View {
        // This view will be the initial screen viewed upon opening the app. It will prompt the user to select a sport, and then upon selecting a sport, it will authenticate them as their sports respective coach, this will then be stored for convenience sake when showing schedules and scheduling new events
        // While we are using authenticating users on the backend, they are technically anonymous, and their sport is being saved in an @EnvironmentObject for later use
        
        VStack {
            if isLoggingIn {
                ProgressView()
            }
            if let error = error {
                Text("Error: \(error.localizedDescription)")
            }
            // FRONTEND PEOPLE WORKING ON THIS VIEW: Lines 36-50 contain the code that must be replicated for each individual login button.
            //      As of right now, only a login for baseball shows up. The code needs to be copied and pasted and then needs updated for each
            //      respective sport the button is for, along with any styles you apply to it through SwiftUI modifiers.
            Button("Baseball Log In") {
                // Button has been pressed, so log them in (and display ProgressView
                isLoggingIn = true
                app.login(credentials: .anonymous) { result in
                    isLoggingIn = false
                    if case let .failure(error) = result {
                        print("Failed to log in: \(error.localizedDescription)")
                        // Set error to observed property so it can be displayed
                        self.error = error
                        return
                    }
                    // Other views that are observing the app will detect the the currentUser has changed. Nothing more to do
                    print("Logged in")
                }
            }.disabled(isLoggingIn)
        }
        
    }
}

// I'm not quite sure how to make these MongoDB data models work in previews because of how they are passed down from view to view
//      If you need to test or look at the view, either load it in the simulator, or comment out the @ObservedRealmObject above, update the
//      dependencies in the code, and then use the preview code below. Let me know if you have questions or if that doesn't make sense

//struct SportSelectView_Previews: PreviewProvider {
//    static var previews: some View {
//        SportSelectView()
//            .preferredColorScheme(.dark)
//    }
//}
