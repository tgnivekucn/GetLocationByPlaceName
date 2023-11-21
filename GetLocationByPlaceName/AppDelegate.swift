//
//  AppDelegate.swift
//  GetLocationByPlaceName
//
//  Created by SomnicsAndrew on 2023/11/21.
//

import UIKit
import GooglePlaces

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if let cloudKey = getCloudKey() {
            GMSPlacesClient.provideAPIKey(cloudKey)
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

    // MARK: Utilities
    private func getCloudKey() -> String? {
        // Define the name of your custom plist file
        let plistFileName = "custom"

        // Access the main bundle to find the path for your plist
        if let path = Bundle.main.path(forResource: plistFileName, ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {

            // Now you can access values from the dictionary
            // Replace "YourKey" with the actual key you're interested in
            if let value = dict["googleCloudKey"] as? String {
                print(value)
                return value
            } else {
                print("Key not found.")
            }
        } else {
            print("Unable to locate \(plistFileName).plist file or it's not a Dictionary.")
        }
        return nil
    }

}

