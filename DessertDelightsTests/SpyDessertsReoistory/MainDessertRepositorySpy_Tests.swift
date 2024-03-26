//
//  MainDessertRepositorySpy_Tests.swift
//  DessertDelightsTests
//
//  Created by Mostafa Mahmoud on 25/03/2024.
//

import XCTest
@testable import DessertDelights

final class MainDessertRepositorySpy_Tests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    private func makeSut(spy: DessertApis) -> DessertRepository {
        MainDessertRepositorySpy(spy: spy)
    }
    
    private func makeSuccessDessertApis() -> DessertApis {
        DessertDelightsDessertApiSuccessSpy()
    }
    
    private func makeFailDessertApis() -> DessertApis {
        DessertDelightsDessertApiFailSpy()
    }
    
    func test_MainDessertRepositorySpy_getAllDesserts_shouldCheckDessertCount() throws {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSut(spy: strongSelf.makeSuccessDessertApis())
            // Act
            let desserts = try await sut.getAllDesserts().meals
            // Assert
            XCTAssertEqual(desserts.count, 65)
        }
    }
    
    func test_MainDessertRepositorySpy_getAllDesserts_shouldThrowError() throws {
        // Arrange
        let sut = makeSut(spy: makeFailDessertApis())
        var thrownError: ErrorMessage?
        let errorHandler = { thrownError = $0 }
        let exp = XCTestExpectation(description: #function)
        // Act
        Task {
            do {
                _ = try await sut.getAllDesserts()
                XCTFail()
            } catch let errorMessage as ErrorMessage {
                errorHandler(errorMessage)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 2)
        // Assert
        if let error = thrownError {
            XCTAssertNoThrow(error)
        } else {
            XCTFail()
        }
    }
    
    func test_MainDessertRepositorySpy_getDessertDetails_shouldThrowError() throws {
        
        // Arrange
        let sut = makeSut(spy: makeFailDessertApis())
        let id = "52893"
        var thrownError: ErrorMessage?
        let errorHandler = { thrownError = $0 }
        let exp = XCTestExpectation(description: #function)
        // Act
        Task {
            do {
                _ = try await sut.getDessertDetails(by: id)
                XCTFail()
            } catch let errorMessage as ErrorMessage {
                errorHandler(errorMessage)
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
        // Assert
        if let error = thrownError {
            XCTAssertNoThrow(error)
        } else {
            XCTFail()
        }
    }
    
    func test_MainDessertRepositorySpy_getDessertDetails_getDessertDetailsSusseffully() throws {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let id = "52893"
            let sut = strongSelf.makeSut(spy: strongSelf.makeSuccessDessertApis())
            // Act
            let dessertDetails = try await sut.getDessertDetails(by: id)
            let dessertId = (dessertDetails.meals[0]["idMeal"] ?? "") ?? ""
            // Assert
            XCTAssertEqual(id, dessertId)
        }
    }
    
    

}




