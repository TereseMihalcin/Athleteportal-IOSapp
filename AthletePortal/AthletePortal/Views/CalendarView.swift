//
//  CalendarView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 30/04/2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Combine

struct CalendarView: View {
    // Will be used to help display dates
    @EnvironmentObject var environmentModel: EnvironmentModel
    
    // Results containing all events from the database - var will be used when creating schedule list
    @ObservedResults(Event.self) var events
    
    // For the navbar code
    @State var showMenu = false
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainCalendarNavView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    
                    // Specific UI view code here:

                    // Query to modify the db results to fit the "schedule view" format of being in timed order (frontend - please do not touch)
                    let schedule = events.sorted(byKeyPath: "startDateTime", ascending: true)
                    
                    // This view is what is displayed when the calender icon is selected from the calendar icon on the default navbar. It should display all upcoming scheduled events based on the selected sport in SportSelectView
                    // Similar to PracticeView, querying the group so that it displays events based on startTime may require my help as well - Dan, just
                    //      reach out and we can figure it out together
                    
                    Text("Calendar View")

                    
                    // UI code ends, rest of the code is now navbar related
                    if self.showMenu {
                        NavContentView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                    .gesture(drag)
            }
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                ))
        }
    }
}

struct MainCalendarNavView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        
        Button(action: {
            withAnimation {
               self.showMenu = true
            }
        }) {
        }
        
    }
        
    }

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
