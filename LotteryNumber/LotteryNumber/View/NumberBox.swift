//
//  NumberBox.swift
//  LotteryNumber
//
//  Created by Patrick Chen on 2022/9/21.
//

import SwiftUI

struct NumberBox: View {
    
    @Binding var number: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.clear)
                .frame(width: 48, height: 48)
                .border(.black)
                .shadow(radius: 2, x: 2,y: 2)
            
            Text(String(number))
                .animation(.spring(), value: number)
        }
        //.frame(maxWidth: .infinity)
    }
}

struct NumberBox_Previews: PreviewProvider {
    static var previews: some View {
        NumberBox(number: .constant(7))
    }
}
