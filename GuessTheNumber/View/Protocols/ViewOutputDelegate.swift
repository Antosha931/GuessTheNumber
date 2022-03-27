//
//  ViewOutputDelegate.swift
//  GuessTheNumber
//
//  Created by Антон Титов on 27.03.2022.
//

import Foundation

protocol ViewOutputDelegate: AnyObject {
    
    func getData(key: String) -> Int
    func saveData(result: Int, key: String)
}
