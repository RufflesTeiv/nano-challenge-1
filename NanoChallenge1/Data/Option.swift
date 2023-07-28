//
//  Option.swift
//  NanoChallenge1
//
//  Created by Rafa (Ruffles) on 27/07/23.
//

import Foundation

struct Option: Hashable, Identifiable {
    static func == (lhs: Option, rhs: Option) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    let id = UUID()
    let text : String
    let action : () -> Void
    
}
