//
//  CalendarView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import SwiftUI
import RealmSwift
import Combine

struct CalendarView: View {
    // Will be used to help display dates
    @EnvironmentObject var environmentModel: EnvironmentModel
    @ObservedRealmObject var schedule: Schedule
    
    var body: some View {
        // This view is what is displayed when the calender icon is selected from the calendar icon on the default navbar. It should display all upcoming scheduled events based on the selected sport in SportSelectView
        // Similar to PracticeView, querying the group so that it displays events based on startTime may require my help as well - Dan, just
        //      reach out and we can figure it out together
        Text("Hello, World!")
    }
}

// I'm not quite sure how to make these MongoDB data models work in previews because of how they are passed down from view to view
//      If you need to test or look at the view, either load it in the simulator, or comment out the @ObservedRealmObject above, update the
//      dependencies in the code, and then use the preview code below. Let me know if you have questions or if that doesn't make sense

//struct SportSelectView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarView()
//            .preferredColorScheme(.dark)
//    }
//}
