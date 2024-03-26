//
//  DessertDetailsViewModel_Tests.swift
//  DessertDelightsTests
//
//  Created by Mostafa Mahmoud on 26/03/2024.
//

import XCTest
import Combine
@testable import DessertDelights

final class DessertDetailsViewModel_Tests: XCTestCase {

    var cancellable: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    private func makeSut(id: String) -> DessertDetailsViewModel {
        DessertDetailsViewModel(
            dessertId: id,
            dessertRepository: MainDessertRepositorySpy(spy: DessertDelightsDessertApiSuccessSpy()))
    }
    
    func test_dessertDetailsViewModel_fetchDessertDetails_shouldReturnDataSuccessfully() throws {
        // Arrange
        let sut = self.makeSut(id: "52893")
        // Act
        let expectation = expectation(description: #function)
        sut.fetchDessertDetails()
        sut.$isDataLoading
            .dropFirst(2)
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 2)
        // Assert
        XCTAssertNil(sut.errorMessage)
    }
    
    func test_dessertDetailsViewModel_fetchDessertDetails_shouldThrowError() throws {
        // Arrange
        let sut = DessertDetailsViewModel(
            dessertId: "52893",
            dessertRepository: MainDessertRepositorySpy(spy: DessertDelightsDessertApiFailSpy()))
        // Act
        let expectation = expectation(description: #function)
        sut.fetchDessertDetails()
        sut.$isDataLoading
            .dropFirst(2)
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 2)
        // Assert
        XCTAssertNotNil(sut.errorMessage)
    }
    
    func test_dessertDetailsViewModel_setIsDataLoading_shouldBeTrue() throws {
        // Arrange
        let sut = self.makeSut(id: "52893")
        let isDataLoading = true
        // Act
        let expectation = expectation(description: #function)
        sut.setIsDataLoading(isDataLoading)
        sut.$isDataLoading
            .dropFirst()
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 2)
        // Assert
        XCTAssertTrue(sut.isDataLoading)
    }
    
    func test_dessertDetailsViewModel_setIsDataLoading_shouldBeFalse() throws {
        // Arrange
        let sut = self.makeSut(id: "52893")
        let isDataLoading = false
        // Act
        let expectation = expectation(description: #function)
        sut.setIsDataLoading(isDataLoading)
        sut.$isDataLoading
            .dropFirst()
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 2)
        // Assert
        XCTAssertFalse(sut.isDataLoading)
    }
    
    func test_dessertDetailsViewModel_setErrorMessage_errorMessageShouldHaveValue() throws {
        // Arrange
        let sut = self.makeSut(id: "52893")
        let errorMessage = ErrorMessage(title: "title", message: "Message")
        // Act
        let expectation = expectation(description: #function)
        sut.setErrorMessage(errorMessage)
        sut.$errorMessage
            .dropFirst()
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 2)
        // Assert
        XCTAssertNotNil(sut.errorMessage)
    }
    
    func test_dessertDetailsViewModel_setErrorMessage_errorMessageShouldBeNil() throws {
        // Arrange
        let sut = self.makeSut(id: "52893")
        // Act
        let expectation = expectation(description: #function)
        sut.setErrorMessage(nil)
        sut.$errorMessage
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 2)
        // Assert
        XCTAssertNil(sut.errorMessage)
    }

    func test_dessertDetailsViewModel_didTapOnTryAgain_shouldGetDessertsSuccessfullyWhenTappingOnTryAgain() throws {
        // Arrange
        let sut = self.makeSut(id: "52893")
        let expectation = expectation(description: #function)
        // Act
        sut.didTapOnTryAgain()
        sut.$isDataLoading
            .dropFirst(2)
            .sink { data in
                print(data)
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 2)
        // Assert
        XCTAssertNil(sut.errorMessage)
    }
    
    func test_dessertDetailsViewModel_didTapOnTryAgain_shouldFailAndThrowError() throws {
        // Arrange
        let sut = DessertDetailsViewModel(
            dessertId: "52893",
            dessertRepository: MainDessertRepositorySpy(spy: DessertDelightsDessertApiFailSpy()))
        let expectation = expectation(description: #function)
        // Act
        sut.didTapOnTryAgain()
        sut.$isDataLoading
            .dropFirst(2)
            .sink { data in
                print(data)
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 2)
        // Assert
        XCTAssertNotNil(sut.errorMessage)
    }

}
