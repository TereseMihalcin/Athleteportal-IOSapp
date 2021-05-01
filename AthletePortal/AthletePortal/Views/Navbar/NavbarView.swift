//
//  NavbarView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 11/04/2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Combine

struct NavbarView: View {
    
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
                    MainNavView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    
                    // Specific UI view code here:

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

struct MainNavView: View {
    
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

//struct NavbarView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavbarView()
//            .preferredColorScheme(.dark)
//            .environment(\.realmConfiguration,
//                          app.currentUser!.configuration(partitionValue: "masterSchedule"))
//
//    }
//}
