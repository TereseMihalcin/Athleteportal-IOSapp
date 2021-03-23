//
//  DropdownNavView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import SwiftUI

struct DropdownNavView: View {
    @EnvironmentObject var scheduleModel: ScheduleModel
    var body: some View {
        // This is the small dropdown list of buttons that appears when tapping the hamburger icon from the default nav bar that is always displayed at the top of the app
        // As of right now, the only options should be "Dashboard" and "Practices"
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DropdownNavView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownNavView()
            .environmentObject(ScheduleModel())
            .preferredColorScheme(.dark)
    }
}
