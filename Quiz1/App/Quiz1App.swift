//
//  Quiz1App.swift
//  Shared
//
//  Created by Garra on 21/9/21.
//

import SwiftUI

@main
struct Quiz1App: App {
    
    let quizzesModel = QuizzesModel()
    let scoresModel = ScoresModel()
    
    var body: some Scene {
        WindowGroup {
            QuizzesListView()
                .environmentObject(quizzesModel)
                .environmentObject(scoresModel)
        }
    }
}
