//
//  GameWithComputerViewController.swift
//  GuessTheNumber
//
//  Created by Антон Титов on 25.03.2022.
//

import UIKit

class GameWithComputerViewController: UIViewController {
    
    @IBOutlet weak var backScroolView: UIScrollView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var labelsStackView: UIStackView!
    @IBOutlet weak var numberRoundsLabel: UILabel!
    @IBOutlet weak var rulesTextLabel: UILabel!
    @IBOutlet weak var playerNumberTextField: UITextField!
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    
    private let presenter = Presenter()
    let segueIdentifier = "identifierToFinalGame"
    
    var numberOfAttempts = 1 {
        didSet {
            setupUIInitialState()
        }
    }
    
    var hiddenNumberComputer: Int = Int.random(in: 1...99)
    
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
            dst.playerResult = numberOfAttempts
        }
    }
}


