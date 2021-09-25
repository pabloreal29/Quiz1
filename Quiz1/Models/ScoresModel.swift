//
//  ScoresModel.swift
//  Quiz1 (iOS)
//
//  Created by Alfredo Garrachon Ruiz on 23/9/21.
//

import Foundation

class ScoresModel: ObservableObject {
    //Comentada porque tiraba error
//    @Published private(set) var acertadas: Set<Int> = []
    var acertadas: Set<Int> = []
    
//    func check(respuesta: String, quiz: QuizItem) {
//        func check(respuesta: String, quiz: QuizItem) {
//            let r1 = respuesta.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
//            let r2 = quiz.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
//            if r1 == r2 {
//                acertadas.insert(quiz.id)
//            }
//        }
//    }
    
    func check(answer: String, quiz: QuizItem) {
        let quizAnswer = quiz.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        if answer == quizAnswer {
            acertadas.insert(quiz.id)
        }
    }
}
