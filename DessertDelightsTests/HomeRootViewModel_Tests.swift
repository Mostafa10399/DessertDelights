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
            dessertRepository: MainDessertRepositorySpy(spy: DessertDelightsDessertApiSuccessSpy()),
            goToDessertDetailsView: HomeViewModel())
    }
    
    func test_homeRootViewModel_notSetDesserts_whenNotCallingTheEndPoint() throws {
        // Arrange
        let homeRootViewModel = self.makeSut()
        let expectation = expectation(description: "Set Desserts")
        // Act
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
        let expectation = expectation(description: "Set Desserts")
        // Act
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
    
    func test_homeRootViewModel_setDesserts_shouldThrowError() throws {
        // Arrange
        let sut = HomeRootViewModel(
            dessertRepository: MainDessertRepositorySpy(spy: DessertDelightsDessertApiFailSpy()),
            goToDessertDetailsView: HomeViewModel())
        var errorMessage: ErrorMessage?
        let expectation = expectation(description: "Set Desserts")
        // Act
        sut.setDesserts()
        sut.$errorMessage
            .dropFirst()
            .sink { error in
                errorMessage = error
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 2)
        // Assert
        XCTAssertNotNil(errorMessage)
    }
    
    func test_homeRootViewModel_setIsDataLoading_shouldBeTrue() throws {
        // Arrange
        let sut = self.makeSut()
        let isDataLoading = true
        let expectation = expectation(description: "Set Desserts")
        // Act
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
        let expectation = expectation(description: "Set Desserts")
        // Act
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
        let expectation = expectation(description: #function)
        // Act
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
        let expectation = expectation(description: "Set Desserts")
        // Act
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
    
    func test_homeRootViewModel_didTapOnTryAgain_shouldGetDessertsSuccessfullyWhenTappingOnTryAgain() throws {
        // Arrange
        let sut = self.makeSut()
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
        guard let desserts = sut.desserts else {
            XCTFail()
            return
        }
        XCTAssertEqual(desserts.count, 65)
    }
    
}
