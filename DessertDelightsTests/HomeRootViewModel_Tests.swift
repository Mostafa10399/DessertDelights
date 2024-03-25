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
    var cancellable: Set<AnyCancellable> = []
    
    // MARK: - Methods

    override func setUpWithError() throws {
        self.homeRootViewModel = HomeRootViewModel(
            dessertRepository: MainDessertRepository(remoteApi: DessertDelightsDessertApis()),
            goToDessertDetailsView: HomeViewModel())
    }

    override func tearDownWithError() throws {
        homeRootViewModel = nil
    }
    
    func test_homeRootViewModel_notSetDesserts_whenNotCallingTheEndPoint() throws {
        // Arrange
        guard let homeRootViewModel = self.homeRootViewModel else {
            XCTFail()
            return }
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
    
}
