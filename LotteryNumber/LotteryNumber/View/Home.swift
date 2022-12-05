//
//  Home.swift
//  LotteryNumber
//
//  Created by Patrick Chen on 2022/9/16.
//

import SwiftUI

struct Home: View {
    
    @StateObject var gameModel: GameModel = GameModel()
    @State var tabSelector: String = "Lottery"
    
    var body: some View {
        VStack (spacing: 0) {
            if tabSelector == gameModel.tabArray[0] {
                LotteryView(gameModel: gameModel)
                    .transition(.backslide)
            } else {
                PowerballView(gameModel: gameModel)
                    .transition(.slide)
            }
            
            Divider()
            
            LotteryTabBar(tabBarSelector: $tabSelector)
        }
    }
}

extension AnyTransition {
    static var backslide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))}
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
