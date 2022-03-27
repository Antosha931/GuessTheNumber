//
//  ViewInputDelegate.swift
//  GuessTheNumber
//
//  Created by Антон Титов on 27.03.2022.
//

import Foundation

protocol ViewInputDelegate: AnyObject {
    
    func setupUIInitialState()
    func displayData()
    
}
