//
//  HomeScheduleView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import SwiftUI
import RealmSwift
import Combine

struct HomeScheduleView: View {
    // Will be used to help display dates
    @EnvironmentObject var environmentModel: EnvironmentModel
    @ObservedRealmObject var schedule: Schedule
    
    // Button to be displayed on the top left (should always be logout button
    var leadingBarButton: AnyView?
    
    var body: some View {
        // This view specifically should organize the schedule displayed by a selected team, this selected team will be referenced in the Object Model, and chosen in the SportSelectView
        // This view is also what appears when the "Dashboard" option is selected from the hamburger navbar
        Text("Hello, World!")
    }
}

// I'm not quite sure how to make these MongoDB data models work in previews because of how they are passed down from view to view
//      If you need to test or look at the view, either load it in the simulator, or comment out the @ObservedRealmObject above, update the
//      dependencies in the code, and then use the preview code below. Let me know if you have questions or if that doesn't make sense

//struct SportSelectView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeScheduleView()
//            .preferredColorScheme(.dark)
//    }
//}
