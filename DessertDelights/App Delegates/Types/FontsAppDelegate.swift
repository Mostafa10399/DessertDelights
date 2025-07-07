//
//  FontsAppDelegate.swift
//  DessertDelights
//
//  Created by Mostafa on 7/2/25.
//

import UIKit
import Commons

final class FontsAppDelegate: AppDelegateType {
    
    static let shared = FontsAppDelegate()
    
    private override init() { }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FontRegisterDelegate.shared.registerFonts()
        return true
    }
}
