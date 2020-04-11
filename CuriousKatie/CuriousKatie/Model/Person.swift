//
//  Person.swift
//  P4_01_xcode
//
//  Created by Gabriel Balta on 17/03/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import Foundation



struct Person {
    
    // properties
    var name: String
    var age: Int
    var interests: [Interest]

    // function to intruduce participant by generating introduction
    func introduce() -> String {
       
        let greetings = ["Hello everybody, I'm ", "Hi all, my name is", "Hey there, they call me"]
        let introduction = "\(greetings.randomElement()!) \(name), and I'm \(age) years old."
    
        return introduction
    }
    
    // function to share interest of participant || if there are no interests left, to say all interests said
    func shareInterest(indexPath: Int) {
        if indexPath <= interests.count - 1 {
            let interest = interests[indexPath]
            print("(\(name))" + "My interest is " + interest.title + ", I'm " + interest.skill.rawValue)
        }
    }

    // initializer
    init(name: String, age: Int, interest: [Interest] = pickInterests()) {
        self.name = name
        self.age = age
        self.interests = interest
    }
    
    // computed property to generate participants
    static var people: [Person] {
        print("\n\n ..... Generating Participants ..... \n")
          return [
            Person(name: "Jonathan", age: 48),
            Person(name: "Julia", age: 37),
            Person(name: "Peter", age: 40),
            Person(name: "Reynold", age: 29),
            Person(name: "Bianca", age: 36),
            Person(name: "Garry", age: 42),
            Person(name: "Nataly", age: 31),
            Person(name: "Chloe", age: 52),
            Person(name: "Sophie", age: 22),
            Person(name: "Paul", age: 51),
            Person(name: "Anna", age: 34),
            Person(name: "Robert", age: 26)
            ]
    }
    
    // function to populate participant with random quantity of random possible interests
    static func pickInterests() -> [Interest] {
        return Array(Interest.possibleInterests().shuffled().prefix(Int.random(in: 1...Interest.possibleInterests().count)))
    }
}
