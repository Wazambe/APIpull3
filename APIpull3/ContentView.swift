//
//  ContentView.swift
//  APIpull3
//
//  Created by Mark Robberts on 2020/07/15.
//  Copyright © 2020 Mark Robberts. All rights reserved.
//
import Amplify
import SwiftUI

struct ContentView: View {
    
    @State var myUser: FAuser?
    
    
    
    
    
    
    
    
    var body: some View {
        // 1
        VStack {

            // 2
            Spacer()
                .frame(height: 50)
            
            // 3
            VStack {
                Text("Current Balance")
                    .fontWeight(.medium)
                
                Text("$0.00")
                    .font(.system(size: 60))
            }
            
            // 4
            Spacer()
        }
    }
    
    
    
    
    
    // MARK: API Access
    
    func queryUser() {
        print("Query User")
        
        _ = Amplify.API.query(request: .list(LandmarkData.self)) { event in
            switch event {
            case .success(let result):
                print("Landmarks query complete.")
                switch result {
                case .success(let landmarksData):
                    print("Successfully retrieved list of landmarks")
                    for f in landmarksData {
                        let landmark = Landmark.init(from: f)
                        DispatchQueue.main.async() {
                            self.userData.landmarks.append(landmark);
                        }
                    }
                    
                case .failure(let error):
                    print("Can not retrieve result : error  \(error.errorDescription)")
                }
            case .failure(let error):
                print("Can not retrieve landmarks : error \(error)")
            }
        }
    }

    
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
