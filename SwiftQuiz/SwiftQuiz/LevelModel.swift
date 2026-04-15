//
//  LevelModel.swift
//  SwiftQuiz
//
//  Created by Даша Суворова on 12.04.26.
//

import Foundation

enum Levels: String, CaseIterable {
    var title : String {
        return self.rawValue.capitalized
    }
    
    case junior = "junior"
    case middle = "middle"
    case senior = "senior"
}

enum States {
    case loading
    case success
}
