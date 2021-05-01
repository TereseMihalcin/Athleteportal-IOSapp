//
//  NavContentView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 25/04/2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Combine

struct NavContentView: View {
    // Environment Object to help keep track of sports team
    @EnvironmentObject var environmentModel: EnvironmentModel
    
    // Results containing all events from the database - var will be used when creating schedule list
    @ObservedResults(Event.self) var events
    
    // Instance of the realm that may or may not be necessary when loading all of the separate views (not entirely sure)
    @Environment(\.realm) var eventRealm
    
    var body: some View {
        
        VStack(alignment: .leading){
                    
            // Dashboard/HomeScheduleView nav
            NavigationLink(
                destination: HomeScheduleView()
                    .environment(\.realmConfiguration,
                                 app.currentUser!.configuration(partitionValue: partitionValue))
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            ){
                HStack{
                    Image(systemName: "house")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    Text("Dashboard/Calendar")
                        .foregroundColor(.white)
                        .font(.headline)
                }.padding(.top, 100)
            }
            // PracticeView nav
            NavigationLink(
                destination: PracticeView()
                    .environment(\.realmConfiguration,
                                 app.currentUser!.configuration(partitionValue: partitionValue))
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            ){
                HStack{
                    Image(systemName: "person.3")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    Text("Practices")
                        .foregroundColor(.white)
                        .font(.headline)
                }.padding(.top, 30)
            }
            // ScheduleFormView nav
            NavigationLink(
                destination: ScheduleFormView()
                    .environment(\.realmConfiguration,
                                 app.currentUser!.configuration(partitionValue: partitionValue))
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                    .zIndex(1)
            ){
                HStack{
                    Image(systemName: "plus.circle")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    Text("Schedule Event")
                        .foregroundColor(.white)
                        .font(.headline)
                }.padding(.top, 30)
            }
            // List of 'coming soon' features
            HStack {
                Image(systemName: "sportscourt")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("Game Day      (coming soon)")
                    .foregroundColor(.white)
                    .font(.headline)
            }
                .padding(.top, 30)
            HStack {
                Image(systemName: "cross.case")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("Testing       (coming soon)")
                    .foregroundColor(.white)
                    .font(.headline)
            }
                .padding(.top, 30)
            HStack {
                Image(systemName: "bell")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("Notifications (coming soon)")
                    .foregroundColor(.white)
                    .font(.headline)
        }
                .padding(.top, 30)
            HStack {
                Image(systemName: "newspaper")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("News (coming soon)")
                    .foregroundColor(.white)
                    .font(.headline)
        }
                .padding(.top, 30)
                Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red:32/255, green:32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
            
        
    }
}

struct NavContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavContentView()
    }
}
