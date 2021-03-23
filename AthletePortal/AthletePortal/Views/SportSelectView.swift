//
//  SportSelectView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import SwiftUI

struct SportSelectView: View {
    @EnvironmentObject var scheduleModel: ScheduleModel
    var body: some View {
        // This view will be the initial screen viewed upon opening the app. It will prompt the user to select a sport, and then upon selecting a sport, it will save that sports name to the @EnvironmentObject, this will then be stored for convenience sake when showing schedules and scheduling new events
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SportSelectView_Previews: PreviewProvider {
    static var previews: some View {
        SportSelectView()
            .environmentObject(ScheduleModel())
            .preferredColorScheme(.dark)
    }
}
