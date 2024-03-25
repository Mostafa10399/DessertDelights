//
//  Bundle+UnitTest.swift
//  DessertDelightsTests
//
//  Created by Mostafa Mahmoud on 25/03/2024.
//

import Foundation

extension Bundle {
    public class var unitTestForDessertDelightsDessertApi: Bundle {
        return Bundle(for: DessertDelightsDessertApis_Tests.self)
    }
    public class var unitTestForMainDessertRepositorySpy: Bundle {
        return Bundle(for: MainDessertRepositorySpy_Tests.self)
    }
}
