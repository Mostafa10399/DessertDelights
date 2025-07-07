//
//  CompositeAppDelegate.swift
//  DessertDelights
//
//  Created by Mostafa on 7/2/25.
//


import UIKit

final class CompositeAppDelegate: AppDelegateType {
    
    private let appDelegates: [AppDelegateType]
    
    internal init(appDelegates: [AppDelegateType]) {
        self.appDelegates = appDelegates
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        /// We are handling here a case when, in worst case scenario, `didFinishLaunchingWithOptions` returns `false` like in case of a jailbroken device
        
        // Indicates whether the app launch was succesful
        var shouldTheAppLaunch = true
        
        appDelegates.forEach { specificAppDelegate in

            guard specificAppDelegate.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? false else {

                // Disabling the app launch because some delegate return false for the launch of the app
                shouldTheAppLaunch = false
                return
            }
            
        }
        
        return shouldTheAppLaunch
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        appDelegates.forEach { $0.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken) }
    }
    
}

// MARK: - Lifecycle methods
extension CompositeAppDelegate {
    
    func applicationWillResignActive(_ application: UIApplication) {
        
        appDelegates.forEach { $0.applicationWillResignActive?(application) }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    
        appDelegates.forEach { $0.applicationDidEnterBackground?(application) }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
        appDelegates.forEach { $0.applicationWillEnterForeground?(application) }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
        appDelegates.forEach { $0.applicationDidBecomeActive?(application) }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        appDelegates.forEach { $0.applicationWillTerminate?(application) }
    }
    
}