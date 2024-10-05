//
//  Bundle+UnitTest.swift
//  
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation

extension Bundle {
    public class var unitTestForDessertDelightsDessertApiSpy: Bundle {
        return Bundle(for: DessertDelightsDessertApiSuccessSpy.self)
    }
}
