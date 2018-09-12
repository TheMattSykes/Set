//
//  Set.swift
//  Set
//
//  Created by Matthew Sykes on 03/09/2018.
//  Copyright © 2018 mattsykes. All rights reserved.
//

import UIKit // For color literals
import Foundation

struct Set {
    
    let numberOfInitalCards = 12
    
    var numberOfCurrentCards = 12
    
    var startOfTheGame = true
    
    // Array of strings that are displayed on cards
    var iconList = ["▲","●","■"]

    var colourList = [#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)]
    
    var fillList = [Fill.block,Fill.stripe,Fill.hollow]
    
    var cards = [Card]()
    
    mutating func chooseCard(at index: Int) {
        cards[index].isSelected = true
    }
    
    init() {
        cards = [Card]() // reset card array
        
        for icon in 0..<iconList.count {
            for fill in 0..<fillList.count {
                for colour in 0..<colourList.count {
                    cards.append(Card(icon: iconList[icon],fill: fillList[fill],colour: colourList[colour]))
                }
            }
        }
        
        var newCardsList = [Card]()
        // Insert random element from first array into new array
        for _ in 0..<cards.count {
            let randomCardIndex = Int(arc4random_uniform(UInt32(cards.count)))
            
            newCardsList.append(cards[randomCardIndex])
            cards.remove(at: randomCardIndex)
        }
        cards = newCardsList
    }
}
