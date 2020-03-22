//
//  CuriousKatie.swift
//  P4_01_xcode
//
//  Created by Gabriel Balta on 21/03/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import Foundation


struct CuriousKatie {
    
    static func generatePossibleInterests() -> [Interest] {
        print("\n\n ..... Generating Interests ..... \n")
        var allInterests: [Interest] = []
        
        let interest1 = Interest(title: "swimming", skill: .expert)
        allInterests.append(interest1)
        let interest2 = Interest(title: "running", skill: .novice)
        allInterests.append(interest2)
        let interest3 = Interest(title: "programming", skill: .proficient)
        allInterests.append(interest3)
        let interest4 = Interest(title: "snowboarding", skill: .expert)
        allInterests.append(interest4)
        let interest5 = Interest(title: "skydiving", skill: .proficient)
        allInterests.append(interest5)
        let interest6 = Interest(title: "racing", skill: .novice)
        allInterests.append(interest6)
        let interest7 = Interest(title: "cycling", skill: .expert)
        allInterests.append(interest7)
        let interest8 = Interest(title: "surfing", skill: .proficient)
        allInterests.append(interest8)
        let interest9 = Interest(title: "socialazing", skill: .novice)
        allInterests.append(interest9)
        let interest10 = Interest(title: "watching TV", skill: .novice)
        allInterests.append(interest10)
        let interest11 = Interest(title: "gardening", skill: .novice)
        allInterests.append(interest11)
        let interest12 = Interest(title: "cooking", skill: .novice)
        allInterests.append(interest12)
        let interest13 = Interest(title: "investing", skill: .novice)
        allInterests.append(interest13)
        let interest14 = Interest(title: "sleeping", skill: .novice)
        allInterests.append(interest14)
        let interest15 = Interest(title: "cleaning", skill: .novice)
        allInterests.append(interest15)
        let interest16 = Interest(title: "dancing", skill: .novice)
        allInterests.append(interest16)
        let interest17 = Interest(title: "painting", skill: .novice)
        allInterests.append(interest17)
        let interest18 = Interest(title: "singing", skill: .novice)
        allInterests.append(interest18)
        let interest19 = Interest(title: "reading", skill: .novice)
        allInterests.append(interest19)
        let interest20 = Interest(title: "studying", skill: .novice)
        allInterests.append(interest20)
        let interest21 = Interest(title: "collecting pens", skill: .novice)
        allInterests.append(interest21)
        let interest22 = Interest(title: "blogging", skill: .novice)
        allInterests.append(interest22)
        
        
        return allInterests
    }
    
 
    static func generateParticipants() -> [Person] {
        print("\n\n ..... Generating Participants ..... \n")
        var participants: [Person] = []
        
        let participant1 = Person(name: "Jonathan", age: 48)
        participants.append(participant1)
        let participant2 = Person(name: "Julia", age: 37)
        participants.append(participant2)
        let participant3 = Person(name: "Peter", age: 40)
        participants.append(participant3)
        let participant4 = Person(name: "Reynold", age: 29)
        participants.append(participant4)
        let participant5 = Person(name: "Bianca", age: 36)
        participants.append(participant5)
        let participant6 = Person(name: "Garry", age: 42)
        participants.append(participant6)
        let participant7 = Person(name: "Nataly", age: 31)
        participants.append(participant7)
        let participant8 = Person(name: "Chloe", age: 52)
        participants.append(participant8)
        let participant9 = Person(name: "Sophie", age: 22)
        participants.append(participant9)
        let participant10 = Person(name: "Paul", age: 51)
        participants.append(participant10)
        let participant11 = Person(name: "Anna", age: 34)
        participants.append(participant11)
        let participant12 = Person(name: "Robert", age: 26)
        participants.append(participant12)
        
        return participants
    }
    

    static func chooseParticipants() -> [Person] {
        print("\n\n ..... Choosing Participants ..... \n")
        let pool = generateParticipants().shuffled()
        let maximum = pool.count
        return Array(pool.prefix(Int.random(in: 2...maximum)))
    }
    

    static func pickInterests() -> [Interest] {
        let pool = generatePossibleInterests().shuffled()
        let maximum = pool.count
        return Array(pool.prefix(Int.random(in: 1...maximum)))
    }
    
    static func matchPeople(participants: [Person]) {
        
        var peopleToMatch = participants.shuffled()
               var matchIndex = 1
               while matchIndex <= (peopleToMatch.count - 1) {
                let interestMached = peopleToMatch.first?.interests.filter(peopleToMatch[matchIndex].interests.contains)
                       if peopleToMatch[matchIndex].name != peopleToMatch.first?.name && interestMached?.count ?? 0 >= 2 {
                           print("\(peopleToMatch.first?.name ?? "") is matching with \(peopleToMatch[matchIndex].name) with \(interestMached?.count ?? 0) common interests.")
                        peopleToMatch.remove(at: matchIndex)
                        peopleToMatch.removeFirst()
                       }
                       else {
                           matchIndex += 1
                       }
                   }
               }
    }
