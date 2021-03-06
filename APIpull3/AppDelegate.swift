//
//  AppDelegate.swift
//  APIpull3
//
//  Created by Mark Robberts on 2020/07/15.
//  Copyright © 2020 Mark Robberts. All rights reserved.
//

import Amplify
import AmplifyPlugins
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
         Amplify.Logging.logLevel = .verbose
        do {
            // 1
              try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: AmplifyModels()))
            //try Amplify.add(plugin: AWSDataStorePlugin(modelRegistration: AmplifyModels()))
            // 2
            try Amplify.configure()
            print("Amplify initialized successfully")
            
        } catch {
            print("Could not initialize Amplify \(error)")
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

