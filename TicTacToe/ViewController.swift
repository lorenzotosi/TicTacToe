//
//  ViewController.swift
//  TicTacToe
//
//  Created by Lorenzo Tosi on 31/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn {
        case Circle
        case Cross
    }
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var a0: UIButton!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    private var firstTurn = Turn.Cross
    private var currentTurn = Turn.Cross
    private var listOfButtons: [UIButton] = []
    
    private let Circle = "O"
    private let Cross = "X"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfButtons.append(a0)
        listOfButtons.append(a1)
        listOfButtons.append(a2)
        listOfButtons.append(b1)
        listOfButtons.append(b2)
        listOfButtons.append(b3)
        listOfButtons.append(c1)
        listOfButtons.append(c2)
        listOfButtons.append(c3)
        // Do any additional setup after loading the view.
    }

    private func checkResetBoard() -> Bool {
        for button in listOfButtons {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    private func resetBoard() {
        for button in listOfButtons {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
    }
    
    private func showEndGameAlert(_ test: String) {
        
    }
    
    @IBAction private func tapOnBoard(_ sender: UIButton) {
        addOnBoard(sender)
        if checkResetBoard() {
            resetBoard()
        }
    }
    
    private func addOnBoard(_ button: UIButton){
        if (button.title(for: .normal) == nil) {
            if (currentTurn == .Cross){
                setTitle(button, Cross)
                switchTurn(Circle, .Circle)
            } else if (currentTurn == .Circle) {
                setTitle(button, Circle)
                switchTurn(Cross, .Cross)
            }
            button.isEnabled = false
        }
    }
    
    private func switchTurn(_ item: String, _ newTurn: Turn){
        turnLabel.text = item
        currentTurn = newTurn
    }
    
    private func setTitle(_ item: UIButton, _ title: String){
        item.setTitle(title, for: .normal)
    }
    
}
