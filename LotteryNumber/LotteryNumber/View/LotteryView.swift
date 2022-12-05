//
//  LotteryView.swift
//  LotteryNumber
//
//  Created by Patrick Chen on 2022/9/18.
//

import SwiftUI

struct LotteryView: View {
    
    @ObservedObject var gameModel: GameModel
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                Image("lottery")
                
                Divider()
                
                //Lottery Number Display
                HStack {
                    //animation in NumberBox
                    ForEach(0...5, id: \.self) {index in
                        NumberBox(number: $gameModel.lotteryArray[index])
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.all)
                
                Spacer()
                
                Button {
                    gameModel.generateLotteryNumber()
                } label: {
                    Text("Generate")
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(12)
                }
                .padding()
                
                Spacer()
                
            }
        }
    }
}

struct LotteryView_Previews: PreviewProvider {
    static var previews: some View {
        LotteryView(gameModel: GameModel())
    }
}
