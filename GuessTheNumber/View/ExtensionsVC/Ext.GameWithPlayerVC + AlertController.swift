//
//  Ext.GameWithPlayerVC + AlertController.swift
//  GuessTheNumber
//
//  Created by Антон Титов on 27.03.2022.
//

import UIKit

extension GameWithPlayerViewController {
    
    func nextPlayerAllert() {
        let alertController = UIAlertController(title: "Отлично! Твой результат \(numberOfAttempts)",
                                                message: "Теперь загадай число сопернику",
                                                preferredStyle: .alert)
        
        let nextAction = UIAlertAction(title: "Погнали", style: .default) { [weak self] _ in
            guard let playerNumberVC = self?.storyboard?.instantiateViewController(withIdentifier: "PlayerNumber") as? PlayerNumberViewController else { return }
            playerNumberVC.modalPresentationStyle = .fullScreen
            playerNumberVC.numberPlayerFlag = 2
            self?.present(playerNumberVC, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in }
        
        alertController.addAction(nextAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
