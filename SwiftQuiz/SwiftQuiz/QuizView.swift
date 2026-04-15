//
//  QuizView.swift
//  SwiftQuiz
//
//  Created by Даша Суворова on 19.03.26.
//

import SwiftUI
import Combine

struct QuizView: View {
    var quiz: QuizModel
    
    var body: some View {
        VStack{
            ZStack{
                RectangleView()
                    .frame(width: 280, height: 160)
                Text("{\(quiz.question)}")
                    .padding()
            }
            Spacer()
            VStack{
                ForEach(quiz.options, id:\.self) { quiz in
                    ZStack{
                        Text("\(quiz)")
                            .foregroundColor(.white)
                        RectangleView()
                            .frame(width:280, height: 50)
                            .padding(.vertical, 10)
                    }
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.darkBlueApp)
    }
}

struct RectangleView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(.ultraThinMaterial)
            .overlay(
                LinearGradient(
                    colors: [
                        Color.white.opacity(0.4),
                        Color.white.opacity(0.7)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(
                        LinearGradient(
                            colors: [.white.opacity(0.55), .blue.opacity(0.35), .white.opacity(0.20)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.2
                    )
            )
    }
}

#Preview {
    QuizView(quiz: QuizModel.init(question: "", options: [], correct: 0))
}
