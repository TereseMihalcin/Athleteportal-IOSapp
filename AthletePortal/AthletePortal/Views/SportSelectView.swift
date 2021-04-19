//
//  SportSelectView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Combine

struct SportSelectView: View {
    @EnvironmentObject var environmentModel: EnvironmentModel
    
    // The realm we are working in
    @Environment(\.realm) var realm
    
    // Results containing all events from the database - var will be used when creating schedule list
    @ObservedResults(Event.self) var events
    
    //variable for index of each sport
    @State private var sportIndex = "--Choose a Sport--"
    
//facilities array
var sports =
    ["--Choose a Sport Sport--", "Football","Volleyball", "Baseball", "Softball", "Mens Lacrosse","Womens Lacrosse", "Mens Soccer", "Womens Soccer", "Mens T&F", "Womens T&F", "Mens Cross Country", "Womens Cross Country","Field Hockey", "Golf", "Tennis", "Mens Basketball", "Womens Basketball"]
            
    var body: some View {
        
        
        VStack{
            //title
            Text("Select Your Sport")
                .fontWeight(.black)
                .frame(width: 320.0, height: 50.0)
                .font(.largeTitle)
                .padding(20)
                //.background(Color.pink)
                .cornerRadius(10)
                .foregroundColor(Color.red)
                
            
            //picker item
            Section {
                Picker (selection : $sportIndex, label :
                            Text("Sports")) {
                    ForEach(sports, id: \.self) {
                        Text($0)
                    }
                }
            }
            .padding(10.0)
            .position(x: 160, y: 150)
            
            NavigationView{
            Button( action: {
            })
            {
             
                
                Text("Login as \(sportIndex) Coach")
                    .frame(width: 200.0, height: 50.0)
                    .padding(20)
                    .font(.title2)
                    .background(Color.green)
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
                    .position(x: 160, y:50)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    
                
            }
                environmentModel.currentSport = sportIndex
                NavigationLink("", destination: HomeScheduleView()
                    .environment(\.realmConfiguration,
                                 app.currentUser!.configuration(partitionValue: partitionValue)))
            }
            
        }
    }
}
        
        // This view will be the initial screen viewed upon opening the app. It will prompt the user to select a sport, and then upon selecting a sport, it will authenticate them as their sports respective coach, this will then be stored for convenience sake when showing schedules and scheduling new events
        // While we are using authenticating users on the backend, they are technically anonymous, and their sport is being saved in an @EnvironmentObject for later use
        
        
        //I just commented out what you had origionally dan just in case I messed something up
       // NavigationView {
           // VStack {
                // FRONTEND PEOPLE WORKING ON THIS VIEW: Lines 29-34 contain everything needed to create one login button for one sport (in this case, baseball)
                //      In order to make a button for every sport, lines 29-34 just need to be copied and pasted, with the text displaying a team name needing changed
                //          on each one (aka, wherever is says 'baseball'
                // Button("Login as Baseball Coach",action: {
                  //  environmentModel.currentSport = "Baseball"
                  //  NavigationLink("", destination: HomeScheduleView()
                       // .environment(\.realmConfiguration,
                                    // app.currentUser!.configuration(partitionValue: partitionValue)))
              //  })
                
           // }
       // }
        
 

// For some reason I think I was able to get the other previews working, but this one does not work and I have no idea why

//struct SportSelectView_Previews: PreviewProvider {
//    static var previews: some View {
//        SportSelectView()
//            .preferredColorScheme(.dark)
//    }
//}
