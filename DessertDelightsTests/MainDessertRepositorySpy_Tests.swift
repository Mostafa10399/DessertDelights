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
    
    private func makeSut() -> DessertRepository {
        MainDessertRepositorySpy(spy: DessertDelightsDessertApiSpy())
    }
    
    func test_MainDessertRepositorySpy_getAllDesserts_shouldReturnDessertCount() throws {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSut()
            // Act
            let desserts = try await sut.getAllDesserts().meals
            // Assert
            XCTAssertEqual(desserts.count, 65)
        }

        
    }
    
    // MARK: - Helpers
    
    private class MainDessertRepositorySpy: DessertRepository {
        
        // MARK: - Properties
        
        private let spy: DessertApis
        
        // MARK: - Methods
        
        init(spy: DessertApis) {
            self.spy = spy
        }
        
        func getAllDesserts() async throws -> DessertDelights.Meals {
            try await spy.getAllDesserts()
        }
        
        func getDessertDetails(by id: String) async throws -> DessertDelights.MealDetails {
            try await spy.getDessertDetails(by: id)
        }
        
        
    }
    
}




extension XCTestCase {
    func runAsyncTest(
        named testName: String = #function,
        in file: StaticString = #file,
        at line: UInt = #line,
        withTimeout timeout: TimeInterval = 10,
        test: @escaping () async throws -> Void
    ) {
        var thrownError: Error?
        let errorHandler = { thrownError = $0 }
        let expectation = expectation(description: testName)

        Task {
            do {
                try await test()
            } catch {
                errorHandler(error)
            }

            expectation.fulfill()
        }

        waitForExpectations(timeout: timeout)

        if let error = thrownError {
            XCTFail(
                "Async error thrown: \(error)",
                file: file,
                line: line
            )
        }
    }
}
