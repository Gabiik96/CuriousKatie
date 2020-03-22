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
    var interests = CuriousKatie.pickInterests()
    

    func introduce() -> String {
       
        let greeting = ["Hello everybody, I'm ", "Hi all, my name is", "Hey there, they call me"]
        let introduction = "\(greeting.randomElement()!) \(name), and I'm \(age) years old."
    
        return introduction
    }
    
    func shareInterest(indexPath: Int) -> String {
        let sharedInterestTitle = interests[indexPath].title
        let sharedInterestSkill = interests[indexPath].skill
        
        return "(\(name))My interest is " + sharedInterestTitle + ", I'm " + sharedInterestSkill.rawValue
        
    }
    

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
