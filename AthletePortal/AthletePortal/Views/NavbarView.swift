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
    // Environment Object to help keep track of sports team
    @EnvironmentObject var environmentModel: EnvironmentModel
    
    // Instance of the realm that may or may not be necessary when loading all of the separate views (not entirely sure)
    @Environment(\.realm) var eventRealm
    
    var body: some View {
        
        // This nav bar will always be located at the top of the applicatio, regardless of what specific view the user is looking at
        
        // Replace this with the actual UI code:
        Text("Navbar View")
        
    }
}

struct NavbarView_Previews: PreviewProvider {
    static var previews: some View {
        NavbarView()
    }
}
