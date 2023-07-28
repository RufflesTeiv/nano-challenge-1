//
//  Router.swift
//  NanoChallenge1
//
//  Created by Rafa (Ruffles) on 26/07/23.
//

import Foundation
import SwiftUI

class PlayerData : ObservableObject {
    static var shared: PlayerData = {
        let instance = PlayerData()
        return instance
    }()
    
//    @Published var passageIdStack : [Int] = []
    
    private init() {}
}
