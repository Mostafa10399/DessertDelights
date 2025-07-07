//
//  AppDelegateFactory.swift
//  DessertDelights
//
//  Created by Mostafa on 7/2/25.
//


import Foundation

enum AppDelegateFactory {
    
    static var fetchDelegates: AppDelegateType {
        
        CompositeAppDelegate(appDelegates: [
            FontsAppDelegate.shared,
            NavigationAppDelegate.shared
        ])
        
    }
    
}
