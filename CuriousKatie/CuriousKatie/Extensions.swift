//
//  Extensions.swift
//  Curious_Katie
//
//  Created by Ellen Covey on 10/06/2019.
//  Copyright © 2019 Ellen Covey. All rights reserved.
//

import Foundation


extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
