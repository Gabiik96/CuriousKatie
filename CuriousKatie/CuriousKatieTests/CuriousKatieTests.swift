//
//  CuriousKatieTests.swift
//  CuriousKatieTests
//
//  Created by Gabriel Balta on 22/03/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import XCTest
@testable import CuriousKatie

class CuriousKatieTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

      /// When there is an odd number -> remaining person will not get paired up
    func testOddNumberOfParticipants() {
        var people: [Person] =   [Person(name: "Jonathan", age: 48, interest: Interest.possibleInterests),
                                  Person(name: "Julia", age: 37, interest: Interest.possibleInterests),
                                  Person(name: "Peter", age: 40, interest: Interest.possibleInterests),
                                  Person(name: "Reynold", age: 29, interest: Interest.possibleInterests),
                                  Person(name: "Bianca", age: 36, interest: Interest.possibleInterests),]
        
        XCTAssert(CuriousKatie.matchPeople(participants: people).isEmpty, "Odd number of participants should leave one person out.")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
