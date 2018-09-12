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
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    @IBAction func dealCards(_ sender: UIButton) {
        if (!game.startOfTheGame) {
            
            if (game.numberOfCurrentCards <= 21) {
                game.numberOfCurrentCards += 3
            }
            //TODO: Finish logic for dealing new cards
            
            updateViewFromModel()
        } else {
            updateViewFromModel()
            game.startOfTheGame = false
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
            for index in 0..<game.numberOfCurrentCards {
                setButtonData(at: index)
            }
        }
    }
    
    private func setButtonData(at index: Int){
        let button = cardButtons[index]
        let card = game.cards[index]
        
        // Button titles
        if (card.show){
            button.setTitle(card.icon, for: UIControlState.normal)
        } else {
            button.setTitle(nil, for: UIControlState.normal)
        }
        
        /*switch card.fill {
            case Fill.hollow:
                
                break
            case Fill.stripe:
                
                break
            default:
                
                break
        }*/
        
        button.setTitleColor(card.colour,for: UIControlState.normal)
        
        // Button background color
        button.backgroundColor = card.show ? #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0)
        
        // Button border when selected
        button.layer.borderWidth = card.isSelected ? 3.0 : 0.0
        button.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    }
}

