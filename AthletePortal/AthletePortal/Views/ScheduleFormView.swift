//
//  ScheduleFormView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import SwiftUI
import RealmSwift
import Combine

struct ScheduleFormView: View {
    // Will be used to help display dates and use the logged in team as a default team for a new Event
    @EnvironmentObject var environmentModel: EnvironmentModel
    @ObservedRealmObject var schedule: Schedule
    
    var body: some View {
        // This view is the dropdown that allows users to select a facility and time to reserve/schedule a new event. The different sections of the form that users must fill out is "facility" - a dropdown list of all facilities on campus, "time", will allow the user to select a start time and end time, and "type" - this will be a dropdown list of the different team activity types such as practice, lift, meeting, etc.
        // After the form is completed, a function will be called to check the database and see if there is an overlap between times and the selected facility. If there is a conflict, an error message will appear telling the user to select a new time. Again, this will also require my help - Dan.
        Text("Hello, World!")
    }
}

// I'm not quite sure how to make these MongoDB data models work in previews because of how they are passed down from view to view
//      If you need to test or look at the view, either load it in the simulator, or comment out the @ObservedRealmObject above, update the
//      dependencies in the code, and then use the preview code below. Let me know if you have questions or if that doesn't make sense

//struct SportSelectView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScheduleFormView()
//            .preferredColorScheme(.dark)
//    }
//}
