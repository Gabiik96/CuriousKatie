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

struct Interest: Equatable {
    
    static func == (lhs: Interest, rhs: Interest) -> Bool {
        return lhs.title == rhs.title
        
    }

    var title: String
    var skill: Skill
    
    init(title: String, skill: Skill) {
        self.title = title
        self.skill = skill
    }
}

