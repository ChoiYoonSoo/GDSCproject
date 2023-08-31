//
//  TriviaManager.swift
//  QuizProject
//
//  Created by cys on 2023/08/13.
//

import Foundation
import SwiftUI

class TriviaManager: ObservableObject {
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    var title = ""
    
    init(){
        Task.init{
            await fetchTrivia()
        }
    }
    
    func fetchTrivia() async {
        guard let jsonFilePath = Bundle.main.path(forResource: "data", ofType: "json") else {
            fatalError("JSON file not found")
        }
        
        do {
            let jsonUrl = URL(fileURLWithPath: jsonFilePath)
            let jsonData = try Data(contentsOf: jsonUrl)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trivia.self, from: jsonData)
            
            
            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                
                self.trivia = decodedData.results.shuffled()
                self.length = 10
                self.setQuestion()
            }
        } catch {
            fatalError("Error decoding JSON: \(error)")
        }
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double((index + 1)) / Double(length) * 350)
        
        if index < length {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices = currentTriviaQuestion.answers
            self.title = currentTriviaQuestion.category
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
