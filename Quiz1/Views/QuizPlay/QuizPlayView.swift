//
//  QuizPlayView.swift
//  Quiz1 (iOS)
//
//  Created by Garra on 23/9/21.
//

import SwiftUI

struct QuizPlayView: View {
    var quiz: QuizItem
    //Para guardar la respuesta
    @State var answer: String = ""
    //Para la alerta
    @State var showAlert = false
    //Pasar el score
    var scoresModel: ScoresModel
    var body: some View {
        NavigationView{
        
        return GeometryReader { g in
            VStack(alignment: .center, spacing: 20){
            Text(quiz.question)
                .font(.title2)
                .bold()
                .frame(width: 350, height: 70, alignment: .top)
            TextField("Respuesta", text:$answer, onCommit: {
                showAlert = true
            }).frame(width: 350, height: 20).textFieldStyle(RoundedBorderTextFieldStyle())
            .alert(isPresented: $showAlert) {
                let s1 = quiz.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                let s2 = answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                //Hacemos el check del score
                scoresModel.check(answer: s2, quiz: quiz)
                //Decimos si está bien o mal
                return Alert(title: Text("Resultado"), message: Text(s1 == s2 ? "Bien":"Mal"), dismissButton: .default(Text("Bien")))
                
            }
            attachment
            HStack(alignment: .center, spacing: 5){
                author
                favourite
            }
            HStack(alignment: .center, spacing: 50){
                Button(action: { showAlert = true}) {
                    Text("Comprobar")
                }
                Text("Score: \(scoresModel.acertadas.count)")
            }
        }
        }
        }
        .padding()
        .navigationTitle(Text("Play the Game"))
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    private var attachment: some View {
        //Ponemos la vista de la imagen que descargamos de cada quiz
        return GeometryReader { g in
            NetworkImageView(viewModel: NetworkImageViewModel(url: quiz.attachment?.url))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .contentShape(RoundedRectangle(cornerRadius: 20))
                .frame(width: g.size.width, height: g.size.height)
                .scaledToFill()
        }
    }
    
    private var author: some View {
        HStack{
            //Como es un opcional, puede que no tenga valor, por lo que le damos un valor
            //por defecto en el caso de que no haya valor
            Text(quiz.author?.username ?? "Anonymus")
            //Si es favorita, pintamos good, si no, pintamos bad
            //Ponemos la vista para sacar la imagen del author
            NetworkImageView(viewModel: NetworkImageViewModel(url: quiz.author?.photo?.url))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .frame(width: 50, height: 50)
                .scaledToFill()
        }
    }
    
    private var favourite: some View {
        Image(quiz.favourite ? "good": "bad")
            .resizable()
            .frame(width: 40, height: 40)
            .scaledToFit()
    }
}
