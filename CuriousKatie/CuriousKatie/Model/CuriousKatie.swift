//
//  CuriousKatie.swift
//  P4_01_xcode
//
//  Created by Gabriel Balta on 21/03/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import Foundation


struct CuriousKatie {
        
    // function to randomly choosing random number of participants
    static func chooseParticipants() -> [Person] {
        let pool = Person.people.shuffled()
        let maximum = pool.count
        print("\n\n ..... Choosing Participants ..... \n")
        return Array(pool.prefix(Int.random(in: 2...maximum)))
    }
    
    
    static func printMatches(matches: [String]) {
        for element in matches {
            print(element)
            }
            print("\n")
    }
    
    // main function to match current participants
    static func matchPeople(participants: [Person]) -> [String] {
        
        // function to print all matches in array of matches
        func printMatches(matches: [String]) {
             for element in matches {
                 print(element)
                 }
                 print("\n")
         }
        
        // function which adds string to array if person are matching & removes participants which matched from pool
        func addIfMatch(array:inout [String], matchPerson: Person, participant: Person, interestsMatched: [Interest], people:inout [Person], string: String ) {
            array.append(string)
            people.removeAll { (person) -> Bool in
                if person.name == participant.name {
                    return true
                } else {
                    return false
                }
            }
            people.remove(at: 0)
        }
        
        // arrays to store matches
        var strongMatches = [String]()
        var weakMatches = [String]()
        var oneMatches = [String]()
        var noMatches = [String]()
        
        // randomize participants order
        var peopleToMatch = participants.shuffled()
        
        
        // matching participants which have same interests
            for participant in peopleToMatch {
                peopleToMatch.shuffle()
                //to this participant we are comparing others interest
                let matchingPerson = peopleToMatch[0]
                //this is comparing participant
                let participant = participant
                // storing all interests which are matching (matchingPerson.interests to participant.interests)
                let interestsMatched = matchingPerson.interests.filter(participant.interests.contains)
                // condition searching for matches with 4 or more common interests
                if participant.name != matchingPerson.name && interestsMatched.count >= 4 {
                    addIfMatch(array: &strongMatches, matchPerson: matchingPerson, participant: participant, interestsMatched: interestsMatched, people: &peopleToMatch, string: "\(matchingPerson.name ) is strong match with \(participant.name) with \(interestsMatched.count) common interests.")
                }
                // condition searching for matches with 2 or more common interests
                else if participant.name != matchingPerson.name && interestsMatched.count >= 2 {
                    addIfMatch(array: &weakMatches, matchPerson: matchingPerson, participant: participant, interestsMatched: interestsMatched, people: &peopleToMatch, string: "\(matchingPerson.name ) is match with \(participant.name) with \(interestsMatched.count) common interests.")
                }
                // condition searching for matches with 1 common interests
                else if participant.name != matchingPerson.name && interestsMatched.count >= 1 {
                    addIfMatch(array: &oneMatches, matchPerson: matchingPerson, participant: participant, interestsMatched: interestsMatched, people: &peopleToMatch, string: "\(matchingPerson.name ) is match with \(participant.name) with \(interestsMatched.count) common interest.")
                }
            }

        // participants which are left in array(dont have match for them - everybody else is already paired)
        while 0 <= peopleToMatch.count - 1  {
            noMatches.append("\(peopleToMatch[0].name) has no suitable match.")
            peopleToMatch.removeFirst()
        }
        
        printMatches(matches: strongMatches)
        printMatches(matches: weakMatches)
        printMatches(matches: oneMatches)
        printMatches(matches: noMatches)
        
        return noMatches
    }
}
