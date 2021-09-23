//
//  ContentView.swift
//  Shared
//
//  Created by Alfredo Garrachon Ruiz on 21/9/21.
//

import SwiftUI

struct QuizzesListView: View {
    
    //El @EmvironmentObject busca algo que le haya llegado a la vista del tipo
    //"QuizzesModel" y se lo asigna automaticamente a la variable quizzesModel
    @EnvironmentObject var quizzesModel: QuizzesModel
    
        var body: some View {
            //Para que parezca una pantalla con distintos apartados por los que navegar
            NavigationView{
            List {
                ForEach(quizzesModel.quizzes) { quiz in
                    NavigationLink(destination: QuizPlayView(quiz: quiz)) {
                        QuizRowView(quiz: quiz)
                    }
//                    NavigationLink(destination: QuizPlayView(quiz: quiz), label: QuizRowView(quiz: quiz))
//                    QuizRowView(quiz: quiz)
                }
            }
            .padding()
            .navigationTitle(Text("Quiz con SwiftUI"))
            .onAppear {
                quizzesModel.load()
            }
            }
        }
    }

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizzesListView()
//    }
//}
