//
//  SwiftQuizApp.swift
//  SwiftQuiz
//
//  Created by Даша Суворова on 17.03.26.
//

import SwiftUI
import FirebaseCore

@main
struct SwiftQuizApp: App {
    
    init() {
        FirebaseApp.configure()
       }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
