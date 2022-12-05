//
//  LotteryTabBar.swift
//  LotteryNumber
//
//  Created by Patrick Chen on 2022/9/19.
//

import SwiftUI

struct LotteryTabBar: View {
    
    @Binding var tabBarSelector: String
    
    var body: some View {
        
        HStack {
            TabBarButton(buttonName: "Lottery", symbolName: "star.circle", selector: $tabBarSelector)
            TabBarButton(buttonName: "Powerball", symbolName: "7.circle", selector: $tabBarSelector)
        }
        .background(Color.gray.opacity(0.2))
        .frame(maxWidth: .infinity)
        
    }
}

struct TabBarButton: View {
    
    let buttonName: String
    let symbolName: String
    @Binding var selector: String
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                selector = buttonName
            }
        } label: {
            VStack(spacing: 4) {
                Image(systemName: selector == buttonName ? symbolName + ".fill" : symbolName)
                Text(buttonName)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60)
    }
}

struct LotteryTabBar_Previews: PreviewProvider {
    static var previews: some View {
        LotteryTabBar(tabBarSelector: .constant("Lottery"))
    }
}
