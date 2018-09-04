//
//  Card.swift
//  Set
//
//  Created by Matthew Sykes on 04/09/2018.
//  Copyright © 2018 mattsykes. All rights reserved.
//

import UIKit // For color literals
import Foundation

struct Card {
    var isASet = false
    var identifier: Int
    var isSelected = false
    
    var show = true
    
    var icon: String
    var fill: Fill
    var colour: UIColor
    
    private static var idFactory = 0
    
    private static func getIdentifier() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init(icon: String, fill: Fill, colour: UIColor) {
        self.identifier = Card.getIdentifier()
        self.icon = icon
        self.fill = fill
        self.colour = colour
    }
}

// Type to determine the fill of a shape on the card
enum Fill {
    case block
    case stripe
    case hollow
    
}
