//
//  Interests.swift
//  P4_01_xcode
//
//  Created by Gabriel Balta on 17/03/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import Foundation

enum Skill: String, CaseIterable {
    //enumeration for skill property of Interest
    case novice = "novice"
    case proficient = "proficient"
    case expert = "expert"
}

struct Interest {
    
    // propertes
    var title: String
    var skill: Skill
    
    // initializer
    init(title: String, skill: Skill) {
        self.title = title
        self.skill = skill
    }
    
    // function to generate possible interests
    static func possibleInterests() -> [Interest] {
        return [
            Interest(title: "swimming", skill: Skill.allCases.randomElement()!),
            Interest(title: "running", skill: Skill.allCases.randomElement()!),
            Interest(title: "programming", skill: Skill.allCases.randomElement()!),
            Interest(title: "snowboarding", skill: Skill.allCases.randomElement()!),
            Interest(title: "skydiving", skill: Skill.allCases.randomElement()!),
            Interest(title: "racing", skill: Skill.allCases.randomElement()!),
            Interest(title: "cycling", skill: Skill.allCases.randomElement()!),
            Interest(title: "surfing", skill: Skill.allCases.randomElement()!),
            Interest(title: "socialazing", skill: Skill.allCases.randomElement()!),
            Interest(title: "watching TV", skill: Skill.allCases.randomElement()!),
        ]
    }
}

extension Interest: Equatable {
    static func == (lhs: Interest, rhs: Interest) -> Bool {
        return lhs.title == rhs.title
    }
}
