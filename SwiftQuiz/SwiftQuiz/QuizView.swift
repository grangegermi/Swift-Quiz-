//
//  QuizView.swift
//  SwiftQuiz
//
//  Created by Даша Суворова on 19.03.26.
//

import SwiftUI

struct QuizView: View {
    
    var body: some View {
        VStack{
            ZStack{
                LiquidGlassView()
                    .frame(width: 280, height: 160)
                Text("{ Hello, World! }")
                    .padding()
            }
            Spacer()
            VStack{
                ZStack{
                    LiquidGlassView()
                        .frame(width:280, height: 50)
                        .padding(.vertical, 10)
                    Text("{ Hello, World! }")
                        .foregroundColor(.white)
                }
                ZStack{
                    LiquidGlassView()
                        .frame(width:280, height: 50)
                        .padding(.vertical, 10)
                    Text("{ Hello, World! }")
                        .foregroundColor(.white)
                }
                ZStack{
                    LiquidGlassView()
                        .frame(width:280, height: 50)
                        .padding(.vertical, 10)
                    Text("{ Hello, World! }")
                        .foregroundColor(.white)
                }
                ZStack{
                    LiquidGlassView()
                        .frame(width:280, height: 50)
                        .padding(.vertical, 10)
                    Text("{ Hello, World! }")
                        .foregroundColor(.white)
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [.blackApp, .darkBlueApp, .blueApp],
                           startPoint: .top, endPoint: .bottom)
        )
    }
}

struct LiquidGlassView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .glassEffect(in: .rect(cornerRadius: 16))
    }
}

#Preview {
    QuizView()
}
