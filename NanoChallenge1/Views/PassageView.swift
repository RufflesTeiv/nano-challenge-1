//
//  PassageView.swift
//  NanoChallenge1
//
//  Created by Rafa (Ruffles) on 28/07/23.
//

import SwiftUI

struct PassageView: View {
    let passage : Passage

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("paperBackground")
                    .resizable()
                    .ignoresSafeArea()
                VStack(spacing: 50.0) {
                    if (passage.hasImages) {
                        ZStack {
                            Image(passage.backgroundImageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
//                                .frame(height: geo.size.height / 2, alignment: .top)
                                .frame(height: geo.size.height / 2)
                                .frame(maxWidth: .infinity)
                            if (passage.foregroundImageName != "transparent") {
                                Image(passage.foregroundImageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
    //                                .frame(height: geo.size.height / 2, alignment: .top)
                                    .frame(height: geo.size.height / 2)
                                    .frame(maxWidth: .infinity)
                            }
                            Image("vignette")
                                .resizable()
                        }
                    }
//                    .frame(maxWidth: geo.size.width)
//                    .frame(height: geo.size.height / 2, alignment: .top)
                    ScrollView {
                        VStack (spacing: 50.0) {
                            Text (passage.text)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(Font.custom("RecursiveMonoLnrSt-Regular", size: 18))
                            VStack(spacing: 26.0) {
                                ForEach(passage.options) { option in
                                    OptionButton(option: option)
                                        .frame(maxWidth: .infinity)
                                }
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                    }
                }
                .padding(.top, 50.0)
            }
        }
    }
}

struct PassageView_Previews: PreviewProvider {
    static var previews: some View {
        PassageView(passage: Passage.getPassages()[0])
    }
}
