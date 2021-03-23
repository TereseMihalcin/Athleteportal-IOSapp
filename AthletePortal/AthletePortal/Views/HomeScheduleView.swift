//
//  HomeScheduleView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import SwiftUI

struct HomeScheduleView: View {
    @EnvironmentObject var scheduleModel: ScheduleModel
    var body: some View {
        // This view specifically should organize the schedule displayed by a selected team, this selected team will be referenced in the Object Model, and chosen in the SportSelectView
        // This view is also what appears when the "Dashboard" option is selected from the hamburger navbar
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HomeScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScheduleView()
            .environmentObject(ScheduleModel())
            .preferredColorScheme(.dark)
    }
}
