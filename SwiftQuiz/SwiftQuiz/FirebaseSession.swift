//
//  NetworkSession.swift
//  SwiftQuiz
//
//  Created by Даша Суворова on 31.03.26.
//

import Foundation
import SwiftUI
import Combine
import FirebaseFunctions

class FirebaseSession: ObservableObject {
    @Published var questions: QuizModel?
    @Published var states: States = .loading
    private let function = Functions.functions(region: "us-central1")
    private let sessionIdKey = "swift_quiz_session_id"
    
    func loadQuiz (level: Levels) async {
        states = .loading
        let callFunction = function.httpsCallable("generateSwiftQuizMock")
        let payload : [String: Any] = [
            "sessionId" : sessionID(),
            "level": level.rawValue
        ]
        
        do {
            let result =  try await callFunction.call(payload)
            let jsonData = try JSONSerialization.data(withJSONObject: result.data )
            
            print(String(data: jsonData, encoding: .utf8))
            questions = try JSONDecoder().decode(QuizModel.self, from: jsonData)
            states = .success
            print(questions)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func sessionID () -> String {
        if let existing = UserDefaults.standard.string(forKey: sessionIdKey), !existing.isEmpty {
            return existing
        }
        let newId = UUID().uuidString
        UserDefaults.standard.set(newId, forKey: sessionIdKey)
        return newId
    }
}
