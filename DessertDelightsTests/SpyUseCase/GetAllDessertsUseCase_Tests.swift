//
//  GetAllDessertsUseCase_Tests.swift
//  DessertDelightsTests
//
//  Created by Mostafa Mahmoud on 26/03/2024.
//

import XCTest
@testable import DessertDelights

final class GetAllDessertsUseCase_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    private func makeSut() -> GetAllDessertsUseCase {
        SpyGetAllDessertsUseCase(dessertRepository: MainDessertRepositorySpy(spy: DessertDelightsDessertApiSpy()))
    }
    
    func test_GetAllDessertUseCase_getAllDesserts_shouldReturnDessertsSuccessffully() {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSut()
            // Act
            let desserts = try await sut.getAllDesserts()
            // Assert
            XCTAssertEqual(desserts.count, 65)
        }
    }
    
    func test_GetAllDessertUseCase_getAllDesserts_shouldReturnDessertsSorrtedAlphapeticcly() {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSut()
            // Act
            let desserts = try await sut.getAllDesserts().map({ $0.id })
            let meals = try await sut.dessertRepository.getAllDesserts()
            let dessertsSorted = meals.meals.map { DessertPresentable(meal: $0) }.sorted { $0.dessertName.lowercased() < $1.dessertName.lowercased() }.map { $0.id }
            // Assert
            XCTAssertEqual(desserts, dessertsSorted)
        }
    }
    
    
    private class SpyGetAllDessertsUseCase: GetAllDessertsUseCase {
        
        // MARK: - Properties
        
        var dessertRepository: DessertDelights.DessertRepository
        
        // MARK: - Methods
        
        init(dessertRepository: DessertDelights.DessertRepository) {
            self.dessertRepository = dessertRepository
        }
    }

}
