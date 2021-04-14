//
//  SyncContentView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 29/03/2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Combine

struct SyncContentView: View {
    // Observe the Realm app object in order to react to login state changes
    @ObservedObject var app: RealmSwift.App
    
    var body: AnyView {
        
        return AnyView(SportSelectView()
            .environment(\.realmConfiguration,
                         app.currentUser!.configuration(partitionValue: partitionValue)))
        
    }
        
}

