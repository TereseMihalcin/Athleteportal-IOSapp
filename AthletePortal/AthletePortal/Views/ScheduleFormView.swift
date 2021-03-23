//
//  ScheduleFormView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import SwiftUI

struct ScheduleFormView: View {
    @EnvironmentObject var scheduleModel: ScheduleModel
    var body: some View {
        // This view is the dropdown that allows users to select a facility and time to reserve/schedule a new event. The different sections of the form that users must fill out is "facility" - a dropdown list of all facilities on campus, "time", will allow the user to select a start time and end time, and "type" - this will be a dropdown list of the different team activity types such as practice, lift, meeting, etc.
        // After the form is completed, a function will be called to check the database and see if there is an overlap between times and the selected facility. If there is a conflict, an error message will appear telling the user to select a new time.
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ScheduleFormView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleFormView()
            .environmentObject(ScheduleModel())
            .preferredColorScheme(.dark)
    }
}
