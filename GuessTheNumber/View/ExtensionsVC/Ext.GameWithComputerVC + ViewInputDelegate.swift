//
//  Ext.GameWithComputerVC + ViewInputDelegate.swift
//  GuessTheNumber
//
//  Created by Антон Титов on 27.03.2022.
//

import UIKit

extension GameWithComputerViewController: ViewInputDelegate {
    
    func setupUIInitialState() {
        numberRoundsLabel.text = "Раунд № \(numberOfAttempts)"
        promptLabel.isHidden = true
        
        rulesTextLabel.layer.shadowColor = UIColor.black.cgColor
        rulesTextLabel.layer.shadowOffset = CGSize(width: 10, height: 10)
        rulesTextLabel.layer.shadowRadius = 5
        rulesTextLabel.layer.shadowOpacity = 0.5
        
        guessButton.layer.cornerRadius = 10
        guessButton.layer.shadowColor = UIColor.black.cgColor
        guessButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        guessButton.layer.shadowRadius = 5
        guessButton.layer.shadowOpacity = 0.5
        
        print(hiddenNumberComputer)
    }
    
    func displayData() {
        guard let playerNumber = Int(playerNumberTextField.text ?? "")
        else { return rulesTextLabel.text = "Введите число цифрами от 1 до 99!" }
        
        if playerNumber >= 100 {
            rulesTextLabel.text = "Нельзя ввести число больше 99!"
        } else if playerNumber <= 0 {
            rulesTextLabel.text = "Нельзя ввести число меньше 1!"
        } else {
            
            if playerNumber > hiddenNumberComputer {
                promptLabel.text = "Твоё число больше >"
                numberOfAttempts += 1
                promptLabel.isHidden = false
            } else if playerNumber < hiddenNumberComputer {
                promptLabel.text = "Твоё число меньше <"
                numberOfAttempts += 1
                promptLabel.isHidden = false
            } else if playerNumber == hiddenNumberComputer {
                performSegue(withIdentifier: segueIdentifier, sender: nil)
            }
        }
    }
}
