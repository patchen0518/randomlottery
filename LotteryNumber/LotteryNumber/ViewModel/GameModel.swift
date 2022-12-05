//
//  HomeViewModel.swift
//  LotteryNumber
//
//  Created by Patrick Chen on 2022/9/16.
//

import Foundation

class GameModel: ObservableObject {
    @Published var tabArray: [String] = ["Lottery","Powerball"]
    @Published var lotteryArray: [Int] = [1,2,3,4,5,6]
    @Published var powerballArray:[Int] = [1,2,3,4,5,6,7]
    
    //lottery is 6 numbers from 1 to 49
    var lotteryPool = Array(1...49)
    
    //powerball is 6 numbers 1 to 38 from section 1, and a number from 1 to 8 for section 2
    var powerballSectionOnePool = Array(1...38)
    var powerballSectionTwoPool = Array(1...8)
    
    
    func generateLotteryNumber() {
        lotteryPool.shuffle()
        
        for index in 0..<lotteryArray.count {
            lotteryArray[index] = lotteryPool[index]
        }
        
        lotteryArray.sort()
    }
    
    func generatePowerBallNumber() {
        powerballSectionOnePool.shuffle()
        powerballSectionTwoPool.shuffle()
        
        let sectionOne = powerballArray.count - 1 //6
        
        for index in 0 ..< sectionOne {
            powerballArray[index] = powerballSectionOnePool[index]
        }
        powerballArray[6] = powerballSectionTwoPool[0]
        
        powerballArray[0..<sectionOne].sort()
    }
}
