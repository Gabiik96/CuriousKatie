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
        
        let pickedParticipants = CuriousKatie.chooseParticipants()
            

        for participant in pickedParticipants {
            print(participant.introduce())
            print("\n")
        }
        
        
        var index = 0
        
        while index != pickedParticipants[0].interests.count{
            for participant in pickedParticipants {
                print(participant.shareInterest(indexPath: index))
            }
            index += 1 
        }
        
         
        
        CuriousKatie.matchPeople(participants: pickedParticipants)
            
    }
}
