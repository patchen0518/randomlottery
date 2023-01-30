//
//  PowerballView.swift
//  LotteryNumber
//
//  Created by Patrick Chen on 2022/9/18.
//

import SwiftUI

struct PowerballView: View {
    
    @ObservedObject var gameModel: GameModel
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.2)
                .ignoresSafeArea()
            VStack {
                Image("powerball")
                Divider()
                
                //Powerball Number Display
                Text("Section 1")
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal)
                HStack {
                    //animation in NumberBox
                    ForEach(0...5, id: \.self) { item in
                        NumberBox(number: $gameModel.powerballArray[item])
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.all)
                
                Text("Section 2")
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                HStack {
                    NumberBox(number: $gameModel.powerballArray[6])
                        .padding(.leading)
                    
                    Spacer()
                }
                
                Button {
                    gameModel.generatePowerBallNumber()
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

struct PowerballView_Previews: PreviewProvider {
    static var previews: some View {
        PowerballView(gameModel: GameModel())
    }
}
