//
//  DeviceOrientationDelegate.swift
//  GuessTheNumber
//
//  Created by Антон Титов on 27.03.2022.
//

import Foundation

protocol DeviceOrientationDelegate: AnyObject {
    
    func setupViewForPortraitOrientation()
    func setupViewForLeftRightOrientation()
}
