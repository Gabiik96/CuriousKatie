//
//  CuriousKatie.swift
//  P4_01_xcode
//
//  Created by Gabriel Balta on 21/03/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import Foundation


struct CuriousKatie {
        
    static func chooseParticipants() -> [Person] {
        let pool = Person.generateParticipants().shuffled()
        let maximum = pool.count
        print("\n\n ..... Choosing Participants ..... \n")
        return Array(pool.prefix(Int.random(in: 2...maximum)))
    }
    
    static func matchPeople(participants: [Person]) {
        var peopleToMatch = participants.shuffled()
        var matchIndex = 1
        while matchIndex <= (peopleToMatch.count - 1) {
            let interestsMatched = peopleToMatch.first?.interests.filter(peopleToMatch[matchIndex].interests.contains)
            if peopleToMatch[matchIndex].name != peopleToMatch.first?.name && interestsMatched?.count ?? 0 >= 2 {
                print("\(peopleToMatch.first?.name ?? "") is matching with \(peopleToMatch[matchIndex].name) with \(interestsMatched?.count ?? 0) common interests.")
                    peopleToMatch.remove(at: matchIndex)
                    peopleToMatch.removeFirst()
            } else {
            matchIndex += 1
            }
        }
    }
}
