//
//  DropdownNavView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import SwiftUI
import RealmSwift
import Combine

struct DropdownNavView: View {
    @EnvironmentObject var environmentModel: EnvironmentModel
    @ObservedRealmObject var schedule: Schedule
    
    var body: some View {
        // This is the small dropdown list of buttons that appears when tapping the hamburger icon from the default nav bar that is always displayed at the top of the app
        // As of right now, the only options should be "Dashboard" and "Practices"
        Text("Hello, World!")
    }
}

// I'm not quite sure how to make these MongoDB data models work in previews because of how they are passed down from view to view
//      If you need to test or look at the view, either load it in the simulator, or comment out the @ObservedRealmObject above, update the
//      dependencies in the code, and then use the preview code below. Let me know if you have questions or if that doesn't make sense

//struct SportSelectView_Previews: PreviewProvider {
//    static var previews: some View {
//        DropdownNavView()
//            .preferredColorScheme(.dark)
//    }
//}
