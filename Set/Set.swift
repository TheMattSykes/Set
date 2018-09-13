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
    
    var scoreLabelData = "Sets: 0"
    
    var score = 0 {
        didSet {
            scoreLabelData = "Flips: \(score)"
        }
    }
    
    
    let numberOfInitalCards = 12
    
    let maxNumberOfDisplayCards = 24
    
    var numberOfCurrentCards = 12
    
    private var numberOfSelectedCards = 0
    private var numberOfCardsRemoved = 0
    
    var startOfTheGame = true
    
    // Array of strings that are displayed on cards
    var iconList = ["▲","●","■"]

    var colourList = [#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)]
    
    var fillList = [Fill.block,Fill.stripe,Fill.hollow]
    
    var cards = [Card]()
    
    // Check three cards to see if they're a set
    private mutating func checkForSets() {
        var listOfSelectedCards = [Card]()
        var listOfIndexes = [Int]() // store index of selected cards in cards array
        
        // Generate list of selected cards and their index
        for index in 0..<cards.count {
            if (cards[index].isSelected) {
                listOfSelectedCards.append(cards[index])
                listOfIndexes.append(index)
            }
        }
        
        // Variables to store whether cards match
        var iconsMatch = true
        var coloursMatch = true
        var fillsMatch = true
        
        for index in 1..<(listOfSelectedCards.count) {
            if (listOfSelectedCards[index].icon != listOfSelectedCards[index-1].icon) {
                iconsMatch = false
            }
            
            if (listOfSelectedCards[index].colour != listOfSelectedCards[index-1].colour) {
                coloursMatch = false
            }
            
            if (listOfSelectedCards[index].fill != listOfSelectedCards[index-1].fill) {
                fillsMatch = false
            }
        }
        
        // Stop showing matched cards
        if (iconsMatch || coloursMatch || fillsMatch) {
            
            for index in listOfIndexes {
                cards[index].show = false
                print("MARKED \(index) as false")
            }
        }
    }
    
    private mutating func deselectAllCards() {
        for index in 0..<cards.count {
            cards[index].isSelected = false
        }
    }
    
    mutating func chooseCard(at index: Int) {
        if (!cards[index].isSelected) {
            numberOfSelectedCards += 1
            cards[index].isSelected = true
            
            if (numberOfSelectedCards == 3) {
                checkForSets()
                numberOfSelectedCards = 0
                deselectAllCards()
            }
        }
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
