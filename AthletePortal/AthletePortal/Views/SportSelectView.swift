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
    ["--Choose a Sport--", "Football","Volleyball", "Baseball", "Softball", "Mens Lacrosse","Womens Lacrosse", "Mens Soccer", "Womens Soccer", "Mens T&F", "Womens T&F", "Mens Cross Country", "Womens Cross Country", "Field Hockey", "Golf", "Tennis", "Mens Basketball", "Womens Basketball"]
            
    var body: some View {
        
        NavigationView{
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

                if (sportIndex == "--Choose a Sport--") {
                    Text("Please choose a sport!")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.yellow)
                        .font(.title2)
                } else {
                    NavigationLink(
                        destination: HomeScheduleView()
                            .environment(\.realmConfiguration,
                                         app.currentUser!.configuration(partitionValue: partitionValue))
                            .onAppear(perform: {
                                environmentModel.currentSport = sportIndex
                            })
                    ){
                        Text("Login as \(sportIndex) Coach")
                            .frame(width: 250.0, height: 65.0)
                            .padding(20)
                            .font(.title2)
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(3)
                            .navigationBarHidden(true)
                    }
                }
                    
                
            }
        }
    }
}
 

// For some reason I think I was able to get the other previews working, but this one does not work and I have no idea why

struct SportSelectView_Previews: PreviewProvider {
    static var previews: some View {
        SportSelectView()
            .preferredColorScheme(.dark)
            .environment(\.realmConfiguration,
                         app.currentUser!.configuration(partitionValue: partitionValue))
    }
}
