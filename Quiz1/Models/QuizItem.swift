//
//  QuizItem.swift
//  P1 Quiz SwiftUI
//
//  Created by Garra on 21/9/21.
//
//  Para adaptar los quizzes en formato .json a swift, creamos una estructura
//  Con sus mismos atributos

import Foundation

struct QuizItem: Codable, Identifiable {
    //Codable se pone para identificar que esta estructura es la del .json que
    //tenemos y lo adapta automaticamente
    //
    //Identificable usa el campo id que hemos creado para identificar cada elemento
    //como su identificador único
    //
    
    let id: Int
    let question: String
    let answer: String
    let author: Author?     //Por si no hay autor
    let attachment: Attachment?
    let favourite: Bool
    
    struct Author: Codable {
        let isAdmin: Bool?
        let username: String
        let photo: Attachment?  //Puede no tener foto
    }
    
    struct Attachment: Codable {
        let filename: String
        let mime: String
        let url: URL?
    }
}
