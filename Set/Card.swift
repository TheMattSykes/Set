//
//  Card.swift
//  Set
//
//  Created by Matthew Sykes on 04/09/2018.
//  Copyright © 2018 mattsykes. All rights reserved.
//

import Foundation

struct Card {
    var isASet = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getIdentifier()
    }
}

// Type to determine the fill of a shape on the card
enum Fill {
    case Block
    case Stripe
    case Hollow
}
