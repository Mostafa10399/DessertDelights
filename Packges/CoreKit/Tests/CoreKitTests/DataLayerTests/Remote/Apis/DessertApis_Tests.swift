//
//  MainDessertApis_Tests.swift
//
//
//  Created by Mostafa Mahmoud on 05/10/2024.
//

import Foundation
import XCTest
import protocol CoreKit.DessertApis
import struct CoreKit.Meals
import struct CoreKit.Meal
import struct CoreKit.MealDetails

final class DessertApis_Tests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func test_DessertApis_getAllDesserts_getDataSuccessfully() async {
        // Arrange
        let sut = makeSut()
        // Act
        do {
            let desserts = try await sut.getAllDesserts().meals
            // Assert
            XCTAssertEqual(desserts.count, 65)
        } catch {
            // Assert
            XCTFail(error.localizedDescription)
        }
    }
    
    func test_DessertApis_getDessertDetails_getDataSuccessfully() async {
        // Arrange
        let sut = makeSut()
        // Act
        do {
            let dessertId = try await sut.getDessertDetails(by: "52893")
                .details
                .desert["idMeal"]
            // Assert
            XCTAssertEqual(dessertId, "52893")
        } catch {
            // Assert
            XCTFail(error.localizedDescription)
        }
    }
    
    private func makeSut() -> DessertApis {
        SpyDessertDelightsDessertApis()
    }
    
}


