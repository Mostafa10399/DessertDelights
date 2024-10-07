//
//  MainDessertRepositorySpy_Tests.swift
//  
//
//  Created by Mostafa Mahmoud on 07/10/2024.
//

import XCTest
import protocol CoreKit.DessertRepository
import protocol CoreKit.DessertApis
import class CoreKit.MainDessertRepository
import enum NetworkLayer.APIError

final class MainDessertRepositorySpy_Tests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    private func makeSut(shouldSimulateFailure: Bool = false) -> DessertRepository {
        MainDessertRepository(remoteApi: SpyDessertDelightsDessertApis(shouldSimulateFailure: shouldSimulateFailure))
    }

    func test_MainDessertRepositorySpy_getAllDesserts_successFetchingData() async throws {
            // Arrange
            let sut = self.makeSut()
            // Act
            let desserts = try await sut.getAllDesserts()
            // Assert
            XCTAssertEqual(desserts.count, 65)
    }
    
    func test_MainDessertRepositorySpy_getAllDesserts_shouldThrowErrorBecauseOfDecodingError() async throws {
        // Arrange
        let sut = makeSut(shouldSimulateFailure: true)
        let expectedResult = APIError.decodingError
        // Act
        do {
            let _ = try await sut.getAllDesserts()
            XCTFail("It should not success")
        } catch let error as APIError {
            XCTAssertEqual(error.localizedDescription, expectedResult.localizedDescription)
        }
    }
    
    func test_MainDessertRepositorySpy_getDessertDetails_withBadId() async throws {
        // Arrange
        let sut = makeSut()
        let id = "528934"
        // Act
        let details = try! await sut.getDessertDetails(by: id)
        // Assert
        XCTAssertNotEqual(details.desert["idMeal"], id)
    }
    
    func test_MainDessertRepositorySpy_getDessertDetails_getBadData() async throws {
        // Arrange
        let sut = makeSut(shouldSimulateFailure: true)
        let id = "52893"
        // Act
        do {
            let _ = try await sut.getDessertDetails(by: id)
        // Assert
            XCTFail("It should not success")
        } catch let error as APIError {
            XCTAssertEqual(error.localizedDescription, APIError.decodingError.localizedDescription)
        }
    }
    
    func test_MainDessertRepositorySpy_getDessertDetails_getDessertDetailsSusseffully() async throws {
            // Arrange
            let id = "52893"
            let sut = makeSut()
            // Act
            let dessertDetails = try await sut.getDessertDetails(by: id)
            let dessertId = (dessertDetails.desert["idMeal"] ?? "") ?? ""
            // Assert
            XCTAssertEqual(id, dessertId)
    }
}




