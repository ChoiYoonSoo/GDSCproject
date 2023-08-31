//
//  Answer.swift
//  QuizProject
//
//  Created by cys on 2023/08/08.
//

import Foundation

struct Answer: Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect : Bool
}
