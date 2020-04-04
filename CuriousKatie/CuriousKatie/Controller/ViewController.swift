//
//  ViewController.swift
//  P4_01_xcode
//
//  Created by Gabriel Balta on 06/03/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // declaration of current participants
        var pickedParticipants = CuriousKatie.chooseParticipants()
        
        // each participant will introduce
        for participant in pickedParticipants {
            print(participant.introduce())
            
        }
        print("\n")
        var index = 0
        
        var numberOfInterests = [Int]()
        
        // populating array with each participant quantity of interests
        for participant in pickedParticipants {
            numberOfInterests.append(participant.interests.count)
        }
        
        // picking out the highest number from array
        let highestNumber = numberOfInterests.reduce(Int.min, { max($0, $1)})
        
        // while loop sharing all interests of each participant(only one at the time)
        while index != highestNumber {
            pickedParticipants.shuffle()
            for participant in pickedParticipants {
                participant.shareInterest(indexPath: index)
            }
            index += 1
        }
        print("\n")
        
        CuriousKatie.matchPeople(participants: pickedParticipants)
    }
}
