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
    
    init (text: String) {
        self.text = text;
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
