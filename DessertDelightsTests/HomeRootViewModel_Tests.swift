//
//  HomeRootViewModel_Tests.swift
//  DessertDelightsTests
//
//  Created by Mostafa Mahmoud on 24/03/2024.
//

import XCTest
import Combine
@testable import DessertDelights

final class HomeRootViewModel_Tests: XCTestCase {
    
    // MARK: - Properties
    
    var cancellable: Set<AnyCancellable> = []
    
    // MARK: - Methods

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    private func makeSut() -> HomeRootViewModel {
        HomeRootViewModel(
            dessertRepository: MainDessertRepositorySpy(spy: DessertDelightsDessertApiSpy()),
            goToDessertDetailsView: HomeViewModel())
    }
    
    func test_homeRootViewModel_notSetDesserts_whenNotCallingTheEndPoint() throws {
        // Arrange
        let homeRootViewModel = self.makeSut()
        // Act
        let expectation = expectation(description: "Set Desserts")
        homeRootViewModel.$isDataLoading
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 2)
        // Assert
        XCTAssertNil(homeRootViewModel.desserts)
    }

    func test_homeRootViewModel_setDesserts_dessertShouldBeAddedSuccessfully() throws {
        // Arrange
        let sut = self.makeSut()
        // Act
        let expectation = expectation(description: "Set Desserts")
        sut.setDesserts()
        sut.$isDataLoading
            .dropFirst(2)
            .sink { _ in
                expectation.fulfill()
                
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 2)
        guard let dessert = sut.desserts else {
            XCTFail()
            return
        }
        // Assert
        XCTAssertEqual(dessert.count, 65)
    }
    
    func test_homeRootViewModel_setIsDataLoading_shouldBeTrue() throws {
        // Arrange
        let sut = self.makeSut()
        let isDataLoading = true
        // Act
        let expectation = expectation(description: "Set Desserts")
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
    
    func test_homeRootViewModel_setIsDataLoading_shouldBeFalse() throws {
        // Arrange
        let sut = self.makeSut()
        let isDataLoading = false
        // Act
        let expectation = expectation(description: "Set Desserts")
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
    
    func test_homeRootViewModel_setErrorMessage_errorMessageShouldHaveValue() throws {
        // Arrange
        let sut = self.makeSut()
        let errorMessage = ErrorMessage(title: "title", message: "Message")
        // Act
        let expectation = expectation(description: "Set Desserts")
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
    
    func test_homeRootViewModel_setErrorMessage_errorMessageShouldBeNil() throws {
        // Arrange
        let sut = self.makeSut()
        // Act
        let expectation = expectation(description: "Set Desserts")
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
    
}
