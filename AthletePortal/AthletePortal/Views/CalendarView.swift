//
//  CalendarView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var scheduleModel: ScheduleModel
    var body: some View {
        // This view is what is displayed when the calender icon is selected from the calendar icon on the default navbar. It should display all upcoming scheduled events based on the selected sport in SportSelectView
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .environmentObject(ScheduleModel())
            .preferredColorScheme(.dark)
    }
}
