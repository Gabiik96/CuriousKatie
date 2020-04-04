//
//  Interests.swift
//  P4_01_xcode
//
//  Created by Gabriel Balta on 17/03/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import Foundation

enum Skill: String {
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
    
    // computed variable to generate possible interests
    static var possibleInterests: [Interest] {
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
        ]
    }
}

extension Interest: Equatable {
    static func == (lhs: Interest, rhs: Interest) -> Bool {
        return lhs.title == rhs.title
    }
}
