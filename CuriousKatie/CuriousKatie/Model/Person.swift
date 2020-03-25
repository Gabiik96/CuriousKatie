//
//  Person.swift
//  P4_01_xcode
//
//  Created by Gabriel Balta on 17/03/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import Foundation



struct Person {
    
    var name: String
    var age: Int
    var interests = pickInterests()

    func introduce() -> String {
       
        let greetings = ["Hello everybody, I'm ", "Hi all, my name is", "Hey there, they call me"]
        let introduction = "\(greetings.randomElement()!) \(name), and I'm \(age) years old."
    
        return introduction
    }
    
    func shareInterest(indexPath: Int) -> Any {
        if indexPath <= interests.count - 1{
        let interest = interests[indexPath]
        return "(\(name))" + "My interest is " + interest.title + ", I'm " + interest.skill.rawValue
        } else {
            return "(\(name))" + "All interests said"
        }
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
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
    
    static func pickInterests() -> [Interest] {
        let pool = Interest.possibleInterests.shuffled()
        return Array(pool.prefix(Int.random(in: 1...10)))
    }
}
