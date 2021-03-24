//
//  Event.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import Foundation

struct Event: Hashable, Codable, Identifiable {
    var id: Int
    var facility: String
    // This will be one of a few predefined strings/names that will be selected from a dropdown in the form to schedule
    //      The selectable facilities will be:
    //      Mckenna, Sullivan, Field House, Sullivan Lounge, Softball field, Baseball field, Practice Football field, Soccer field, Grass field
    var team: String
    // This will be decided on based on what team a user selects in the SportSelectView
    var eventType: String
    // This will be one of a few predefined strings/types of events and will also be selected from a dropdown in the form
    //      The selectable event types are:
    //      Practice, Lift, Meeting, Conditioning, Game
    var startTime: Date
    var endTime: Date
    // Logic will be created that checks the time between startTime and endTime, and will reference that difference when creating a new Event
    //      This logic should only be needed once (when making a new Event), so it will only be contained in that function inside ScheduleModel.swift
    
}
