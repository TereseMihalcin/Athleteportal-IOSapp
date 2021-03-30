//
//  EnvironmentModel.swift
//  AthletePortal
//
//  Created by Daniel Williams on 29/03/2021.
//

import Foundation

class EnvironmentModel: ObservableObject {
    
    // This class is to contain certain aspects of the app that are necessary to manipulating the views and pieces of the app
    //      that cannot be tracked/managed by MongoDB
    
    // This will contain whatever sport is currently logged in. It will update upon logging in with SporSelectView, and will be referenced when
    //      events are created later on
    @Published var currentSport: String = ""
    
    // This will be the DateFormatter that is used to display the startTime and endTime of events inside views
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .short
        df.timeZone = .current
        return df
    }()

    
    
}
