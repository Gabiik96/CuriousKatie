//
//  Interests.swift
//  P4_01_xcode
//
//  Created by Gabriel Balta on 17/03/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import Foundation

class Interest {
    
    // propertes
    var title: String
    var skill: String?
    
    // initializer
    init(title: String, skill: String? = nil) {
        self.title = title
        self.skill = skill
    }
    
    // function to generate possible interests
    static func possibleInterests() -> [Interest] {
        return [
            Interest(title: "swimming"),
            Interest(title: "running"),
            Interest(title: "programming"),
            Interest(title: "snowboarding"),
            Interest(title: "skydiving"),
            Interest(title: "racing"),
            Interest(title: "cycling"),
            Interest(title: "surfing"),
            Interest(title: "socialazing"),
            Interest(title: "watching TV")
        ]
    }
}

extension Interest: Equatable {
    static func == (lhs: Interest, rhs: Interest) -> Bool {
        return lhs.title == rhs.title
    }
}
