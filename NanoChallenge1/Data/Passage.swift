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
    let backgroundImageName : String
    let foregroundImageName : String = "transparency"
    let options : [Option]
    
    init (text: String, backgroundImageName: String, options: [Option]) {
        self.text = text
        self.backgroundImageName = backgroundImageName
        self.options = options
    }
    
    static func getPassages() -> [Passage] {
        let router = Router.shared
        return [
            Passage(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                backgroundImageName: "cafeteria",
                options: [
                    Option(text: "Opcao 1", action: {router.addToPassageIdStack(passageId: 1)}),
                    Option(text: "Opcao 2", action: {router.addToPassageIdStack(passageId: 2)})
                ]),
            Passage(
                text: "Passagem final 1",
                backgroundImageName: "teste1",
                options: [
                    Option(text: "Voltar", action: {router.goBack()}),
                    Option(text: "Ir ao outro final", action: {router.addToPassageIdStack(passageId: 2)})
                ]),
            Passage(
                text: "Passagem final 2",
                backgroundImageName: "teste2",
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
