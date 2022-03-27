//
//  Ext.PlayerNumberVC + ViewInputDelegate.swift
//  GuessTheNumber
//
//  Created by Антон Титов on 27.03.2022.
//

import UIKit

extension PlayerNumberViewController: ViewInputDelegate {
    
    func setupUIInitialState() {
        numberPlayerLabel.text = "Игрок № \(numberPlayerFlag) загадывает число"
        
        rulesTextLabel.layer.shadowColor = UIColor.black.cgColor
        rulesTextLabel.layer.shadowOffset = CGSize(width: 10, height: 10)
        rulesTextLabel.layer.shadowRadius = 5
        rulesTextLabel.layer.shadowOpacity = 0.5
        
        startGamePlayerButton.layer.cornerRadius = 10
        startGamePlayerButton.layer.shadowColor = UIColor.black.cgColor
        startGamePlayerButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        startGamePlayerButton.layer.shadowRadius = 5
        startGamePlayerButton.layer.shadowOpacity = 0.5
    }
    
    func displayData() {
        guard let number = Int(playerNumberTextField.text ?? "")
        else { return rulesTextLabel.text = "Введите число цифрами от 1 до 99!" }
        
        if number >= 100 {
            rulesTextLabel.text = "Нельзя ввести число больше 99!"
        } else if number <= 0 {
            rulesTextLabel.text = "Нельзя ввести число меньше 1!"
        } else {
            playerNumber = number
            performSegue(withIdentifier: segueIdentifier, sender: nil)
        }
    }
}
