//
//  PracticeView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import SwiftUI

struct PracticeView: View {
    @EnvironmentObject var scheduleModel: ScheduleModel
    var body: some View {
        // This view is what is show when the "Practices" option is selected from the hamburger navbar. It should display only scheduled events that are listed as "practice" and belong to the sport that has already been selected in the SporSelectView
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
            .environmentObject(ScheduleModel())
            .preferredColorScheme(.dark)
    }
}
