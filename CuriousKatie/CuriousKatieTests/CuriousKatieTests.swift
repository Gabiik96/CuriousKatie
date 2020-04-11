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
        let people: [Person] =   [Person(name: "Jonathan", age: 48, interest: Interest.possibleInterests()),
                                  Person(name: "Julia", age: 37, interest: Interest.possibleInterests()),
                                  Person(name: "Peter", age: 40, interest: Interest.possibleInterests()),
                                  Person(name: "Reynold", age: 29, interest: Interest.possibleInterests()),
                                  Person(name: "Bianca", age: 36, interest: Interest.possibleInterests()),]
        
        XCTAssert(!CuriousKatie.matchPeople(participants: people).isEmpty, "Odd number of participants should leave one person out.")
    }
    /// Nobody who is supposed to get matched get skipped
    func testMatchMatchingParticipants() {
        let people: [Person] =   [Person(name: "Jonathan", age: 48, interest: matchingInterest()),
                                  Person(name: "Julia", age: 37, interest: matchingInterest()),
                                  Person(name: "Peter", age: 40, interest: matchingInterest()),
                                  Person(name: "Reynold", age: 29, interest: nonMatchingInterest()),
                                  Person(name: "Bianca", age: 36, interest: matchingInterest()),
                                  Person(name: "Jozeph", age: 52, interest: matchingInterest())]
        let matches = CuriousKatie.matchPeople(participants: people)
        for each in matches {
            print(each)
        }
        XCTAssert(matches.count == 2, "5 people with matchingInterest, should have 2 matches in array.")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func matchingInterest() -> [Interest] {
    return [
        Interest(title: "swimming", skill: Skill.allCases.randomElement()!),
        Interest(title: "running", skill: Skill.allCases.randomElement()!),
        Interest(title: "programming", skill: Skill.allCases.randomElement()!),
        Interest(title: "snowboarding", skill: Skill.allCases.randomElement()!),
        Interest(title: "skydiving", skill: Skill.allCases.randomElement()!)
        ]
    }
    
    func nonMatchingInterest() -> [Interest] {
    return [
        Interest(title: "racing", skill: Skill.allCases.randomElement()!),
        Interest(title: "cycling", skill: Skill.allCases.randomElement()!)
        ]
    }

}
