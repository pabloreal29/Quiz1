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
            Text(quiz.question)
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
                        .frame(width: 40, height: 40)
                        .scaledToFit()
                    
                }
                //Ponemos la vista de la imagen que descargamos de cada quiz
                NetworkImageView(viewModel: NetworkImageViewModel(url: quiz.attachment?.url))
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .scaledToFit()
            }
        }
    }
}

//struct QuizRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizRowView()
//    }
//}
