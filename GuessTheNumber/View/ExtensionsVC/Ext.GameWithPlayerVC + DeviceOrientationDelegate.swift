//
//  Ext.GameWithPlayerVC + DeviceOrientationDelegate.swift
//  GuessTheNumber
//
//  Created by Антон Титов on 27.03.2022.
//

import UIKit

extension GameWithPlayerViewController: DeviceOrientationDelegate {
    
    func setupViewForPortraitOrientation() {
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        playerNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        guessButton.translatesAutoresizingMaskIntoConstraints = false
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        
        labelsStackView.spacing = 50
        
        NSLayoutConstraint.activate(
            [labelsStackView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
             labelsStackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 50),
             labelsStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
             labelsStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20)
            ])
        
        NSLayoutConstraint.activate(
            [playerNumberTextField.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
             playerNumberTextField.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
             playerNumberTextField.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
             playerNumberTextField.heightAnchor.constraint(equalToConstant: 80)])
        
        NSLayoutConstraint.activate(
            [guessButton.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
             guessButton.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
             guessButton.topAnchor.constraint(equalTo: playerNumberTextField.bottomAnchor, constant: 20),
             guessButton.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
             guessButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
             guessButton.heightAnchor.constraint(equalTo: playerNumberTextField.heightAnchor)])
        
        promptLabel.topAnchor.constraint(equalTo: guessButton.bottomAnchor, constant: 50).isActive = true
        
        NotificationCenter.default.removeObserver(self)
    }
    
    func setupViewForLeftRightOrientation() {
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        playerNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        guessButton.translatesAutoresizingMaskIntoConstraints = false
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        
        labelsStackView.spacing = 20
        
        NSLayoutConstraint.activate(
            [labelsStackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20),
             labelsStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
             labelsStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20)])
        
        NSLayoutConstraint.activate(
            [playerNumberTextField.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 20),
             playerNumberTextField.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
             playerNumberTextField.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
             playerNumberTextField.heightAnchor.constraint(equalToConstant: 50)])
        
        NSLayoutConstraint.activate(
            [guessButton.topAnchor.constraint(equalTo: playerNumberTextField.bottomAnchor, constant: 20),
             guessButton.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
             guessButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
             guessButton.heightAnchor.constraint(equalTo: playerNumberTextField.heightAnchor)])
        
        promptLabel.topAnchor.constraint(equalTo: guessButton.bottomAnchor, constant: 20).isActive = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown() {
        backScroolView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 250, right: 0)
    }
    
    @objc func keyboardHide() {
        backScroolView.contentInset = UIEdgeInsets.zero
    }
}
