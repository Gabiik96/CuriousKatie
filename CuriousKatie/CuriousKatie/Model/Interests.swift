//
//  Interests.swift
//  P4_01_xcode
//
//  Created by Gabriel Balta on 17/03/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import Foundation

enum Skill: String {
    case novice = "novice"
    case proficient = "proficient"
    case expert = "expert"
}

struct Interest {
    
    var title: String
    var skill: Skill
    
    init(title: String, skill: Skill) {
        self.title = title
        self.skill = skill
    }
    
    static func generatePossibleInterests() -> [Interest] {
        print("\n\n ..... Generating Interests ..... \n")
        return [
            Interest(title: "swimming", skill: .expert),
            Interest(title: "running", skill: .novice),
            Interest(title: "programming", skill: .proficient),
            Interest(title: "snowboarding", skill: .expert),
            Interest(title: "skydiving", skill: .proficient),
            Interest(title: "racing", skill: .novice),
            Interest(title: "cycling", skill: .expert),
            Interest(title: "surfing", skill: .proficient),
            Interest(title: "socialazing", skill: .novice),
            Interest(title: "watching TV", skill: .novice),
            Interest(title: "gardening", skill: .novice),
            Interest(title: "cooking", skill: .novice),
            Interest(title: "investing", skill: .novice),
            Interest(title: "sleeping", skill: .novice),
            Interest(title: "cleaning", skill: .novice),
            Interest(title: "dancing", skill: .novice),
            Interest(title: "painting", skill: .novice),
            Interest(title: "singing", skill: .novice),
            Interest(title: "reading", skill: .novice),
            Interest(title: "studying", skill: .novice),
            Interest(title: "collecting pens", skill: .novice),
            Interest(title: "blogging", skill: .novice)
        ]
    }
}

extension Interest: Equatable {
    static func == (lhs: Interest, rhs: Interest) -> Bool {
        return lhs.title == rhs.title
    }
}
