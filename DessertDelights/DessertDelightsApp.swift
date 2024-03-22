//
//  DessertDelightsApp.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 21/03/2024.
//

import SwiftUI

@main
class AppDelegate: NSObject, UIApplicationDelegate {
    
    // MARK: - Properties
    
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    let mainDependencyContainer = MainDependencyContainer()
    
    // MARK: - Methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupRootController(
            controller: mainDependencyContainer.makeMainNavigationController(),
            navigationBarHidden: true)
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return UIDevice.current.userInterfaceIdiom == .phone ? .portrait : .all
    }
    
}

extension AppDelegate{
    func setupRootController(controller: UIViewController, navigationBarHidden: Bool) {
            if let window = self.window {
                window.rootViewController = controller
                window.makeKeyAndVisible()
            }
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
            UINavigationBar.appearance().isHidden = navigationBarHidden
        }
}
