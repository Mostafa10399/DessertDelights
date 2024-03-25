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
    
    private var homeRootViewModel: HomeRootViewModel?
    
    // MARK: - Methods

    override func setUpWithError() throws {
        self.homeRootViewModel = HomeRootViewModel(
            filterRepository: MainDessertRepository(remoteApi: DessertDelightsDessertApis()),
            goToDessertDetailsView: HomeViewModel())
    }

    override func tearDownWithError() throws {
        homeRootViewModel = nil
    }

    func test_homeRootViewModel_setDesserts_dessertShouldBeAddedSuccessfully() throws {
        // Arrange
        var cancellable: Set<AnyCancellable> = []
        guard let homeRootViewModel = self.homeRootViewModel else {
            XCTFail()
            return }
        // Act
        let expectation = expectation(description: "Set Desserts")
        homeRootViewModel.setDesserts()
        homeRootViewModel.$isDataLoading
            .dropFirst(2)
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 2)
        // Assert
        XCTAssertNotNil(homeRootViewModel.desserts)
    }
    
    
    func test_homeRootViewModel_setDesserts_dessertShouldThrowError() throws {
        // Arrange
        guard let homeRootViewModel = self.homeRootViewModel else {
            XCTFail()
            return }
        // Act
        let expectation = expectation(description: "Throw Error")
        homeRootViewModel.setDesserts()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 2)
        // Assert
        XCTAssertNotNil(homeRootViewModel.desserts)
    }
}
