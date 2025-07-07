//
//  NavigationAppDelegate.swift
//  DessertDelights
//
//  Created by Mostafa on 7/2/25.
//

import UIKit

class NavigationAppDelegate: AppDelegateType {
    
    // MARK: - Properties
    
    static let shared = NavigationAppDelegate()
        
    var window: UIWindow?
    let mainDependencyContainer = MainDependencyContainer()
    
    // MARK: - Methods
    
    private override init() { }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        setupRootController(
            controller: mainDependencyContainer.makeMainNavigationController(),
            navigationBarHidden: true)
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return UIDevice.current.userInterfaceIdiom == .phone ? .portrait : .all
    }
    
}

extension NavigationAppDelegate{
    private func setupRootController(controller: UIViewController, navigationBarHidden: Bool) {
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
