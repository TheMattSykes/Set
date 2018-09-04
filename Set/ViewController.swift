//
//  ViewController.swift
//  Set
//
//  Created by Matthew Sykes on 03/09/2018.
//  Copyright © 2018 mattsykes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = newGame()
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        updateViewFromModel()
    }
    
    @IBAction func dealCards(_ sender: UIButton) {
        updateViewFromModel()
        
        if (!game.startOfTheGame) {
            game.startOfTheGame = false
            
            //TODO: Finish logic for dealing new cards
        }
    }
    
    private func newGame() -> Set {
        
        // Make all cards initially invisible
        for index in 0..<cardButtons.count {
            cardButtons[index].backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0)
        }
        
        return Set()
    }
    
    private func updateViewFromModel() {
        if (game.startOfTheGame) {
            for index in 0..<game.numberOfInitalCards {
                setButtonData(at: index)
            }
        } else {
            // Finish
        }
    }
    
    private func setButtonData(at index: Int){
        let button = cardButtons[index]
        let card = game.cards[index]
        
        button.setTitle(card.icon, for: UIControlState.normal)
        button.setTitleColor(card.colour,for: UIControlState.normal)
        button.backgroundColor = card.show ? #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0)
    }
}

