//
//  AthletePortalApp.swift
//  AthletePortal
//
//  Created by Daniel Williams on 17/03/2021.
//

import SwiftUI
import RealmSwift
import Combine

// This file will contain all of the data models and the Realm sync connection

// Realm sync connection
let app: RealmSwift.App? = RealmSwift.App(id: "athlete_scheduling-tfwgg")

// Defining the model for an Event
final class Event: Object, ObjectKeyIdentifiable {
    // Unique ID
    @objc dynamic var _id = ObjectId.generate()
    
    // The facility where the event will take place
    @objc dynamic var facility = ""
    
    // The team that is associated with the event (will be updated further when users are implemented)
    @objc dynamic var team = ""
    
    // The type of event that is taking place. Should be one of these:
    //      Practice, Lift, Meeting, Conditioning, Game
    @objc dynamic var eventType = ""
    
    // The date and time when this event starts
    @objc dynamic var startDateTime = Date()
    
    // The date and time when the event ends
    @objc dynamic var endDateTime = Date()
    
    // The backlink to the master schedule all events are apart of
    let schedule = LinkingObjects(fromType: Schedule.self, property: "events")
    
    // Declares the _id field as the primary key to the realm
    override class func primaryKey() -> String? {
        "_id"
    }
}

// Defining the model for the Schedule
final class Schedule: Object, ObjectKeyIdentifiable {
    // Unique ID
    @objc dynamic var _id = ObjectId.generate()
    
    // the collection of Events in this schedule
    var events = RealmSwift.List<Event>()
    
    // Declares the _id field as the primary key to the realm
    override class func primaryKey() -> String? {
        "_id"
    }
}

