//
//  GetDessertDetailsUseCase_Tests.swift
//  DessertDelightsTests
//
//  Created by Mostafa Mahmoud on 26/03/2024.
//

import XCTest
import Combine
@testable import DessertDelights

final class GetDessertDetailsUseCase_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    private func makeSutForSuccess() -> GetDessertDetailsUseCase {
        SpyGetDessertDetailsUseCase(dessertRepository: MainDessertRepositorySpy(spy: DessertDelightsDessertApiSuccessSpy()))
    }
    
    private func makeSutForFail() -> GetDessertDetailsUseCase {
        SpyGetDessertDetailsUseCase(dessertRepository: MainDessertRepositorySpy(spy: DessertDelightsDessertApiFailSpy()))
    }
    
    func test_getDessertDetailsUseCase_getDessertDetails_shouldReturnDessertDataSuccessfully() {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSutForSuccess()
            let id = "52893"
            // Act
            let dessertDetails = try await sut.getDessertDetails(by: id) 
            // Assert
            XCTAssertNotNil(dessertDetails)
        }
    }
    
    func test_getDessertDetailsUseCase_getDessertDetails_shouldThrowError() {
        // Arrange
        let sut = makeSutForFail()
        var thrownError: ErrorMessage?
        let errorHandler = { thrownError = $0 }
        let id = "52893"
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

    private class SpyGetDessertDetailsUseCase: GetDessertDetailsUseCase {
        
        // MARK: - Properties
        
        var dessertRepository: DessertDelights.DessertRepository
        
        // MARK: - Methods
        
        init(dessertRepository: DessertDelights.DessertRepository) {
            self.dessertRepository = dessertRepository
        }
    }

}
