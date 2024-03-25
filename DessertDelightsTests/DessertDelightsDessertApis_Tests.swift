//
//  DessertDelightsDessertApis_Tests.swift
//  DessertDelightsTests
//
//  Created by Mostafa Mahmoud on 25/03/2024.
//

import XCTest
@testable import DessertDelights

final class DessertDelightsDessertApis_Tests: XCTestCase {
    
    var sut: DessertApis?

    override func setUpWithError() throws {
        self.sut = DessertDelightsDessertApis()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
//    func test_dessertDelightsDessertApis_getDesserts_shouldReturnListOfDesserts() throws {
//        // Arrange
//        guard let sut = sut, let dessertListPath = Bundle.unitTest.path(forResource: "DessertsList", ofType: "json") else {
//            XCTFail()
//            return
//        }
//        let expectation = XCTestExpectation(description: #function)
//        dessertsApi.
//        
//    }

}
