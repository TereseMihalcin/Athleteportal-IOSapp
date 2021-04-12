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

// Global Constants:
// Realm sync connection
let app = RealmSwift.App(id: "athlete_schedule-vnxji")
// Partition value to use everytime the realm config is passed into a view
let partitionValue = "masterSchedule"

// CURRENT EVENT MODEL (SHOULD BE ACCURATE)
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


// PREVIOUS EVENT MODEL - NOT VALID/ACCURATE

//// Defining the model for an Event
//final class Event: Object, ObjectKeyIdentifiable {
//    // Unique ID
//    @objc dynamic var _id = ObjectId.generate()
//
//    // This specific partition key confirms this object will be apart of the main (and only) partition of events
//    //      inside the main (and also only) schedule in this application
//    // I didn't realize how it worked exactly when I configured it, so now it's this complex value lol
//    @objc dynamic var _partitionKey = "606fc670d9d5247b507457a2"
//
//    // The type of event that is taking place. Should be one of these:
//    //      Practice, Lift, Meeting, Conditioning, Game
//    @objc dynamic var title = ""
//
//    // The facility where the event will take place
//    @objc dynamic var facility = ""
//
//    // The team that is associated with the event (will be updated further when users are implemented)
//    @objc dynamic var team = ""
//
//    // The date and time when this event starts
//    @objc dynamic var startDateTime = Date()
//
//    // The date and time when the event ends
//    @objc dynamic var endDateTime = Date()
//
//    // The backlink to the master schedule all events are apart of
//    let schedule = LinkingObjects(fromType: Schedule.self, property: "events")
//
//    // Declares the _id field as the primary key to the realm
//    override class func primaryKey() -> String? {
//        "_id"
//    }
//}


// ORIGINAL DATA MODEL FOR SCHEDULE - DONT THINK ITS NEEDED FOR THIS APP

//final class Schedule: Object, ObjectKeyIdentifiable {
//    // Unique ID
//    @objc dynamic var _id = ObjectId.generate()
//
//    // This specific partition key confirms this object will be apart of the main (and only) schedule partition
//    // I didn't realize how it worked exactly when I configured it, so now it's this complex value lol
//    @objc dynamic var _partitionKey = "606fc670d9d5247b507457a2"
//
//    // the collection of Events in this schedule
//    var events = RealmSwift.List<Event>()
//
//    // Declares the _id field as the primary key to the realm
//    override class func primaryKey() -> String? {
//        "_id"
//    }
//}

