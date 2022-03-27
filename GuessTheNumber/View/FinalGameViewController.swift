//
//  FinalGameViewController.swift
//  GuessTheNumber
//
//  Created by Антон Титов on 25.03.2022.
//

import UIKit

class FinalGameViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var finalTextLabel: UILabel!
    @IBOutlet weak var restartGameButton: UIButton!
    
    var playerResult = Int()
    var playerWin = Int()
    
    private func setupUI() {
        resultLabel.text = "Количество попыток для выигрыша: \(playerResult) ! 👍🏻"
        
        finalTextLabel.layer.shadowColor = UIColor.black.cgColor
        finalTextLabel.layer.shadowOffset = CGSize(width: 10, height: 10)
        finalTextLabel.layer.shadowRadius = 5
        finalTextLabel.layer.shadowOpacity = 0.5
        
        restartGameButton.layer.cornerRadius = 10
        restartGameButton.layer.shadowColor = UIColor.black.cgColor
        restartGameButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        restartGameButton.layer.shadowRadius = 5
        restartGameButton.layer.shadowOpacity = 0.5
        
        if playerWin == 1 {
            finalTextLabel.text = "Игрок № 1 победил! Поздравляем!"
        } else if playerWin == 2 {
            finalTextLabel.text = "Игрок № 2 победил! Поздравляем!"
        } else if playerWin == 3 {
            finalTextLabel.text = "Ничья! Равный результат!"
            resultLabel.font.withSize(60)
            resultLabel.text = "🤷‍♂️"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func clearPlayersResult() {
        UserDefaults.standard.removeObject(forKey: "resultPlayerOne")
        UserDefaults.standard.removeObject(forKey: "resultPlayerTwo")
    }
    
    @IBAction func restartGameButton(_ sender: Any) {
        clearPlayersResult()
        guard let startMenu = self.storyboard?.instantiateViewController(withIdentifier: "startMenu") else { return }
        startMenu.modalPresentationStyle = .fullScreen
        self.present(startMenu, animated: true, completion: nil)
    }
}
