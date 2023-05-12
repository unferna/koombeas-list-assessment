//
//  KoombeaTestTests.swift
//  KoombeaTestTests
//
//  Created by Fernando Florez on 12/05/23.
//

import XCTest
@testable import KoombeaTest

final class KoombeaTestTests: XCTestCase {
    
    var sut: UserDataServiceProtocol?

    override func setUpWithError() throws {
        sut = UserDataService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testUserDataService_WhenGivenInvalidAPIURL_ShouldReturnUsersAsNil() {
        sut?.baseAPIURL = "https//jserver-api.herokuapp.com"
        
        let expectation = expectation(description: "Fetch users expectation")
        sut?.fetchUsers { users, error in
            XCTAssertNil(users)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 15)
    }
    
    func testUserDataService_WhenGivenValidAPIURL_ShouldReturnUsers() {
        sut?.baseAPIURL = "https://jserver-api.herokuapp.com"
        
        let expectation = expectation(description: "Fetch users expectation")
        sut?.fetchUsers { users, error in
            XCTAssertNotNil(users)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 15)
    }
}
