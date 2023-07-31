//
//  OptionButton.swift
//  NanoChallenge1
//
//  Created by Rafa (Ruffles) on 30/07/23.
//

import SwiftUI

struct OptionButton: View {
    let option: Option

    var body: some View {
        Button (action: option.action) {
            HStack {
                Text("> "+option.text)
                    .font(Font.custom("RecursiveMonoLnrSt-Regular", size: 24))
            }
            .padding(.all, 5)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color("buttonColor"))
            .foregroundColor(.black)
        }
    }
}

struct OptionButton_Previews: PreviewProvider {
    static var previews: some View {
//        OptionButton(option: Passage.getPassages()[0].options[0])
        PassageView(passage: Passage.getPassages()[0])
    }
}
