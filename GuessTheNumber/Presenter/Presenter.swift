//
//  Presenter.swift
//  GuessTheNumber
//
//  Created by Антон Титов on 27.03.2022.
//

import Foundation

class Presenter {
    
    weak private var viewInputDelegate: ViewInputDelegate?
    private let defaults = UserDefaults.standard
    
    func setViewInputDelegate(viewInputDelegate: ViewInputDelegate) {
        self.viewInputDelegate = viewInputDelegate
    }
}

extension Presenter: ViewOutputDelegate {
    
    func saveData(result: Int, key: String) {
        defaults.set(result, forKey: key)
    }

    func getData(key: String) -> Int {
        let object = defaults.integer(forKey: key)
        return object
    }
}
