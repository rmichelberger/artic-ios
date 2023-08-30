//
//  UseCaseTests.swift
//  articTests
//
//  Created by roland.michelberger on 26.08.23.
//

import XCTest
@testable import artic
@testable import Inject

final class UseCaseTests: XCTestCase {
    
    override class func setUp() {
        @Singleton var repository: Repository = MockRepository()
        super.setUp()
    }

    func testGetArtList() async throws {
        let useCase = UseCase()
        let artList = try await useCase.getArtList()
        XCTAssertEqual(3, artList.count)
    }
    
    func testGetArtDetail() async throws {
        let useCase = UseCase()
        let artDetail = try await useCase.getArtDetail(id: 1)
        XCTAssertEqual("Vincent van Gogh\nDutch, 1853-1890", artDetail.artistName)
    }

}
