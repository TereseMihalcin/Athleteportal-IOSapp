//
//  AthletePortalApp.swift
//  AthletePortal
//
//  Created by Daniel Williams on 17/03/2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Combine

// This file will contain all of the data models and other 'global' constants

// Realm sync connection
let app = RealmSwift.App(id: "athlete_schedule-vnxji")
// Partition value to use everytime the realm config is passed into a view
let partitionValue = "masterSchedule"

// Schema data model for the an Event
final class Event: Object, ObjectKeyIdentifiable {
    // Unique ID
    @objc dynamic var _id: ObjectId = ObjectId.generate()
    
    // This specific partition key confirms this object will be apart of the main (and only) partition of events
    //      inside the main (and also only) schedule in this application - this schedule is the "All_Events collection in MongoDB
    @objc dynamic var _partitionKey: String = "masterSchedule"
    
    // The type of event that is taking place. Should be one of these:
    //      Practice, Lift, Meeting, Conditioning, Game
    @objc dynamic var title: String? = nil
    
    // Sports team that this event belongs to
    @objc dynamic var team: String = ""
    
    // Facility that the team event is being held at
    @objc dynamic var facility: String = ""
    
    // Date and time when the event begins
    @objc dynamic var startDateTime: Date = Date()
    
    // The date and time when the event ends (time is really the only one needed, but date is kept for special use cases
    @objc dynamic var endDateTime: Date = Date()
    
    // Declaring the _id field as a primary key
    override static func primaryKey() -> String? {
        return "_id"
    }
}

