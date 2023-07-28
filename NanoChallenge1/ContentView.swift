//
//  ContentView.swift
//  NanoChallenge1
//
//  Created by Rafa (Ruffles) on 25/07/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var router = Router.shared
    @State var mainMenu = false
    let passages = Passage.getPassages()

    var body: some View {
        if (mainMenu) {
            Text("Oi?")
        } else {
            NavigationStack(path: router.navigationStackBinding) {
                VStack {
                    List(0..<passages.count, id: \.self) { i in
                        NavigationLink(value: i) {
                            Label("Passage \(i)", systemImage: "\(i).circle")
                        }
                    }
                    .navigationDestination(for: Int.self) { i in
                        if (i >= 0 && i < passages.count) {
                            let passage = passages[i]
                            VStack {
                                Text("Passage \(i)")
                                Text(passage.text)
                                Text(Utils.jsonString(from: router.passageIdStack as Any) ?? "Deu merda")
                                Button("Go to Next") {
                                    router.addToPassageIdStack(passageId: i+1)
                                }
                            }
                            .navigationBarBackButtonHidden(true)
                        } else {
                            Text("Index out of bounds")
                        }
                    }
                    .navigationTitle("Navigation")
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
