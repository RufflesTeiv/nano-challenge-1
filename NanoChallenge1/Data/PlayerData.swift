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
    var name : String = ""
    var shuffledNameArray : [String] = []
    var deathCount: Int = -1
    var deathCountLoop : Int = 0
    
    private init() {
        reshuffleArray()
        generateNewPlayer()
    }
    
    func generateNewPlayer() {
        deathCount += 1
        if (deathCount >= shuffledNameArray.count) {
            reshuffleArray()
        }
        name = getRandomName()
    }
    
    func reshuffleArray() {
        shuffledNameArray = Names.names
        shuffledNameArray.shuffle()
        deathCountLoop += 1
        deathCount = 0
    }
    
    private func getRandomName() -> String {
        return shuffledNameArray[deathCount]
    }
}
