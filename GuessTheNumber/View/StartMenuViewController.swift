//
//  StartMenuViewController.swift
//  GuessTheNumber
//
//  Created by Антон Титов on 24.03.2022.
//

import UIKit

final class StartMenuViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var rulesOfTheGameLabel: UILabel!
    @IBOutlet weak var gameModeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var startGameButton: UIButton!
    
    private let segueIdentifierToPlayerNumber = "identifierToGameScreenWithPlayer"
    private let segueIdentifierToGameScreenWithComputer = "identifierToGameScreenWithComputer"
    
    private func setupUI() {
        welcomeLabel.layer.shadowColor = UIColor.black.cgColor
        welcomeLabel.layer.shadowOffset = CGSize(width: 10, height: 10)
        welcomeLabel.layer.shadowRadius = 5
        welcomeLabel.layer.shadowOpacity = 0.5
        
        startGameButton.layer.cornerRadius = 10
        startGameButton.layer.shadowColor = UIColor.black.cgColor
        startGameButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        startGameButton.layer.shadowRadius = 5
        startGameButton.layer.shadowOpacity = 0.5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func startGameButton(_ sender: Any) {
        switch gameModeSegmentedControl.selectedSegmentIndex {
        case 0:
            performSegue(withIdentifier: segueIdentifierToPlayerNumber, sender: nil)
        case 1:
            performSegue(withIdentifier: segueIdentifierToGameScreenWithComputer, sender: nil)
        default:
            rulesOfTheGameLabel.text = "Выберите режим игры! 👇🏻"
        }
    }
}
