//
//  Router.swift
//  NanoChallenge1
//
//  Created by Rafa (Ruffles) on 26/07/23.
//

import Foundation
import SwiftUI

class Router : ObservableObject {
    static var shared: Router = {
        let instance = Router()
        return instance
    }()
    
//    @Published var passageIdStack : [Int] = {
//        return [-1]
//    }()
    @Published var passageIdStack : [Int] = []
    let baseStack : [Int] = [0]
    var navigationStackBinding : Binding<[Int]> = Binding(get: {[]}, set:{_ in })
    
    private init() {
//        passageIdStack = []
        clear()
        navigationStackBinding = Binding(
            get: {self.passageIdStack},
            set: {
                self.passageIdStack = $0
            }
        )
    }
    
    func addToPassageIdStack(passageId: Int) -> Void {
        passageIdStack.append(passageId)
        self.objectWillChange.send()
    }
    
    func goBack() -> Void {
        passageIdStack.removeLast()
        self.objectWillChange.send()
    }
    
    func clear() -> Void {
        passageIdStack = baseStack
        self.objectWillChange.send()
    }
}
