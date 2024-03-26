//
//  Bundle+UnitTest.swift
//  DessertDelightsTests
//
//  Created by Mostafa Mahmoud on 25/03/2024.
//

import Foundation

extension Bundle {
    public class var unitTestForDessertDelightsDessertApiSpy: Bundle {
        return Bundle(for: DessertDelightsDessertApiSuccessSpy.self)
    }
}
