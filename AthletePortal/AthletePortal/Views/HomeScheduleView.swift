//
//  HomeScheduleView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 30/04/2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Combine

struct HomeScheduleView: View {
    // Environment Object to help keep track of sports team
    @EnvironmentObject var environmentModel: EnvironmentModel
    
    // Results containing all events from the database - var will be used when creating schedule list
    @ObservedResults(Event.self) var events
    
    @Environment(\.realm) var realm
    
    // For the navbar portion of the view
    @State var showMenu = false
    
    var body: some View {
        
        // Beginning of Navbar code
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
                    MainHomeNavView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    
                    // Specific UI view code here:
                    
                    // Query to modify the db results to fit the "schedule view" format of being in timed order (frontend - please do not touch)
                    let schedule = events.sorted(byKeyPath: "startDateTime", ascending: true)
                    
                    // This view specifically should organize the schedule displayed by a selected team, this selected team will be referenced in the Object Model, and chosen in the SportSelectView
                    // This view is also what appears when the "Dashboard" option is selected from the hamburger navbar
                    
                    Text("Home View")
                    
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

struct MainHomeNavView: View {
    
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
        
struct HomeScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScheduleView()
    }
}
