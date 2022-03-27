//
//  PlayerNumberViewController.swift
//  GuessTheNumber
//
//  Created by Антон Титов on 25.03.2022.
//

import UIKit

final class PlayerNumberViewController: UIViewController {
    
    @IBOutlet weak var backScroolView: UIScrollView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var labelsStackView: UIStackView!
    @IBOutlet weak var numberPlayerLabel: UILabel!
    @IBOutlet weak var rulesTextLabel: UILabel!
    @IBOutlet weak var playerNumberTextField: UITextField!
    @IBOutlet weak var startGamePlayerButton: UIButton!
    
    let segueIdentifier = "identifierToGameWithPlayer"
    
    private let presenter = Presenter()
    weak private var viewOutputDelegate: ViewOutputDelegate?
    
    var playerNumber = Int()
    var numberPlayerFlag = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIInitialState()
        presenter.setViewInputDelegate(viewInputDelegate: self)
        self.viewOutputDelegate = presenter
        
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
    
    @IBAction func startGamePlayerButton(_ sender: Any) {
        hideKeyboard()
        displayData()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier,
           let dst = segue.destination as? GameWithPlayerViewController {
            dst.hiddenPlayerNumber = playerNumber
            dst.numberPlayerFlag = numberPlayerFlag
        }
    }
}
