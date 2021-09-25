//
//  QuizRowView.swift
//  Quiz1 (iOS)
//
//  Created by Garra on 21/9/21.
//

import SwiftUI

struct QuizRowView: View {
    var quiz: QuizItem
    var body: some View {
        VStack{
            HStack{
                Text(quiz.question)
                    .font(.title2)
                    .frame(width: 200, height: 20)
                //Si es favorita, pintamos good, si no, pintamos bad
                Image(quiz.favourite ? "good": "bad")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .scaledToFit()
            }
            HStack(alignment: .center, spacing: 5){
                VStack{
                    //Como es un opcional, puede que no tenga valor, por lo que le damos un valor
                    //por defecto en el caso de que no haya valor
                    Text(quiz.author?.username ?? "Anonymus")
                        .frame(width: 50, height: 20, alignment: .bottom)
                    //Ponemos la vista para sacar la imagen del author
                    NetworkImageView(viewModel: NetworkImageViewModel(url: quiz.author?.photo?.url))
                        .frame(width: 40, height: 40)
                        .scaledToFill()
                    
                }
                //Ponemos la vista de la imagen que descargamos de cada quiz
                NetworkImageView(viewModel: NetworkImageViewModel(url: quiz.attachment?.url))
                    .clipShape(Ellipse())
                    .frame(width: 150, height: 100)
                    .scaledToFill()
            }
        }
    }
}
