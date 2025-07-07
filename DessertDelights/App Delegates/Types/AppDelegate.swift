//
//  DessertDelightsApp.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 21/03/2024.
//

import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Stored properties
    
    var window: UIWindow?
    
    /// Holds the app delegates
    private let appDelegate = AppDelegateFactory.fetchDelegates
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appDelegate.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? false
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        appDelegate.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
   
}

// MARK: - Application Lifecycle methods
extension AppDelegate {
    
    func applicationWillResignActive(_ application: UIApplication) {
        appDelegate.applicationWillResignActive?(application)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        appDelegate.applicationDidEnterBackground?(application)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        appDelegate.applicationWillEnterForeground?(application)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        appDelegate.applicationDidBecomeActive?(application)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        appDelegate.applicationWillTerminate?(application)
    }
    
}

// MARK: - URL Schemes

extension AppDelegate {
            
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        appDelegate.application?(app, open: url, options: options) ?? false
    }
    
}

// MARK: - Background fetch delegate

extension AppDelegate {
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        appDelegate.application?(application, performFetchWithCompletionHandler: completionHandler)
    }
   
}
