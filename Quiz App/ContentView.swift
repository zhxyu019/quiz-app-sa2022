//
//  ContentView.swift
//  Quiz App
//
//  Created by TinkerTanker on 17/6/22.
//

import SwiftUI

struct ContentView: View {
    
    let questions = [
        QuizQuestions(title: "How old is Ryder?", optionA: "ten", optionB: "eleven", optionC: "twelve", optionD: "thirteen"),
        QuizQuestions(title: "What does Mayor Goodway own in Paw Patrol?", optionA: "chicken", optionB: "dog", optionC: "rabbit", optionD: "snake"),
        QuizQuestions(title: "Who is the police pup always on the case?", optionA: "Chase", optionB: "Zuma", optionC: "Marshall", optionD: "Rocky"),
        QuizQuestions(title: "Who is the fire pup?", optionA: "Marshall", optionB: "Zuma", optionC: "Rocky", optionD: "Chase")
        
    ]
    
    @State var QuestionIndex = 0
    @State var isAlertShwon = false
    @State var isCorrect = true
    @State var score = 0
    @State var isSheetShown = false
    
    var body: some View {
        VStack {
            Text(questions[QuestionIndex].title)
                .padding()
            HStack {
                Button {
                    isAlertShwon = true
                    isCorrect = true
                    score += 1
                } label: {
                    Text(questions[QuestionIndex].optionA)
                        .padding()
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                Button {
                    isAlertShwon = true
                    isCorrect = false
                } label: {
                    Text(questions[QuestionIndex].optionB)
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
            HStack {
                Button {
                    isAlertShwon = true
                    isCorrect = false
                } label: {
                    Text(questions[QuestionIndex].optionC)
                        .padding()
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                Button {
                    isAlertShwon = true
                    isCorrect = false
                } label: {
                    Text(questions[QuestionIndex].optionD)
                        .padding()
                        .background(.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
        }
        
        .alert(isCorrect ? "Well done!" : "You suck.",
               isPresented: $isAlertShwon) {
            Button("OK") {
                if QuestionIndex == questions.count - 1 {
                    isSheetShown = true
                } else {
                    QuestionIndex += 1
                }
            }
        }
        .sheet(isPresented: $isSheetShown) {
            Text("Your score is \(score)/\(questions.count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
