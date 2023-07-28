//
//  Passage.swift
//  NanoChallenge1
//
//  Created by Rafa (Ruffles) on 26/07/23.
//

import Foundation

struct Passage: Identifiable, Hashable {
    static func == (lhs: Passage, rhs: Passage) -> Bool {
        return lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    let id = UUID()
    let text : String
    let imageName : String
    let options : [Option]
    
    init (text: String, imageName: String, options: [Option]) {
        self.text = text
        self.imageName = imageName
        self.options = options
    }
    
    static func getPassages() -> [Passage] {
        let router = Router.shared
        return [
            Passage(
                text: "Passagem teste",
                imageName: "teste0",
                options: [
                    Option(text: "Opcao 1", action: {router.addToPassageIdStack(passageId: 1)}),
                    Option(text: "Opcao 2", action: {router.addToPassageIdStack(passageId: 2)})
                ]),
            Passage(
                text: "Passagem final 1",
                imageName: "teste1",
                options: [
                    Option(text: "Voltar", action: {router.goBack()}),
                    Option(text: "Ir ao outro final", action: {router.addToPassageIdStack(passageId: 2)})
                ]),
            Passage(
                text: "Passagem final 2",
                imageName: "teste2",
                options: [
                    Option(text: "Voltar", action: {router.goBack()}),
                    Option(text: "Voltar ao comeco", action: {router.clear()})
                ])
            
        ]
    }
    
//    let category: Category
//    let challenge: String
//    var progress: Progress
//    let specificSearch: String
//
//    init (category: Category, challenge: String, progress: Progress = Progress.none, specificSearch: String = "") {
//        self.category = category
//        self.challenge = challenge
//        self.progress = progress
//        self.specificSearch = specificSearch
//    }
}
