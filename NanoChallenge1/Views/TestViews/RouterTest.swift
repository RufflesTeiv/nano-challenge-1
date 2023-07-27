//
//  RouterTest.swift
//  NanoChallenge1
//
//  Created by Rafa (Ruffles) on 25/07/23.
//

import SwiftUI

struct RouterTest: View {
    @StateObject var router = Router.shared

    var body: some View {
        NavigationStack(path: router.navigationStackBinding) {
            VStack {
                List(1..<50) { i in
                    NavigationLink(value: i) {
                        Label("Row \(i)", systemImage: "\(i).circle")
                    }
                }
                .navigationDestination(for: Int.self) { i in
                    VStack {
                        Text("Detail \(i)")
                        Text(Utils.jsonString(from: router.passageIdStack as Any) ?? "Deu merda")

                        Button("Go to Next") {
                            router.addToPassageIdStack(passageId: i+1)
                        }
                    }
                }
                .navigationTitle("Navigation")
            }
        }
    }
}

struct RouterTest_Previews: PreviewProvider {
    static var previews: some View {
        RouterTest()
    }
}
