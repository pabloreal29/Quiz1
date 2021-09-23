//
//  QuizzesModel.swift
//  P1 Quiz SwiftUI
//
//  Created by Garra on 21/09/2021.
//

import Foundation

class QuizzesModel: ObservableObject {
    
    // Los datos
    //Array de tipo QuizItem con constructor incluido
    @Published private(set) var quizzes = [QuizItem]()
    
    
    //Cargam el .json y lo añade al array
    func load() {
         
        //Sacamos la url del fichero .json donde están los quizzes
        guard let jsonURL = Bundle.main.url(forResource: "p1_quizzes", withExtension: "json") else {
            print("Internal error: No encuentro p1_quizzes.json")
            return
        }
        
        do {
            
            //Sacamos toda la información (bytes) de el contenido de la url
            //Se podría dar una url de internet y funcionaría igual
            let data = try Data(contentsOf: jsonURL)
            
            //Definimos el decoder de JSON
            let decoder = JSONDecoder()
            
            //Saca el string correspondiente a la información (bytes) de el contenido de
            //la url
//            if let str = String(data: data, encoding: String.Encoding.utf8) {
//                print("Quizzes ==>", str)
//            }
            
            //Decodificamos el contenido del archivo .json y lo guardamos en un array de
            //tipo QuizItem, esto encaja gracias a que al definir la estructura QuizItem
            //hemos definido como "Codable"
            let quizzes = try decoder.decode([QuizItem].self, from: data)
            
            //Lo guardamos en la variable de la clases
            self.quizzes = quizzes

            print("Quizzes cargados")
        } catch {
            print("Algo chungo ha pasado: \(error)")
        }
    }
}
