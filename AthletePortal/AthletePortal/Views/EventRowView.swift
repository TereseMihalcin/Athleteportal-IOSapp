//
//  EventRowView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 29/03/2021.
//

import SwiftUI
import RealmSwift
import Combine

struct EventRowView: View {
    // Will be used to help display dates
    @EnvironmentObject var environmentModel: EnvironmentModel
    @ObservedRealmObject var event: Event
    
    var body: some View {
        // This view will be the template for how information about a specific event is displayed on the screen. Based on the designs Patrick created,
        //      these should have a small, bold print in the top left corner that says the day of the week, and then the actual date, with a
        //      rounded rectangular box below it displaying the facility and the start and end time like this: "startTime-endTime"
        // This view will be called many times in many other views as we iterate over differently queried schedules
        Text("Hello, World!")
    }
}

// I'm not quite sure how to make these MongoDB data models work in previews because of how they are passed down from view to view
//      If you need to test or look at the view, either load it in the simulator, or comment out the @ObservedRealmObject above, update the
//      dependencies in the code, and then use the preview code below. Let me know if you have questions or if that doesn't make sense

//struct SportSelectView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressView()
//            .preferredColorScheme(.dark)
//    }
//}
