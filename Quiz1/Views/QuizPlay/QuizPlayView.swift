//
//  QuizPlayView.swift
//  Quiz1 (iOS)
//
//  Created by Alfredo Garrachon Ruiz on 23/9/21.
//

import SwiftUI

struct QuizPlayView: View {
    var quiz: QuizItem
    //Para guardar la respuesta
    @State var answer: String = ""
    //Para la alerta
    @State var showAlert = false
    //Para el Score, HAY QUE PASARLE EL SCORE; TODAVIA NO ESTÁ
    @EnvironmentObject var scoresModel: ScoresModel
    var body: some View {
        
        return GeometryReader { g in
        VStack{
            Text(quiz.question)
            TextField("Respuesta", text:$answer, onCommit: {
                showAlert = true
            })
            .alert(isPresented: $showAlert) {
                let s1 = quiz.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                let s2 = answer.lowercased()
                return Alert(title: Text("Resultado"), message: Text(s1 == s2 ? "Bien":"Mal"), dismissButton: .default(Text("Bien")))
            }
            Button(action: { showAlert = true}) {
                Text("Comprobar")
            }
            HStack(alignment: .center, spacing: 5){
                VStack{
                    //Como es un opcional, puede que no tenga valor, por lo que le damos un valor
                    //por defecto en el caso de que no haya valor
                    Text(quiz.author?.username ?? "Anonymus")
                    //Si es favorita, pintamos good, si no, pintamos bad
                    Image(quiz.favourite ? "good": "bad")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .scaledToFit()
                    //Ponemos la vista para sacar la imagen del author
                    NetworkImageView(viewModel: NetworkImageViewModel(url: quiz.author?.photo?.url))
                        .frame(width: 50, height: 50)
                        .scaledToFill()
                }
                attachment
                
                Text("Score: \(scoresModel.acertadas.count)")
                
            }
        }
        }
    }
    
    private var attachment: some View {
        //Ponemos la vista de la imagen que descargamos de cada quiz
        return GeometryReader { g in
            NetworkImageView(viewModel: NetworkImageViewModel(url: quiz.attachment?.url))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .contentShape(RoundedRectangle(cornerRadius: 20))
                .frame(width: g.size.width, height: g.size.height)
                .scaledToFit()
        }
    }
    
//    private var author: some View {
//
//    }

}

//struct QuizPlayView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizPlayView()
//    }
//}
