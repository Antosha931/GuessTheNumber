//
//  GameWithPlayerViewController.swift
//  GuessTheNumber
//
//  Created by Антон Титов on 25.03.2022.
//

import UIKit

final class GameWithPlayerViewController: UIViewController {
    
    @IBOutlet weak var backScroolView: UIScrollView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var labelsStackView: UIStackView!
    @IBOutlet weak var numberRoundsLabel: UILabel!
    @IBOutlet weak var rulesTextLabel: UILabel!
    @IBOutlet weak var playerNumberTextField: UITextField!
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    
    let segueIdentifier = "identifierToFinalGame"
    let presenter = Presenter()
    
    var numberOfAttempts = 1 {
        didSet {
            setupUIInitialState()
        }
    }
    
    var hiddenPlayerNumber = Int()
    var numberPlayerFlag = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIInitialState()
        presenter.setViewInputDelegate(viewInputDelegate: self)
        
        if UIDevice.current.orientation == .portrait {
            setupViewForPortraitOrientation()
        } else {
            setupViewForLeftRightOrientation()
        }
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func hideKeyboard() {
        backView.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        switch UIDevice.current.orientation {
        case .portrait:
            setupViewForPortraitOrientation()
        case .landscapeLeft, .landscapeRight:
            setupViewForLeftRightOrientation()
        default:
            setupUIInitialState()
        }
    }
    
    @IBAction func guessButton(_ sender: Any) {
        hideKeyboard()
        displayData()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier,
           let dst = segue.destination as? FinalGameViewController {
            
            let resultPlayerOne = presenter.getData(key: "resultPlayerOne")
            let resultPlayerTwo = presenter.getData(key: "resultPlayerTwo")
            
            if resultPlayerOne > resultPlayerTwo {
                dst.playerResult = resultPlayerOne
                dst.playerWin = 1
            } else if resultPlayerOne < resultPlayerTwo {
                dst.playerResult = resultPlayerTwo
                dst.playerWin = 2
            } else {
                dst.playerWin = 3
            }
        }
    }
}
