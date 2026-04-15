//
//  ContentView.swift
//  SwiftQuiz
//
//  Created by Даша Суворова on 17.03.26.
//

import FirebaseFunctions
import SwiftUI
import Combine

struct ContentView: View {
    @State private var selectedLevel: Levels = Levels.junior
    @StateObject private var session = FirebaseSession()
   
    var body: some View {
        
        VStack(spacing: 16) {
                Text("Choose your quiz level")
                    .font(.headline)
                    .foregroundColor(.whiteApp)
                VStack(spacing: 16) {
                    Picker("Levels", selection: $selectedLevel) {
                        ForEach(Levels.allCases, id: \.self) { level in
                            Text(level.title)
                        }
                    }
                }
                .pickerStyle(.segmented)
                .padding(16)
                switch session.states {
                case .loading:
                    Button {
                        Task {
                            await session.loadQuiz(level: selectedLevel)
                        }
                    } label: {
                        Text("Start")
                            .foregroundColor(.whiteApp)
                            .padding([.horizontal, .vertical], 16)
                        
                    }
                    .background(Color.blueApp)
                    .cornerRadius(8)
                case .success:
                    if let quiz = session.questions{
                        QuizView(quiz: quiz)
                    }
                    
                }
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.darkBlueApp)
    }
}

#Preview {
    ContentView()
}
